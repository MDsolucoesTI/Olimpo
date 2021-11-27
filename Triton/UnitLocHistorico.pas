//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitLocHistorico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, fcButton, fcImgBtn, RXSplit, Grids, DBGrids, RackCtls,
  ExtCtrls, RXCtrls, jpeg,db, RXDBCtrl;

type
  TFrmLocHistorico = class(TForm)
    Panel1: TPanel;
    RxLabel3: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel7: TRxLabel;
    LEDButton1: TLEDButton;
    LEDButton2: TLEDButton;
    fclSair: TfcImageBtn;
    EdtCampo: TEdit;
    fclLocHist: TfcImageBtn;
    ScrewPanel1: TScrewPanel;
    Label1: TLabel;
    Image1: TImage;
    Panel2: TPanel;
    cmbcampo: TComboBox;
    Image2: TImage;
    Label2: TLabel;
    RxDBGrid1: TRxDBGrid;
    edtvalor: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboCampoEnter(Sender: TObject);
    procedure DBComboCampoExit(Sender: TObject);
    procedure EdtValorEnter(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure fclSairClick(Sender: TObject);
    procedure cmbcampoEnter(Sender: TObject);
    procedure cmbcampoExit(Sender: TObject);
    procedure fclLocHistClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure LEDButton2DblClick(Sender: TObject);
  private
    { Private declarations }
    fresultado : longint;
  public
    { Public declarations }
    Property Resultado:longint read fresultado write fresultado;
  end;

var
     FrmLocHistorico : TFrmLocHistorico;
  PorCod,PorDesc,cor : boolean;
             LocOpts : tlocateoptions;
     CodDesc,DescTab : String;
              CodTab : Integer;
             Vertipo : char;
              
implementation

uses UnitDmdados;

{$R *.DFM}

procedure TFrmLocHistorico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//     Action:= Cafree;
end;

procedure TFrmLocHistorico.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmLocHistorico.DBComboCampoEnter(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clTeal;
end;

procedure TFrmLocHistorico.DBComboCampoExit(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clWindow;
end;

procedure TFrmLocHistorico.EdtValorEnter(Sender: TObject);
begin
(Sender as TEdit).Color:=$00D2E2FF;
end;

procedure TFrmLocHistorico.EdtValorExit(Sender: TObject);
begin
(Sender as TEdit).Color:=clWindow;
end;

procedure TFrmLocHistorico.fclSairClick(Sender: TObject);
begin
resultado:=dmdados.tbHistoricoCodHist.Value;
Close;
end;

procedure TFrmLocHistorico.cmbcampoEnter(Sender: TObject);
begin
(Sender as TComboBox).Color:=$00D2E2FF;
end;

procedure TFrmLocHistorico.cmbcampoExit(Sender: TObject);
begin
Pordesc:=False;
PorCod:=False;
if cmbCampo.Text = 'C�digo' Then
  Begin
  VerTipo:='I';
  PorCod:=True;
  edtCampo.Text:='CodHist';
  dmDados.tbHistorico.IndexFieldNames:='';
  End
Else if cmbcampo.text = 'Descri��o' then
  Begin
  PorDesc:=True;
  edtCampo.Text:='Descricao';
  dmDados.tbHistorico.IndexFieldNames:='Descricao';
  End

end;

procedure TFrmLocHistorico.fclLocHistClick(Sender: TObject);
begin
{verificando se dado digitado corresponde ao tipo}
if (vertipo='I') and (StrToIntDef(edtvalor.text,-1)= -1) then
   begin
   ShowMessage('Valor inv�lido para a pesquisa');
   edtvalor.SetFocus;
   abort;
   end;
{}
fclLocHist.Default:= False;
fclLocHist.Default:= False;
  LocOpts:=[];
  if LEDButton1.StateOn then
    LocOpts:=LocOpts+[loPartialKey];
  if LEDButton2.StateOn then
    LocOpts:=LocOpts+[loCaseInsensitive];
If not dmdados.TbHistorico.locate(edtCampo.Text, edtValor.text,LocOpts) Then
   begin
   ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
   end
else
  Begin
  cor := true;
  If Pordesc Then
     DescTab:=dmDados.tbHistoricoDescricao.Value;
  If PorCod Then
     CodTab:=dmDados.tbHistoricoCodHist.Value;
  End;

end;

procedure TFrmLocHistorico.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);

  var
  codigo: integer;
  desc : string;
begin
CODIGO :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CodHist').asInteger;
desc   :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Descricao').asString;
if cor then
   If PorDesc Then
      If Desc = DescTab Then
         background:=$00D2E2FF;
   If PorCod Then
      If CODIGO = CodTab Then
         background:=$00D2E2FF;

end;

procedure TFrmLocHistorico.LEDButton1DblClick(Sender: TObject);
begin
if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TFrmLocHistorico.LEDButton2DblClick(Sender: TObject);
begin
if LEDButton2.StateOn then
    LEDButton2.StateOn:=False
  else
    LEDButton2.StateOn:=True;
end;

end.
