//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UniLocCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CurrEdit, RXDBCtrl, ToolEdit, RXSplit, fcButton, fcImgBtn, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, ExtCtrls, RXCtrls, RackCtls, jpeg, DBTables, DB,
  EnhEdit;

type
  TfrmLocClientes = class(TForm)
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
    Label1: TLabel;
    Image1: TImage;
    Panel2: TPanel;
    Cmbcampo: TComboBox;
    Image2: TImage;
    Label2: TLabel;
    RxDBGrid1: TRxDBGrid;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBComboCampoEnter(Sender: TObject);
    procedure DBComboCampoExit(Sender: TObject);
    procedure EdtValorEnter(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure fclSairClick(Sender: TObject);
    procedure CmbcampoExit(Sender: TObject);
    procedure LEDButton1Click(Sender: TObject);
    procedure LEDButton2Click(Sender: TObject);
    procedure fclLocCliClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
              AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormShow(Sender: TObject);
    procedure CmbcampoEnter(Sender: TObject);

  private
    { Private declarations }
     fresultado : longint;
  public
    { Public declarations }
     Property Resultado:longint Read Fresultado Write Fresultado;
  end;

var
  frmLocClientes: TfrmLocClientes;
  LocOpts : TLocateOptions;
  cor,PorNome,PorCod,PorCPF,PorCNPJ : boolean;
  NomeTab, CpfTab, CnpjTab : String;
  CodTab : LongInt;

implementation

uses UnitDmdados;

{$R *.DFM}

procedure TfrmLocClientes.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TfrmLocClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:= Cafree;
end;

procedure TfrmLocClientes.DBComboCampoEnter(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clTeal;
end;

procedure TfrmLocClientes.DBComboCampoExit(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clWindow;
end;

procedure TfrmLocClientes.EdtValorEnter(Sender: TObject);
begin
(Sender as TEdit).Color:=$00D2E2FF;
end;

procedure TfrmLocClientes.EdtValorExit(Sender: TObject);
begin
(Sender as TEdit).Color:=clwindow;
fclLocCli.Default:= True;
end;

procedure TfrmLocClientes.fclSairClick(Sender: TObject);
begin
     Close;
end;
 
procedure TfrmLocClientes.CmbcampoExit(Sender: TObject);
begin
PorNome:=False;
PorCod:=False;
PorCPF:= False;
PorCNPJ:= False;
if cmbCampo.Text = 'C�digo' Then
  Begin
  PorCod:=True;
  edtCampo.Text:='CodCli';
  dmDados.tbCliente.IndexFieldNames:='';
  End
Else if cmbcampo.text = 'Nome' then
  Begin
  PorNome:=True;
  edtCampo.Text:='Nome';
  dmDados.tbCliente.IndexFieldNames:='Nome';

  End
Else if cmbcampo.text = 'CPF' then
  Begin
  PorCpf:=True;
  edtCampo.Text:='CPF';
  End
Else if cmbcampo.text = 'CNPJ' then
  Begin
  Porcnpj:=True;
  edtCampo.Text:='CNPJ';
  End;
(Sender as TComboBox).Color:=clwindow;
end;

procedure TfrmLocClientes.LEDButton1Click(Sender: TObject);
begin
 LocOpts:=LocOpts+[loPartialKey];
end;

procedure TfrmLocClientes.LEDButton2Click(Sender: TObject);
begin
 LocOpts:=LocOpts+[locaseinsensitive];
end;

procedure TfrmLocClientes.fclLocCliClick(Sender: TObject);
begin
fclLocCli.Default:= False;
If not dmdados.tbCliente.locate(edtCampo.Text, edtValor.text,LocOpts) Then
   begin
   ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
   end
else
  Begin
  cor := true;
  If PorNome Then
     NomeTab:=dmDados.tbClienteNome.Value;
  If PorCod Then
     CodTab:=dmDados.tbClienteCodCli.Value;
  If PorCpf Then
     CpfTab:=dmDados.tbClienteCpf.Value;
  If PorCnpj Then
     CnpjTab:=dmDados.tbClienteCnpj.Value;
  End;
end;

procedure TfrmLocClientes.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  NOME, CPF, CNPJ  : string;
  CODIGO : longInt;

begin
NOME := (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Nome').asString;
CODIGO :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CodCli').asInteger;
CPF :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('cpf').asString;
if cor then
   If PorNome Then
      If NOME = NomeTab Then
         background:=$00D2E2FF;
   If PorCod Then
      If CODIGO = CodTab Then
         background:=$00D2E2FF;
   If PorCpf Then
      If CPF = cPFTab Then
         background:=$00D2E2FF;
   If PorCnpj Then
      If CNPJ = CNPJTab Then
         background:=$00D2E2FF;

end;

procedure TfrmLocClientes.FormShow(Sender: TObject);
begin
   LocOpts:=[];
end;

procedure TfrmLocClientes.CmbcampoEnter(Sender: TObject);
begin
(Sender as TComboBox).Color:=$00D2E2FF;
end;

end.
