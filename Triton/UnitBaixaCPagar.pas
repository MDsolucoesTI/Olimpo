//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitBaixaCpagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, RackCtls, DBCtrls, SpeedBar, jpeg, CurrEdit, db,
  RXDBCtrl, ToolEdit, Grids, DBGrids, Mask, RXCtrls, RxDBComb;

type
  TFrmBaixaCPagar = class(TForm)
    Panel1: TPanel;
    RxLabel3: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    DBENdocbaixa: TDBEdit;
    DBGridBaixaRec: TDBGrid;
    dbdatapagto: TDBDateEdit;
    RxDBVlDoc: TRxDBCalcEdit;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnCancelar: TSpeedItem;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    Panel2: TPanel;
    Image2: TImage;
    Label2: TLabel;
    RxLabel5: TRxLabel;
    RxDBVlPg: TRxDBCalcEdit;
    RxLabel4: TRxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbdatapagtoExit(Sender: TObject);
    procedure dbdatapagtoEnter(Sender: TObject);
    procedure RxDBVlPgExit(Sender: TObject);
  private
    { Private declarations }
    fresultado : real;
  public
    { Public declarations }
    Property Resultado : real Read fresultado Write fresultado;
  end;

var
  FrmBaixaCPagar : TFrmBaixaCPagar;
             pos : tbookmark;

implementation

uses UnitDmdados, unitConfPagtoCP;

{$R *.DFM}

procedure TFrmBaixaCPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:= Cafree;
end;

procedure TFrmBaixaCPagar.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmBaixaCPagar.BtnSairClick(Sender: TObject);
begin
     Close;
end;

procedure TFrmBaixaCPagar.BtnCancelarClick(Sender: TObject);
begin
dmdados.tbCPagar.Cancel;
Close;

end;

procedure TFrmBaixaCPagar.FormShow(Sender: TObject);
begin
Dmdados.tbCPagar.Edit;
dmdados.tbCPagarDataPaga.Value:=date;
dbdatapagto.SetFocus;
end;

procedure TFrmBaixaCPagar.dbdatapagtoExit(Sender: TObject);
Var
  VlAtual, Multa, Juros, VlDesc, VlMu, VlJu,PJu: Real;
  DtVen, DtDesc, DtMu, DtJu, DtPg: TDateTime;
  PDesc, Pmu : real;
  Dias:longint;
begin
    Multa:= 0;
    Juros:= 0;
  VlAtual:= Dmdados.tbCPagarValor.Value;
    DtVen:= Dmdados.tbCPagarDataVenc.Value;
     DtPg:= StrToDate(dbDatapagto.text);
   DtDesc:= dmdados.tbCPagarDescDia.Value;
     DtMu:= Dmdados.tbCPagarMultaDia.Value;
     DtJu:= Dmdados.tbCPagarJurosDia.Value;
   VlDesc:= Dmdados.tbCPagarValorDesc.Value;
     VlMu:= Dmdados.tbCPagarValorMulta.Value;
     VlJu:= Dmdados.tbCPagarValorJuros.Value;
    Pdesc:= Dmdados.tbCPagarPercDesc.value;
      Pmu:= Dmdados.tbCPagarPercMulta.value;
      Pju:= Dmdados.tbCPagarPercJuros.Value;
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
  Dmdados.tbCPagarValorPago.Value:= VlAtual;
  resultado:=vlAtual;
end;

procedure TFrmBaixaCPagar.dbdatapagtoEnter(Sender: TObject);
begin
(sender as TdbDateedit).color:=$00D2E2FF;
end;

procedure TFrmBaixaCPagar.RxDBVlPgExit(Sender: TObject);
begin
pos := dmdados.tbCPagar.GetBookmark;
{abrir o frm para relan�ar contas � pagar}
frmConfPgtoCP:=tfrmConfPgtoCP.create(application);
frmConfPgtoCP.showmodal;
end;

end.
