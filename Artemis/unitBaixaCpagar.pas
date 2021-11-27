//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitBaixaCpagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, RXCtrls, DBCtrls, CurrEdit, RXDBCtrl, Mask, ToolEdit,
  Grids, DBGrids, fcButton, fcImgBtn, RXSplit, jpeg, SpeedBar, RackCtls,
  SRGrad,db, RxDBComb, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint, RxGrdCpt, fcImager;

type
  TFrmBaixaCpagar = class(TForm)
    Panel1: TPanel;
    RxLabel3: TRxLabel;
    DBENdocbaixa: TDBEdit;
    DBGridBaixaRec: TDBGrid;
    RxLabel1: TRxLabel;
    dbDataPagto: TDBDateEdit;
    RxDBCalcEditVlPg: TRxDBCalcEdit;
    RxLabel2: TRxLabel;
    RxLabel5: TRxLabel;
    RxDBVlDoc: TRxDBCalcEdit;
    RxSplitter1: TRxSplitter;
    Panel2: TPanel;
    Image1: TImage;
    RxLabel4: TRxLabel;
    Panel3: TPanel;
    btnCancelar: TfcImageBtn;
    RxGradientCaption2: TRxGradientCaption;
    fcImager3: TfcImager;
    fcImager1: TfcImager;
    fcImager2: TfcImager;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbDataPagtoExit(Sender: TObject);
    procedure RxDBCalcEditVlPgExit(Sender: TObject);
    procedure fcImageBtn1Click(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure DBComboBox1Enter(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
      fresultado : real;
  public
    { Public declarations }
      Property Resultado : real Read fresultado Write fresultado;
  end;

var
  FrmBaixaCpagar : TFrmBaixaCpagar;
              pos  : tbookmark;

implementation

uses UnitDmdados, unitCreceber, unitConfPagto, UnitPrincipal,
  unitCpagar;

{$R *.DFM}

procedure TFrmBaixaCpagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
frmPrincipal.statusteclas(False,'');
frmCPagar.visible:=true;
Action:= Cafree;
end;

procedure TFrmBaixaCpagar.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmBaixaCpagar.dbDataPagtoExit(Sender: TObject);
Var
  VlAtual, Multa, Juros, VlDesc, VlMu, VlJu,PJu: Real;
  DtVen, DtDesc, DtMu, DtJu, DtPg: TDateTime;
  PDesc, Pmu : Real;
  Dias:longint;
begin
   if (dbDataPagto.text <> '  /  /    ') then
     begin
     try StrToDate(dbDataPagto.text)
       except on EConvertError do
         begin
         ShowMessage('Data Inv�lida');
         dbDataPagto.SetFocus;
         end;
       end;
     end
   else
     begin
    Multa:= 0;
    Juros:= 0;
  VlAtual:= Dmdados.tbCpagarValor.Value;
    DtVen:= Dmdados.tbCpagarDataVenc.Value;
     DtPg:= StrToDate(dbDatapagto.text);

  resultado:=vlAtual;

(Sender as TDbDateEdit).Color:=clWindow;
end;
end;

procedure TFrmBaixaCpagar.RxDBCalcEditVlPgExit(Sender: TObject);
begin
pos := dmdados.tbCpagar.GetBookmark;
{abrir o frm para relan�ar contas � receber}
frmConfPagto:=tfrmConfPagto.create(application);
frmConfPagto.showmodal;
end;

procedure TFrmBaixaCpagar.fcImageBtn1Click(Sender: TObject);
begin
     Close;
end;

procedure TFrmBaixaCpagar.BtnSairClick(Sender: TObject);
begin
dmdados.tbCPagar.Cancel;
close;
end;

procedure TFrmBaixaCpagar.DBComboBox1Enter(Sender: TObject);
begin
(Sender as TDBComboBox).Color:=clTeal;
end;

procedure TFrmBaixaCpagar.DBComboBox1Exit(Sender: TObject);
begin
(Sender as TDBComboBox).Color:=clWindow;
end;

procedure TFrmBaixaCpagar.BtnCancelarClick(Sender: TObject);
begin
dmdados.tbCPagar.Cancel;
close;
end;

procedure TFrmBaixaCpagar.FormShow(Sender: TObject);
begin
FrmPrincipal.StatusTeclas(True,'[Esc] Sair');
Dmdados.tbCPagar.Edit;
dbdatapagto.SetFocus;
end;

procedure TFrmBaixaCpagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : if dmDados.vTabStt then BtnCancelar.Click;
end;
end;

end.
