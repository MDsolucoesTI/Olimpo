//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitLocImovel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  LMDShapeHint, StdCtrls, jpeg, Grids, DBGrids, RXDBCtrl, ExtCtrls,
  RackCtls, fcButton, fcImgBtn, RXCtrls, DB, DBTables;

type
  TFrmLocImov = class(TForm)
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
    btnLocImo: TfcImageBtn;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    RxLabel15: TRxLabel;
    Cmbcampo: TComboBox;
    RxDBGrid1: TRxDBGrid;
    Panel2: TPanel;
    Image2: TImage;
    Label2: TLabel;
    LMDShapeHint1: TLMDShapeHint;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fclSairClick(Sender: TObject);
    procedure CmbcampoEnter(Sender: TObject);
    procedure CmbcampoExit(Sender: TObject);
    procedure EdtValorEnter(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure btnLocImoClick(Sender: TObject);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure LEDButton2DblClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    fresultado : integer;
  public
    { Public declarations }
    Property Resultado:integer Read Fresultado Write Fresultado;
  end;

var
  FrmLocImov: TFrmLocImov;
  LocOpts : TLocateOptions;
  cor,PorCod,PorEnd: boolean;
  CodTab, EndTab: String;
  VerTipo : Char;

implementation

uses UnitDmdados;

{$R *.dfm}

procedure TFrmLocImov.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ACtion:= Cafree;
end;

procedure TFrmLocImov.fclSairClick(Sender: TObject);
begin
 resultado:=dmdados.TbCadImovelCodImo.AsInteger;
 Close;
end;

procedure TFrmLocImov.CmbcampoEnter(Sender: TObject);
begin
(Sender as TComboBox).Color:=$00D2E2FF;
end;

procedure TFrmLocImov.CmbcampoExit(Sender: TObject);
begin
  PorCod:=False;
  PorEnd:=False;
  if cmbCampo.Text = 'C�digo' Then
    Begin
    VerTipo:='I';
    PorCod:=True;
    edtCampo.Text:='CodImo';
    dmDados.TbCadImovel.IndexName:='';
    End
  Else if cmbcampo.text = 'Endere�o' then
    Begin
    VerTipo:='K';
    PorEnd:=True;
    edtCampo.Text:='Endereco';
    dmDados.tbCadImovel.IndexName:='Endereco';
    End;
  (Sender as TComboBox).Color:=clwindow;
end;

procedure TFrmLocImov.EdtValorEnter(Sender: TObject);
begin
(Sender as TEdit).Color:=$00D2E2FF;
end;

procedure TFrmLocImov.EdtValorExit(Sender: TObject);
begin
  (Sender as TEdit).Color:=clwindow;
  btnLocImo.Default:= True;
end;

procedure TFrmLocImov.btnLocImoClick(Sender: TObject);
begin
{verificando se dado digitado corresponde ao tipo}
  if (vertipo='I') and (StrToIntDef(edtvalor.text,-1)= -1) then
    begin
    ShowMessage('Valor digitado deve ser num�rico');
    edtvalor.SetFocus;
    abort;
    end;
  btnLocImo.Default:= False;
  LocOpts:=[];
  if LEDButton1.StateOn then
    LocOpts:=LocOpts+[loPartialKey];
  if LEDButton2.StateOn then
    LocOpts:=LocOpts+[loCaseInsensitive];
  If not dmdados.TbCadImovel.locate(edtCampo.Text, edtValor.text,LocOpts) Then
    begin
    ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
    end
  else
    Begin
    cor := true;
    If PorCod Then
      CodTab:=dmDados.TbCadImovelCodImo.Value;
    If PorEnd Then
      EndTab:=dmDados.TbCadImovelEndereco.Value;
    End;
end;

procedure TFrmLocImov.LEDButton1DblClick(Sender: TObject);
begin
  if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TFrmLocImov.LEDButton2DblClick(Sender: TObject);
begin
if LEDButton2.StateOn then
    LEDButton2.StateOn:=False
  else
    LEDButton2.StateOn:=True;
end;

procedure TFrmLocImov.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  ENDER, CODIGO   : string;

begin
  Ender := (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Endereco').asString;
  CODIGO :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CodImo').asString;
  if cor then
    If PorEnd Then
      If ENDER = EndTab Then
        background:=$00D2E2FF;
    If PorCod Then
      If CODIGO = CodTab Then
        background:=$00D2E2FF;
end;

procedure TFrmLocImov.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    fclSair.Click;
  if Key=VK_PRIOR then
    LEDButton1DblClick(Sender);
  if Key=VK_NEXT then
    LEDButton2DblClick(Sender);
end;

procedure TFrmLocImov.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

end.
