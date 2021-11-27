//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitLocHistorico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, fcButton, fcImgBtn, RXSplit, Grids, DBGrids, RackCtls,
  ExtCtrls, RXCtrls, jpeg,db, RXDBCtrl, RxGrdCpt, fcImager, EMsgDlg;

type
  TFrmLocHistorico = class(TForm)
    Panel1: TPanel;
    RxLabel3: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel7: TRxLabel;
    LEDButton1: TLEDButton;
    LEDButton2: TLEDButton;
    EdtCampo: TEdit;
    fclLocHist: TfcImageBtn;
    cmbcampo: TComboBox;
    RxDBGrid1: TRxDBGrid;
    edtvalor: TEdit;
    Panel2: TPanel;
    RxLabel15: TRxLabel;
    Image3: TImage;
    fclSair: TfcImageBtn;
    RxGradientCaption2: TRxGradientCaption;
    MsgDlg: TEvMsgDlg;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValorExit(Sender: TObject);
    procedure fclSairClick(Sender: TObject);
    procedure cmbcampoExit(Sender: TObject);
    procedure fclLocHistClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure LEDButton2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    fresultado : string;
  public
    { Public declarations }
    Property Resultado:string read fresultado write fresultado;
  end;

var
     FrmLocHistorico : TFrmLocHistorico;
  PorCod,PorDesc,cor : boolean;
             LocOpts : tLocateOptions;
     CodDesc,DescTab : string;
              CodTab : string;

implementation

uses UnitDmdados, UnitPrincipal;

{$R *.DFM}

procedure TFrmLocHistorico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.StatusTeclas(False,'');
end;

procedure TFrmLocHistorico.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 Then
    begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    end;
end;

procedure TFrmLocHistorico.EdtValorExit(Sender: TObject);
begin
  fclLocHist.Default:= True;
  fclLocHist.SetFocus;
end;

procedure TFrmLocHistorico.fclSairClick(Sender: TObject);
begin
  resultado:=dmdados.tbHistoricoCodHist.Value;
  Close;
end;

procedure TFrmLocHistorico.cmbcampoExit(Sender: TObject);
begin
  Pordesc:=False;
  PorCod:=False;
  if cmbCampo.Text = 'C�digo' then
    begin
    PorCod:=True;
    edtCampo.Text:='CodHist';
    end
  else if cmbcampo.text = 'Descri��o' then
    begin
    PorDesc:=True;
    edtCampo.Text:='Descricao';
    end
end;

procedure TFrmLocHistorico.fclLocHistClick(Sender: TObject);
begin
  fclLocHist.Default:= False;
  LocOpts:=[];
  if LEDButton1.StateOn then
    LocOpts:=LocOpts+[loPartialKey];
  if LEDButton2.StateOn then
    LocOpts:=LocOpts+[loCaseInsensitive];
  if not dmdados.TbHistorico.locate(edtCampo.Text, edtValor.text,LocOpts) then
    begin
    MsgDlg.MsgWarning ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
    end
  else
    begin
    cor := true;
    if Pordesc then
      DescTab:=dmDados.tbHistoricoDescricao.Value;
    if PorCod then
      CodTab:=dmDados.tbHistoricoCodHist.Value;
    end;
end;

procedure TFrmLocHistorico.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  codigo: string;
  desc : string;
begin
  CODIGO :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CodHist').asString;
  desc   :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Descricao').asString;
  if cor then
    begin
    if PorDesc then
      if Desc = DescTab then
        background:=$00D2E2FF;
    if PorCod Then
      if CODIGO = CodTab Then
        background:=$00D2E2FF;
    end;
end;

procedure TFrmLocHistorico.LEDButton1DblClick(Sender: TObject);
begin
  if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TFrmLocHistorico.LEDButton2DblClick(Sender: TObject);
begin
  if LEDButton2.StateOn then
    LEDButton2.StateOn:=False
  else
    LEDButton2.StateOn:=True;
end;

procedure TFrmLocHistorico.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [PageDown] A=a [F2] Localizar [ESC] Sai');
  Cmbcampo.ItemIndex:=0;
  CmbCampo.SetFocus;
  EdtCampo.Text:='CodHist';
end;

procedure TFrmLocHistorico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    fclSair.Click;
  if Key=VK_PRIOR then
    LEDButton1DblClick(Sender);
  if Key=VK_NEXT then
    LEDButton2DblClick(Sender);
end;

end.
