//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitLocContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CurrEdit, RXDBCtrl, ToolEdit, RXSplit, fcButton, fcImgBtn, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, ExtCtrls, RXCtrls, RackCtls, jpeg, DBTables, DB,
  EnhEdit, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  LMDShapeHint, EFocCol;

type
  TfrmLocContrato = class(TForm)
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
    RxDBGrid1: TRxDBGrid;
    RxLabel15: TRxLabel;
    Image2: TImage;
    Label2: TLabel;
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
     Property Restricao : string Read rest Write rest;
     Property CPF : string read fcpf write fcpf;
     Property CNPJ: string read fcnpj write fcnpj;
  end;

var
  frmLocContrato: TfrmLocContrato;
  LocOpts : TLocateOptions;
  cor,PorCod,PorCodCli : boolean;
  CodTab, CodCliTab : LongInt;
  VerTipo : Char;

implementation

uses UnitDmdados, unitPrincipal ;

{$R *.DFM}

procedure TfrmLocContrato.FormKeyPress(Sender: TObject; var Key: Char);
begin
  {If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;  }
    
end;

procedure TfrmLocContrato.EdtValorExit(Sender: TObject);
begin
  fclLocCli.Default:= True;
  fclLocCli.SetFocus;
end;

procedure TfrmLocContrato.fclSairClick(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(False,'');
  resultado:=dmdados.tbContratoCodCServ.Value;
  Close;
  dmdados.tbPesContra.Filtered:=false;
end;

procedure TfrmLocContrato.CmbcampoExit(Sender: TObject);
begin
  PorCod:=False;
  PorCodCli:= False;
  if cmbCampo.Text = 'C�digo Contrato' Then
    Begin
    VerTipo:='I';
    PorCod:=True;
    edtCampo.Text:='CodCServ';
    End
  Else if cmbcampo.text = 'C�digo Cliente' then
    Begin
    VerTipo:='I';
    PorCodCli:=True;
    edtCampo.Text:='CodCli';
    End;
end;

procedure TfrmLocContrato.fclLocCliClick(Sender: TObject);
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
  If not dmdados.tbContrato.locate(edtCampo.Text,edtValor.text,LocOpts) Then
    begin
    ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
    end
  else
    Begin
    cor := true;
    If PorCodCli Then
      CodCliTab:=dmDados.tbContratoCodCli.Value;
    If PorCod Then
      CodTab:=dmDados.tbContratoCodCServ.Value;
    End;
  Cmbcampo.SetFocus;
end;

procedure TfrmLocContrato.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  CODIGO, CODCLI : longInt;
begin
  CODIGO :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CodcServ').asInteger;
  CODCLI :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CodCli').asInteger;
  if cor then
    begin
    If PorCod Then
      If CODIGO = CodCliTab Then
        background:=$00D2E2FF;
    If PorCodCli Then
      If CODCLI = CodTab Then
        background:=$00D2E2FF;
    end;
end;

procedure TfrmLocContrato.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{  if Key=VK_ESCAPE then
    fclSair.Click;
  if Key=VK_PRIOR then
    LEDButton1DblClick(Sender);
  if Key=VK_NEXT then
    LEDButton2DblClick(Sender);}

end;

procedure TfrmLocContrato.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [PageDown] A=a [F2] Localizar [ESC] Sai');
  LocOpts:=[];
  Cmbcampo.ItemIndex:=0;
  edtcampo.Text:='CodCServ';
  VerTipo:='I';
  cmbCampo.SetFocus;
end;

procedure TfrmLocContrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 //frmPrincipal.StatusTeclas(False,'');
end;

procedure TfrmLocContrato.LEDButton1DblClick(Sender: TObject);
begin
  if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TfrmLocContrato.LEDButton2DblClick(Sender: TObject);
begin
if LEDButton2.StateOn then
    LEDButton2.StateOn:=False
  else
    LEDButton2.StateOn:=True;
end;

end.
