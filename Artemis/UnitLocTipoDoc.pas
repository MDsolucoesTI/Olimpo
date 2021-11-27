//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitLocTipoDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, fcButton, fcImgBtn, RXSplit, Grids, DBGrids, RackCtls,
  ExtCtrls, RXCtrls, jpeg, db, RXDBCtrl, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint, RxGrdCpt, fcImager, EMsgDlg;

type
  TFrmLocTipoDoc = class(TForm)
    Panel1: TPanel;
    RxLabel3: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel7: TRxLabel;
    LEDButton1: TLEDButton;
    LEDButton2: TLEDButton;
    EdtValor: TEdit;
    EdtCampo: TEdit;
    fclLocTipo: TfcImageBtn;
    cmbcampo: TComboBox;
    RxDBGrid1: TRxDBGrid;
    Panel2: TPanel;
    RxLabel4: TRxLabel;
    Image3: TImage;
    fclSair: TfcImageBtn;
    RxGradientCaption2: TRxGradientCaption;
    MsgDlg: TEvMsgDlg;
    procedure fclSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cmbcampoExit(Sender: TObject);
    procedure fclLocTipoClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure LEDButton2DblClick(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
  private
    { Private declarations }
    fresultado : string;
  public
    { Public declarations }
    Property Resultado :string Read fresultado Write fresultado;
  end;

var
  FrmLocTipoDoc : TFrmLocTipoDoc;
  PorDesc,PorCod,cor : boolean;
  LocOpts  : TLocateOptions;
  DescTab : string;
  CodTab : string;

implementation

uses UnitDmdados, unitPrincipal;

{$R *.DFM}

procedure TFrmLocTipoDoc.fclSairClick(Sender: TObject);
begin
  fresultado:=dmdados.tbTipoDocCodDoc.value;
  Close;
end;

procedure TFrmLocTipoDoc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmLocTipoDoc.cmbcampoExit(Sender: TObject);
begin
  Pordesc:=False;
  PorCod:=False;
  if cmbCampo.Text = 'C�digo' then
    begin
    PorCod:=True;
    edtCampo.Text:='Coddoc';
    end
  else if cmbcampo.text = 'Descri��o' then
    begin
    PorDesc:=True;
    edtCampo.Text:='Descricao';
    end;
end;

procedure TFrmLocTipoDoc.fclLocTipoClick(Sender: TObject);
begin
  fclLocTipo.Default:= False;
  LocOpts:=[];
  if LEDButton1.StateOn then
    LocOpts:=LocOpts+[loPartialKey];
  if LEDButton2.StateOn then
    LocOpts:=LocOpts+[loCaseInsensitive];
  if not dmdados.TbTipoDoc.locate(edtCampo.Text, edtValor.text,LocOpts) Then
    MsgDlg.MsgWarning ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text)
  else
    begin
    cor := true;
    if Pordesc then
      DescTab:=dmDados.tbTipoDocDescricao.Value;
    if PorCod then
      CodTab:=dmDados.tbTipoDocCodDoc.Value;
    end;
end;

procedure TFrmLocTipoDoc.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  codigo : string;
  desc : string;
begin
  CODIGO :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CodDoc').asString;
  desc  :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Descricao').asString;
  if cor then
    begin
    if PorDesc then
      if Desc = DescTab then
        background:=$00D2E2FF;
    if PorCod then
      if CODIGO = CodTab then
        background:=$00D2E2FF;
    end;
end;

procedure TFrmLocTipoDoc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    fclSair.Click;
  if Key=VK_PRIOR then
    LEDButton1dblClick(Sender);
  if Key=VK_NEXT then
    LEDButton2dblClick(Sender);
end;

procedure TFrmLocTipoDoc.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [PageDown] A=a [F2] Localizar [ESC] Sai');
  Cmbcampo.ItemIndex:=0;
  CmbCampo.SetFocus;
  EdtCampo.Text:='CodDoc';
end;

procedure TFrmLocTipoDoc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.StatusTeclas(False,'');
end;

procedure TFrmLocTipoDoc.LEDButton1DblClick(Sender: TObject);
begin
  if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TFrmLocTipoDoc.LEDButton2DblClick(Sender: TObject);
begin
 if LEDButton2.StateOn then
    LEDButton2.StateOn:=False
  else
    LEDButton2.StateOn:=True;
end;

procedure TFrmLocTipoDoc.EdtValorExit(Sender: TObject);
begin
  fclLocTipo.Default:= True;
  fclLocTipo.SetFocus;
end;

end.
