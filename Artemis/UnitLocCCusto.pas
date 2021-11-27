//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitLocCcusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, fcButton, fcImgBtn, RXSplit, Grids, DBGrids, RackCtls,
  ExtCtrls, RXCtrls, jpeg, dbtables, db, RXDBCtrl, LMDCustomComponent,
  LMDCustomHint, LMDCustomShapeHint, LMDShapeHint, RxGrdCpt, fcImager;

type
  TFrmLocCCusto = class(TForm)
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
    fclLocCcusto: TfcImageBtn;
    cmbCampo: TComboBox;
    RxDBGrid1: TRxDBGrid;
    Panel2: TPanel;
    RxLabel15: TRxLabel;
    Image3: TImage;
    RxGradientCaption2: TRxGradientCaption;
    procedure fclSairClick(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cmbCampoExit(Sender: TObject);
    procedure fclLocCcustoClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure LEDButton2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    fresultado:string;
  public
    { Public declarations }
    Property Resultado:string Read fresultado write fresultado;
  end;

var
  FrmLocCCusto: TFrmLocCCusto;
  PorCod,PorDesc,cor : boolean;
             LocOpts : TLocateOptions;
      DescTab,CodTab : String;
             vertipo : char;
  implementation

uses UnitDmdados, UnitPrincipal;

{$R *.DFM}

procedure TFrmLocCCusto.fclSairClick(Sender: TObject);
begin
resultado:=dmdados.TbCCustoCodCCusto.value;
Close;
end;

procedure TFrmLocCCusto.EdtValorExit(Sender: TObject);
begin
  fclLocCcusto.Default:= True;
  fclLocCcusto.SetFocus;
end;

procedure TFrmLocCCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.StatusTeclas(False,'');
 Action:= Cafree;
end;

procedure TFrmLocCCusto.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmLocCCusto.cmbCampoExit(Sender: TObject);
begin
Pordesc:=False;
PorCod:=False;
if cmbCampo.Text = 'C�digo' Then
  Begin
  PorCod:=True;
  edtCampo.Text:='CodCCusto';
  End
Else if cmbcampo.text = 'Descri��o' then
  Begin
  PorDesc:=True;
  edtCampo.Text:='Descricao';
  End
end;

procedure TFrmLocCCusto.fclLocCcustoClick(Sender: TObject);
begin
fclLocccusto.Default:= False;
if LEDButton1.StateOn then
    LocOpts:=LocOpts+[loPartialKey];
  if LEDButton2.StateOn then
    LocOpts:=LocOpts+[loCaseInsensitive];
If not dmdados.TbCcusto.locate(edtCampo.Text, edtValor.text,LocOpts) Then
   begin
   ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
   end
else
  Begin
  cor := true;
  If Pordesc Then
     DescTab:=dmDados.tbCcustoDescricao.Value;
  If PorCod Then
     CodTab:=dmDados.tbCcustoCodCcusto.Value;
  End;

end;

procedure TFrmLocCCusto.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  codigo,desc : string;
begin
CODIGO :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CodCcusto').asstring;
desc  :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Descricao').asString;
if cor then
   If PorDesc Then
      If Desc = DescTab Then
         background:=$00D2E2FF;
   If PorCod Then
      If CODIGO = CodTab Then
         background:=$00D2E2FF;
end;

procedure TFrmLocCCusto.LEDButton1DblClick(Sender: TObject);
begin
if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TFrmLocCCusto.LEDButton2DblClick(Sender: TObject);
begin
if LEDButton2.StateOn then
    LEDButton2.StateOn:=False
  else
    LEDButton2.StateOn:=True;
end;

procedure TFrmLocCCusto.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [PageDown] A=a [F2] Localizar [ESC] Sai');
  cmbCampo.ItemIndex:=0;
  EdtCampo.Text:='CodCCusto';
  cmbCampo.SetFocus;
end;

procedure TFrmLocCCusto.FormKeyDown(Sender: TObject; var Key: Word;
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
