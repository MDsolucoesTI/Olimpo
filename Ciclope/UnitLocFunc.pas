//////////////////////////////////////////////////////////////////////////
// Criacao...........: 05/2002
// Sistema...........: Ciclope - Controle de Funcionarios
// Integracao........: Olimpo - Automacao Comercial
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
  LMDCustomShapeHint, LMDShapeHint;

type
  TFrmLocFunc = class(TForm)
    Panel1: TPanel;
    RxLabel3: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel7: TRxLabel;
    LEDButton1: TLEDButton;
    LEDButton2: TLEDButton;
    fclSair: TfcImageBtn;
    edtvalor: TEdit;
    EdtCampo: TEdit;
    fclLocFunc: TfcImageBtn;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    cmbcampo: TComboBox;
    RxDBGrid1: TRxDBGrid;
    Panel2: TPanel;
    Image2: TImage;
    Label2: TLabel;
    RxLabel15: TRxLabel;
    procedure fclSairClick(Sender: TObject);
    procedure LEDButton2Click(Sender: TObject);
    procedure cmbcampoExit(Sender: TObject);
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
  VerTipo : Char;


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

procedure TFrmLocFunc.cmbcampoExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
    Begin
    If cmbcampo.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar o CAMPO');
      cmbcampo.SetFocus;
      End
    Else
      Begin
      Flag:=True;
      For x:=0 to cmbcampo.Items.Count-1 Do
        If cmbcampo.Text=cmbcampo.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor inv�lido');
        cmbcampo.SetFocus;
        End;
      end;
    end;

    PorNome:=False;
    PorCod:=False;
    if cmbCampo.Text = 'C�digo' Then
    Begin
    VerTipo:='I';
      PorCod:=True;
      edtCampo.Text:='CodFunc';
      dmDados.tbFunc.IndexFieldNames:='';
    End
  Else if cmbcampo.text = 'Nome' then
    Begin
      VerTipo:='K';
      PorNome:=True;
      edtCampo.Text:='Nome';
      dmDados.tbFunc.IndexFieldNames:='Nome';
    End;

end;

procedure TFrmLocFunc.edtvalorExit(Sender: TObject);
begin
  fclLocFunc.Default:= True;
  fclLocFunc.SetFocus;
end;

procedure TFrmLocFunc.fclLocFuncClick(Sender: TObject);
begin
if cmbCampo.Text='' then
  ShowMessage('Obrigat�rio informar o Campo de pesquisa')
else
begin
  {verificando se dado digitado corresponde ao tipo}
  if (vertipo='I') and (StrToIntDef(edtvalor.text,-1)= -1) then
    begin
    ShowMessage('Valor digitado deve ser num�rico');
    edtvalor.SetFocus;
    abort;
    end;
  fclLocFunc.Default:= False;
  LocOpts:=[];
  if LEDButton1.StateOn then
    LocOpts:=LocOpts+[loPartialKey];
  if LEDButton2.StateOn then
    LocOpts:=LocOpts+[loCaseInsensitive];
  If not dmdados.TbFunc.locate(edtCampo.Text, edtValor.text,LocOpts) Then
    begin
    ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
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
  if key=VK_F2 then fclLocfunc.Click;
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
