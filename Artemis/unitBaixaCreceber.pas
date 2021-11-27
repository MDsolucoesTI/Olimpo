//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
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
  LMDCustomShapeHint, LMDShapeHint, RxGrdCpt, fcImager;

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
    RxLabel5: TRxLabel;
    RxDBVlDoc: TRxDBCalcEdit;
    RxSplitter1: TRxSplitter;
    Panel2: TPanel;
    Image2: TImage;
    RxLabel4: TRxLabel;
    Panel3: TPanel;
    btnCancelar: TfcImageBtn;
    RxGradientCaption2: TRxGradientCaption;
    fcImager1: TfcImager;
    fcImager2: TfcImager;
    fcImager3: TfcImager;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbDataPagtoExit(Sender: TObject);
    procedure fcImageBtn1Click(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
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
  FrmBaixaCReceber : TFrmBaixaCReceber;
              pos  : tbookmark;

implementation

uses UnitDmdados, unitCreceber, UnitPrincipal;

{$R *.DFM}

procedure TFrmBaixaCReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
frmPrincipal.statusteclas(False,'');
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

procedure TFrmBaixaCReceber.dbDataPagtoExit(Sender: TObject);
Var
  VlAtual, Multa, Juros, VlDesc, VlMu, VlJu,PJu: Real;
  DtVen, DtDesc, DtMu, DtJu, DtPg: TDateTime;
  PDesc, Pmu : Real;
  Dias:longint;
  flag:boolean;

begin
    flag:=true;
    if  (dbDataPagto.text ='  / /   ') then
      begin
      ShowMessage('Data Vazia');
      flag:=false;
      end
    else
      begin
       try StrToDate(dbDataPagto.text)
        except on EConvertError do
         begin
          ShowMessage('Data Inv�lida');
          dbDataPagto.SetFocus;
          flag:=false;
         end;
       end;
      end;

 if flag then
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
 end;

end;

procedure TFrmBaixaCReceber.fcImageBtn1Click(Sender: TObject);
begin
dmdados.tbCReceber.Cancel;
close;
end;

procedure TFrmBaixaCReceber.BtnSairClick(Sender: TObject);
begin
     Close;
end;

procedure TFrmBaixaCReceber.BtnCancelarClick(Sender: TObject);
begin
dmdados.tbCReceber.Cancel;
close;
end;

procedure TFrmBaixaCReceber.FormShow(Sender: TObject);
begin
FrmPrincipal.StatusTeclas(True,'[Esc] Sair');
Dmdados.tbCReceber.Edit;
dbdatapagto.SetFocus;
end;

procedure TFrmBaixaCReceber.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : if dmDados.vTabStt then BtnCancelar.Click;
end;
end;

end.
