//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitLocCreceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXSplit, StdCtrls, Mask, DBCtrls, RXCtrls, ExtCtrls, SpeedBar, jpeg,
  CurrEdit, RXDBCtrl, ToolEdit, fcButton, fcImgBtn, Grids, DBGrids,variants,
  RackCtls, db, RxGrdCpt, fcImager, EMsgDlg;

type
  TFrmLocCReceber = class(TForm)
    Panel1: TPanel;
    RxLabel3: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel7: TRxLabel;
    LEDButton1: TLEDButton;
    LEDButton2: TLEDButton;
    EdtValor: TEdit;
    EdtCampo: TEdit;
    fclLocCreceber: TfcImageBtn;
    cmbcampo: TComboBox;
    RxDBGrid1: TRxDBGrid;
    Panel2: TPanel;
    RxLabel4: TRxLabel;
    Image3: TImage;
    fclSair: TfcImageBtn;
    RxGradientCaption2: TRxGradientCaption;
    MsgDlg: TEvMsgDlg;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValorExit(Sender: TObject);
    procedure fclSairClick(Sender: TObject);
    procedure cmbcampoExit(Sender: TObject);
    procedure fclLocCreceberClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure LEDButton2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLocCReceber: TFrmLocCReceber;
        LocOpts : TlocateOptions;
      NumDocTab : String;
            Cor : boolean;
         vertipo:char;
implementation

uses UnitDmdados, UnitPrincipal;

{$R *.DFM}

procedure TFrmLocCReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.StatusTeclas(False,'');
end;

procedure TFrmLocCReceber.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmLocCReceber.EdtValorExit(Sender: TObject);
begin
  fclLocCreceber.Default:=true;
  fclLocCreceber.SetFocus;
end;

procedure TFrmLocCReceber.fclSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLocCReceber.cmbcampoExit(Sender: TObject);
begin
  if cmbCampo.Text = 'Documento' Then
    edtCampo.Text:='NumDoc';
end;

procedure TFrmLocCReceber.fclLocCreceberClick(Sender: TObject);
begin
  fclLocCreceber.Default:= False;
  LocOpts:=[];
  if LEDButton1.StateOn then
    LocOpts:=LocOpts+[loPartialKey];
  if LEDButton2.StateOn then
    LocOpts:=LocOpts+[loCaseInsensitive];
  If not dmdados.tbCReceber.locate(edtCampo.Text,edtValor.text,LocOpts) Then
    ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text)
  else
    Begin
    cor := true;
    NumDocTab:=dmDados.tbCReceberNumDoc.Value;
    End;
   Cmbcampo.SetFocus;
end;

procedure TFrmLocCReceber.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  doc : string;
begin
  doc :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('NumDoc').value;
  if cor then
    If doc = NumDocTab Then
      background:=$00D2E2FF;
end;

procedure TFrmLocCReceber.LEDButton1DblClick(Sender: TObject);
begin
  if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TFrmLocCReceber.LEDButton2DblClick(Sender: TObject);
begin
if LEDButton2.StateOn then
    LEDButton2.StateOn:=False
  else
    LEDButton2.StateOn:=True;
end;

procedure TFrmLocCReceber.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [PageDown] A=a [F2] Localizar [ESC] Sai');
  cmbCampo.ItemIndex:=0;
  cmbcampo.SetFocus;
  EdtCampo.Text:='NumDoc';
end;

procedure TFrmLocCReceber.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    fclSair.Click;
  if Key=VK_PRIOR then
    LEDButton1DblClick(Sender);
  if Key=VK_NEXT then
    LEDButton2DblClick(Sender);
end;

end.
