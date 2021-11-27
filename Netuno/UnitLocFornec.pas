//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitLocFornec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, fcButton, fcImgBtn, RXSplit, Grids, DBGrids, RackCtls,
  ExtCtrls, RXCtrls, jpeg, DBTables, DB, RXDBCtrl;

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
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    Panel2: TPanel;
    cmbCampo: TComboBox;
    Image2: TImage;
    Label2: TLabel;
    RxDBGrid1: TRxDBGrid;
    btFornec: TfcImageBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValorExit(Sender: TObject);
    procedure fclSairClick(Sender: TObject);
    procedure LEDButton1Click(Sender: TObject);
    procedure fclLocForClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure LEDButton2DblClick(Sender: TObject);
    procedure btFornecClick(Sender: TObject);
    procedure CmbcampoExit(Sender: TObject);
  private
    { Private declarations }
    fresultado : longint;
  public
    { Public declarations }
    Property Resultado:longint Read Fresultado Write Fresultado;
  end;

var
  FrmLocFornec: TFrmLocFornec;
  LocOpts : TLocateOptions;
  cor,PorNome,PorCod,PorCPF,PorCNPJ : boolean;
  NomeTab, CpfTab, CnpjTab : String;
  CodTab : LongInt;
  vertipo:char;

implementation

uses UnitDmdados, UnitPrincipal;

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
  btFornec.Default:= True;
  btFornec.Enabled:=true;
  btfornec.SetFocus;
end;

procedure TFrmLocFornec.fclSairClick(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(False,'');
  resultado:=dmdados.tbfornecedorCodFor.Value;
  Close;
end;

procedure TFrmLocFornec.LEDButton1Click(Sender: TObject);
begin
 LocOpts:=LocOpts+[loPartialKey];
end;

procedure TFrmLocFornec.fclLocForClick(Sender: TObject);
begin
btFornec.Default:= False;
If not dmdados.TbFornecedor.locate(edtCampo.Text, edtValor.text,LocOpts) Then
   begin
   ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
   end
else
  Begin
  cor := true;
  If PorNome Then
     NomeTab:=dmDados.tbFornecedorNome.Value;
  If PorCod Then
     CodTab:=dmDados.tbFornecedorCodFor.Value;
  If PorCpf then
     CpfTab:=dmDados.tbFornecedorCpf.Value;
  If PorCnpj then
     CnpjTab:= dmdados.tbfornecedorCNPJ.Value;
  End;
end;

procedure TFrmLocFornec.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [PageDown] A=a [F2] Localizar [ESC] Sai');
  LocOpts:=[];
  Cmbcampo.ItemIndex:=0;
  LocOpts:=[];
  edtcampo.Text:='CodFor';
  VerTipo:='I';
end;

procedure TFrmLocFornec.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  NOME, CPF, CNPJ  : string;
  CODIGO : longInt;

begin
NOME   :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Nome').asString;
CODIGO :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CodFor').asInteger;
CPF    :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('cpf').asString;
CNPJ   :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('cnpj').asString;
if cor then
   If PorNome Then
      If NOME = NomeTab Then
         background:=$00D2E2FF;
   If PorCod Then
      If CODIGO = CodTab Then
         background:=$00D2E2FF;
   If PorCpf Then
      If CPF = CpfTab Then
         background:=$00D2E2FF;
    If PorCNPJ Then
      If Cnpj = CnpjTab Then
         background:=$00D2E2FF;
end;
procedure TFrmLocFornec.LEDButton1DblClick(Sender: TObject);
begin
if LedButton1.StateOn then
   LedButton1.StateOn:=false
 else
   LedButton1.StateOn:=true;
end;

procedure TFrmLocFornec.LEDButton2DblClick(Sender: TObject);
begin
if LedButton2.StateOn then
   LedButton2.StateOn:=false
 else
   LedButton2.StateOn:=true;
end;

procedure TFrmLocFornec.btFornecClick(Sender: TObject);
begin
  {verificando se dado digitado corresponde ao tipo}
  if (vertipo='I') and (StrToIntDef(edtvalor.text,-1)= -1) then
    begin
     ShowMessage('Valor digitado deve ser num�rico');
     edtvalor.SetFocus;
     abort;
    end;

    btFornec.default:=false;
    LocOpts:=[];
    if LedButton1.StateOn then
     LocOpts:=LocOpts+[loPartialKey];
    if LedButton2.StateOn then
     LocOpts:=LocOpts+[loCaseInsensitive];
     If not dmdados.tbfornecedor.locate(edtCampo.Text, edtValor.text,LocOpts) Then
        begin
        ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
        end
      else
        Begin
        cor := true;
        If PorNome Then
          NomeTab:=dmDados.tbFornecedorNome.Value;
        If PorCod Then
          CodTab:=dmDados.tbFornecedorCodFor.Value;
        If PorCpf Then
          CpfTab:=dmDados.tbFornecedorCPF.Value;
        If PorCnpj Then
          CnpjTab:=dmDados.tbFornecedorCNPJ.Value;
        End;
      Cmbcampo.SetFocus;


end;

procedure TFrmLocFornec.CmbcampoExit(Sender: TObject);
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
      edtCampo.Text:='CodFor';
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
