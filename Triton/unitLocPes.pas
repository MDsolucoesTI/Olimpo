//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitLocPes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CurrEdit, RXDBCtrl, ToolEdit, RXSplit, fcButton, fcImgBtn, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, ExtCtrls, RXCtrls, RackCtls, jpeg, DBTables, DB,
  EnhEdit, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  LMDShapeHint;

type
  TfrmLocPes = class(TForm)
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
    LMDShapeHint1: TLMDShapeHint;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboCampoEnter(Sender: TObject);
    procedure DBComboCampoExit(Sender: TObject);
    procedure EdtValorEnter(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure fclSairClick(Sender: TObject);
    procedure CmbcampoExit(Sender: TObject);
    procedure fclLocCliClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
              AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure CmbcampoEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure LEDButton2DblClick(Sender: TObject);

  private
    { Private declarations }
     fresultado : integer;
        nomePes : string;

  public
    { Public declarations }
     Property Resultado:integer Read Fresultado Write Fresultado;
     Property Nome : string Read  NomePes Write NomePes;
  end;

var
  frmLocPes: TfrmLocPes;
  LocOpts : TLocateOptions;
  cor,PorNome,PorCod,PorCPF,PorCNPJ : boolean;
  NomeTab, CpfTab, CnpjTab : String;
  CodTab : integer;
  VerTipo : Char;

implementation

uses UnitDmdados, unitPrincipal ;

{$R *.DFM}

procedure TfrmLocPes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TfrmLocPes.DBComboCampoEnter(Sender: TObject);
begin
  (Sender as TDbComboBox).Color:=clTeal;
end;

procedure TfrmLocPes.DBComboCampoExit(Sender: TObject);
begin
  (Sender as TDbComboBox).Color:=clWindow;
end;

procedure TfrmLocPes.EdtValorEnter(Sender: TObject);
begin
  (Sender as TEdit).Color:=$00D2E2FF;
end;

procedure TfrmLocPes.EdtValorExit(Sender: TObject);
begin
  (Sender as TEdit).Color:=clwindow;
  fclLocCli.Default:= True;
end;

procedure TfrmLocPes.fclSairClick(Sender: TObject);
begin
  resultado:=dmdados.tbPessoasCodCli.Value;
  nome:=dmdados.tbPessoasNome.Value;
  Close;
end;

procedure TfrmLocPes.CmbcampoExit(Sender: TObject);
begin
  PorNome:=False;
  PorCod:=False;
  PorCPF:= False;
  PorCNPJ:= False;
  if cmbCampo.Text = 'C�digo' Then
    Begin
    VerTipo:='I';
    PorCod:=True;
    edtCampo.Text:='CodCli';
    End
  Else if cmbcampo.text = 'Nome' then
    Begin
    VerTipo:='K';
    PorNome:=True;
    edtCampo.Text:='Nome';
    End
  Else if cmbcampo.text = 'CPF' then
    Begin
    VerTipo:='K';
    PorCpf:=True;
    edtCampo.Text:='CPF';
    End
  Else if cmbcampo.text = 'CNPJ' then
    Begin
    VerTipo:='K';
    Porcnpj:=True;
    edtCampo.Text:='CNPJ';
    End;
  (Sender as TComboBox).Color:=clwindow;
end;

procedure TfrmLocPes.fclLocCliClick(Sender: TObject);
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
  If not dmdados.tbPessoas.locate(edtCampo.Text, edtValor.text,LocOpts) Then
    begin
    ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
    end
  else
    Begin
    cor := true;
    If PorNome Then
      NomeTab:=dmDados.tbPessoasNome.Value;
    If PorCod Then
      CodTab:=dmDados.tbPessoasCodCli.asInteger;
    If PorCpf Then
      CpfTab:=dmDados.tbPessoasCpf.Value;
    If PorCnpj Then
      CnpjTab:=dmDados.tbPessoasCnpj.Value;
    End;
end;

procedure TfrmLocPes.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  NOME, CPF, CNPJ  : string;
  CODIGO : longInt;
begin
  NOME := (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Nome').asString;
  CODIGO :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CodCli').asInteger;
  CPF :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('cpf').asString;
  Cnpj:=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Cnpj').asString;
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

procedure TfrmLocPes.CmbcampoEnter(Sender: TObject);
begin
  (Sender as TComboBox).Color:=$00D2E2FF;
end;

procedure TfrmLocPes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    fclSair.Click;
  if Key=VK_PRIOR then
    LEDButton1DblClick(Sender);
  if Key=VK_NEXT then
    LEDButton2DblClick(Sender);
end;

procedure TfrmLocPes.LEDButton1DblClick(Sender: TObject);
begin
  if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TfrmLocPes.LEDButton2DblClick(Sender: TObject);
begin
if LEDButton2.StateOn then
    LEDButton2.StateOn:=False
  else
    LEDButton2.StateOn:=True;
end;

end.
