//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitLocComprador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CurrEdit, RXDBCtrl, ToolEdit, RXSplit, fcButton, fcImgBtn, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, ExtCtrls, RXCtrls, RackCtls, jpeg, DBTables, DB,
  EnhEdit;

type
  TfrmLocComprador = class(TForm)
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
    fclLocCompra: TfcImageBtn;
    ScrewPanel1: TScrewPanel;
    Label1: TLabel;
    Image1: TImage;
    Panel2: TPanel;
    Cmbcampo: TComboBox;
    Image2: TImage;
    Label2: TLabel;
    RxDBGrid1: TRxDBGrid;
    procedure EdtValorExit(Sender: TObject);
    procedure fclSairClick(Sender: TObject);
    procedure fclLocCompraClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
              AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormShow(Sender: TObject);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure LEDButton2DblClick(Sender: TObject);
    procedure CmbcampoExit(Sender: TObject);

  private
    { Private declarations }
     fresultado : longint;
  public
    { Public declarations }
     Property Resultado:longint Read Fresultado Write Fresultado;
  end;

var
  frmLocComprador: TfrmLocComprador;
  LocOpts : TLocateOptions;
  cor,PorNome,PorCod,PorCPF,PorCNPJ : boolean;
  NomeTab, CpfTab, CnpjTab : String;
  CodTab : LongInt;
  vertipo:char;

implementation

uses UnitDmdados, UnitPrincipal;

{$R *.DFM}

procedure TfrmLocComprador.EdtValorExit(Sender: TObject);
begin
fclLocCompra.Default:= True;
fclLocCompra.SetFocus;
end;

procedure TfrmLocComprador.fclSairClick(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(False,'');
  Resultado:=dmdados.TbCompradorCodCompra.Value;
  Close;
end;

procedure TfrmLocComprador.fclLocCompraClick(Sender: TObject);
begin
  {verificando se dado digitado corresponde ao tipo}
  if (vertipo='I') and (StrToIntDef(edtvalor.text,-1)= -1) then
    begin
     ShowMessage('Valor digitado deve ser num�rico');
     edtvalor.SetFocus;
     abort;
    end;

    fclLocCompra.Default:= False;
    LocOpts:=[];
    if LedButton1.StateOn then
     LocOpts:=LocOpts+[loPartialKey];
    if LedButton2.StateOn then
     LocOpts:=LocOpts+[loCaseInsensitive];
    If not dmdados.tbComprador.locate(edtCampo.Text, edtValor.text,LocOpts) Then
       begin
       ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
       end
    else
      Begin
      cor := true;
      If PorNome Then
         NomeTab:=dmDados.TbCompradorNome.Value;
      If PorCod Then
         CodTab:=dmDados.tbCompradorCodCompra.Value;
      If PorCpf Then
         CpfTab:=dmDados.tbCompradorCpf.Value;
      If PorCnpj Then
         CnpjTab:=dmDados.tbCompradorCnpj.Value;
      End;
end;

procedure TfrmLocComprador.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  NOME, CPF, CNPJ  : string;
  CODIGO : longInt;

begin
NOME := (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Nome').asString;
CODIGO :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CodCompra').asInteger;
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

procedure TfrmLocComprador.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [PageDown] A=a [F2] Localizar [ESC] Sai');
  LocOpts:=[];
  Cmbcampo.ItemIndex:=0;
  edtcampo.Text:='CodCompra';
  VerTipo:='I';
  cmbCampo.SetFocus;
end;

procedure TfrmLocComprador.LEDButton1DblClick(Sender: TObject);
begin
if LedButton1.StateOn then
   LedButton1.StateOn:=false
 else
   LedButton1.StateOn:=true;
end;

procedure TfrmLocComprador.LEDButton2DblClick(Sender: TObject);
begin
if LedButton2.StateOn then
   LedButton2.StateOn:=false
 else
   LedButton2.StateOn:=true;
end;

procedure TfrmLocComprador.CmbcampoExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
      Flag:=True;
      For x:=0 to cmbcampo.Items.Count-1 Do
        If cmbcampo.Text=cmbcampo.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor inv�lido');
        cmbcampo.SetFocus;
        End;


    PorNome:=False;
    PorCod:=False;
    PorCPF:= False;
    PorCNPJ:= False;
    if cmbCampo.Text = 'C�digo' Then
    Begin
      VerTipo:='I';
      PorCod:=True;
      edtCampo.Text:='CodCompra';
    End;
    if cmbCampo.Text = 'Nome' Then
    Begin
      VerTipo:='K';
      PorNome:=True;
      edtCampo.Text:='Nome';
    End;
    if cmbCampo.Text = 'CPF' Then
    Begin
      VerTipo:='I';
      PorCPF:=True;
      edtCampo.Text:='cpf';
    End;
    if cmbCampo.Text = 'CNPJ' Then
    Begin
      VerTipo:='I';
      PorCNPJ:=True;
      edtCampo.Text:='cnpj';
    End;

end;         

end.
