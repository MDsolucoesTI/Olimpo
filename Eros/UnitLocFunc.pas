//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Localiza��o de Funcion�rios
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitLocFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, Grids, DBGrids, RXDBCtrl, StdCtrls, ExtCtrls, RackCtls, fcButton,
  fcImgBtn, RXCtrls, db, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint, RxGrdCpt, fcImager, EMsgDlg,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmLocFunc = class(TForm)
    MsgDlg: TEvMsgDlg;
    RxLabel15: TRxLabel;
    Image1: TImage;
    RxLabel3: TRxLabel;
    cmbcampo: TComboBox;
    RxLabel1: TRxLabel;
    EdtCampo: TEdit;
    edtvalor: TEdit;
    LEDButton1: TLEDButton;
    RxLabel2: TRxLabel;
    RxLabel7: TRxLabel;
    LEDButton2: TLEDButton;
    fclLocFunc: TfcImageBtn;
    RxDBGrid1: TRxDBGrid;
    fclSair: TfcImageBtn;
    LMDBackPanel2: TPanel;
    LMDBackPanel1: TPanel;
    procedure fclSairClick(Sender: TObject);
    procedure LEDButton2Click(Sender: TObject);
    procedure cmbcampoEnter(Sender: TObject);
    procedure cmbcampoExit(Sender: TObject);
    procedure edtvalorEnter(Sender: TObject);
    procedure edtvalorExit(Sender: TObject);
    procedure fclLocFuncClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
        AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure LEDButton2DblClick(Sender: TObject);
  private
    { Private declarations }
    fresultado : longint;
  public
    { Public declarations }
    Property Resultado:longint Read Fresultado Write Fresultado;
  end;

var
  FrmLocFunc: TFrmLocFunc;
  LocOpts : TLocateOptions;
  cor,PorNome,PorCod : boolean;
  NomeTab : String;
  CodTab : LongInt;
implementation

uses UnitDmDados, unitPrincipal;

{$R *.DFM}

procedure TFrmLocFunc.fclSairClick(Sender: TObject);
begin
  resultado:=dmdados.tbFuncCodFunc.Value;
  dmDados.tbFunc.IndexFieldNames:='';
  Close;
end;

procedure TFrmLocFunc.LEDButton2Click(Sender: TObject);
begin
  if LEDButton2.StateOn then
    LEDButton2.StateOn:=False
  else
    LEDButton2.StateOn:=True;
end;

procedure TFrmLocFunc.cmbcampoEnter(Sender: TObject);
begin
  (Sender as TComboBox).Color:=$00D2E2FF;
end;

procedure TFrmLocFunc.cmbcampoExit(Sender: TObject);
begin
  PorNome:=False;
  PorCod:=False;
  if cmbCampo.Text = 'C�digo' Then
    Begin
    PorCod:=True;
    edtCampo.Text:='CodFunc';
    dmDados.tbFunc.IndexFieldNames:='';
    End
  Else if cmbcampo.text = 'Nome' then
    Begin
    PorNome:=True;
    edtCampo.Text:='Nome';
    dmDados.tbFunc.IndexFieldNames:='Nome';
    End;
  (Sender as TComboBox).Color:=clWindow;
end;

procedure TFrmLocFunc.edtvalorEnter(Sender: TObject);
begin
  (Sender as TEdit).Color:=$00D2E2FF;
end;

procedure TFrmLocFunc.edtvalorExit(Sender: TObject);
begin
  (Sender as TEdit).Color:=clwindow;
  fclLocFunc.Default:= True;
  fclLocFunc.SetFocus;
end;

procedure TFrmLocFunc.fclLocFuncClick(Sender: TObject);
begin
  fclLocFunc.Default:= False;
  LocOpts:=[];
  if LEDButton1.StateOn then
    LocOpts:=LocOpts+[loPartialKey];
  if LEDButton2.StateOn then
    LocOpts:=LocOpts+[loCaseInsensitive];
  If not dmdados.TbFunc.locate(edtCampo.Text, edtValor.text,LocOpts) Then
    begin
    MsgDlg.MsgInformation('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
    end
  else
    Begin
    cor := true;
    If PorNome Then
      NomeTab:=dmDados.tbFuncNome.Value;
    If PorCod Then
      CodTab:=dmDados.tbFuncCodFunc.Value;
    End;
  cmbCampo.SetFocus;
end;

procedure TFrmLocFunc.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  NOME : string;
  CODIGO : longInt;
begin
  NOME   :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Nome').asString;
  CODIGO :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CodFunc').asInteger;
  if cor then
    If PorNome Then
      If NOME = NomeTab Then
        background:=$00D2E2FF;
    If PorCod Then
      If CODIGO = CodTab Then
        background:=$00D2E2FF;
end;

procedure TFrmLocFunc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmLocFunc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    fclSair.Click;
  if Key=VK_PRIOR then
    LEDButton1DblClick(Sender);
  if Key=VK_NEXT then
    LEDButton2DblClick(Sender);
end;

procedure TFrmLocFunc.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [PageDown] A=a [F2] Localizar [ESC] Sai');
end;

procedure TFrmLocFunc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.StatusTeclas(False,'');
end;

procedure TFrmLocFunc.LEDButton1DblClick(Sender: TObject);
begin
  if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TFrmLocFunc.LEDButton2DblClick(Sender: TObject);
begin
  if LEDButton2.StateOn then
    LEDButton2.StateOn:=False
  else
    LEDButton2.StateOn:=True;
end;

end.
