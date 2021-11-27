//////////////////////////////////////////////////////////////////////////
// Criacao...........: 05/2002
// Sistema...........: Metallum - Controle de Serviços
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitlocOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CurrEdit, RXDBCtrl, ToolEdit, RXSplit, fcButton, fcImgBtn, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, ExtCtrls, RXCtrls, RackCtls, jpeg, DBTables, DB,
  EnhEdit, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  LMDShapeHint;

type
  TfrmLocOS = class(TForm)
    Panel1: TPanel;
    RxLabel3: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel7: TRxLabel;
    LEDButton1: TLEDButton;
    LEDButton2: TLEDButton;
    fclSair: TfcImageBtn;
    EdtValor: TEdit;
    EdtCampo: TEdit;
    fclLocCli: TfcImageBtn;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    Panel2: TPanel;
    Cmbcampo: TComboBox;
    Image2: TImage;
    Label2: TLabel;
    RxDBGrid1: TRxDBGrid;
    RxLabel15: TRxLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValorExit(Sender: TObject);
    procedure fclSairClick(Sender: TObject);
    procedure CmbcampoExit(Sender: TObject);
    procedure fclLocCliClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
              AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure LEDButton2DblClick(Sender: TObject);

  private
    { Private declarations }
     fresultado : longint;
      codFuncOs : longint;
       codCliOS : longint;
  public
    { Public declarations }
     Property Resultado : longint Read Fresultado Write Fresultado;
     Property CodFunc   : longint Read  codFuncOs Write codFuncOs;
     Property codcli    : longint Read  codcliOS  Write codcliOS;
  end;

var
  frmLocOS: TfrmLocOS;
  LocOpts : TLocateOptions;
  cor,PorNum,PorCod : boolean;
  NumTab : String;
  CodTab : LongInt;
  VerTipo : Char;
  novoitem:boolean;

implementation

uses UnitDmdados, unitPrincipal ;

{$R *.DFM}

procedure TfrmLocOS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TfrmLocOS.EdtValorExit(Sender: TObject);
begin
 fclLocCli.Default:= True;
 fclLocCli.SetFocus;
end;

procedure TfrmLocOS.fclSairClick(Sender: TObject);
begin
  resultado := dmdados.tbOsCodOs.Value;
  codFunc   := dmdados.tbOsCodFunc.Value;
  codcli    := dmdados.tbOsCodCli.value;
  Close;
end;


procedure TfrmLocOS.CmbcampoExit(Sender: TObject);
begin
PorNum:=False;
PorCod:=False;
if cmbCampo.Text = 'C�digo' Then
   Begin
   VerTipo:='I';
   PorCod:=True;
   edtCampo.Text:='CodOS';
   End
Else if cmbcampo.text = 'N�mero' then
   Begin
   VerTipo:='K';
   PorNum:=True;
   edtCampo.Text:='numero';
   End;
end;

procedure TfrmLocOS.fclLocCliClick(Sender: TObject);
begin
if cmbcampo.Text='' then
  begin
  showmessage('Obrigat�rio informar o campo');
  cmbCampo.SetFocus;
  end
else
  begin
  {verificando se dado digitado corresponde ao tipo}
  if (vertipo='I') and (StrToIntDef(edtvalor.text,-1)= -1) then
    begin
    ShowMessage('Valor digitado deve ser num�rico');
    edtvalor.SetFocus;
    abort;
    end;

  fclLocCli.Default:= False;
  LocOpts:=[];
  if LEDButton1.StateOn then
    LocOpts:=LocOpts+[loPartialKey];
  if LEDButton2.StateOn then
    LocOpts:=LocOpts+[loCaseInsensitive];
  If not dmdados.tbOs.locate(edtCampo.Text, edtValor.text,LocOpts) Then
    begin
    ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
    end
  else
    Begin
    cor := true;
    If PorNum Then
      NumTab:=dmDados.tbOsNumero.Value;
    If PorCod Then
      CodTab:=dmDados.tbOsCodOs.Value;
    End;
  Cmbcampo.SetFocus;
  end;
end;

procedure TfrmLocOS.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  Numero  : string;
  CODIGO : longInt;
begin
  Numero := (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Numero').asString;
  CODIGO :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Codos').asInteger;
  if cor then
    If PorNum Then
      If Numero = NumTab Then
        background:=$00D2E2FF;
    If PorCod Then
      If CODIGO = CodTab Then
        background:=$00D2E2FF;
end;

procedure TfrmLocOS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    fclSair.Click;
  if Key=VK_PRIOR then
    LEDButton1DblClick(Sender);
  if Key=VK_NEXT then
    LEDButton2DblClick(Sender);
end;

procedure TfrmLocOS.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [PageDown] A=a [ESC] Sai');
  edtCampo.Text:='CodOS';
  VerTipo:='I';
end;

procedure TfrmLocOS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.StatusTeclas(False,'');
end;

procedure TfrmLocOS.LEDButton1DblClick(Sender: TObject);
begin
  if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TfrmLocOS.LEDButton2DblClick(Sender: TObject);
begin
if LEDButton2.StateOn then
    LEDButton2.StateOn:=False
  else
    LEDButton2.StateOn:=True;
end;

end.
