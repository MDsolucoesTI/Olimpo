//////////////////////////////////////////////////////////////////////////
// Criacao...........: 05/2002
// Sistema...........: Ciclope - Controle de Funcionarios
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UntLocPatrimonio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, fcButton, fcImgBtn, RXSplit, Grids, DBGrids, RackCtls,
  ExtCtrls, RXCtrls, jpeg, DBTables, DB, RXDBCtrl;

type
  TFrmLocPatrimonio = class(TForm)
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
    fclLocPatri: TfcImageBtn;
    ScrewPanel2: TScrewPanel;
    Label3: TLabel;
    Image3: TImage;
    Cmbcampo: TComboBox;
    RxDBGrid1: TRxDBGrid;
    procedure fclSairClick(Sender: TObject);
    procedure CmbcampoExit(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure fclLocPatriClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure LEDButton2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

   private
    { Private declarations }
    fresultado : longint;
  public
    { Public declarations }
    Property Resultado:longint read Fresultado write Fresultado;
  end;

var
  FrmLocPatrimonio: TFrmLocPatrimonio;
  PorDesc,PorCod,Cor : boolean;
  LocOpts : TLocateOptions;
  DescTab : String;
  CodTab : LongInt;
  VerTipo : Char;
  

implementation

uses UnitDMDados, UnitPrincipal;

{$R *.dfm}


procedure TFrmLocPatrimonio.fclSairClick(Sender: TObject);
begin
  resultado:=dmdados.tbpatrimonioNumPatri.Value;
  Close;
end;

procedure TFrmLocPatrimonio.CmbcampoExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If Cmbcampo.Text= '' then
     Begin
     ShowMessage('� obrigat�rio informar o CAMPO');
     cmbcampo.SetFocus;
     End
  Else
     Begin
       Flag:=True;
       For x:=0 to cmbcampo.Items.Count-1 Do
       If cmbcampo.Text=cmbcampo.Items[x] Then
         Flag:=False;
       If Flag Then
          Begin
          ShowMessage('Valor inv�lido');
          cmbcampo.SetFocus;
          End
       else
          begin
          PorDesc:=False;
          PorCod:=False;
          if cmbCampo.Text = 'N�mero' Then
             Begin
             VerTipo:='I';
             PorCod:=True;
             edtCampo.Text:='NumPatri';
             End;
          if cmbcampo.text = 'Descri��o' then
             Begin
             VerTipo:='K';
             PorDesc:=True;
             edtCampo.Text:='Descricao';
             End;
          end;
     end;
end;

procedure TFrmLocPatrimonio.EdtValorExit(Sender: TObject);
begin
fclLocPatri.Default:=true;
fclLocPatri.SetFocus;
end;

procedure TFrmLocPatrimonio.fclLocPatriClick(Sender: TObject);
begin
{verificando se dado digitado corresponde ao tipo}
  if (vertipo='I') and (StrToIntDef(edtvalor.text,-1)= -1) then
    begin
    ShowMessage('Valor digitado deve ser num�rico');
    edtvalor.SetFocus;
    abort;
    end;

  fclLocPatri.default:=false;
  LocOpts:=[];
  if LedButton1.StateOn then
   LocOpts:=LocOpts+[loPartialKey];
  if LedButton2.StateOn then
   LocOpts:=LocOpts+[loCaseInsensitive];
   If not dmdados.TbPatrimonio.locate(edtCampo.Text, edtValor.text,LocOpts) Then
      begin
      ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
      end
    else
      Begin
      cor := true;
      If PorCod Then
        CodTab:=dmdados.TbPatrimonioNumPatri.Value;
      If PorDesc Then
        DescTab:=dmDados.tbpatrimonioDescricao.Value;
      End;
    Cmbcampo.SetFocus;
end;

procedure TFrmLocPatrimonio.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
   desc : string;
   numero : integer;
begin
Desc   :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Descricao').asString;
numero :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('NumPatri').asInteger;
if cor then
   If PorDesc Then
      If Desc = DescTab Then
         background:=$00D2E2FF;
   If PorCod Then
      If Numero = CodTab Then
         background:=$00D2E2FF;

end;

procedure TFrmLocPatrimonio.LEDButton1DblClick(Sender: TObject);
begin
if LedButton1.StateOn then
   LedButton1.StateOn:=false
 else
   LedButton1.StateOn:=true;
end;

procedure TFrmLocPatrimonio.LEDButton2DblClick(Sender: TObject);
begin
if LedButton2.StateOn then
   LedButton2.StateOn:=false
 else
   LedButton2.StateOn:=true;
end;

procedure TFrmLocPatrimonio.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [PageDown] A=a [F2] Localizar [ESC] Sai');
end;

procedure TFrmLocPatrimonio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.StatusTeclas(False,'');
end;

procedure TFrmLocPatrimonio.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmLocPatrimonio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    fclSair.Click;
  if Key=VK_PRIOR then
    LEDButton1DblClick(Sender);
  if Key=VK_NEXT then
    LEDButton2DblClick(Sender);
  if key=VK_F2 then fclLocpatri.Click;
end;

end.
