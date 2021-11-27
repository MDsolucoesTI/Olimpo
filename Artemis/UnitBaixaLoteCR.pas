//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitBaixaLoteCR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxGrdCpt, ExtCtrls, RXCtrls, jpeg, fcImager, fcButton, fcImgBtn,
  StdCtrls, Grids, DBGrids, RXDBCtrl, CurrEdit, Mask, ToolEdit, Menus,
  RxMenus, DBCtrls, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel, DB, DBTables, EMsgDlg, fcLabel,
  JvPanel, JvTransparentPanel, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseShape, LMDShapeControl, LMDBaseEdit,
  LMDCustomMemo, LMDMemo, JvLabel, JvComponent, JvTransBtn;

type
  TFrmBaixaLoteCR = class(TForm)
    RxPopupMenu1: TRxPopupMenu;
    DefinirJurosMulta1: TMenuItem;
    Desconto1: TMenuItem;
    ZerarJurosMulta1: TMenuItem;
    ZerarDesconto1: TMenuItem;
    LMDBackPanel2: TLMDBackPanel;
    LMDBackPanel3: TLMDBackPanel;
    LMDBackPanel1: TLMDBackPanel;
    dbgridBaixaCP: TRxDBGrid;
    tbCRecSele: TTable;
    dsCRecSele: TDataSource;
    tbCRecSeleCodRec: TIntegerField;
    tbCRecSeleNumDoc: TStringField;
    tbCRecSeleCliente: TStringField;
    tbCRecSeleDataVenc: TDateField;
    tbCRecSeleValor: TCurrencyField;
    tbCRecSeleMultaDia: TDateField;
    tbCRecSeleValorMulta: TCurrencyField;
    tbCRecSelePercMulta: TFloatField;
    tbCRecSeleDescDia: TDateField;
    tbCRecSeleValorDesc: TCurrencyField;
    tbCRecSelePercDesc: TFloatField;
    tbCRecSeleJurosDia: TDateField;
    tbCRecSeleValorJuros: TCurrencyField;
    tbCRecSelePercJuros: TFloatField;
    tbCRecSeleDetalhe: TMemoField;
    tbCRecSeleDesconto: TFloatField;
    tbCRecSeleJuroMulta: TFloatField;
    tbCRecSeleValTotal: TFloatField;
    tbCRecSeleAtraso: TFloatField;
    fcLabel1: TfcLabel;
    MsgDlg: TEvMsgDlg;
    JvLabel7: TJvLabel;
    dbObs: TLMDMemo;
    edtTotal: TCurrencyEdit;
    edtSubTot: TCurrencyEdit;
    edtJuros: TCurrencyEdit;
    edtDesc: TCurrencyEdit;
    JvLabel8: TJvLabel;
    LMDShapeControl1: TLMDShapeControl;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    JvLabel6: TJvLabel;
    dbVlPg: TRxDBCalcEdit;
    dbDtReceb: TDateEdit;
    btnBaixa: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnBaixaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbCRecSeleCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure dbDtRecebChange(Sender: TObject);
    procedure dbDtRecebEnter(Sender: TObject);
    procedure dbVlPg1Exit(Sender: TObject);
    procedure dbVlPgExit(Sender: TObject);
//    procedure dbDtRecebEndDock(Sender, Target: TObject; X, Y: Integer);
  private
    { Private declarations }
    fForPag : char;
    fPago : char;
  public
    { Public declarations }
    property ForPag : char read fForPag write fForPag;
    property Pago : char read fPago write fPago;
  end;

var
  FrmBaixaLoteCR: TFrmBaixaLoteCR;

implementation

uses unitDmDados, unitSelecCR, UnitPrincipal, UnitDescParc, UnitTipoReceb;

{$R *.dfm}

procedure TFrmBaixaLoteCR.btnSairClick(Sender: TObject);
begin
  FrmSelecCR.Visible:=True;
  dmDados.BaixaLote:=False;
  Close;
end;

procedure TFrmBaixaLoteCR.btnBaixaClick(Sender: TObject);
begin
  dmDados.ValorReceb:=dbVlPg.Value;
  if dbVlPg.Value < edtTotal.Value then
    begin
    if dmDados.CRecCli then
      begin
      FrmDescParc:=TFrmDescParc.create(application);
      FrmDescParc.ShowModal;
      if ForPag<>'N' then
        Close;
      end
    else
      begin
      MsgDlg.MsgWarning('S� � poss�vel Descontros ou Pagamento Parcial|para t�tulos de um �nico Cliente...');
      dbVlPg.SetFocus;
      end;
    end
  else
    begin
    FrmTipoReceb:=TFrmTipoReceb.create(application);
    FrmTipoReceb.ShowModal;
    Pago:=FrmTipoReceb.PagoStt;
    FrmTipoReceb.Free;
    if Pago<>'N' then
      Close;
    end;
end;

procedure TFrmBaixaLoteCR.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= Cafree;
end;

procedure TFrmBaixaLoteCR.tbCRecSeleCalcFields(DataSet: TDataSet);
var
  VlAtual, Multa, Juros, Desco, VlDesc, VlMu, VlJu,PJu: Real;
  DtVen, DtDesc, DtMu, DtJu, DtPg: TDateTime;
  PDesc, Pmu : Real;
  Dias:longint;
begin
  //calculo do Atraso
  if dbDtReceb.Date > tbCRecSeleDataVenc.Value then
    tbCRecSeleAtraso.Value:=(dbDtReceb.Date-tbCRecSeleDataVenc.Value)
  else
    tbCRecSeleAtraso.Value:=0;
  //Calculo do Desconto, Multa, Juros
  Multa:= 0;
  Juros:= 0;
  Desco:=0;
  VlAtual:= tbCRecSeleValor.Value;
  DtVen:= tbCRecSeleDataVenc.Value;
  DtPg:= dbDtReceb.Date;
  DtDesc:= tbCRecSeleDescDia.Value;
  DtMu:= tbCRecSeleMultaDia.Value;
  DtJu:= tbCRecSeleJurosDia.Value;
  VlDesc:= tbCRecSeleValorDesc.Value;
  VlMu:= tbCRecSeleValorMulta.Value;
  VlJu:= tbCRecSeleValorJuros.Value;
  Pdesc:= tbCRecSelePercDesc.value;
  Pmu:= tbCRecSelePercMulta.value;
  Pju:= tbCRecSelePercJuros.Value;
  if Dtpg < DtVen then
    if Dtpg <= DtDesc then
      if PDesc > 0 then
        Desco:=VlAtual*(PDesc/100)
      else
    	  Desco:= VlDesc;
  if Dtpg > DtVen then
    begin
    if Dtpg >= DtMu then
      if Pmu > 0 then
        Multa:= VlAtual*(Pmu/100)
      else
        Multa:= VlMu;
    if Dtpg >= DtJu then
      begin
      Dias:= trunc(Dtpg - DtVen);
      if Pju >0 then
        Juros:= (VlAtual*(Pju/100))*dias
      else
        Juros:= VlJu*dias;
      end;
    end;
  VlAtual:= VlAtual-Desco+Multa+Juros;
  tbCRecSeleValTotal.Value:=VlAtual;
  tbCRecSeleDesconto.Value:=Desco;
  tbCRecSeleJuroMulta.Value:=Multa+Juros;
end;

procedure TFrmBaixaLoteCR.FormShow(Sender: TObject);
begin
  tbCRecSele.Open;
  ForPag:='N';
  Pago:='N';
  dmDados.BaixaLote:=True;
end;

procedure TFrmBaixaLoteCR.dbDtRecebChange(Sender: TObject);
begin
  tbCRecSele.Refresh;
  edtSubTot.Value:=0;
  edtDesc.Value:=0;
  edtJuros.Value:=0;
  edtTotal.Value:=0;
  tbCRecSele.First;
  while not tbCRecSele.Eof do
    begin
    edtSubTot.Value:=edtSubTot.Value+tbCRecSeleValor.Value;
    edtDesc.Value:=edtDesc.Value+tbCRecSeleDesconto.Value;
    edtJuros.Value:=edtJuros.Value+tbCRecSeleJuroMulta.Value;
    edtTotal.Value:=edtTotal.Value+tbCRecSeleValTotal.Value;
    tbCRecSele.Next;
    end;
end;

procedure TFrmBaixaLoteCR.dbDtRecebEnter(Sender: TObject);
begin
  edtSubTot.Value:=0;
  edtDesc.Value:=0;
  edtJuros.Value:=0;
  edtTotal.Value:=0;
  tbCRecSele.First;
  while not tbCRecSele.Eof do
    begin
    edtSubTot.Value:=edtSubTot.Value+tbCRecSeleValor.Value;
    edtDesc.Value:=edtDesc.Value+tbCRecSeleDesconto.Value;
    edtJuros.Value:=edtJuros.Value+tbCRecSeleJuroMulta.Value;
    edtTotal.Value:=edtTotal.Value+tbCRecSeleValTotal.Value;
    tbCRecSele.Next;
    end;
end;

procedure TFrmBaixaLoteCR.dbVlPg1Exit(Sender: TObject);
begin
  if dbVlPg.Value > edtTotal.Value then
    begin
    MsgDlg.MsgWarning('O valor informado de Pagemento|� superior ao valor devido !!!');
    dbVlPg.SetFocus;
    end;
end;

procedure TFrmBaixaLoteCR.dbVlPgExit(Sender: TObject);
begin
  if dbVlPg.Value > edtTotal.Value then
    begin
    MsgDlg.MsgWarning('O valor informado de Pagemento|� superior ao valor devido !!!');
    dbVlPg.SetFocus;
end;

end;
end.
