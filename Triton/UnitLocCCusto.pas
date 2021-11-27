//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
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
  LMDCustomHint, LMDCustomShapeHint, LMDShapeHint;

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
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    Panel2: TPanel;
    cmbCampo: TComboBox;
    Image2: TImage;
    Label2: TLabel;
    RxDBGrid1: TRxDBGrid;
    LMDShapeHint1: TLMDShapeHint;
    RxLabel4: TRxLabel;
    procedure fclSairClick(Sender: TObject);
    procedure DBComboCampoEnter(Sender: TObject);
    procedure DBComboCampoExit(Sender: TObject);
    procedure EdtValorEnter(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cmbCampoEnter(Sender: TObject);
    procedure cmbCampoExit(Sender: TObject);
    procedure fclLocCcustoClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure LEDButton2DblClick(Sender: TObject);
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

uses UnitDmdados;

{$R *.DFM}

procedure TFrmLocCCusto.fclSairClick(Sender: TObject);
begin
resultado:=dmdados.TbCCustoCodCCusto.value;
Close;
end;

procedure TFrmLocCCusto.DBComboCampoEnter(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clTeal;
end;

procedure TFrmLocCCusto.DBComboCampoExit(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clWindow;
end;

procedure TFrmLocCCusto.EdtValorEnter(Sender: TObject);
begin
(Sender as TEdit).Color:=$00D2E2FF;
end;

procedure TFrmLocCCusto.EdtValorExit(Sender: TObject);
begin
(Sender as TEdit).Color:=clWindow;
end;

procedure TFrmLocCCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
// Action:= Cafree;
end;

procedure TFrmLocCCusto.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmLocCCusto.cmbCampoEnter(Sender: TObject);
begin
(Sender as TComboBox).Color:=$00D2E2FF;
end;

procedure TFrmLocCCusto.cmbCampoExit(Sender: TObject);
begin
Pordesc:=False;
PorCod:=False;
if cmbCampo.Text = 'C�digo' Then
  Begin
  vertipo:='I';
  PorCod:=True;
  edtCampo.Text:='CodCCusto';
  dmDados.tbCcusto.IndexFieldNames:='';
  End
Else if cmbcampo.text = 'Descri��o' then
  Begin
  PorDesc:=True;
  edtCampo.Text:='Descricao';
  dmDados.tbCcusto.IndexFieldNames:='Descricao';
  End
end;

procedure TFrmLocCCusto.fclLocCcustoClick(Sender: TObject);
begin
{verificando se dado digitado corresponde ao tipo}
if (vertipo='I') and (StrToIntDef(edtvalor.text,-1)= -1) then
   begin
   ShowMessage('Valor inv�lido para a pesquisa');
   edtvalor.SetFocus;
   abort;
   end;
fclLocccusto.Default:= False;
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

end.
