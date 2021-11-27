//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitLocEmprestimo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, StdCtrls, RackCtls, fcButton,
  fcImgBtn, RXCtrls, ExtCtrls, jpeg , dbtables , db;

type
  TFrmLocEmprestimo = class(TForm)
    Image2: TImage;
    Label2: TLabel;
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
    fclLocEmprestimo: TfcImageBtn;
    ScrewPanel2: TScrewPanel;
    Label3: TLabel;
    Image3: TImage;
    Cmbcampo: TComboBox;
    h: TRxDBGrid;
    procedure fclSairClick(Sender: TObject);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure LEDButton2DblClick(Sender: TObject);
    procedure fclLocEmprestimoClick(Sender: TObject);
    procedure hGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure EdtValorExit(Sender: TObject);
    procedure CmbcampoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLocEmprestimo: TFrmLocEmprestimo;
  LocOpts : TLocateOptions;
  cor,PorCod,PorNum:boolean;
  CodTab : LongInt;
  NumTab : String;
  VerTipo:char;


implementation

uses UnitDMDados, UnitPrincipal;

{$R *.dfm}

procedure TFrmLocEmprestimo.fclSairClick(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(False,'');
  close;
end;

procedure TFrmLocEmprestimo.LEDButton1DblClick(Sender: TObject);
begin
if LedButton1.StateOn then
   LedButton1.StateOn:=false
 else
   LedButton1.StateOn:=true;
end;

procedure TFrmLocEmprestimo.LEDButton2DblClick(Sender: TObject);
begin
if LedButton2.StateOn then
   LedButton2.StateOn:=false
 else
   LedButton2.StateOn:=true;
end;

procedure TFrmLocEmprestimo.fclLocEmprestimoClick(Sender: TObject);
begin
  {verificando se dado digitado corresponde ao tipo}
  if (vertipo='I') and (StrToIntDef(edtvalor.text,-1)= -1) then
    begin
     ShowMessage('Valor digitado deve ser num�rico');
     edtvalor.SetFocus;
     abort;
    end;

    fclLocEmprestimo.Default:= False;
    LocOpts:=[];
    if LedButton1.StateOn then
     LocOpts:=LocOpts+[loPartialKey];
    if LedButton2.StateOn then
     LocOpts:=LocOpts+[loCaseInsensitive];
    If not dmdados.TbEmprestimo.locate(edtCampo.Text, edtValor.text,LocOpts) Then
       begin
       ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
       end
    else
      Begin
      cor := true;
      If PorNum Then
         NumTab:=dmDados.TbEmprestimoNumPatri.Value;
      If PorCod Then
         CodTab:=dmDados.TbEmprestimoCodCli.Value;
      End;

end;

procedure TFrmLocEmprestimo.hGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  CODIGO : longInt;
  NUMERO : String;
begin
NUMERO :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('NumPatri').asString;
CODIGO :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CodEmpre').asInteger;
if cor then
   If PorNum Then
      If NUMERO = NumTab Then
         background:=$00D2E2FF;   
   If PorCod Then
      If CODIGO = CodTab Then
         background:=$00D2E2FF;
end;

procedure TFrmLocEmprestimo.EdtValorExit(Sender: TObject);
begin
  fclLocEmprestimo.Default:= True;
  fclLocEmprestimo.SetFocus;
end;

procedure TFrmLocEmprestimo.CmbcampoExit(Sender: TObject);
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
        
    PorCod:=False;
    PorNum:= False;
    if cmbCampo.Text = 'C�digo Empr�timo' Then
    Begin
      VerTipo:='I';
      PorCod:=True;
      edtCampo.Text:='CodEmpre';
    End;
    if cmbCampo.Text = 'N�mero Patrim�nio' Then
    Begin
      VerTipo:='I';
      PorNum:=True;
      edtCampo.Text:='NumPatri';
    End;

end;

procedure TFrmLocEmprestimo.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [PageDown] A=a [F2] Localizar [ESC] Sai');
  LocOpts:=[];
  Cmbcampo.ItemIndex:=0;
  edtcampo.Text:='CodEmpre';
  VerTipo:='I';
end;

end.
