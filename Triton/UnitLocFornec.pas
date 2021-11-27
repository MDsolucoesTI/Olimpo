//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitLocFornec;

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
    fclLocFor: TfcImageBtn;
    ScrewPanel1: TScrewPanel;
    Label1: TLabel;
    Image1: TImage;
    Panel2: TPanel;
    cmbCampo: TComboBox;
    Image2: TImage;
    Label2: TLabel;
    RxDBGrid1: TRxDBGrid;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboCampoEnter(Sender: TObject);
    procedure DBComboCampoExit(Sender: TObject);
    procedure EdtValorEnter(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure fclSairClick(Sender: TObject);
    procedure cmbCampoEnter(Sender: TObject);
    procedure fclLocForClick(Sender: TObject);
    procedure cmbCampoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure LEDButton2DblClick(Sender: TObject);
  private
    { Private declarations }
    fresultado : longint;
  public
    { Public declarations }
    Property Resultado:longint Read Fresultado Write Fresultado;
  end;

var
                       FrmLocFornec : TFrmLocFornec;
                           LocOpts  : TLocateOptions;
  cor,PorNome,PorCod,PorCPF,PorCNPJ : boolean;
           NomeTab, CpfTab, CnpjTab : String;
                             CodTab : LongInt;
                            vertipo : Char;

implementation

uses UnitDmdados, unitPrincipal;

{$R *.DFM}

procedure TFrmLocFornec.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmLocFornec.DBComboCampoEnter(Sender: TObject);
begin
  (Sender as TDBComboBox).Color:=clTeal;
end;

procedure TFrmLocFornec.DBComboCampoExit(Sender: TObject);
begin
  (Sender as TDBComboBox).Color:=clWindow;
end;

procedure TFrmLocFornec.EdtValorEnter(Sender: TObject);
begin
  (Sender as TEdit).Color:=$00D2E2FF;
end;

procedure TFrmLocFornec.EdtValorExit(Sender: TObject);
begin
  (Sender as TEdit).Color:=clwindow;
  fclLocFor.Default:= True;
  fclLocFor.SetFocus;
end;

procedure TFrmLocFornec.fclSairClick(Sender: TObject);
begin
  resultado:=dmdados.tbfornecedorCodFor.Value;
  Close;
end;

procedure TFrmLocFornec.cmbCampoEnter(Sender: TObject);
begin
  (Sender as TComboBox).Color:=$00D2E2FF;
end;

procedure TFrmLocFornec.fclLocForClick(Sender: TObject);
begin
{verificando se dado digitado corresponde ao tipo}
  if (vertipo='I') and (StrToIntDef(edtvalor.text,-1)= -1) then
    begin
    ShowMessage('Valor digitado deve ser num�rico');
    edtvalor.SetFocus;
    abort;
    end;
  fclLocFor.Default:= False;
  LocOpts:=[];
  if LEDButton1.StateOn then
    LocOpts:=LocOpts+[loPartialKey];
  if LEDButton2.StateOn then
    LocOpts:=LocOpts+[loCaseInsensitive];
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
  Cmbcampo.SetFocus;
end;

procedure TFrmLocFornec.cmbCampoExit(Sender: TObject);
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
    dmDados.TbFornecedor.IndexFieldNames:='';
    End
  Else if cmbcampo.text = 'Nome' then
    Begin
    VerTipo:='K';
    PorNome:=True;
    edtCampo.Text:='Nome';
    dmDados.TbFornecedor.IndexFieldNames:='Nome';
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

procedure TFrmLocFornec.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [PageDown] A=a [ESC] Sai');
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
    begin
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
