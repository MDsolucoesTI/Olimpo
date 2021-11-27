//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitLocTipoDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, fcButton, fcImgBtn, RXSplit, Grids, DBGrids, RackCtls,
  ExtCtrls, RXCtrls, jpeg, db, RXDBCtrl, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint;

type
  TFrmLocTipoDoc = class(TForm)
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
    fclLocTipo: TfcImageBtn;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    Panel2: TPanel;
    cmbcampo: TComboBox;
    Image2: TImage;
    Label2: TLabel;
    RxDBGrid1: TRxDBGrid;
    LMDShapeHint1: TLMDShapeHint;
    RxLabel15: TRxLabel;
    procedure fclSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboCampoEnter(Sender: TObject);
    procedure DBComboCampoExit(Sender: TObject);
    procedure EdtValorEnter(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure cmbcampoExit(Sender: TObject);
    procedure fclLocTipoClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure cmbcampoEnter(Sender: TObject);
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
    Property Resultado :longint Read fresultado Write fresultado;
  end;

var
  FrmLocTipoDoc : TFrmLocTipoDoc;
  PorDesc,PorCod,cor : boolean;
  LocOpts  : TLocateOptions;
  DescTab : String;
  CodTab : integer;
  VerTipo : Char;

implementation

uses UnitDmdados, unitPrincipal;

{$R *.DFM}

procedure TFrmLocTipoDoc.fclSairClick(Sender: TObject);
begin
  fresultado:=dmdados.tbTipoDocCodDoc.value;
  Close;
end;

procedure TFrmLocTipoDoc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmLocTipoDoc.DBComboCampoEnter(Sender: TObject);
begin
  (Sender as TDbComboBox).Color:=clTeal;
end;

procedure TFrmLocTipoDoc.DBComboCampoExit(Sender: TObject);
begin
  (Sender as TDbComboBox).Color:=clWindow;
end;

procedure TFrmLocTipoDoc.EdtValorEnter(Sender: TObject);
begin
  (Sender as TEdit).Color:=$00D2e2ff;
end;

procedure TFrmLocTipoDoc.EdtValorExit(Sender: TObject);
begin
  (Sender as TEdit).Color:=clWindow;
end;

procedure TFrmLocTipoDoc.cmbcampoExit(Sender: TObject);
begin
  Pordesc:=False;
  PorCod:=False;
  if cmbCampo.Text = 'C�digo' Then
    Begin
    VerTipo:='I';
    PorCod:=True;
    edtCampo.Text:='Coddoc';
    dmDados.tbTipoDoc.IndexFieldNames:='';
    End
  Else if cmbcampo.text = 'Descri��o' then
    Begin
    PorDesc:=True;
    edtCampo.Text:='Descricao';
    dmDados.tbtipoDoc.IndexFieldNames:='Descricao';
    End;
  (Sender as TComboBox).Color:=clWindow;
end;

procedure TFrmLocTipoDoc.fclLocTipoClick(Sender: TObject);
begin
{verificando se dado digitado corresponde ao tipo}
  if (vertipo='I') and (StrToIntDef(edtvalor.text,-1)= -1) then
    begin
    ShowMessage('Valor inv�lido para a pesquisa');
    edtvalor.SetFocus;
    abort;
    end;
  fclLocTipo.Default:= False;
  LocOpts:=[];
  if LEDButton1.StateOn then
    LocOpts:=LocOpts+[loPartialKey];
  if LEDButton2.StateOn then
    LocOpts:=LocOpts+[loCaseInsensitive];
  If not dmdados.TbTipoDoc.locate(edtCampo.Text, edtValor.text,LocOpts) Then
    begin
    ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
    end
  else
    Begin
    cor := true;
    If Pordesc Then
      DescTab:=dmDados.tbTipoDocDescricao.Value;
    If PorCod Then
      CodTab:=dmDados.tbTipoDocCodDoc.Value;
    End;
end;

procedure TFrmLocTipoDoc.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  codigo : integer;
  desc : string;
begin
  CODIGO :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CodDoc').asinteger;
  desc  :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Descricao').asString;
  if cor then
    If PorDesc Then
      If Desc = DescTab Then
        background:=$00D2E2FF;
    If PorCod Then
      If CODIGO = CodTab Then
        background:=$00D2E2FF;
end;

procedure TFrmLocTipoDoc.cmbcampoEnter(Sender: TObject);
begin
  (Sender as TComboBox).Color:=$00D2e2ff;
end;

procedure TFrmLocTipoDoc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    fclSair.Click;
  if Key=VK_PRIOR then
    LEDButton1dblClick(Sender);
  if Key=VK_NEXT then
    LEDButton2dblClick(Sender);
end;

procedure TFrmLocTipoDoc.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [PageDown] A=a [ESC] Sai');
end;

procedure TFrmLocTipoDoc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.StatusTeclas(False,'');
end;

procedure TFrmLocTipoDoc.LEDButton1DblClick(Sender: TObject);
begin
if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TFrmLocTipoDoc.LEDButton2DblClick(Sender: TObject);
begin
 if LEDButton2.StateOn then
    LEDButton2.StateOn:=False
  else
    LEDButton2.StateOn:=True;
end;

end.
