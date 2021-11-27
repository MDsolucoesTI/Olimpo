//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2002
// Sistema...........: Ceres - Controle de Cheques
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitLibCredito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ToolEdit, CurrEdit, RXDBCtrl, Mask, Spin, fcButton,
  fcImgBtn, ExtCtrls, RackCtls, RXSplit, SpeedBar, jpeg, RXCtrls, ComCtrls,
  Buttons, SRColBtn, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  LMDShapeHint, EFocCol, TFlatSplitterUnit, RxGrdCpt, fcImager, EMsgDlg;

type
  TFrmLibCred = class(TForm)
    RxLabel4: TRxLabel;
    Panel1: TPanel;
    lbUltCompra: TRxLabel;
    dbUltCompra: TDBDateEdit;
    lbrenda: TRxLabel;
    dbrenda: TRxDBCalcEdit;
    lblimite: TRxLabel;
    dblimite: TRxDBCalcEdit;
    dbrestricao: TDBEdit;
    lbrestricao: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    lbBancos: TRxLabel;
    dbBanco1: TDBEdit;
    lbpessoas: TRxLabel;
    lbnome: TRxLabel;
    dbnome1: TDBEdit;
    dbnome2: TDBEdit;
    dbBanco2: TDBEdit;
    RxLabel11: TRxLabel;
    lbempresa: TRxLabel;
    dbEmpresa: TDBEdit;
    dbCargo: TDBEdit;
    lbcargo: TRxLabel;
    lbtel: TRxLabel;
    dbTel: TDBEdit;
    Panel2: TPanel;
    RxLabel15: TRxLabel;
    Image1: TImage;
    Panel3: TPanel;
    btnCancelar: TfcImageBtn;
    btnAlterar: TfcImageBtn;
    btnSair: TfcImageBtn;
    btnNovo: TfcImageBtn;
    btnGravar: TfcImageBtn;
    FlatSplitter1: TFlatSplitter;
    FlatSplitter2: TFlatSplitter;
    FlatSplitter3: TFlatSplitter;
    FlatSplitter4: TFlatSplitter;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    RxGradientCaption1: TRxGradientCaption;
    RxLabel3: TRxLabel;
    FlatSplitter5: TFlatSplitter;
    dbPai: TDBEdit;
    dbMae: TDBEdit;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    Image9: TImage;
    RxLabel7: TRxLabel;
    RxLabel8: TRxLabel;
    MsgDlg: TEvMsgDlg;
    fcImager2: TfcImager;
    fcImager1: TfcImager;
    fcImager3: TfcImager;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbrendaExit(Sender: TObject);
    procedure dblimiteExit(Sender: TObject);
    procedure dbTelExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblimiteEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLibCred: TFrmLibCred;
  NovoItem : Boolean;

implementation

uses unitDmdados, UnitPrincipal, UnitCadCliente;

{$R *.DFM}

procedure TFrmLibCred.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLibCred.BtnGravarClick(Sender: TObject);
var
  Campos:String;
  Vazio,Gravar:Boolean;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  If dbrenda.Value = 0 then
    begin
    if Length(Campos)>0 then
    	Campos:=Campos+', ';
    Campos:=Campos+'Renda Mensal';
    Gravar:=False;
    Vazio:=True;
    end;
  if dblimite.Value= 0 then
    begin
    if Length(Campos)>0 then
    	Campos:=Campos+', ';
    Campos:=Campos+'Limite de Cr�dito';
    Gravar:=False;
    Vazio:=True;
    end;
  if Gravar then
    begin
    dmdados.tbLibCredito.Post;
    NovoItem:=False;
    BtnGravar.enabled := False;
    BtnCancelar.Enabled := False;
    BtnNovo.Enabled:=True;
    BtnAlterar.Enabled:=True;
    {desabilitar os componentes}
    dbUltCompra.Enabled:=false;
    dbrenda.Enabled:=false;
    dbLimite.Enabled:=false;
    dbrestricao.Enabled:=false;
    dbPai.Enabled:=False;
    dbMae.Enabled:=False;
    dbBanco1.Enabled:=false;
    dbBanco2.Enabled:=false;
    dbNome1.Enabled:=false;
    dbNome2.Enabled:=false;
    dbEmpresa.Enabled:=false;
    dbCargo.Enabled:=false;
    dbtel.Enabled:=false;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    Panel3.SetFocus;
    dmDados.vTabStt:=true;
    End
  else
    begin
    if Vazio then
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbUltCompra.SetFocus;
    end;
end;

procedure TFrmLibCred.BtnCancelarClick(Sender: TObject);
begin
  NovoItem:=False;
  dmdados.tblibcredito.cancel;
  BtnGravar.enabled := False;
  BtnCancelar.Enabled := False;
  BtnNovo.Enabled:=True;
  BtnAlterar.Enabled:=True;
  dbUltCompra.Enabled:=false;
  dbrenda.Enabled:=false;
  dbLimite.Enabled:=false;
  dbrestricao.Enabled:=false;
  dbPai.Enabled:=False;
  dbMae.Enabled:=False;
  dbBanco1.Enabled:=false;
  dbBanco2.Enabled:=false;
  dbNome1.Enabled:=false;
  dbNome2.Enabled:=false;
  dbEmpresa.Enabled:=false;
  dbCargo.Enabled:=false;
  dbtel.Enabled:=false;
  dmDados.vTabStt:=true;
  Panel3.SetFocus;
end;

procedure TFrmLibCred.BtnAlterarClick(Sender: TObject);
begin
  NovoItem:=True;
  dmdados.tbLibCredito.edit;
  BtnGravar.Enabled := true;
  BtnCancelar.Enabled:=true;
  BtnNovo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  dbUltCompra.Enabled:=true;
  dbrenda.Enabled:=true;
  dbLimite.Enabled:=true;
  dbrestricao.Enabled:=true;
  dbPai.Enabled:=True;
  dbMae.Enabled:=True;
  dbBanco1.Enabled:=true;
  dbBanco2.Enabled:=true;
  dbNome1.Enabled:=true;
  dbNome2.Enabled:=true;
  dbEmpresa.Enabled:=true;
  dbCargo.Enabled:=true;
  dbtel.Enabled:=true;
  dmDados.vTabStt:=false;
  dbUltCompra.SetFocus;
end;

procedure TFrmLibCred.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmLibCred.dbrendaExit(Sender: TObject);
var
  limite : real;
begin
  If NovoItem Then
    If dbrenda.Value = 0 then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio a RENDA MENSAL');
      dbrenda.SetFocus;
      End
    Else
      begin
      limite:=dmdados.TbParametroCredRenda.Value;
      dmdados.tbLibCreditoLimite.AsCurrency:=(dmdados.tbLibCreditoRenda.value*(limite/100));
      end;
end;

procedure TFrmLibCred.dblimiteExit(Sender: TObject);
begin
  If NovoItem Then
    If dblimite.Value= 0 then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o LIMITE DE CR�DITO');
      dblimite.SetFocus;
      End
end;

procedure TFrmLibCred.dbTelExit(Sender: TObject);
begin
  Panel3.SetFocus;
end;

procedure TFrmLibCred.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  frmCadCliente.visible:=true;
  action:=cafree;
end;

procedure TFrmLibCred.btnNovoClick(Sender: TObject);
begin
  if dmDados.tbLibCredito.RecordCount<>0 then
    MsgDlg.MsgError('Informa��es de Cr�dito j� cadastrado.|S� � permitido altera��es')
  else
    begin
    dmdados.tbLibCredito.append;
    NovoItem:=True;
    dmdados.tbLibCreditoRestricao.Value:='Nada Consta';
    dbUltCompra.Enabled:=true;
    dbrenda.Enabled:=true;
    dbLimite.Enabled:=true;
    dbPai.Enabled:=True;
    dbMae.Enabled:=True;
    dbBanco1.Enabled:=true;
    dbBanco2.Enabled:=true;
    dbNome1.Enabled:=true;
    dbNome2.Enabled:=true;
    dbEmpresa.Enabled:=true;
    dbCargo.Enabled:=true;
    dbtel.Enabled:=true;
    dbUltCompra.SetFocus;
    BtnGravar.Enabled := true;
    BtnCancelar.Enabled:=true;
    BtnNovo.Enabled:=False;
    BtnAlterar.Enabled:=False;
    dmDados.vTabStt:=false;
    end;
end;

procedure TFrmLibCred.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_INSERT : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_HOME   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_END    : if not(dmDados.vTabStt) then BtnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
    end;
end;

procedure TFrmLibCred.btnDeletarClick(Sender: TObject);
begin
  if dmdados.tbLibCredito.RecordCount=0 then
    MsgDlg.MsgError('Tabela sem registro')
  else
      If application.MessageBox('Tem certeza que deseja excluir este registro?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
        dmdados.TbLibCredito.Delete
end;

procedure TFrmLibCred.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Esc] Cancelar ou Sair');
  dmDados.vTabStt:=True;
end;

procedure TFrmLibCred.dblimiteEnter(Sender: TObject);
begin
  dblimite.Value:=dbrenda.Value*(dmDados.TbParametroCredRenda.Value/100);
end;

end.
