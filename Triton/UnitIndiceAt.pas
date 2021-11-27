//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitIndiceAt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, StdCtrls, Mask, DBCtrls, ExtCtrls,
  RackCtls, fcButton, fcImgBtn, RXSplit, RXCtrls, SpeedBar, jpeg, ToolEdit,
  CurrEdit, TFlatHintUnit, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint, RxLookup;

type
  TFrmIndiceAt = class(TForm)
    Panel1: TPanel;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    RxSplitter1: TRxSplitter;
    btnGravar: TfcImageBtn;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    dbGridIndice: TRxDBGrid;
    Panel2: TPanel;
    Image2: TImage;
    Label2: TLabel;
    dbValor: TRxDBCalcEdit;
    RxLabel3: TRxLabel;
    dbData: TDBDateEdit;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnNovo: TSpeedItem;
    BtnCancelar: TSpeedItem;
    BtnDeletar: TSpeedItem;
    BtnSair: TSpeedItem;
    LMDShapeHint1: TLMDShapeHint;
    RxLabel15: TRxLabel;
    cmbLkCodInd: TRxDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbDataEnter(Sender: TObject);
    procedure dbDataExit(Sender: TObject);
    procedure dbValorEnter(Sender: TObject);
    procedure dbValorExit(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure cmbLkCodIndEnter(Sender: TObject);
    procedure cmbLkCodIndExit(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIndiceAt: TFrmIndiceAt;
  NovoItem, Mudar: Boolean;

implementation

uses UnitDmdados;

{$R *.dfm}

procedure TFrmIndiceAt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= Cafree;
end;

procedure TFrmIndiceAt.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmIndiceAt.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmIndiceAt.dbDataEnter(Sender: TObject);
begin
(Sender as TDBDateEdit).color:=$00d2e2ff;
end;

procedure TFrmIndiceAt.dbDataExit(Sender: TObject);
begin
(Sender as TDBDateEdit).color:=clwindow;
end;

procedure TFrmIndiceAt.dbValorEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmIndiceAt.dbValorExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=clwindow;
end;

procedure TFrmIndiceAt.BtnNovoClick(Sender: TObject);
begin
 DMDados.TbIndiceAtu.Append;
 NovoItem:=True;
 Mudar:= False;
{habilitando os bot�es}
 btngravar.Enabled:=True;
 BtnCancelar.Enabled := True;
 BtnDeletar.Enabled:=False;
 BtnNovo.Enabled:=False;
{habilitando os componentes}
 cmbLkCodInd.Enabled:=True;
 dbData.Enabled:=True;
 dbValor.Enabled:= True;
 cmbLkCodInd.SetFocus;
end;

procedure TFrmIndiceAt.BtnCancelarClick(Sender: TObject);
begin
dmdados.TbIndiceAtu.cancel;
NovoItem:= False;
// dmdados.vTabStt:=true;
{Desabilitando os bot�es}
btnGravar.Enabled:=false;
BtnCancelar.Enabled := false;
BtnDeletar.Enabled:=True;
BtnNovo.Enabled:=True;
{Habilitando os componentes}
 cmbLkCodInd.Enabled:=True;
 dbData.Enabled:=True;
 dbValor.Enabled:= True;
 cmbLkCodInd.SetFocus;
end;

procedure TFrmIndiceAt.cmbLkCodIndEnter(Sender: TObject);
begin
(Sender as TRxDBLookupCombo).color:=$00d2e2ff;
end;

procedure TFrmIndiceAt.cmbLkCodIndExit(Sender: TObject);
begin
(Sender as TRxDBLookupCombo).color:=clwindow;
end;

procedure TFrmIndiceAt.BtnDeletarClick(Sender: TObject);
begin
if dmdados.tbValIndex.RecordCount=0 then
   begin
   ShowMessage('Tabela sem registro');
   end
   else
   If application.MessageBox('Tem certeza que deseja exluir esse registro?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
   begin
    dmdados.tbValIndex.Delete;
   end
   else
   dmdados.tbValIndex.Cancel;
end;

end.
