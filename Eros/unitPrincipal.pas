//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Tela Principal - Menu
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
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
  LMDCustomShapeHint, LMDShapeHint, EHintBal, EAppProt,
  LMDCustomGraphicLabel, LMDGraphicLabel, RXCtrls, EFocCol, DB, DBTables,
  EPaswd, ECripto, Mask, ToolEdit, EMsgDlg, EUserAcs, WinSkinStore,
  WinSkinData;

type
  TFrmPrincipal = class(TForm)
    ControlBar1: TControlBar;
    StandardToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    ToolButton10: TToolButton;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    N2: TMenuItem;
    Sair1: TMenuItem;
    Relatrio1: TMenuItem;
    Configuraes1: TMenuItem;
    Gerais1: TMenuItem;
    Ajuda1: TMenuItem;           
    MenuItem5: TMenuItem;
    EnviesuaDvidapeloEmail1: TMenuItem;
    ImageList2: TImageList;
    Clientes1: TMenuItem;
    Pedidos2: TMenuItem;
    EfetuarPedido1: TMenuItem;
    Cliente1: TMenuItem;
    Pedido2: TMenuItem;
    PopRelatorio: TPopupMenu;
    PopAjuda: TPopupMenu;
    Cliente2: TMenuItem;
    Pedidos1: TMenuItem;
    Ajuda2: TMenuItem;
    EnviesuaDvidapeloEmail2: TMenuItem;
    Oramento1: TMenuItem;
    Funcionrio2: TMenuItem;
    Cargo1: TMenuItem;
    Cadastro1: TMenuItem;
    AtualizaodeSalrio1: TMenuItem;
    ComissoporProduto1: TMenuItem;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    PopCadastro: TPopupMenu;
    Cliente3: TMenuItem;
    Funcionrios1: TMenuItem;
    NotaFiscal1: TMenuItem;
    EvHintBalloon1: TEvHintBalloon;
    EvAppProtect1: TEvAppProtect;
    NotaFiscal2: TMenuItem;
    ImageList1: TImageList;
    Funcionrio1: TMenuItem;
    SobreoEROS1: TMenuItem;
    SobreoEROS2: TMenuItem;
    EvFocusColor1: TEvFocusColor;
    Funcionrio3: TMenuItem;
    Produtos1: TMenuItem;
    G1: TMenuItem;
    Subgrupo1: TMenuItem;
    Unidade1: TMenuItem;
    Marca1: TMenuItem;
    Materiais1: TMenuItem;
    ICMS1: TMenuItem;
    EvPassword1: TEvPassword;
    Table1: TTable;
    Table1Senha: TStringField;
    DataSource1: TDataSource;
    C1: TMenuItem;
    evCripto: TEvCriptografa;
    NotaFiscalServ1: TMenuItem;
    Vendas2: TMenuItem;
    Servios1: TMenuItem;
    VendasServios1: TMenuItem;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    PlanosdePagamentos1: TMenuItem;
    ConsultadePreos1: TMenuItem;
    MudarOperador1: TMenuItem;
    MsgDlg: TEvMsgDlg;
    Table1Usuario: TStringField;
    Table1TipoAcesso: TStringField;
    UserAcess: TEvUserAccess;
    Table1CodFunc: TIntegerField;
    ToolButton6: TToolButton;
    CancelarVendas1: TMenuItem;
    Faturamento1: TMenuItem;
    sd1: TSkinData;
    Opd1: TOpenDialog;
    MudarAparncia1: TMenuItem;
    Caixa2: TMenuItem;
    AberturadeCaixa1: TMenuItem;
    MovimentoCaixa1: TMenuItem;
    FechamentodeCaixa1: TMenuItem;
    PopupCaixa: TPopupMenu;
    AberturadeCaixa2: TMenuItem;
    MovimentoCaixa2: TMenuItem;
    FechamentodeCaixa2: TMenuItem;
    Entrad1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure Cargo1Click(Sender: TObject);
    procedure AtualizarSalrio1Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure StatusTeclas(vAcao:boolean;vTeclas:string);
    procedure Clientes1Click(Sender: TObject);
    procedure Cadastro3Click(Sender: TObject);
    procedure AtualizaodeSalrio1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Gerais1Click(Sender: TObject);
    procedure EnviesuaDvidapeloEmail1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure Cadastro1Click(Sender: TObject);
    procedure Oramento1Click(Sender: TObject);
    procedure Pedido2Click(Sender: TObject);
    procedure NotaFiscal1Click(Sender: TObject);
    procedure Cliente3Click(Sender: TObject);
    procedure Funcionrios1Click(Sender: TObject);
    procedure EfetuarPedido2Click(Sender: TObject);
    procedure Oramento2Click(Sender: TObject);
    procedure Cliente2Click(Sender: TObject);
    procedure NotaFiscal2Click(Sender: TObject);
    procedure SobreoEROS2Click(Sender: TObject);
    procedure SobreoEROS1Click(Sender: TObject);
    procedure ComissoporProduto1Click(Sender: TObject);
    procedure Funcionrio1Click(Sender: TObject);
    procedure Funcionrio3Click(Sender: TObject);
    procedure G1Click(Sender: TObject);
    procedure Subgrupo1Click(Sender: TObject);
    procedure Unidade1Click(Sender: TObject);
    procedure Marca1Click(Sender: TObject);
    procedure Materiais1Click(Sender: TObject);
    procedure ICMS1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure EvPassword1Error(Sender: TObject; Error: TEvPasswordError);
    procedure EvPassword1BeforeInput(Sender: TObject);
    procedure EvPassword1Validate(Sender: TObject; UserName,
      Password: String; var Valid: Boolean);
    procedure EvPassword1AfterInput(Sender: TObject);
    procedure EnviesuaDvidapeloEmail2Click(Sender: TObject);
    procedure Vendas2Click(Sender: TObject);
    procedure Servios1Click(Sender: TObject);
    procedure VendasServios1Click(Sender: TObject);
    procedure PlanosdePagamentos1Click(Sender: TObject);
    procedure ConsultadePreos1Click(Sender: TObject);
    procedure MudarOperador1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EfetuarPedido1Click(Sender: TObject);
    procedure CancelarVendas1Click(Sender: TObject);
    procedure Faturamento1Click(Sender: TObject);
    procedure MudarAparncia1Click(Sender: TObject);
    procedure AberturadeCaixa1Click(Sender: TObject);
    procedure AberturadeCaixa2Click(Sender: TObject);
    procedure MovimentoCaixa1Click(Sender: TObject);
    procedure FechamentodeCaixa1Click(Sender: TObject);
    procedure Entrad1Click(Sender: TObject);
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

uses unitdmdados, UnitCargos, UnitAtSalario, unitFunc, UnitSobre, UnitProduto,
  UnitVendas, unitOrcamento, unitEmitirNF, UnitRelCliente, unitParametro,
  unitRelPedidos, UnitRelFunc, UnitCadGrupo, UnitCadSubgrupo, UnitCadUnidade,
  UnitCadMarca, unitCadMaterial, UnitCadSenha, UnitCadCliente, UniCadICMS,
  unitPreco, UnitCadPlanos, UnitConsPlano, unitCancelVenda, unitRelFatura,
  UnitAbreCx, UnitLanCaixa, UnitFechCaixa, UnitEntMat;

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

procedure TFrmPrincipal.Sair2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.Cargo1Click(Sender: TObject);
begin
  FrmCargos:=TFrmCargos.create(application);
  FrmCargos.Showmodal;
end;

procedure TFrmPrincipal.AtualizarSalrio1Click(Sender: TObject);
begin
  FrmAtualSalario:=TFrmAtualSalario.create(application);
  FrmAtualSalario.Showmodal;
end;

procedure TFrmPrincipal.Pedidos1Click(Sender: TObject);
begin
  FrmRelPedidos:=TFrmRelPedidos.create(application);
  FrmRelPedidos.Showmodal;
end;

procedure TFrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmDados.HabilitaTeclado then
    case (key) of
      // Teclas de navega��o
      VK_F2   : ToolButton1.CheckMenuDropdown;
      VK_F3   : ToolButton4.Click;
      VK_F4   : ToolButton10.CheckMenuDropdown;
      VK_F5   : ToolButton3.Click;
      VK_F6   : ToolButton5.Click;

      VK_ESCAPE : close;
    end;
end;


procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  Topo:= -1;
  ListaTeclas:='[F2] Cadastros [F3] Pedidos [F4] Relat�rios [F5] Par�metros do Sistema [F6] Ajuda [ESC] Sai';
  StatusTeclas(True,ListaTeclas);
  if table1.RecordCount=0 then  //obriga o cadastro de senha no 1� uso
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
    frmCadCliente.showmodal;
    end;
  end;
end;

procedure TFrmPrincipal.Cadastro3Click(Sender: TObject);
begin
  frmFuncionario:=tfrmFuncionario.create(application);
  frmFuncionario.showmodal;
end;

procedure TFrmPrincipal.AtualizaodeSalrio1Click(Sender: TObject);
begin
  frmAtualSalario:=tfrmAtualSalario.create(application);
  frmAtualSalario.showmodal;
end;

procedure TFrmPrincipal.Cliente1Click(Sender: TObject);
begin
  frmRelCliente:=tfrmRelCliente.create(application);
  frmRelCliente.showmodal;
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
  url :='mailto:suporte@gensysinfo.com.br';
  shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;

procedure TFrmPrincipal.ToolButton3Click(Sender: TObject);
begin
  frmParametro:=tfrmParametro.create(application);
  frmParametro.showmodal;
end;

procedure TFrmPrincipal.ToolButton4Click(Sender: TObject);
begin
  try
    begin
    frmVendas.show;
    if frmVendas.WindowState=wsMinimized then
      frmVendas.WindowState:=wsNormal;
    end;
  except
    begin
    frmVendas:=tfrmVendas.Create(application);
    frmVendas.Show;
    end;
  end;
end;

procedure TFrmPrincipal.Cadastro1Click(Sender: TObject);
begin
  try
    begin
    frmFuncionario.show;
    if frmFuncionario.WindowState=wsMinimized then
      frmFuncionario.WindowState:=wsNormal;
    end;
  except
    begin
    frmFuncionario:=tfrmFuncionario.create(application);
    frmFuncionario.show;
    end;
  end;
end;

procedure TFrmPrincipal.Oramento1Click(Sender: TObject);
begin
  frmOrcamento:=tfrmOrcamento.create(application);
  frmOrcamento.ShowModal;
end;

procedure TFrmPrincipal.Pedido2Click(Sender: TObject);
begin
  frmRelPedidos:=tfrmRelPedidos.create(application);
  frmRelPedidos.showmodal;
end;

procedure TFrmPrincipal.NotaFiscal1Click(Sender: TObject);
begin
  frmEmitirNF:=tfrmEmitirNF.create(application);
  frmEmitirNF.showmodal;
end;

procedure TFrmPrincipal.Cliente3Click(Sender: TObject);
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

procedure TFrmPrincipal.Funcionrios1Click(Sender: TObject);
begin
  try
    begin
    frmFuncionario.show;
    if frmFuncionario.WindowState=wsMinimized then
      frmFuncionario.WindowState:=wsNormal;
    end;
  except
    begin
    frmFuncionario:=tfrmFuncionario.create(application);
    frmFuncionario.show;
    end;
  end;
end;

procedure TFrmPrincipal.EfetuarPedido2Click(Sender: TObject);
begin
  frmVendas:=tfrmVendas.Create(application);
  frmVendas.ShowModal;
end;

procedure TFrmPrincipal.Oramento2Click(Sender: TObject);
begin
  frmOrcamento:=tfrmOrcamento.create(application);
  frmOrcamento.showModal;
end;

procedure TFrmPrincipal.Cliente2Click(Sender: TObject);
begin
  frmRelCliente:=tfrmRelCliente.create(application);
  frmRelCliente.showmodal;
end;

procedure TFrmPrincipal.NotaFiscal2Click(Sender: TObject);
begin
  frmEmitirNF:=tfrmEmitirNF.create(application);
  frmEmitirNF.showmodal;
end;

procedure TFrmPrincipal.SobreoEROS2Click(Sender: TObject);
begin
  FrmSobre:= TFrmSobre.create(application);
  FrmSobre.Showmodal;
end;

procedure TFrmPrincipal.SobreoEROS1Click(Sender: TObject);
begin
  FrmSobre:= TFrmSobre.create(application);
  FrmSobre.Showmodal;
end;

procedure TFrmPrincipal.ComissoporProduto1Click(Sender: TObject);
begin
  FrmProduto:= TFrmproduto.create(application);
  Frmproduto.Showmodal;
end;

procedure TFrmPrincipal.Funcionrio1Click(Sender: TObject);
begin
  frmRelfunc:=tfrmRelFunc.create(application);
  frmRelFunc.showmodal;
end;

procedure TFrmPrincipal.Funcionrio3Click(Sender: TObject);
begin
  frmRelFunc:=tfrmRelFunc.create(application);
  frmRelFunc.showmodal;
end;

procedure TFrmPrincipal.G1Click(Sender: TObject);
begin
  frmCadgrupo:=tfrmCadgrupo.create(application);
  frmCadgrupo.showmodal;
end;


procedure TFrmPrincipal.Subgrupo1Click(Sender: TObject);
begin
  frmCadsubgrupo:=tfrmCadsubgrupo.create(application);
  frmCadsubgrupo.showmodal;
end;

procedure TFrmPrincipal.Unidade1Click(Sender: TObject);
begin
  frmCadunidades:=tfrmCadunidades.create(application);
  frmCadunidades.showmodal;
end;

procedure TFrmPrincipal.Marca1Click(Sender: TObject);
begin
  frmCadmarca:=tfrmCadmarca.create(application);
  frmCadmarca.showmodal;
end;

procedure TFrmPrincipal.Materiais1Click(Sender: TObject);
begin
  try
    begin
    frmCadmaterial.show;
    if frmCadmaterial.WindowState=wsMinimized then
      frmCadmaterial.WindowState:=wsNormal;
    end;
  except
    begin
    frmCadmaterial:=tfrmCadmaterial.create(application);
    frmCadmaterial.show;
    end;
  end;
end;

procedure TFrmPrincipal.ICMS1Click(Sender: TObject);
begin
  frmCadicms:=tfrmCadicms.create(application);
  frmCadicms.showmodal;
end;

procedure TFrmPrincipal.C1Click(Sender: TObject);
begin
  frmCadSenha:=tfrmCadSenha.create(application);
  frmCadSenha.showModal;
end;

procedure TFrmPrincipal.EvPassword1Error(Sender: TObject;
  Error: TEvPasswordError);
begin
  MsgDlg.MsgWarning('O usu�rio atual n�o pode ser confirmado.|A aplica��o ser� terminada.');
  Application.Terminate;
end;

procedure TFrmPrincipal.EvPassword1BeforeInput(Sender: TObject);
begin
  table1.Open;
end;

procedure TFrmPrincipal.EvPassword1Validate(Sender: TObject; UserName,
  Password: String; var Valid: Boolean);
begin
  if Table1.FindKey([username]) then
    begin
    Valid := EvCripto.CriptoBinToText(Table1senha.AsString) = Password;
    Acesso:=1;
    //Acesso:=StrtoInt(Table1TipoAcesso.Value);
    //User:=Table1Usuario.Value;
    end
  else
    ShowMessage('O nome de usu�rio e senha informado n�o s�o v�lidos.');
end;

procedure TFrmPrincipal.EvPassword1AfterInput(Sender: TObject);
begin
  Table1.Close;
end;

procedure TFrmPrincipal.EnviesuaDvidapeloEmail2Click(Sender: TObject);
var
  url : string;
begin
  url :='mailto:gensysinfo_softwares@uol.com.br';
  shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;

procedure TFrmPrincipal.Vendas2Click(Sender: TObject);
begin
  frmEmitirNF:=tfrmEmitirNF.create(application);
  frmEmitirNF.showmodal;
end;

procedure TFrmPrincipal.Servios1Click(Sender: TObject);
begin
  //frmEmitirNFServ:=tfrmEmitirNFServ.create(application);
  //frmEmitirNFServ.showmodal;
end;

procedure TFrmPrincipal.VendasServios1Click(Sender: TObject);
begin
  frmEmitirNF:=tfrmEmitirNF.create(application);
  frmEmitirNF.showmodal;
end;

procedure TFrmPrincipal.PlanosdePagamentos1Click(Sender: TObject);
begin
  FrmCadPlanos:=TFrmCadPlanos.Create(application);
  FrmCadPlanos.Showmodal;
end;

procedure TFrmPrincipal.ConsultadePreos1Click(Sender: TObject);
begin
  FrmLocPreco:=TFrmLocPreco.Create(application);
  FrmLocPreco.Showmodal;
end;

procedure TFrmPrincipal.MudarOperador1Click(Sender: TObject);
begin
  EvPassword1.Execute;
  UserAcess.UserID:=frmPrincipal.Acesso;
  UserAcess.ForceDefinitions;
end;

procedure TFrmPrincipal.FormActivate(Sender: TObject);
begin
  UserAcess.UserID:=frmPrincipal.Acesso;
  UserAcess.ForceDefinitions;
end;

procedure TFrmPrincipal.EfetuarPedido1Click(Sender: TObject);
begin
  try
    begin
    frmVendas.show;
    if frmVendas.WindowState=wsMinimized then
      frmVendas.WindowState:=wsNormal;
    end;
  except
    begin
    frmVendas:=tfrmVendas.Create(application);
    frmVendas.Show;
    end;
  end;
end;

procedure TFrmPrincipal.CancelarVendas1Click(Sender: TObject);
begin
  FrmCancelVenda:=TFrmCancelVenda.Create(application);
  FrmCancelVenda.Showmodal;
end;

procedure TFrmPrincipal.Faturamento1Click(Sender: TObject);
begin
  FrmRelFatura:=TFrmRelFatura.Create(application);
  FrmRelFatura.Showmodal;
end;

procedure TFrmPrincipal.MudarAparncia1Click(Sender: TObject);
begin
  opd1.InitialDir:='..\skins';//ExtractFilePath(ParamStr(0));
  opd1.Filter:= 'Text files (*.skn)|*.skn';
  if opd1.Execute then begin
     sd1.SkinFile:=opd1.FileName;
  end;
end;

procedure TFrmPrincipal.AberturadeCaixa1Click(Sender: TObject);
begin
	FrmAbreCx := TFrmAbreCx.Create(Application);
  FrmAbreCx.Showmodal;
end;

procedure TFrmPrincipal.AberturadeCaixa2Click(Sender: TObject);
begin
	FrmAbreCx := TFrmAbreCx.Create(Application);
  FrmAbreCx.Showmodal;
end;

procedure TFrmPrincipal.MovimentoCaixa1Click(Sender: TObject);
begin
  FrmLanCaixa := TFrmLanCaixa.Create(Application);
  FrmLanCaixa.Showmodal;
end;

procedure TFrmPrincipal.FechamentodeCaixa1Click(Sender: TObject);
begin
	FrmFechCaixa := TFrmFechCaixa.Create(Application);
	FrmFechCaixa.Showmodal;
end;

procedure TFrmPrincipal.Entrad1Click(Sender: TObject);
begin
  FrmEntrMat := TFrmEntrMat.Create(Application);
  FrmEntrMat.ShowModal;
end;

end.
