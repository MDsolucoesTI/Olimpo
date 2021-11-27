/////////////////////////////////////////////////////////////////////////
// Cria��o...........: 15-01-2001
// Ultima modifica��o: 29-01-2001
// M�dulo............: Localiza��o de Fornecedores - Utilizado em 
//                      diversos m�dulos
// Sistema...........: Pegasus - Controle de Estoque
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitLocFornec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CurrEdit, RXDBCtrl, ToolEdit, RXSplit, fcButton, fcImgBtn, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, ExtCtrls, RXCtrls, RackCtls, jpeg, DBTables, DB,
  EnhEdit, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  LMDShapeHint, EFocCol, RxGrdCpt, fcImager;

type
  TFrmLocFornec = class(TForm)
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
    Cmbcampo: TComboBox;
    RxDBGrid1: TRxDBGrid;
    Panel2: TPanel;
    RxLabel15: TRxLabel;
    Image1: TImage;
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
        nomeCli : string;
        rest    : string;
        fcpf    : string;
        fcnpj   : string;
  public
    { Public declarations }
     Property Resultado:longint Read Fresultado Write Fresultado;
     Property Nome : string Read  NomeCli Write NomeCli;
     Property CPF : string read fcpf write fcpf;
     Property CNPJ: string read fcnpj write fcnpj;
  end;

var
  FrmLocFornec: TFrmLocFornec;
  LocOpts : TLocateOptions;
  cor,PorNome,PorCod,PorCPF,PorCNPJ : boolean;
  NomeTab, CpfTab, CnpjTab : String;
  CodTab : LongInt;
  VerTipo : Char;

implementation

uses UnitDmdados, unitPrincipal ;

{$R *.DFM}

procedure TFrmLocFornec.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmLocFornec.EdtValorExit(Sender: TObject);
begin
  fclLocCli.Default:= True;
  fclLocCli.SetFocus;
end;

procedure TFrmLocFornec.fclSairClick(Sender: TObject);
begin
  resultado:=dmdados.tbfornecedorCodFor.Value;
  nome:=dmdados.tbfornecedorNome.Value;
  CPF:=dmdados.tbfornecedorCPF.value;
  CNPJ:=dmdados.tbfornecedorCNPJ.value;
  Close;
end;

procedure TFrmLocFornec.CmbcampoExit(Sender: TObject);
begin
  PorNome:=False;
  PorCod:=False;
  PorCPF:= False;
  PorCNPJ:= False;
  if cmbCampo.Text = 'C�digo' Then
    Begin
    VerTipo:='I';
    PorCod:=True;
    edtCampo.Text:='CodFor';
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
end;

procedure TFrmLocFornec.fclLocCliClick(Sender: TObject);
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
  If not dmdados.tbfornecedor.locate(EdtCampo.Text,edtValor.text,LocOpts) Then
    begin
    ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
    end
  else
    Begin
    cor := true;
    If PorNome Then
      NomeTab:=dmDados.tbfornecedorNome.Value;
    If PorCod Then
      CodTab:=dmDados.tbfornecedorCodFor.Value;
    If PorCpf Then
      CpfTab:=dmDados.tbfornecedorCpf.Value;
    If PorCnpj Then
      CnpjTab:=dmDados.tbfornecedorCnpj.Value;
    End;
  Cmbcampo.SetFocus;
end;

procedure TFrmLocFornec.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  NOME, CPF, CNPJ  : string;
  CODIGO : longInt;
begin
  NOME := (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Nome').asString;
  CODIGO :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CodFor').asInteger;
  CPF :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('cpf').asString;
  CNPJ   :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('cnpj').asString;
  if cor then
    begin
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
end;

procedure TFrmLocFornec.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    fclSair.Click;
  if Key=VK_PRIOR then
    LEDButton1DblClick(Sender);
  if Key=VK_NEXT then
    LEDButton2DblClick(Sender);
  if Key=VK_F9 then
    fclLocCli.Click;
  end;

procedure TFrmLocFornec.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [PageDown] A=a [F9] Localizar [ESC] Sai');
  Cmbcampo.ItemIndex:=0;
  Cmbcampo.SetFocus;
  EdtCampo.Text:='CodFor';
  vertipo:='I';
end;

procedure TFrmLocFornec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.StatusTeclas(False,'');
end;

procedure TFrmLocFornec.LEDButton1DblClick(Sender: TObject);
begin
  if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TFrmLocFornec.LEDButton2DblClick(Sender: TObject);
begin
if LEDButton2.StateOn then
    LEDButton2.StateOn:=False
  else
    LEDButton2.StateOn:=True;
end;

end.
