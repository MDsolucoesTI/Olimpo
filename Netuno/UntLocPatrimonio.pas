//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
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
    procedure EdtValorExit(Sender: TObject);
    procedure fclLocPatriClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure LEDButton2DblClick(Sender: TObject);
    procedure CmbcampoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    fresultado : String;
  public
    { Public declarations }
    Property Resultado:String Read Fresultado Write Fresultado;
  end;

var
  FrmLocPatrimonio: TFrmLocPatrimonio;
  PorDesc,PorCod,Cor : boolean;
  LocOpts : TLocateOptions;
  DescTab,CodTab : String;
  vertipo: char;

implementation

uses UnitDMDados, UnitPrincipal;

{$R *.dfm}


procedure TFrmLocPatrimonio.fclSairClick(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(False,'');
  resultado:=dmdados.TbPatrimonioNumPatri.AsString;
  Close;
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
          DescTab:=dmDados.TbPatrimonioDescricao.Value;
        End;
      Cmbcampo.SetFocus;

end;

procedure TFrmLocPatrimonio.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
   desc,numero : string;
begin
Desc   :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Descricao').AsString;
numero :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('NumPatri').AsString;
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

procedure TFrmLocPatrimonio.CmbcampoExit(Sender: TObject);
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

    PorDesc:=False;
    PorCod:=False;
    if cmbCampo.Text = 'N�mero' Then
    Begin
      VerTipo:='I';
      PorCod:=True;
      edtCampo.Text:='NumPatri';
    End;
    if cmbCampo.Text = 'Descri��o' Then
    Begin
      VerTipo:='K';
      PorDesc:=True;
      edtCampo.Text:='Descricao';
    End;

end;

procedure TFrmLocPatrimonio.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [PageDown] A=a [F2] Localizar [ESC] Sai');
  LocOpts:=[];
  Cmbcampo.ItemIndex:=0;
  edtcampo.Text:='NumPatri';
  VerTipo:='k';
end;

end.
