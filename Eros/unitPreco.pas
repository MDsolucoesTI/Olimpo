//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Localiza��o de Pre�o Produto
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitPreco;

interface
                            
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, fcButton, fcImgBtn, RXSplit, Grids, DBGrids, RackCtls,
  ExtCtrls, RXCtrls, jpeg,Db,dbUtils, RXDBCtrl, LMDCustomComponent,
  LMDCustomHint, LMDCustomShapeHint, LMDShapeHint, RxGrdCpt, fcImager,
  EMsgDlg, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmLocPreco = class(TForm)
    MsgDlg: TEvMsgDlg;
    RxLabel4: TRxLabel;
    Image3: TImage;
    EdtCampo: TEdit;
    RxLabel3: TRxLabel;
    cmbCampo: TComboBox;
    RxLabel1: TRxLabel;
    EdtValor: TEdit;
    RxDBGrid1: TRxDBGrid;
    LEDButton1: TLEDButton;
    RxLabel2: TRxLabel;
    LEDButton2: TLEDButton;
    RxLabel7: TRxLabel;
    fclLocMerc: TfcImageBtn;
    fclSair: TfcImageBtn;
    LMDBackPanel2: TPanel;
    LMDBackPanel1: TPanel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValorExit(Sender: TObject);
    procedure fclSairClick(Sender: TObject);
    procedure cmbCampoExit(Sender: TObject);
    procedure LEDButton1Click(Sender: TObject);
    procedure LEDButton2Click(Sender: TObject);
    procedure fclLocMercClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure LEDButton2DblClick(Sender: TObject);
  private
    fresultado : String;
    fnome:string;
  public
    { Public declarations }
    Property Resultado:String Read Fresultado Write Fresultado;
    Property Nome:String Read Fnome Write Fnome;
  end;

var
  FrmLocPreco: TFrmLocPreco;
  LocOpts : TLocateOptions;
  cor,PorNome,PorCod : boolean;
  NomeTab : String;
  CodTab : String;
  habilitaTeclado : boolean=true;

implementation

uses UnitDmDados, unitPrincipal;

{$R *.DFM}

procedure TFrmLocPreco.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;


procedure TFrmLocPreco.EdtValorExit(Sender: TObject);
begin
  fclLocMerc.Default:= True;
end;

procedure TFrmLocPreco.fclSairClick(Sender: TObject);
begin
  resultado:=dmdados.tbEstoqueCodMerc.Value;
  nome:=dmdados.tbEstoqueDescricao.Value;
  dmDados.tbEstoque.IndexFieldNames:='';
  Close;
end;


procedure TFrmLocPreco.cmbCampoExit(Sender: TObject);
begin
  PorNome:=False;
  PorCod:=False;
  if cmbCampo.Text ='C�digo' Then
    Begin
    PorCod:=True;
    edtCampo.Text:='CodMerc';
    End
  Else if cmbcampo.text = 'Descri��o' then
    Begin
     PorNome:=True;
     edtCampo.Text:='Descricao';
    End;
end;

procedure TFrmLocPreco.LEDButton1Click(Sender: TObject);
begin
  if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TFrmLocPreco.LEDButton2Click(Sender: TObject);
begin
  if LEDButton2.StateOn then
    LEDButton2.StateOn:=False
  else
    LEDButton2.StateOn:=True;
end;

procedure TFrmLocPreco.fclLocMercClick(Sender: TObject);
begin
  fclLocMerc.Default:= False;
  LocOpts:=[];
  if LEDButton1.StateOn then
    LocOpts:=LocOpts+[loPartialKey];
  if LEDButton2.StateOn then
    LocOpts:=LocOpts+[loCaseInsensitive];
  If not dmdados.TbEstoque.locate(edtCampo.Text, edtValor.text,LocOpts) Then
    begin
    MsgDlg.MsgInformation('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text);
    end
  else
    Begin
    cor := true;
    If PorNome Then
      NomeTab:=dmDados.tbEstoqueDescricao.Value;
    If PorCod Then
      CodTab:=dmDados.tbEstoqueCodMerc.Value;
    End;
end;

procedure TFrmLocPreco.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  NOME : string;
  CODIGO : String;
begin
  NOME   :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Descricao').asString;
  CODIGO :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CodMerc').asString;
  if cor then
    If PorNome Then
      If NOME = NomeTab Then
        background:=$00D2E2FF;
    If PorCod Then
      If CODIGO = CodTab Then
        background:=$00D2E2FF;
end;

procedure TFrmLocPreco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    fclSair.Click;
  if Key=VK_PRIOR then
    LEDButton1Click(Sender);
  if Key=VK_NEXT then
    LEDButton2Click(Sender);
  if Key=VK_F2 then
    fclLocMerc.Click;
end;

procedure TFrmLocPreco.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [PageDown] A=a [F2] Localizar [ESC] Sai');
end;

procedure TFrmLocPreco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.StatusTeclas(False,'');
  Action:=caFree;
end;

procedure TFrmLocPreco.LEDButton1DblClick(Sender: TObject);
begin
  if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TFrmLocPreco.LEDButton2DblClick(Sender: TObject);
begin
  if LEDButton2.StateOn then
    LEDButton2.StateOn:=False
  else
    LEDButton2.StateOn:=True;
end;

end.
