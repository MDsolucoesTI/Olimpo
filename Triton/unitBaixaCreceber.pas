//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitBaixaCreceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, RXCtrls, DBCtrls, CurrEdit, RXDBCtrl, Mask, ToolEdit,
  Grids, DBGrids, fcButton, fcImgBtn, RXSplit, jpeg, SpeedBar, RackCtls,
  SRGrad,db, RxDBComb, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint;

type
  TFrmBaixaCReceber = class(TForm)
    Panel1: TPanel;
    RxLabel3: TRxLabel;
    DBENdocbaixa: TDBEdit;
    DBGridBaixaRec: TDBGrid;
    RxLabel1: TRxLabel;
    dbDataPagto: TDBDateEdit;
    RxDBCalcEditVlPg: TRxDBCalcEdit;
    RxLabel2: TRxLabel;
    Panel2: TPanel;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnCancelar: TSpeedItem;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    Image2: TImage;
    Label2: TLabel;
    RxLabel5: TRxLabel;
    RxDBVlDoc: TRxDBCalcEdit;
    RxSplitter1: TRxSplitter;
    RxLabel6: TRxLabel;
    LMDShapeHint1: TLMDShapeHint;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBENdocbaixaEnter(Sender: TObject);
    procedure DBENdocbaixaExit(Sender: TObject);
    procedure dbDataPagtoEnter(Sender: TObject);
    procedure dbDataPagtoExit(Sender: TObject);
    procedure RxDBCalcEditVlPgEnter(Sender: TObject);
    procedure RxDBCalcEditVlPgExit(Sender: TObject);
    procedure DBLcombBancEnter(Sender: TObject);
    procedure DBLcombBancExit(Sender: TObject);
    procedure DBEChequeEnter(Sender: TObject);
    procedure DBEChequeExit(Sender: TObject);
    procedure fcImageBtn1Click(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure DBComboBox1Enter(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
      fresultado : real;
  public
    { Public declarations }
      Property Resultado : real Read fresultado Write fresultado;
  end;

var
  FrmBaixaCReceber : TFrmBaixaCReceber;
              pos  : tbookmark;

implementation

uses UnitLocCReceber, UnitDmdados, UnitConfReceb, unitCreceber;

{$R *.DFM}

procedure TFrmBaixaCReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
frmCreceber.visible:=true;
Action:= Cafree;
end;

procedure TFrmBaixaCReceber.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmBaixaCReceber.DBENdocbaixaEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=$00d2e2ff;
end;

procedure TFrmBaixaCReceber.DBENdocbaixaExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmBaixaCReceber.dbDataPagtoEnter(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=$00d2e2ff;
end;

procedure TFrmBaixaCReceber.dbDataPagtoExit(Sender: TObject);
Var
  VlAtual, Multa, Juros, VlDesc, VlMu, VlJu,PJu: Real;
  DtVen, DtDesc, DtMu, DtJu, DtPg: TDateTime;
  PDesc, Pmu : Real;
  Dias:longint;

begin
    Multa:= 0;
    Juros:= 0;
  VlAtual:= Dmdados.tbCReceberValor.Value;
    DtVen:= Dmdados.tbCReceberDataVenc.Value;
     DtPg:= StrToDate(dbDatapagto.text);
   DtDesc:= dmdados.tbCReceberDescDia.Value;
     DtMu:= Dmdados.tbCReceberMultaDia.Value;
     DtJu:= Dmdados.tbCReceberJurosDia.Value;
   VlDesc:= Dmdados.tbCReceberValorDesc.Value;
     VlMu:= Dmdados.tbCReceberValorMulta.Value;
     VlJu:= Dmdados.tbCReceberValorJuros.Value;
    Pdesc:= Dmdados.tbCReceberPercDesc.value;
      Pmu:= Dmdados.tbCReceberPercMulta.value;
      Pju:= Dmdados.tbCReceberPercJuros.Value;
  If Dtpg < DtVen then
    if Dtpg <= DtDesc Then
      If PDesc > 0 Then
        VlAtual:= VlAtual - (VlAtual*(PDesc/100))
      Else
      	VlAtual:= VlAtual - VlDesc;

 If Dtpg > DtVen Then
   Begin
   If Dtpg >= DtMu then
     if Pmu > 0 Then
       Multa:= VlAtual*(Pmu/100)
     Else
       Multa:= VlMu;
   If Dtpg >= DtJu Then
     Begin
     Dias:= trunc(Dtpg - DtVen);
     If Pju >0 then
       Juros:= (VlAtual*(Pju/100))*dias
     Else
       Juros:= VlJu*dias;
     end;
     VlAtual:= VlAtual+Multa+Juros;
   End;
  Dmdados.tbCReceberValorPago.Value:= VlAtual;
  resultado:=vlAtual;

(Sender as TDbDateEdit).Color:=clWindow;
end;

procedure TFrmBaixaCReceber.RxDBCalcEditVlPgEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).Color:=$00d2e2ff;
end;

procedure TFrmBaixaCReceber.RxDBCalcEditVlPgExit(Sender: TObject);
begin
pos := dmdados.tbCreceber.GetBookmark;
{abrir o frm para relan�ar contas � receber}
frmConfReceb:=tfrmConfReceb.create(application);
frmConfReceb.showmodal;
(Sender as TRxDBCalcEdit).Color:=clWindow;
end;

procedure TFrmBaixaCReceber.DBLcombBancEnter(Sender: TObject);
begin
(Sender as TDBLookupComboBox).Color:=clTEAL;
end;

procedure TFrmBaixaCReceber.DBLcombBancExit(Sender: TObject);
begin
(Sender as TDBLookupComboBox).Color:=clWindow;
end;

procedure TFrmBaixaCReceber.DBEChequeEnter(Sender: TObject);
begin
(Sender as TDBEdit).Color:=clTEAL;
end;

procedure TFrmBaixaCReceber.DBEChequeExit(Sender: TObject);
begin
(Sender as TDBEdit).Color:=clWindow;
end;

procedure TFrmBaixaCReceber.fcImageBtn1Click(Sender: TObject);
begin
     Close;
end;

procedure TFrmBaixaCReceber.BtnSairClick(Sender: TObject);
begin
     Close;
end;

procedure TFrmBaixaCReceber.DBComboBox1Enter(Sender: TObject);
begin
(Sender as TDBComboBox).Color:=clTeal;
end;

procedure TFrmBaixaCReceber.DBComboBox1Exit(Sender: TObject);
begin
(Sender as TDBComboBox).Color:=clWindow;
end;

procedure TFrmBaixaCReceber.BtnCancelarClick(Sender: TObject);
begin
dmdados.tbCReceber.Cancel;
close;
end;

procedure TFrmBaixaCReceber.FormShow(Sender: TObject);
begin
Dmdados.tbCReceber.Edit;
dbdatapagto.SetFocus;
end;

end.
