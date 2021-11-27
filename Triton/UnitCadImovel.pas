//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCadImovel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RXCtrls, ExtCtrls, SpeedBar, RackCtls, jpeg, RxLookup,
  DBCtrls, fcButton, fcImgBtn, Mask, DCStdCtrls, ToolEdit, CurrEdit,
  RXDBCtrl, RXSplit, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDBaseEdit, LMDCustomEdit, LMDCustomMaskEdit, LMDMaskEdit, LMDEdit,
  TFlatEditUnit, TFlatHintUnit, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint,db,dbtables;

type
  TFrmCadImovel = class(TForm)
    Image2: TImage;
    Label2: TLabel;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    Panel1: TPanel;
    pgcimovel: TDCPageControl;
    pgdados: TDCPage;
    pgloc: TDCPage;
    pgdesc: TDCPage;
    RxLabel6: TRxLabel;
    RxLabel44: TRxLabel;
    cmbTipoOp: TDBComboBox;
    RxLabel1: TRxLabel;
    RxLabel52: TRxLabel;
    btnLocProp: TfcImageBtn;
    dbCodProp: TDBEdit;
    RxLabel51: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel8: TRxLabel;
    RxLabel9: TRxLabel;
    RxSplitter8: TRxSplitter;
    RxLabel10: TRxLabel;
    cmbOp: TDBComboBox;
    RxLabel11: TRxLabel;
    dbValorOp: TRxDBCalcEdit;
    dbCadPref: TDBEdit;
    dbEscr: TDBEdit;
    dbAreaTer: TDBEdit;
    dbAreaConst: TDBEdit;
    dbValor: TRxDBCalcEdit;
    dbProp: TDBEdit;
    dbNumImov: TDBEdit;
    lbendereco: TRxLabel;
    dbEnd: TDBEdit;
    lbnumero: TRxLabel;
    dbNum: TDBEdit;
    lbcompl: TRxLabel;
    dbCompl: TDBEdit;
    lbBairro: TRxLabel;
    dbBairro: TDBEdit;
    lbcep: TRxLabel;
    dbCep: TDBEdit;
    lbuf: TRxLabel;
    dbUf: TDBComboBox;
    lbcidade: TRxLabel;
    dbCidade: TDBEdit;
    RxLabel38: TRxLabel;
    dbMemoRef: TDBMemo;
    Bevel1: TBevel;
    Panel2: TPanel;
    RxLabel12: TRxLabel;
    RxLabel13: TRxLabel;
    RxLabel14: TRxLabel;
    RxLabel15: TRxLabel;
    RxLabel16: TRxLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    dbDorm: TRxDBCalcEdit;
    RxLabel17: TRxLabel;
    dbBanheiro: TRxDBCalcEdit;
    RxLabel18: TRxLabel;
    dbLavabo: TRxDBCalcEdit;
    RxLabel19: TRxLabel;
    dbHall: TRxDBCalcEdit;
    RxLabel21: TRxLabel;
    dbEsc: TRxDBCalcEdit;
    RxLabel22: TRxLabel;
    dbSuite: TRxDBCalcEdit;
    RxLabel23: TRxLabel;
    dbSalaTV: TRxDBCalcEdit;
    RxLabel24: TRxLabel;
    dbLiving: TRxDBCalcEdit;
    RxLabel25: TRxLabel;
    dbSalaJan: TRxDBCalcEdit;
    RxLabel26: TRxLabel;
    dbCopa: TRxDBCalcEdit;
    RxLabel27: TRxLabel;
    dbCozinha: TRxDBCalcEdit;
    RxLabel28: TRxLabel;
    dbAreaServ: TRxDBCalcEdit;
    RxLabel29: TRxLabel;
    dbDisp: TRxDBCalcEdit;
    RxLabel30: TRxLabel;
    dbGarag: TRxDBCalcEdit;
    RxLabel31: TRxLabel;
    dbDormEmp: TRxDBCalcEdit;
    RxLabel32: TRxLabel;
    dbBanhEmp: TRxDBCalcEdit;
    RxLabel33: TRxLabel;
    dbRancho: TRxDBCalcEdit;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnPrimeiro: TSpeedItem;
    BtnAnterior: TSpeedItem;
    BtnProximo: TSpeedItem;
    BtnUltimo: TSpeedItem;
    BtnNovo: TSpeedItem;
    BtnGravar: TSpeedItem;
    BtnCancelar: TSpeedItem;
    BtnAlterar: TSpeedItem;
    BtnDeletar: TSpeedItem;
    BtnLocalizar: TSpeedItem;
    BtnSair: TSpeedItem;
    pgoutro: TDCPage;
    dbObs: TDBMemo;
    LMDShapeHint1: TLMDShapeHint;
    dbDataCad: TDBDateEdit;
    RxLabel20: TRxLabel;
    RxLabel34: TRxLabel;
    dbPisc: TRxDBCalcEdit;
    RxLabel35: TRxLabel;
    lookTipoImov: TRxDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbNumImovEnter(Sender: TObject);
    procedure dbNumImovExit(Sender: TObject);
    procedure cmbTipoOpEnter(Sender: TObject);
    procedure cmbTipoOpExit(Sender: TObject);
    procedure dbValorEnter(Sender: TObject);
    procedure cmbLkTipoImovEnter(Sender: TObject);
    procedure dbPropEnter(Sender: TObject);
    procedure dbPropExit(Sender: TObject);
    procedure dbCadPrefEnter(Sender: TObject);
    procedure dbCadPrefExit(Sender: TObject);
    procedure dbEscrEnter(Sender: TObject);
    procedure dbEscrExit(Sender: TObject);
    procedure dbAreaTerEnter(Sender: TObject);
    procedure dbAreaTerExit(Sender: TObject);
    procedure dbAreaConstEnter(Sender: TObject);
    procedure dbAreaConstExit(Sender: TObject);
    procedure cmbOpEnter(Sender: TObject);
    procedure cmbOpExit(Sender: TObject);
    procedure dbValorOpEnter(Sender: TObject);
    procedure dbValorOpExit(Sender: TObject);
    procedure dbEndEnter(Sender: TObject);
    procedure dbNumEnter(Sender: TObject);
    procedure dbNumExit(Sender: TObject);
    procedure dbComplEnter(Sender: TObject);
    procedure dbBairroEnter(Sender: TObject);
    procedure dbBairroExit(Sender: TObject);
    procedure dbCepEnter(Sender: TObject);
    procedure dbCepExit(Sender: TObject);
    procedure dbUfEnter(Sender: TObject);
    procedure dbUfExit(Sender: TObject);
    procedure dbCidadeEnter(Sender: TObject);
    procedure dbCidadeExit(Sender: TObject);
    procedure dbMemoRefEnter(Sender: TObject);
    procedure dbMemoRefExit(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure dbPiscExit(Sender: TObject);
    procedure btnLocPropClick(Sender: TObject);
    procedure dbEndExit(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure dbValorExit(Sender: TObject);
    procedure dbCodPropExit(Sender: TObject);
    procedure dbObsExit(Sender: TObject);
    procedure dbComplExit(Sender: TObject);
    procedure dbDormEnter(Sender: TObject);
    procedure dbBanheiroEnter(Sender: TObject);
    procedure dbLavaboEnter(Sender: TObject);
    procedure dbHallEnter(Sender: TObject);
    procedure dbEscEnter(Sender: TObject);
    procedure dbSuiteEnter(Sender: TObject);
    procedure dbSalaTVEnter(Sender: TObject);
    procedure dbLivingEnter(Sender: TObject);
    procedure dbSalaJanEnter(Sender: TObject);
    procedure dbCopaEnter(Sender: TObject);
    procedure dbCozinhaEnter(Sender: TObject);
    procedure dbAreaServEnter(Sender: TObject);
    procedure dbDispEnter(Sender: TObject);
    procedure dbGaragEnter(Sender: TObject);
    procedure dbDormEmpEnter(Sender: TObject);
    procedure dbBanhEmpEnter(Sender: TObject);
    procedure dbRanchoEnter(Sender: TObject);
    procedure dbPiscEnter(Sender: TObject);
    procedure dbDormExit(Sender: TObject);
    procedure dbBanheiroExit(Sender: TObject);
    procedure dbLavaboExit(Sender: TObject);
    procedure dbHallExit(Sender: TObject);
    procedure dbEscExit(Sender: TObject);
    procedure dbSuiteExit(Sender: TObject);
    procedure dbSalaTVExit(Sender: TObject);
    procedure dbLivingExit(Sender: TObject);
    procedure dbSalaJanExit(Sender: TObject);
    procedure dbCopaExit(Sender: TObject);
    procedure dbCozinhaExit(Sender: TObject);
    procedure dbAreaServExit(Sender: TObject);
    procedure dbDispExit(Sender: TObject);
    procedure dbGaragExit(Sender: TObject);
    procedure dbDormEmpExit(Sender: TObject);
    procedure dbBanhEmpExit(Sender: TObject);
    procedure dbRanchoExit(Sender: TObject);
    procedure lookTipoImovExit(Sender: TObject);
    procedure dbCodPropEnter(Sender: TObject);
    procedure lookTipoImovEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadImovel: TFrmCadImovel;
  NovoItem: Boolean;

implementation

uses UnitDmdados, UnitLocImovel, unitLocPes, unitLocFornec;

{$R *.dfm}

procedure TFrmCadImovel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= Cafree;
end;

procedure TFrmCadImovel.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadImovel.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmCadImovel.dbNumImovEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbNumImovExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If dbNumImov.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o N�MERO DO IM�VEL');
      dbNumImov.SetFocus;
      End
    Else
      (Sender as TDBEdit).color:=clWindow;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmCadImovel.cmbTipoOpEnter(Sender: TObject);
begin
(Sender as TDBComboBox).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.cmbTipoOpExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If NovoItem Then
    Begin
    If cmbTipoOp.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar TIPO DE OPERA��O');
      cmbTipoOp.SetFocus;
      End
    Else
      Begin
      Flag:=True;
      For x:=0 to cmbTipoOp.Items.Count-1 Do
        If cmbTipoOp.Text=cmbTipoOp.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor'+' '+cmbTipoOp.Text+' '+'inv�lido');
        cmbTipoOp.SetFocus;
        End
      Else
        (Sender as TDBComboBox).color:=clWindow;
      End;
    End
  Else
    (Sender as TDBComboBox).color:=clWindow;
end;

procedure TFrmCadImovel.dbValorEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.cmbLkTipoImovEnter(Sender: TObject);
begin
(Sender as TRxDBLookupCombo).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbPropEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbPropExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmCadImovel.dbCadPrefEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbCadPrefExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmCadImovel.dbEscrEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbEscrExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmCadImovel.dbAreaTerEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbAreaTerExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmCadImovel.dbAreaConstEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbAreaConstExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmCadImovel.cmbOpEnter(Sender: TObject);
begin
(Sender as TDBComboBox).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.cmbOpExit(Sender: TObject);
begin
(Sender as TDBComboBox).color:=clwindow;
end;

procedure TFrmCadImovel.dbValorOpEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbValorOpExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=clwindow;
pgcimovel.ActivePage:=pgloc;
pgdados.Caption:='LOCALIZA��O';
end;

procedure TFrmCadImovel.dbEndEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbNumEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbNumExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If dbNum.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o N�MERO');
      dbNum.SetFocus;
      End
    Else
      (Sender as TDBEdit).color:=clWindow;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmCadImovel.dbComplEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbBairroEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbBairroExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If dbBairro.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o BAIRRO');
      dbBairro.SetFocus;
      End
    Else
      (Sender as TDBEdit).color:=clWindow;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmCadImovel.dbCepEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbCepExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If dbCep.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o CEP');
      dbCep.SetFocus;
      End
    Else
      (Sender as TDBEdit).color:=clWindow;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmCadImovel.dbUfEnter(Sender: TObject);
begin
(Sender as TDBComboBox).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbUfExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
 Flag:=True;
 For x:=0 to DBuf.Items.Count-1 Do
 If DBuf.Text=DBuf.Items[x] Then
    Flag:=False;
    If Flag Then
        Begin
        ShowMessage('Valor ESTADO inv�lido');
        DBuf.SetFocus;
        End
      Else
        (Sender as TDBComboBox).color:=clWindow;
      
End;

procedure TFrmCadImovel.dbCidadeEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbCidadeExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If dbCidade.Text= '' then
      Begin
      ShowMessage('� obrigat�rio a CIDADE');
      dbCidade.SetFocus;
      End
    Else
      (Sender as TDBEdit).color:=clWindow;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmCadImovel.dbMemoRefEnter(Sender: TObject);
begin
(Sender as TDBmemo).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbMemoRefExit(Sender: TObject);
begin
(Sender as TDBMemo).color:=clwindow;
pgcimovel.ActivePage:=pgdesc;
pgdados.Caption:='DESCRI��O';
end;

procedure TFrmCadImovel.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.TbCadImovel.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
end;

procedure TFrmCadImovel.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.TbCadImovel.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.TbCadImovel.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
end;

procedure TFrmCadImovel.BtnProximoClick(Sender: TObject);
begin
  dmdados.TbCadImovel.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.TbCadIMovel.Eof Then
  Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
  End;
end;

procedure TFrmCadImovel.BtnUltimoClick(Sender: TObject);
begin
  dmdados.TbCadImovel.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
end;

procedure TFrmCadImovel.BtnNovoClick(Sender: TObject);
begin
 NovoItem:=True;
 DMDados.tbCadImovel.Append;
 pgloc.PageVisible:=false;
 pgdesc.PageVisible:=false;
 pgoutro.PageVisible:=false;
 {habilitando os bot�es}
 BtnGravar.Enabled:= True;
 BtnCancelar.Enabled := True;
 BtnAlterar.Enabled:=False;
 BtnDeletar.Enabled:=False;
 BtnNovo.Enabled:=False;
 BtnLocalizar.Enabled:=False;
{habilitando os componentes}
 DbNumImov.Enabled:= True;
 cmbTipoOp.Enabled:= True;
 dbValor.Enabled:= True;
 LOOkTipoImov.Enabled:= True;
 dbCodProp.Enabled:= True;
 dbProp.Enabled:= True;
 dbCadPref.Enabled:= True;
 dbEscr.Enabled:= True;
 dbAreaTer.Enabled:= True;
 dbAreaConst.Enabled:= True;
 cmbOp.Enabled:= True;
 dbValorOp.Enabled:= True;
 dbDataCad.Enabled:= True;
 dbEnd.Enabled:= True;
 dbNum.Enabled:= True;
 dbCompl.Enabled:= True;
 dbBairro.Enabled:= True;
 dbCep.Enabled:= True;
 dbUF.Enabled:= True;
 dbCidade.Enabled:= True;
 dbMemoRef.Enabled:= True;
 dbDorm.Enabled:= True;
 dbBanheiro.Enabled:= True;
 dbLavabo.Enabled:= True;
 dbHall.Enabled:= True;
 dbEsc.Enabled:= True;
 dbSuite.Enabled:= True;
 dbSalaTV.Enabled:= True;
 dbLiving.Enabled:= True;
 dbSalaJan.Enabled:= True;
 dbCopa.Enabled:= True;
 dbCozinha.Enabled:= True;
 dbAreaServ.Enabled:= True;
 dbDisp.Enabled:= True;
 dbGarag.Enabled:= True;
 dbDormEmp.Enabled:= True;
 dbBanhEmp.Enabled:= True;
 dbRancho.Enabled:= True;
 dbPisc.Enabled:= True;
 dbObs.Enabled:= True;
 DbNumImov.SetFocus;

end;

procedure TFrmCadImovel.BtnCancelarClick(Sender: TObject);
begin
NovoItem:=False;
dmdados.tbCadImovel.cancel;
{Desabilitando os bot�es}
BtnCancelar.Enabled := false;
BtnAlterar.Enabled:=True;
BtnDeletar.Enabled:=True;
BtnNovo.Enabled:=True;
BtnLocalizar.Enabled:=True;
{desabilitando os componentes}
DbNumImov.Enabled:= False;
cmbTipoOp.Enabled:= False;
dbValor.Enabled:= False;
LOOkTipoImov.Enabled:= False;
dbCodProp.Enabled:= False;
dbProp.Enabled:= False;
dbCadPref.Enabled:= False;
dbEscr.Enabled:= False;
dbAreaTer.Enabled:= False;
dbAreaConst.Enabled:= False;
cmbOp.Enabled:= False;
dbValorOp.Enabled:= False;
dbDataCad.Enabled:= False;
dbEnd.Enabled:= False;
dbNum.Enabled:= False;
dbCompl.Enabled:= False;
dbBairro.Enabled:= False;
dbCep.Enabled:= False;
dbUF.Enabled:= False;
dbCidade.Enabled:= False;
dbMemoRef.Enabled:= False;
dbDorm.Enabled:= False;
dbBanheiro.Enabled:= False;
dbLavabo.Enabled:= False;
dbHall.Enabled:= False;
dbEsc.Enabled:= False;
dbSuite.Enabled:= False;
dbSalaTV.Enabled:= False;
dbLiving.Enabled:= False;
dbSalaJan.Enabled:= False;
dbCopa.Enabled:= False;
dbCozinha.Enabled:= False;
dbAreaServ.Enabled:= False;
dbDisp.Enabled:= False;
dbGarag.Enabled:= False;
dbDormEmp.Enabled:= False;
dbBanhEmp.Enabled:= False;
dbRancho.Enabled:= False;
dbPisc.Enabled:= False;
dbObs.Enabled:= False;
SpeedBar1.SetFocus;
end;

procedure TFrmCadImovel.BtnAlterarClick(Sender: TObject);
begin
novoitem:=true;
dmdados.tbCadImovel.Edit;
{habilitando os componentes}
btncancelar.Enabled:=true;
btngravar.Enabled:=true;
btnnovo.Enabled:=false;
btnprimeiro.Enabled:=false;
btnanterior.Enabled:=false;
btnproximo.Enabled:=false;
btnultimo.Enabled:=false;

DbNumImov.Enabled:= True;
cmbTipoOp.Enabled:= True;
dbValor.Enabled:= True;
LOOkTipoImov.Enabled:= True;
dbCodProp.Enabled:= True;
dbProp.Enabled:= True;
dbCadPref.Enabled:= True;
dbEscr.Enabled:= True;
dbAreaTer.Enabled:= True;
dbAreaConst.Enabled:= True;
cmbOp.Enabled:= True;
dbValorOp.Enabled:= True;
dbDataCad.Enabled:= True;
dbEnd.Enabled:= True;
dbNum.Enabled:= True;
dbCompl.Enabled:= True;
dbBairro.Enabled:= True;
dbCep.Enabled:= True;
dbUF.Enabled:= True;
dbCidade.Enabled:= True;
dbMemoRef.Enabled:= True;
dbDorm.Enabled:= True;
dbBanheiro.Enabled:= True;
dbLavabo.Enabled:= True;
dbHall.Enabled:= True;
dbEsc.Enabled:= True;
dbSuite.Enabled:= True;
dbSalaTV.Enabled:= True;
dbLiving.Enabled:= True;
dbSalaJan.Enabled:= True;
dbCopa.Enabled:= True;
dbCozinha.Enabled:= True;
dbAreaServ.Enabled:= True;
dbDisp.Enabled:= True;
dbGarag.Enabled:= True;
dbDormEmp.Enabled:= True;
dbBanhEmp.Enabled:= True;
dbRancho.Enabled:= True;
dbPisc.Enabled:= True;
dbObs.Enabled:= True;
DbNumImov.SetFocus;

end;

procedure TFrmCadImovel.BtnDeletarClick(Sender: TObject);
begin
NovoItem:=False;
if dmdados.tbCadImovel.RecordCount=0 then
begin
ShowMessage('Tabela sem registro');
end
else
If application.MessageBox('Tem certeza que deseja exluir esse registro?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
   dmdados.tbCadImovel.Delete
   else
   dmdados.TbCadImovel.Cancel;
end;

procedure TFrmCadImovel.BtnLocalizarClick(Sender: TObject);
begin
FrmLocImov:=TFrmLocImov.create(application);
FrmLocImov.Showmodal;
end;

procedure TFrmCadImovel.dbPiscExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00D1DED9;
pgcimovel.ActivePage:=pgoutro;
PGDADOS.Caption:='OUTROS DETALHES';
end;

procedure TFrmCadImovel.btnLocPropClick(Sender: TObject);
begin
If (dmdados.TbCadImovel.State=dsinsert)or (dmdados.TbCadImovel.State=dsedit) Then
  Begin
    frmLocFornec:=tfrmLocFornec.create(application);
    frmLocFornec.showmodal;
    dbcodprop.text:=IntToStr(frmLocFornec.resultado);
    frmLocFornec.Free;
  end;
end;

procedure TFrmCadImovel.dbEndExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If dbEnd.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o ENDERE�O');
      dbEnd.SetFocus;
      End
    Else
      (Sender as TDBEdit).color:=clWindow;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmCadImovel.BtnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
  Tabela: TTable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbCadImovel.DatabaseName;
  Tabela.TableName := dmDados.tbCadImovel.TableName;
  Tabela.Open;

  If dbCodProp.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
      Campos:=Campos+'C�d.Propriet�rio';
      Gravar:=False;
      Vazio:=True;
    end;

  if dbvalor.Text= '' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
      Campos:=Campos+'Valor';
      Gravar:=False;
      Vazio:=True;
    End;

  If dbend.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
      Campos:=Campos+'Endere�o';
      Gravar:=False;
      Vazio:=True;
    end;

  If dbNum.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
      Campos:=Campos+'N�MERO';
      Gravar:=False;
      Vazio:=True;
    end;

  If dbbAIRRO.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
      Campos:=Campos+'BAIRRO';
      Gravar:=False;
      Vazio:=True;
    end;

  If dbCEP.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
      Campos:=Campos+'CEP';
      Gravar:=False;
      Vazio:=True;
    end;

  If dbCIDADE.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
      Campos:=Campos+'Cidade';
      Gravar:=False;
      Vazio:=True;
    end;

  If Gravar Then
    Begin
    DMDados.TbCadImovel.Post;
    NovoItem:=False;
    BtnGravar.Enabled:=False;
    BtnCancelar.Enabled:=False;
    BtnNovo.Enabled:=True;
    BtnPrimeiro.Enabled:=True;
    BtnAnterior.Enabled:=True;
    BtnProximo.Enabled:=True;
    BtnUltimo.Enabled:=True;
    BtnAlterar.Enabled:=True;
    Btndeletar.Enabled:=True;
    BtnLocalizar.Enabled:=True;
    SpeedBar1.SetFocus;
    {desabilitando os componentes}
    DbNumImov.Enabled:= False;
    cmbTipoOp.Enabled:= False;
    dbValor.Enabled:= False;
    LOOkTipoImov.Enabled:= False;
    dbCodProp.Enabled:= False;
    dbProp.Enabled:= False;
    dbCadPref.Enabled:= False;
    dbEscr.Enabled:= False;
    dbAreaTer.Enabled:= False;
    dbAreaConst.Enabled:= False;
    cmbOp.Enabled:= False;
    dbValorOp.Enabled:= False;
    dbDataCad.Enabled:= False;
    dbEnd.Enabled:= False;
    dbNum.Enabled:= False;
    dbCompl.Enabled:= False;
    dbBairro.Enabled:= False;
    dbCep.Enabled:= False;
    dbUF.Enabled:= False;
    dbCidade.Enabled:= False;
    dbMemoRef.Enabled:= False;
    dbDorm.Enabled:= False;
    dbBanheiro.Enabled:= False;
    dbLavabo.Enabled:= False;
    dbHall.Enabled:= False;
    dbEsc.Enabled:= False;
    dbSuite.Enabled:= False;
    dbSalaTV.Enabled:= False;
    dbLiving.Enabled:= False;
    dbSalaJan.Enabled:= False;
    dbCopa.Enabled:= False;
    dbCozinha.Enabled:= False;
    dbAreaServ.Enabled:= False;
    dbDisp.Enabled:= False;
    dbGarag.Enabled:= False;
    dbDormEmp.Enabled:= False;
    dbBanhEmp.Enabled:= False;
    dbRancho.Enabled:= False;
    dbPisc.Enabled:= False;
    dbObs.Enabled:= False;
    ShowMessage ('Dados gravados com sucesso!');
    End
      Else
        Begin
          If Vazio Then
            ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
             pgcimovel.ActivePage:=pgdados;
             dbNumImov.SetFocus;
        end;
pgloc.PageVisible:=TRUE;
pgdesc.PageVisible:=TRUE;
pgoutro.PageVisible:=TRUE;

end;

procedure TFrmCadImovel.dbValorExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If dbvalor.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Valor Im�vel');
      dbvalor.SetFocus;
      End
    Else
      (Sender as TRxDBCalcEdit).color:=clWindow;
    End
  Else
    (Sender as TRxDBCalcEdit).color:=clWindow;
end;

procedure TFrmCadImovel.dbCodPropExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If dbCodProp.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o C�DIGO');
      dbCodProp.SetFocus;
      End
    Else
      If Not(dmDados.tbfornecedor.Locate('CodFor',dbCodProp.Text,[])) Then
        Begin
        Showmessage('C�DIGO n�o Cadastrado');
        dbCodProp.SetFocus;
        End
      Else
        (Sender as TDBEdit).color:=clWindow;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;

end;

procedure TFrmCadImovel.dbObsExit(Sender: TObject);
begin
pgcimovel.ActivePage:=pgdados;
pgdados.Caption:='Dados Gerais';
end;

procedure TFrmCadImovel.dbComplExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmCadImovel.dbDormEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbBanheiroEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbLavaboEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbHallEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbEscEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbSuiteEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbSalaTVEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbLivingEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbSalaJanEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbCopaEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbCozinhaEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbAreaServEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbDispEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbGaragEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbDormEmpEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbBanhEmpEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbRanchoEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbPiscEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.dbDormExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00D1DED9;
end;

procedure TFrmCadImovel.dbBanheiroExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00D1DED9;
end;

procedure TFrmCadImovel.dbLavaboExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00D1DED9;
end;

procedure TFrmCadImovel.dbHallExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00D1DED9;
end;

procedure TFrmCadImovel.dbEscExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00D1DED9;
end;

procedure TFrmCadImovel.dbSuiteExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00D1DED9;
end;

procedure TFrmCadImovel.dbSalaTVExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00D1DED9;
end;

procedure TFrmCadImovel.dbLivingExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00D1DED9;
end;

procedure TFrmCadImovel.dbSalaJanExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00D1DED9;
end;

procedure TFrmCadImovel.dbCopaExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00D1DED9;
end;

procedure TFrmCadImovel.dbCozinhaExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00D1DED9;
end;

procedure TFrmCadImovel.dbAreaServExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00D1DED9;
end;

procedure TFrmCadImovel.dbDispExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00D1DED9;
end;

procedure TFrmCadImovel.dbGaragExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00D1DED9;
end;

procedure TFrmCadImovel.dbDormEmpExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00D1DED9;
end;

procedure TFrmCadImovel.dbBanhEmpExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00D1DED9;
end;

procedure TFrmCadImovel.dbRanchoExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00D1DED9;
end;

procedure TFrmCadImovel.lookTipoImovExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If looktipoImov.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar TIPO DE IM�VEL');
      looktipoImov.SetFocus;
      End;
    END;
end;

procedure TFrmCadImovel.dbCodPropEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImovel.lookTipoImovEnter(Sender: TObject);
begin
(Sender as TRxDBLookupCombo).color:=$00d2e2ff;
end;

end.
