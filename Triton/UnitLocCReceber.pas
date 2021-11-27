//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
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
  CurrEdit, RXDBCtrl, ToolEdit, fcButton, fcImgBtn, Grids, DBGrids,
  RackCtls, db;

type
  TFrmLocCReceber = class(TForm)
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
    fclLocCreceber: TfcImageBtn;
    ScrewPanel1: TScrewPanel;
    Label1: TLabel;
    Image1: TImage;
    Panel2: TPanel;
    cmbcampo: TComboBox;
    Image2: TImage;
    Label2: TLabel;
    RxDBGrid1: TRxDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure DBComboCampoEnter(Sender: TObject);
    procedure DBComboCampoExit(Sender: TObject);
    procedure EdtValorEnter(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure fclSairClick(Sender: TObject);
    procedure cmbcampoExit(Sender: TObject);
    procedure LEDButton1Click(Sender: TObject);
    procedure LEDButton2Click(Sender: TObject);
    procedure fclLocCreceberClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
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
implementation

uses UnitDmdados;

{$R *.DFM}

procedure TFrmLocCReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:= Cafree;
end;

procedure TFrmLocCReceber.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmLocCReceber.BtnSairClick(Sender: TObject);
begin
     Close;
end;

procedure TFrmLocCReceber.DBComboCampoEnter(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clTeal;
end;

procedure TFrmLocCReceber.DBComboCampoExit(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clWindow;
end;

procedure TFrmLocCReceber.EdtValorEnter(Sender: TObject);
begin
(Sender as TEdit).Color:= $00d2e2ff;
end;

procedure TFrmLocCReceber.EdtValorExit(Sender: TObject);
begin
(Sender as TEdit).Color:=clWindow;
end;

procedure TFrmLocCReceber.fclSairClick(Sender: TObject);
begin
Close;
end;

procedure TFrmLocCReceber.cmbcampoExit(Sender: TObject);
begin
if cmbCampo.Text = 'Documento' Then
  Begin
  edtCampo.Text:='NumDoc';
  dmDados.tbCReceber.IndexFieldNames:='NumDoc';
  End

end;

procedure TFrmLocCReceber.LEDButton1Click(Sender: TObject);
begin
 LocOpts:=LocOpts+[loPartialKey];
end;

procedure TFrmLocCReceber.LEDButton2Click(Sender: TObject);
begin
 LocOpts:=LocOpts+[locaseinsensitive];
end;

procedure TFrmLocCReceber.fclLocCreceberClick(Sender: TObject);
begin
fclLocCreceber.Default:= False;
If not dmdados.tbCReceber.locate(edtCampo.Text, edtValor.text,LocOpts) Then
   begin
   ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
   end
else
  Begin
  cor := true;
  NumDocTab:=dmDados.tbCreceberNumDoc.Value;
  End;

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

end.
