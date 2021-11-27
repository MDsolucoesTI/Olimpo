//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitLocServ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, StdCtrls, RackCtls, fcButton,
  fcImgBtn, RXCtrls, ExtCtrls, jpeg , db;

type
  TFrmLocServ = class(TForm)
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
    edtvalor: TEdit;
    EdtCampo: TEdit;
    fclLocServ: TfcImageBtn;
    ScrewPanel2: TScrewPanel;
    Image3: TImage;
    RxLabel4: TRxLabel;
    cmbcampo: TComboBox;
    RxDBGrid1: TRxDBGrid;
    procedure cmbcampoExit(Sender: TObject);
    procedure fclLocServClick(Sender: TObject);
    procedure fclSairClick(Sender: TObject);
    procedure edtvalorExit(Sender: TObject);
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
    Property Resultado:longint Read Fresultado Write Fresultado;
  end;

var
  FrmLocServ: TFrmLocServ;
  LocOpts : TLocateOptions;
  cor,PorDesc,PorCod:boolean;
  DescTab : String;
  CodTab : LongInt;
  VerTipo : Char;

implementation

uses unitDmDados, unitPrincipal;

{$R *.dfm}

procedure TFrmLocServ.cmbcampoExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
    Begin
    If cmbcampo.Text= '' then
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
        End;
      end;
    end;

    PorDesc:=False;
    PorCod:=False;
    if cmbCampo.Text = 'C�digo' Then
    Begin
      VerTipo:='I';
      PorCod:=True;
      edtCampo.Text:='CodServ';
    End
  Else if cmbcampo.text = 'Descri��o' then
    Begin
      VerTipo:='K';
      PorDesc:=True;
      edtCampo.Text:='Descricao';
    End;

end;

procedure TFrmLocServ.fclLocServClick(Sender: TObject);
begin
{verificando se dado digitado corresponde ao tipo}
  if (vertipo='I') and (StrToIntDef(edtvalor.text,-1)= -1) then
    begin
    ShowMessage('Valor digitado deve ser num�rico');
    edtvalor.SetFocus;
    abort;
    end;
  fclLocServ.Default:= False;
  LocOpts:=[];
  if LEDButton1.StateOn then
    LocOpts:=LocOpts+[loPartialKey];
  if LEDButton2.StateOn then
    LocOpts:=LocOpts+[loCaseInsensitive];
  If not dmdados.tbServicos.locate(edtCampo.Text, edtValor.text,LocOpts) Then
    begin
    ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
    end
  else
    Begin
    cor := true;
    If PorDesc Then
      DescTab:=dmDados.tbServicosDescricao.Value;
    If PorCod Then
      CodTab:=dmDados.tbServicosCodServ.Value;
    End;
  cmbCampo.SetFocus;

end;

procedure TFrmLocServ.fclSairClick(Sender: TObject);
begin
  resultado:=dmdados.tbServicosCodServ.Value;
  dmDados.tbServicos.IndexFieldNames:='';
  close;
end;

procedure TFrmLocServ.edtvalorExit(Sender: TObject);
begin
  fclLocServ.Default:= True;
  fclLocServ.SetFocus;
end;

procedure TFrmLocServ.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  DESC : string;
  CODIGO : longInt;
begin
  DESC   :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('descricao').asString;
  CODIGO :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CodServ').asInteger;
  if cor then
    If PorDesc Then
      If DESC = DescTab Then
        background:=$00D2E2FF;
    If PorCod Then
      If CODIGO = CodTab Then
        background:=$00D2E2FF;

end;

procedure TFrmLocServ.LEDButton1DblClick(Sender: TObject);
begin
  if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TFrmLocServ.LEDButton2DblClick(Sender: TObject);
begin
  if LEDButton2.StateOn then
    LEDButton2.StateOn:=False
  else
    LEDButton2.StateOn:=True;
end;

procedure TFrmLocServ.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [PageDown] A=a [F2] Localizar [ESC] Sai');
  LocOpts:=[];
  Cmbcampo.ItemIndex:=0;
  edtcampo.Text:='CodServ';
  VerTipo:='I';
end;

procedure TFrmLocServ.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.StatusTeclas(False,'');
end;

procedure TFrmLocServ.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmLocServ.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    fclSair.Click;
  if Key=VK_PRIOR then
    LEDButton1DblClick(Sender);
  if Key=VK_NEXT then
    LEDButton2DblClick(Sender);
  if key=VK_F2 then fclLocserv.Click;
    
end;

end.
