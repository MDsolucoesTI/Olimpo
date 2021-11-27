//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, RxMenus, StdCtrls, ImgList, ComCtrls, ToolWin, ExtCtrls, jpeg,
  SRLabel, LMDGraphicControl, LMDScrollText, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDCustomLabelFill,
  LMDLabelFill, XPMenu, ShellApi, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint, EHintBal, EAppProt, EFocCol, RXCtrls,
  DB, DBTables, EPaswd, ECripto, EMsgDlg, EUserAcs;

type
  TFrmPrincipal = class(TForm)
    ControlBar1: TControlBar;
    StandardToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    Sair1: TMenuItem;
    Financeiro1: TMenuItem;
    ContasaReceber1: TMenuItem;
    Relatrio1: TMenuItem;
    Configuraes1: TMenuItem;
    Gerais1: TMenuItem;
    Ajuda1: TMenuItem;
    MenuItem5: TMenuItem;
    EnviesuaDvidapeloEmail1: TMenuItem;
    SobreoTritonLigth1: TMenuItem;
    ImageList2: TImageList;
    Clientes1: TMenuItem;
    CentrodeCusto1: TMenuItem;
    Histrico1: TMenuItem;
    ipoDocumento1: TMenuItem;
    Bancos1: TMenuItem;
    Cliente1: TMenuItem;
    Fornecedor2: TMenuItem;
    Receber2: TMenuItem;
    PopRelatorio: TPopupMenu;
    PopAjuda: TPopupMenu;
    Cliente2: TMenuItem;
    Fornecedor1: TMenuItem;
    ContasaReceber2: TMenuItem;
    Ajuda2: TMenuItem;
    EnviesuaDvidapeloEmail2: TMenuItem;
    SobreoTriton1: TMenuItem;
    ContaCorrente1: TMenuItem;
    ContasaPagar1: TMenuItem;
    Lanamento1: TMenuItem;
    BaixaemLOte1: TMenuItem;
    Lanamento2: TMenuItem;
    BaixaemLote2: TMenuItem;
    Caixa1: TMenuItem;
    Lanamento3: TMenuItem;
    Fechamento1: TMenuItem;
    BalanoFinanceiro1: TMenuItem;
    N3: TMenuItem;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    BalanoFinanceiro2: TMenuItem;
    PopCadastro: TPopupMenu;
    Cliente3: TMenuItem;
    Pagar1: TMenuItem;
    EvAppProtect1: TEvAppProtect;
    Fornecedor3: TMenuItem;
    ImageList1: TImageList;
    Fornecedor4: TMenuItem;
    EvFocusColor1: TEvFocusColor;
    SaldoseExtratos1: TMenuItem;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    EvHintBalloon1: TEvHintBalloon;
    XPMenu1: TXPMenu;
    ContasaPagar2: TMenuItem;
    SaldoseExtratos2: TMenuItem;
    Boleto1: TMenuItem;
    BBV1: TMenuItem;
    BancoReal1: TMenuItem;
    AquivoBB1: TMenuItem;
    dsSenha: TDataSource;
    tbSenha: TTable;
    EvPassword1: TEvPassword;
    tbSenhaUsuario: TStringField;
    tbSenhaSenha: TStringField;
    EvCripto: TEvCriptografa;
    Senhas1: TMenuItem;
    LMDLabelFill3: TLMDLabelFill;
    LMDLabelFill2: TLMDLabelFill;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    CancelamentodeContas1: TMenuItem;
    CancelamentodeContas2: TMenuItem;
    CartesConvnios1: TMenuItem;
    MsgDlg: TEvMsgDlg;
    UserAcess: TEvUserAccess;
    tbSenhaTipoAcesso: TStringField;
    tbSenhaCodFunc: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure Lanamento1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure StatusTeclas(vAcao:boolean;vTeclas:string);
    procedure Clientes1Click(Sender: TObject);
    procedure CentrodeCusto1Click(Sender: TObject);
    procedure Histrico1Click(Sender: TObject);
    procedure ipoDocumento1Click(Sender: TObject);
    procedure Bancos1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Fornecedor2Click(Sender: TObject);
    procedure Receber2Click(Sender: TObject);
    procedure Gerais1Click(Sender: TObject);
    procedure EnviesuaDvidapeloEmail1Click(Sender: TObject);
    procedure SobreoTritonLigth1Click(Sender: TObject);
    procedure Fornecedor3Click(Sender: TObject);
    procedure ContaCorrente1Click(Sender: TObject);
    procedure Lanamento2Click(Sender: TObject);
    procedure Lanamento3Click(Sender: TObject);
    procedure BaixaemLOte1Click(Sender: TObject);
    procedure BaixaemLote2Click(Sender: TObject);
    procedure Fechamento1Click(Sender: TObject);
    procedure BalanoFinanceiro1Click(Sender: TObject);
    procedure Pagar1Click(Sender: TObject);
    procedure SaldoseExtratos1Click(Sender: TObject);
    procedure Cliente3Click(Sender: TObject);
    procedure Fornecedor4Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure Cliente2Click(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    procedure ContasaReceber2Click(Sender: TObject);
    procedure ContasaPagar2Click(Sender: TObject);
    procedure BalanoFinanceiro2Click(Sender: TObject);
    procedure SaldoseExtratos2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure EvPassword1Validate(Sender: TObject; UserName,
      Password: String; var Valid: Boolean);
    procedure EvPassword1Error(Sender: TObject; Error: TEvPasswordError);
    procedure EvPassword1BeforeInput(Sender: TObject);
    procedure EvPassword1AfterInput(Sender: TObject);
    procedure Senhas1Click(Sender: TObject);
    procedure CartesConvnios1Click(Sender: TObject);
    procedure CancelamentodeContas1Click(Sender: TObject);
    procedure CancelamentodeContas2Click(Sender: TObject);
  private
    { Private declarations }
    fAcesso : integer;
    fUser : string;
  public
    { Public declarations }
    property Acesso : integer read fAcesso write fAcesso;
    property User : string read fUser write fUser;
  end;

var
  FrmPrincipal : TFrmPrincipal;
  ListaTeclas : String;
  PilhaTeclas : array[1..10] of string;
  Topo : integer;
  Acao:boolean;

implementation

uses unitDmDados, unitCadCcusto, UnitHistorico, UnitCadBancos, UnitCadTipoDoc,
     unitCcorrente, unitCreceber, unitBaixaLoteCR, unitCpagar, UnitBaixaLoteCP,
     UnitMovCaixa, UnitFechCaixa, UnitRelFornec, unitParametro, UnitRelCliente,
     UnitRelCReceber, UnitRelMovConta, unitRelCpagar, unitBalFin, UnitSobre,
     Unitbolbbv, UnitCadSenha, UnitCadFornec, UnitCadCliente, UnitFechCC,
     UnitCadCartao, UnitCancelCR, UnitCancelCP;

{$R *.DFM}

procedure TfrmPrincipal.StatusTeclas(vAcao:boolean;vTeclas:string);
begin
  if vAcao then
    begin
    Topo:=Topo + 1;
    if Topo > 0 Then
      PilhaTeclas[Topo]:=StatusBar1.Panels[0].Text;
    StatusBar1.Panels[0].Text:=vTeclas;
    end
  else
    begin
    StatusBar1.Panels[0].Text:=PilhaTeclas[Topo];
    Topo:=Topo-1;
    end;
end;

procedure TFrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= Cafree;
end;

procedure TFrmPrincipal.Sair1Click(Sender: TObject);
begin
	Close;
end;

procedure TFrmPrincipal.Lanamento1Click(Sender: TObject);
begin
  try
    begin
    frmCPagar.show;
    if FrmCReceber.WindowState=wsMinimized then
      FrmCReceber.WindowState:=wsNormal;
    end;
  except
    begin
    FrmCReceber:=TFrmCReceber.create(application);
    FrmCReceber.show;
    end;
  end;
end;

procedure TFrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmDados.HabilitaTeclado then
    case (key) of
      // Teclas de navega��o
      VK_F1     : ToolButton5.Click;
      VK_F2     : ToolButton1.CheckMenuDropdown;
      VK_F3     : ToolButton8.Click;
      VK_F4     : ToolButton9.Click;
      VK_F5     : ToolButton10.CheckMenuDropdown;
      VK_F6     : ToolButton3.Click;
      VK_ESCAPE : Close;
    end;
end;


procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  Topo:= -1;
  ListaTeclas:='[F1] Ajuda [F2] Cadastros [F3] Contas a Receber [F4] Contas a Pagar [F5] Relat�rios [F6] Par�metros [ESC] Sai';
  StatusTeclas(True,ListaTeclas);
  if tbSenha.RecordCount=1 then  //obriga o cadastro de senha no 1� uso
    begin
    frmCadSenha:=tfrmCadSenha.create(application);
    frmCadSenha.showModal;
    end;
  evPassword1.Execute;
end;

procedure TFrmPrincipal.Clientes1Click(Sender: TObject);
begin
  try
    begin
    frmCadCliente.show;
    if frmCadCliente.WindowState=wsMinimized then
      frmCadCliente.WindowState:=wsNormal;
    end;
  except
    begin
    frmCadCliente:=tfrmCadCliente.create(application);
    frmCadCliente.show;
    end;
  end;
end;

procedure TFrmPrincipal.CentrodeCusto1Click(Sender: TObject);
begin
  frmCCusto:=tfrmCCusto.create(application);
  frmCCusto.showmodal;
end;

procedure TFrmPrincipal.Histrico1Click(Sender: TObject);
begin
  frmHistorico:=tfrmhistorico.create(application);
  frmHistorico.showmodal;
end;

procedure TFrmPrincipal.ipoDocumento1Click(Sender: TObject);
begin
  frmTipoDoc:=tfrmTipoDoc.create(application);
  frmTipoDoc.showmodal;
end;

procedure TFrmPrincipal.Bancos1Click(Sender: TObject);
begin
  frmCadBancos:=tfrmCadBancos.create(application);
  frmCadBancos.showmodal;
end;


procedure TFrmPrincipal.Cliente1Click(Sender: TObject);
begin
  frmRelCliente:=tfrmRelCliente.create(application);
  frmRelCliente.showmodal;
end;

procedure TFrmPrincipal.Fornecedor2Click(Sender: TObject);
begin
  frmRelFornec:=tfrmRelFornec.create(application);
  frmRelFornec.showmodal;
end;

procedure TFrmPrincipal.Receber2Click(Sender: TObject);
begin
  frmRelCReceber:=tfrmRelCReceber.create(application);
  frmRelCReceber.showmodal;
end;

procedure TFrmPrincipal.Gerais1Click(Sender: TObject);
begin
  frmParametro:=tfrmParametro.create(application);
  frmParametro.showmodal;
end;

procedure TFrmPrincipal.EnviesuaDvidapeloEmail1Click(Sender: TObject);
var
  url : string;
begin
  url :='mailto:suportephoenix@terra.com.br';
  shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;

procedure TFrmPrincipal.SobreoTritonLigth1Click(Sender: TObject);
begin
  frmSobre:=tfrmSobre.create(application);
  frmSobre.showmodal;
end;

procedure TFrmPrincipal.Fornecedor3Click(Sender: TObject);
begin
  try
    begin
    FrmCadFornec.show;
    if FrmCadFornec.WindowState=wsMinimized then
      FrmCadFornec.WindowState:=wsNormal;
    end;
  except
    begin
    FrmCadFornec:=tFrmCadFornec.create(application);
    FrmCadFornec.show;
    end;
  end;
end;


procedure TFrmPrincipal.ContaCorrente1Click(Sender: TObject);
begin
  frmCCorrente:=tfrmCCorrente.create(application);
  frmCCorrente.showmodal;
end;

procedure TFrmPrincipal.Lanamento2Click(Sender: TObject);
begin
  try
    begin
    frmCPagar.show;
    if frmCPagar.WindowState=wsMinimized then
      frmCPagar.WindowState:=wsNormal;
    end;
  except
    begin
    frmCPagar:=tfrmCPagar.create(application);
    frmCPagar.show;
    end;
  end;
end;

procedure TFrmPrincipal.Lanamento3Click(Sender: TObject);
begin
  try
    begin
    frmMovCaixa.show;
    if frmMovCaixa.WindowState=wsMinimized then
      frmMovCaixa.WindowState:=wsNormal;
    end;
  except
    begin
    frmMovCaixa:=tfrmMovCaixa.create(application);
    frmMovCaixa.show;
    end;
  end;
end;

procedure TFrmPrincipal.BaixaemLOte1Click(Sender: TObject);
begin
  try
    begin
    frmBaixaLoteCR.show;
    if frmBaixaLoteCR.WindowState=wsMinimized then
      frmBaixaLoteCR.WindowState:=wsNormal;
    end;
  except
    begin
    frmBaixaLoteCR:=tfrmBaixaLoteCR.create(application);
    frmBaixaLoteCR.show;
    end;
  end;
end;

procedure TFrmPrincipal.BaixaemLote2Click(Sender: TObject);
begin
  try
    begin
    frmBaixaLoteCP.show;
    if frmBaixaLoteCP.WindowState=wsMinimized then
      frmBaixaLoteCP.WindowState:=wsNormal;
    end;
  except
    begin
    frmBaixaLoteCP:=tfrmBaixaLoteCP.create(application);
    frmBaixaLoteCP.show;
    end;
  end;
end;

procedure TFrmPrincipal.Fechamento1Click(Sender: TObject);
begin
  frmFechCC:=tfrmFechCC.create(application);
  frmFechCC.showmodal;
end;

procedure TFrmPrincipal.BalanoFinanceiro1Click(Sender: TObject);
begin
  frmBalFin:=tfrmbalFin.create(application);
  frmBalFin.showmodal;
end;

procedure TFrmPrincipal.Pagar1Click(Sender: TObject);
begin
  frmRelCpagar:=tfrmRelCpagar.create(application);
  frmRelCpagar.showmodal;
end;

procedure TFrmPrincipal.SaldoseExtratos1Click(Sender: TObject);
begin
  frmRelMovConta:=tfrmRelMovConta.create(application);
  frmRelMovConta.showmodal;
end;

procedure TFrmPrincipal.Cliente3Click(Sender: TObject);
begin
  frmCadCliente:=tfrmCadCliente.create(application);
  frmCadCliente.showmodal;
end;

procedure TFrmPrincipal.Fornecedor4Click(Sender: TObject);
begin
  frmCadFornec:=tfrmCadFornec.create(application);
  frmCadFornec.showmodal;
end;

procedure TFrmPrincipal.ToolButton8Click(Sender: TObject);
begin
  FrmCreceber:=TFrmCReceber.Create(Application);
  FrmCReceber.showmodal;
end;

procedure TFrmPrincipal.ToolButton9Click(Sender: TObject);
begin
  frmCPagar:=tfrmCPagar.create(application);
  frmCPagar.showmodal;
end;

procedure TFrmPrincipal.Cliente2Click(Sender: TObject);
begin
  frmRelCliente:=tfrmRelCliente.create(application);
  frmRelCliente.showmodal;
end;

procedure TFrmPrincipal.Fornecedor1Click(Sender: TObject);
begin
  frmRelFornec:=tfrmRelFornec.create(application);
  frmRelFornec.showmodal;
end;

procedure TFrmPrincipal.ContasaReceber2Click(Sender: TObject);
begin
  frmRelCReceber:=tfrmRelCReceber.create(application);
  frmRelCReceber.showmodal;
end;

procedure TFrmPrincipal.ContasaPagar2Click(Sender: TObject);
begin
  frmRelCpagar:=tfrmRelCpagar.create(application);
  frmRelCpagar.showmodal;
end;

procedure TFrmPrincipal.BalanoFinanceiro2Click(Sender: TObject);
begin
  frmBalFin:=tfrmbalFin.create(application);
  frmBalFin.showmodal;
end;

procedure TFrmPrincipal.SaldoseExtratos2Click(Sender: TObject);
begin
  frmRelMovConta:=tfrmRelMovConta.create(application);
  frmRelMovConta.showmodal;
end;

procedure TFrmPrincipal.ToolButton3Click(Sender: TObject);
begin
  frmParametro:=tfrmParametro.create(application);
  frmParametro.showmodal;
end;

procedure TFrmPrincipal.EvPassword1Validate(Sender: TObject; UserName,
  Password: String; var Valid: Boolean);
begin
  if tbSenha.FindKey([username]) then
    begin
    Valid := EvCripto.CriptoBinToText(tbSenhaSenha.Value) = Password;
    Acesso:=StrtoInt(tbSenhaTipoAcesso.Value);
    User:=tbSenhaUsuario.Value;
    end
  else
    MsgDlg.MsgWarning('O nome de usu�rio e senha informado n�o s�o v�lidos.');
end;

procedure TFrmPrincipal.EvPassword1Error(Sender: TObject;
  Error: TEvPasswordError);
begin
  MsgDlg.MsgError('O usu�rio atual n�o pode ser confirmado. A aplica��o ser� terminada.');
  Application.Terminate;
end;

procedure TFrmPrincipal.EvPassword1BeforeInput(Sender: TObject);
begin
  tbSenha.Open;
end;

procedure TFrmPrincipal.EvPassword1AfterInput(Sender: TObject);
begin
  tbSenha.Close;
end;

procedure TFrmPrincipal.Senhas1Click(Sender: TObject);
begin
  frmCadSenha:=tfrmCadSenha.create(application);
  frmCadSenha.showModal;
end;

procedure TFrmPrincipal.CartesConvnios1Click(Sender: TObject);
begin
  FrmCadCartao:=TFrmCadCartao.create(application);
  FrmCadCartao.showModal;
end;

procedure TFrmPrincipal.CancelamentodeContas1Click(Sender: TObject);
begin
  FrmCancelCR:=TFrmCancelCR.create(application);
  FrmCancelCR.showModal;
end;

procedure TFrmPrincipal.CancelamentodeContas2Click(Sender: TObject);
begin
  FrmCancelCP:=TFrmCancelCP.create(application);
  FrmCancelCP.showModal;
end;

end.
