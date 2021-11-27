//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitTipoPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, RxGrdCpt, ExtCtrls, ToolEdit, RXDBCtrl,
  StdCtrls, DBCtrls, CurrEdit, Mask, RxLookup, RXCtrls, LMDControl,
  LMDBaseControl, LMDBaseGraphicButton, LMDCustomShapeButton,
  LMDShapeButton, jpeg, fcImager;

type
  TFrmTipoPgto = class(TForm)
    cbPagto: TPanel;
    btnDinheiro: TLMDShapeButton;
    btnCheque: TLMDShapeButton;
    PanelCheq: TPanel;
    PanelDinh: TPanel;
    edtVlPago: TRxLabel;
    RxLabel1: TRxLabel;
    edtTroco: TRxLabel;
    edtVlTotal: TCurrencyEdit;
    VlPago: TCurrencyEdit;
    Troco: TCurrencyEdit;
    PanelFrente: TPanel;
    Panel3: TPanel;
    RxLabel4: TRxLabel;
    Image1: TImage;
    RxGradientCaption2: TRxGradientCaption;
    Panel4: TPanel;
    btnConfirmar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    RxLabel8: TRxLabel;
    edtValor: TCurrencyEdit;
    RxLabel7: TRxLabel;
    dbNum: TDBEdit;
    RxLabel16: TRxLabel;
    dbLookBanc: TRxLookupEdit;
    RxLabel2: TRxLabel;
    RxLabel9: TRxLabel;
    RxLabel3: TRxLabel;
    dbNumCheq: TEdit;
    RxLabel5: TRxLabel;
    CheckPre: TCheckBox;
    RxLabel6: TRxLabel;
    dbBomPara: TDateEdit;
    dbNumConta: TRxLookupEdit;
    dbAgencia: TDBEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnDinheiroClick(Sender: TObject);
    procedure btnChequeClick(Sender: TObject);
    procedure VlPagoExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure CheckPreClick(Sender: TObject);
  private
    { Private declarations }
    fPagoStt:string;
  public
    { Public declarations }
    Property PagoStt:string Read fPagoStt Write fPagoStt;
  end;

var
  FrmTipoPgto: TFrmTipoPgto;
  TipoPag : String;

implementation

uses unitCpagar, unitDmDados;

{$R *.dfm}

procedure TFrmTipoPgto.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTipoPgto.btnDinheiroClick(Sender: TObject);
begin
  PanelFrente.Visible:=False;
  PanelDinh.Visible:=True;
  PanelCheq.Visible:=False;
  TipoPag:='Din';
  edtVlTotal.Value:=frmCpagar.dbVlPago.Value;
  VlPago.SetFocus;
end;

procedure TFrmTipoPgto.btnChequeClick(Sender: TObject);
begin
  PanelFrente.Visible:=False;
  PanelDinh.Visible:=False;
  PanelCheq.Visible:=True;
  TipoPag:='Che';
  edtValor.Value:=frmCpagar.dbVlPago.Value;
  dbNumConta.SetFocus;
end;

procedure TFrmTipoPgto.VlPagoExit(Sender: TObject);
begin
  Troco.Value:=VlPago.Value-edtVlTotal.Value;
end;

procedure TFrmTipoPgto.btnCancelarClick(Sender: TObject);
begin
  PagoStt:='N';
  Close;
end;

procedure TFrmTipoPgto.btnConfirmarClick(Sender: TObject);
var
  ano,mes,dia : word;
  mesCusto,anoCusto,Custo : string;
begin
  PagoStt:='S';
  if TipoPag='Din' then
    begin
    dmdados.TbMovConta.Append;
    dmdados.TbMovContaDosNumero.Value:=dmdados.tbCPagarNumDoc.Value;
    dmdados.TbMovContaConta.Value:='000000000000001';
    dmdados.TbMovContaDataMov.Value:=FrmCPagar.dbDtPgto.Date;
    dmdados.tbMovContaDataReg.value:=date;
    dmdados.TbMovContaHoraReg.Value:=time;
    dmdados.TbMovContaTipoOper.Value:='S';
    dmdados.TbMovContaCodHist.Value:=dmdados.tbCPagarCodHist.Value;
    dmdados.TbMovContaCodDoc.Value:=dmdados.tbCPagarCodDoc.Value;
    dmdados.TbMovContaComplHist.Value:=dmDados.tbCPagarCompHist.Value;
    dmdados.TbMovContaValor.Value:=FrmCPagar.dbVlPago.Value;
    dmdados.TbMovConta.Post;
    {atualizar conta corrente}
    if dmdados.TbCCorrente.Locate('Conta','000000000000001',[]) then
      begin
      dmdados.TbCCorrente.Edit;
      dmdados.TbCCorrenteSaldo.Value:=dmDados.TbCCorrenteSaldo.Value-FrmCPagar.dbVlPago.Value;
      dmdados.tbccorrenteUltMov.value:=date;
      dmdados.TbCCorrente.post;
      end;
    {atualizar centro de custo}
    DecodeDate(now,ano,mes,dia);
    mesCusto:=IntToStr(mes);
    anoCusto:=IntTostr(ano);
    Custo:=dmdados.tbCPagarCodCCusto.Value;
    if dmdados.TbBalCusto.Locate('CodCcusto;Mes;Ano',VarArrayOf([Custo,mesCusto,anoCusto]),[]) then
      begin
      dmdados.tbBalcusto.edit;
      dmdados.tbBalCustoDespesas.value:=dmdados.tbBalCustoDespesas.value+FrmCPagar.dbVlPago.Value;
      dmdados.tbBalCusto.Post;
      end;
    end;
  if TipoPag='Che' then
    begin
    if CheckPre.Checked then
      begin
      dmdados.tbChequePro.Append;
      dmdados.tbChequeProNumBanco.Value:=dbNum.Text;
      dmdados.tbChequeProNomeBanco.Value:=dbLookBanc.Text;
      dmdados.tbChequeProAgencia.Value:=dbAgencia.Text;
      dmdados.tbChequeProCodFor.Value:=dmdados.tbCPagarCodFor.Value;
      dmdados.tbChequeProConta.Value:=dbNumConta.Text;
      dmdados.tbChequeProValor.Value:=FrmCPagar.dbVlPago.Value;
      dmdados.tbChequeProVencimento.Value:=dbBomPara.Date;
      dmDados.tbChequeProPre.Value:='S';
      dmdados.tbChequeProStatus.Value:='ABERTO';
      dmdados.tbChequeProNumCheque.Value:=StrToFloat(dbNumCheq.Text);
      dmDados.tbChequePro.Post;
      end;
    if Not CheckPre.Checked then
      begin
      dmdados.TbMovConta.Append;
      dmdados.TbMovContaDosNumero.Value:=dmdados.tbCPagarNumDoc.Value;
      dmdados.TbMovContaConta.Value:=dbNumConta.Text;
      dmdados.TbMovContaDataMov.Value:=FrmCPagar.dbDtPgto.Date;
      dmdados.tbMovContaDataReg.value:=date;
      dmdados.TbMovContaHoraReg.Value:=time;
      dmdados.TbMovContaTipoOper.Value:='S';
      dmdados.TbMovContaCodHist.Value:=dmdados.tbCPagarCodHist.Value;
      dmdados.TbMovContaCodDoc.Value:=dmdados.tbCPagarCodDoc.Value;
      dmdados.TbMovContaComplHist.Value:='Pagamento em Cheque n� '+dbNumCheq.Text;
      dmdados.TbMovContaValor.Value:=FrmCPagar.dbVlPago.Value;
      dmdados.TbMovConta.Post;
      {atualizar conta corrente}
      if dmdados.TbCCorrente.Locate('Conta',dbNumConta.Text,[]) then
        begin
        dmdados.TbCCorrente.Edit;
        dmdados.TbCCorrenteSaldo.Value:=dmDados.TbCCorrenteSaldo.Value-FrmCPagar.dbVlPago.Value;
        dmdados.tbccorrenteUltMov.value:=date;
        dmdados.TbCCorrente.post;
        end;
      end;
    {atualizar centro de custo}
    DecodeDate(now,ano,mes,dia);
    mesCusto:=IntToStr(mes);
    anoCusto:=IntTostr(ano);
    Custo:=dmdados.tbCPagarCodCCusto.Value;
    if dmdados.TbBalCusto.Locate('CodCcusto;Mes;Ano',VarArrayOf([Custo,mesCusto,anoCusto]),[]) then
      begin
      dmdados.tbBalcusto.edit;
      dmdados.tbBalCustoDespesas.value:=dmdados.tbBalCustoDespesas.value+FrmCPagar.dbVlPago.Value;
      dmdados.tbBalCusto.Post;
      end;
    end;
  Close;
end;

procedure TFrmTipoPgto.CheckPreClick(Sender: TObject);
begin
  if CheckPre.Checked then
    dbBomPara.Enabled:=True;
end;

end.
