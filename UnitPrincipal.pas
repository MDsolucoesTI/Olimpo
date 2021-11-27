//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, fcOutlookList, fcButton, fcImgBtn, fcShapeBtn,
  ExtCtrls, fcClearPanel, fcButtonGroup, fcOutlookBar, EHintBal, ComCtrls,
  EStBar, EGrad, DCStdCtrls, Menus, jpeg, LMDControl, LMDBaseControl,
  LMDBaseGraphicButton, LMDCustomShapeButton, LMDShapeButton,
  LMDCustomMMButton, LMDMMButton, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDCustomPanelFill,
  LMDButtonPanel, OvalBtn, TFlatButtonUnit, EAppProt, ToolWin, EFocCol,
  XPMenu, RxMenus, ShellApi, DB, ECripto, DBTables, EUserAcs, EMsgDlg,
  EPaswd;

type
  TFrmPrincipal = class(TForm)
    EvAppProtect1: TEvAppProtect;
    MainMenu1: TMainMenu;
    Clientes1: TMenuItem;
    N1: TMenuItem;
    Bancos1: TMenuItem;
    N2: TMenuItem;
    Sair1: TMenuItem;
    Cheques1: TMenuItem;
    Lanamento4: TMenuItem;
    Baixa1: TMenuItem;
    ChequesemFundos1: TMenuItem;
    Renegociarcheque1: TMenuItem;
    ConsultarCPFCNPJ1: TMenuItem;
    Relatrios1: TMenuItem;
    ChequesemAberto1: TMenuItem;
    ChequesemAbertoporCliente1: TMenuItem;
    ChequesDevolvidos1: TMenuItem;
    ChequesDevolvidosporCliente1: TMenuItem;
    Configuraes1: TMenuItem;
    Gerais1: TMenuItem;
    Senhas1: TMenuItem;
    Ajuda1: TMenuItem;
    MenuItem5: TMenuItem;
    EnviesuaDvidapeloEmail1: TMenuItem;
    XPMenu1: TXPMenu;
    EvFocusColor1: TEvFocusColor;
    ControlBar1: TControlBar;
    StandardToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton8: TToolButton;
    ToolButton7: TToolButton;
    ToolButton3: TToolButton;
    Utilitrios1: TMenuItem;
    Calculadora1: TMenuItem;
    AgendaTelefnica1: TMenuItem;
    AlterarSenhadoUsurio1: TMenuItem;
    InformaesdoSistema1: TMenuItem;
    EditordeTexto1: TMenuItem;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    SobreoOlimpo1: TMenuItem;
    StatusBar1: TStatusBar;
    Fornecedor1: TMenuItem;
    Funcionrios1: TMenuItem;
    Cargo1: TMenuItem;
    Cadastro1: TMenuItem;
    AtualizaodeSalrio1: TMenuItem;
    ComissoporProduto1: TMenuItem;
    PlanosdePagamento1: TMenuItem;
    Produtos1: TMenuItem;
    ICMS1: TMenuItem;
    Grupo1: TMenuItem;
    SubGRupo1: TMenuItem;
    Unidade1: TMenuItem;
    Marca1: TMenuItem;
    Materiais1: TMenuItem;
    Vendas1: TMenuItem;
    Cadastros1: TMenuItem;
    Estoque1: TMenuItem;
    Financeiro1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Caixa1: TMenuItem;
    EfetuarVendas1: TMenuItem;
    Oramento1: TMenuItem;
    ConsultadePreos1: TMenuItem;
    CancelarVendas1: TMenuItem;
    Clientes2: TMenuItem;
    Funcionrios2: TMenuItem;
    Pedidos2: TMenuItem;
    NotaFiscal1: TMenuItem;
    NotaFiscaldeServios1: TMenuItem;
    NotaFiscalnica1: TMenuItem;
    Vendas3: TMenuItem;
    Servios1: TMenuItem;
    VendasServios1: TMenuItem;
    Compras1: TMenuItem;
    EntradadeProsutos1: TMenuItem;
    SadadeProdutos1: TMenuItem;
    Fornecedor2: TMenuItem;
    Estoque2: TMenuItem;
    Compra1: TMenuItem;
    Etiqueta1: TMenuItem;
    Mercadoria1: TMenuItem;
    PorFornecedorePorPerodo1: TMenuItem;
    CentrodeCusto1: TMenuItem;
    Histrico1: TMenuItem;
    TipodeDocumento1: TMenuItem;
    CartesConvnios1: TMenuItem;
    ContaCorrente1: TMenuItem;
    ContasaReceber1: TMenuItem;
    ContasaPagar1: TMenuItem;
    CaixaBanco1: TMenuItem;
    Lanamento1: TMenuItem;
    BaixaemLotes1: TMenuItem;
    CancelamentodeContas1: TMenuItem;
    Lanamento2: TMenuItem;
    BaixaemLote1: TMenuItem;
    CanelamentodeContas1: TMenuItem;
    Lanamento3: TMenuItem;
    Fechamento1: TMenuItem;
    N3: TMenuItem;
    ContasaPagar2: TMenuItem;
    ContasaReceber2: TMenuItem;
    BalanoFinanceiro1: TMenuItem;
    SaldoseExtratos1: TMenuItem;
    Boletos1: TMenuItem;
    BBV1: TMenuItem;
    BancoReal1: TMenuItem;
    ArquivoparaBB1: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N6: TMenuItem;
    ImageList2: TImageList;
    ToolButton5: TToolButton;
    N9: TMenuItem;
    ToolButton6: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    PopupMenu1: TPopupMenu;
    Clientes3: TMenuItem;
    Fornecedores1: TMenuItem;
    Funcionrios3: TMenuItem;
    PopupMenu2: TPopupMenu;
    Clientes4: TMenuItem;
    Fornecedor3: TMenuItem;
    Funcionrios4: TMenuItem;
    N10: TMenuItem;
    Pedidos3: TMenuItem;
    NotaFiscal2: TMenuItem;
    Faturamento1: TMenuItem;
    NotaFiscalnica2: TMenuItem;
    VendasServios2: TMenuItem;
    Servios2: TMenuItem;
    Vendas2: TMenuItem;
    N11: TMenuItem;
    ChequesemAberto2: TMenuItem;
    ChequesemAbertoporCliente2: TMenuItem;
    ChequesDevolvidos2: TMenuItem;
    ChequesDevolvidosporCliente2: TMenuItem;
    N12: TMenuItem;
    ContasaPagar3: TMenuItem;
    ContasaReceber3: TMenuItem;
    BalanoFinanceiro2: TMenuItem;
    SaldoseExtratos2: TMenuItem;
    Boletos2: TMenuItem;
    ArquivoparaBB2: TMenuItem;
    BancoReal2: TMenuItem;
    BBV2: TMenuItem;
    N13: TMenuItem;
    Estoque3: TMenuItem;
    Compra2: TMenuItem;
    PorFornecedorePorPerodo2: TMenuItem;
    Mercadoria2: TMenuItem;
    Etiqueta2: TMenuItem;
    Cheques2: TMenuItem;
    MsgDlg: TEvMsgDlg;
    UserAcess: TEvUserAccess;
    Table1: TTable;
    Table1Usuario: TStringField;
    Table1Senha: TStringField;
    Table1TipoAcesso: TStringField;
    Table1CodFunc: TIntegerField;
    evCripto: TEvCriptografa;
    DataSource1: TDataSource;
    EvHintBalloon1: TEvHintBalloon;
    EvPassword1: TEvPassword;
    MudarUsurio1: TMenuItem;
    procedure StatusTeclas(vAcao:boolean;vTeclas:string);
    procedure Clientes1Click(Sender: TObject);
    procedure Bancos1Click(Sender: TObject);
    procedure Lanamento4Click(Sender: TObject);
    procedure Baixa1Click(Sender: TObject);
    procedure ChequesemFundos1Click(Sender: TObject);
    procedure Renegociarcheque1Click(Sender: TObject);
    procedure ConsultarCPFCNPJ1Click(Sender: TObject);
    procedure ChequesemAberto1Click(Sender: TObject);
    procedure ChequesemAbertoporCliente1Click(Sender: TObject);
    procedure ChequesDevolvidos1Click(Sender: TObject);
    procedure ChequesDevolvidosporCliente1Click(Sender: TObject);
    procedure Gerais1Click(Sender: TObject);
    procedure Senhas1Click(Sender: TObject);
    procedure EnviesuaDvidapeloEmail1Click(Sender: TObject);
    procedure SobreoOlimpo1Click(Sender: TObject);
    procedure AtualizaodeSalrio1Click(Sender: TObject);
    procedure Cargo1Click(Sender: TObject);
    procedure Cadastro1Click(Sender: TObject);
    procedure Grupo1Click(Sender: TObject);
    procedure SubGRupo1Click(Sender: TObject);
    procedure Unidade1Click(Sender: TObject);
    procedure Marca1Click(Sender: TObject);
    procedure Materiais1Click(Sender: TObject);
    procedure ICMS1Click(Sender: TObject);
    procedure PlanosdePagamento1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure EfetuarVendas1Click(Sender: TObject);
    procedure Oramento1Click(Sender: TObject);
    procedure CancelarVendas1Click(Sender: TObject);
    procedure ComissoporProduto1Click(Sender: TObject);
    procedure ConsultadePreos1Click(Sender: TObject);
    procedure Compras1Click(Sender: TObject);
    procedure EntradadeProsutos1Click(Sender: TObject);
    procedure SadadeProdutos1Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure Fornecedor2Click(Sender: TObject);
    procedure Funcionrios2Click(Sender: TObject);
    procedure Pedidos2Click(Sender: TObject);
    procedure NotaFiscaldeServios1Click(Sender: TObject);
    procedure Estoque2Click(Sender: TObject);
    procedure Etiqueta1Click(Sender: TObject);
    procedure EvPassword1AfterInput(Sender: TObject);
    procedure EvPassword1BeforeInput(Sender: TObject);
    procedure EvPassword1Error(Sender: TObject; Error: TEvPasswordError);
    procedure EvPassword1Validate(Sender: TObject; UserName,
      Password: String; var Valid: Boolean);
    procedure MudarUsurio1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Fornecedor1Click(Sender: TObject);
    procedure CentrodeCusto1Click(Sender: TObject);
    procedure Histrico1Click(Sender: TObject);
    procedure TipodeDocumento1Click(Sender: TObject);
    procedure CartesConvnios1Click(Sender: TObject);
    procedure ContaCorrente1Click(Sender: TObject);
    procedure Lanamento1Click(Sender: TObject);
    procedure BaixaemLotes1Click(Sender: TObject);
    procedure CancelamentodeContas1Click(Sender: TObject);
    procedure Lanamento2Click(Sender: TObject);
    procedure BaixaemLote1Click(Sender: TObject);
    procedure CanelamentodeContas1Click(Sender: TObject);
    procedure Lanamento3Click(Sender: TObject);
    procedure Fechamento1Click(Sender: TObject);
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
  frmPrincipal : TfrmPrincipal;
  ListaTeclas : String;
  PilhaTeclas : array[1..10] of string;
  Topo : integer;
  Acao:boolean;

implementation

uses unitCadBancos, unitLanCheque, unitBaixaCheque, unitLanChequeSF, unitRenCheque, unitConsultaCPF,
     unitRelCheAberto, untRelCheAbreCli, untRelCheDev, untRelCheDevCli, UnitCadCliente, unitParametro,
     UnitCadSenha, UnitSobre, UnitAtSalario, UnitCargos, unitFunc, UnitCadGrupo, UnitCadSubgrupo,
     UnitCadUnidade, UnitCadMarca, unitCadMaterial, UnitConsPlano, UnitVendas, untOrca, unitCancelVenda,
     UnitProduto, unitPreco, UnitEntradaMat, UnitSaidaMat, UnitRelCliente, UnitRelFornec, UnitRelFunc,
     unitRelFatura, UnitRelEstoque, unitRelEtiqueta, UniCadICMS, unitCompras, unitRelPedidos, unitDmDados,
     UnitCadFornec, unitCadCcusto, UnitHistorico, unitCadTipoDoc, unitCcorrente, unitCreceber,
     UnitCancelCR, unitCpagar, UnitCancelCP, UnitMovCaixa, UnitFechCC, UnitCadCartao,
  unitSelecCR, UnitSelecCP;

{$R *.dfm}

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

procedure TFrmPrincipal.Bancos1Click(Sender: TObject);
begin
  try
    begin
    FrmCadBancos.show;
    if FrmCadBancos.WindowState=wsMinimized then
      FrmCadBancos.WindowState:=wsNormal;
    end;
  except
    begin
    FrmCadBancos:=TFrmCadBancos.create(application);
    FrmCadBancos.show;
    end;
  end;
end;

procedure TFrmPrincipal.Lanamento4Click(Sender: TObject);
begin
  try
    begin
    FrmLanCheque.show;
    if FrmLanCheque.WindowState=wsMinimized then
      FrmLanCheque.WindowState:=wsNormal;
    end;
  except
    begin
    FrmLanCheque:=TFrmLanCheque.Create(application);
    FrmLanCheque.Show;
    end;
  end;
end;

procedure TFrmPrincipal.Baixa1Click(Sender: TObject);
begin
  try
    begin
    FrmBaixaCheque.show;
    if FrmBaixaCheque.WindowState=wsMinimized then
      FrmBaixaCheque.WindowState:=wsNormal;
    end;
  except
    begin
    FrmBaixaCheque:=TFrmbaixaCheque.create(application);
    FrmBaixaCheque.Show;
    end;
  end;
end;

procedure TFrmPrincipal.ChequesemFundos1Click(Sender: TObject);
begin
  try
    begin
    FrmLanChequeSF.show;
    if FrmLanChequeSF.WindowState=wsMinimized then
      FrmLanChequeSF.WindowState:=wsNormal;
    end;
  except
    begin
    FrmLanChequeSF:=TFrmLanChequeSF.create(application);
    FrmLanChequeSF.Show;
    end;
  end;
end;

procedure TFrmPrincipal.Renegociarcheque1Click(Sender: TObject);
begin
  try
    begin
    FrmRengCheque.show;
    if FrmRengCheque.WindowState=wsMinimized then
      FrmRengCheque.WindowState:=wsNormal;
    end;
  except
    begin
    FrmRengCheque:=TFrmRengCheque.create(application);
    FrmRengCheque.Show;
    end;
  end;
end;

procedure TFrmPrincipal.ConsultarCPFCNPJ1Click(Sender: TObject);
begin
  try
    begin
    FrmConsultaCPF.show;
    if FrmConsultaCPF.WindowState=wsMinimized then
      FrmConsultaCPF.WindowState:=wsNormal;
    end;
  except
    begin
    FrmConsultaCPF:=TFrmConsultaCPF.create(application);
    FrmConsultaCPF.Show;
    end;
  end;
end;

procedure TFrmPrincipal.ChequesemAberto1Click(Sender: TObject);
begin
  FrmRelCheAberto:=TFrmRelCheAberto.create(application);
  FrmRelCheAberto.showModal;
end;

procedure TFrmPrincipal.ChequesemAbertoporCliente1Click(Sender: TObject);
begin
  FrmRelCheAbreCli:=TFrmRelCheAbreCli.create(application);
  FrmRelCheAbreCli.showModal;
end;

procedure TFrmPrincipal.ChequesDevolvidos1Click(Sender: TObject);
begin
  FrmRelCheDev:=TFrmRelCheDev.create(application);
  FrmRelCheDev.showModal;
end;

procedure TFrmPrincipal.ChequesDevolvidosporCliente1Click(Sender: TObject);
begin
  FrmRelCheDevCli:=TFrmRelCheDevCli.create(application);
  FrmRelCheDevCli.showModal;
end;

procedure TFrmPrincipal.Gerais1Click(Sender: TObject);
begin
  FrmParametro:=TFrmParametro.create(application);
  FrmParametro.showmodal;
end;

procedure TFrmPrincipal.Senhas1Click(Sender: TObject);
begin
  FrmCadSenha:=TFrmCadSenha.create(application);
  FrmCadSenha.showModal;
end;

procedure TFrmPrincipal.EnviesuaDvidapeloEmail1Click(Sender: TObject);
var
 url : string;
begin
url :='mailto:suporte@gensysinfo.com.br';
shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;

procedure TFrmPrincipal.SobreoOlimpo1Click(Sender: TObject);
begin
  FrmSobre:=TFrmSobre.create(application);
  FrmSobre.showmodal;
end;

procedure TFrmPrincipal.AtualizaodeSalrio1Click(Sender: TObject);
begin
  try
    begin
    FrmAtualSalario.show;
    if FrmAtualSalario.WindowState=wsMinimized then
      FrmAtualSalario.WindowState:=wsNormal;
    end;
  except
    begin
    FrmAtualSalario:=TFrmAtualSalario.create(application);
    FrmAtualSalario.show;
    end;
  end;
end;

procedure TFrmPrincipal.Cargo1Click(Sender: TObject);
begin
  try
    begin
    FrmCargos.show;
    if FrmCargos.WindowState=wsMinimized then
      FrmCargos.WindowState:=wsNormal;
    end;
  except
    begin
    FrmCargos:=TFrmCargos.create(application);
    FrmCargos.show;
    end;
  end;
end;

procedure TFrmPrincipal.Cadastro1Click(Sender: TObject);
begin
  try
    begin
    FrmFuncionario.show;
    if FrmFuncionario.WindowState=wsMinimized then
      FrmFuncionario.WindowState:=wsNormal;
    end;
  except
    begin
    FrmFuncionario:=TFrmFuncionario.create(application);
    FrmFuncionario.show;
    end;
  end;
end;

procedure TFrmPrincipal.Grupo1Click(Sender: TObject);
begin
  try
    begin
    FrmCadGrupo.show;
    if FrmCadGrupo.WindowState=wsMinimized then
      FrmCadGrupo.WindowState:=wsNormal;
    end;
  except
    begin
    FrmCadGrupo:=TFrmCadGrupo.create(application);
    FrmCadGrupo.show;
    end;
  end;
end;

procedure TFrmPrincipal.SubGRupo1Click(Sender: TObject);
begin
  try
    begin
    FrmCadSubGrupo.show;
    if FrmCadSubGrupo.WindowState=wsMinimized then
      FrmCadSubGrupo.WindowState:=wsNormal;
    end;
  except
    begin
    FrmCadSubGrupo:=TFrmCadSubGrupo.create(application);
    FrmCadSubGrupo.show;
    end;
  end;
end;

procedure TFrmPrincipal.Unidade1Click(Sender: TObject);
begin
  try
    begin
    FrmCadUnidades.show;
    if FrmCadUnidades.WindowState=wsMinimized then
      FrmCadUnidades.WindowState:=wsNormal;
    end;
  except
    begin
    FrmCadUnidades:=TFrmCadUnidades.create(application);
    FrmCadUnidades.show;
    end;
  end;
end;

procedure TFrmPrincipal.Marca1Click(Sender: TObject);
begin
  try
    begin
    FrmCadMarca.show;
    if FrmCadMarca.WindowState=wsMinimized then
      FrmCadMarca.WindowState:=wsNormal;
    end;
  except
    begin
    FrmCadMarca:=TFrmCadMarca.create(application);
    FrmCadMarca.show;
    end;
  end;
end;

procedure TFrmPrincipal.Materiais1Click(Sender: TObject);
begin
  try
    begin
    FrmCadMaterial.show;
    if FrmCadMaterial.WindowState=wsMinimized then
      FrmCadMaterial.WindowState:=wsNormal;
    end;
  except
    begin
    FrmCadMaterial:=TFrmCadMaterial.create(application);
    FrmCadMaterial.show;
    end;
  end;
end;

procedure TFrmPrincipal.ICMS1Click(Sender: TObject);
begin
  try
    begin
    FrmCadIcms.show;
    if FrmCadIcms.WindowState=wsMinimized then
      FrmCadIcms.WindowState:=wsNormal;
    end;
  except
    begin
    FrmCadIcms:=TFrmCadIcms.create(application);
    FrmCadIcms.show;
    end;
  end;
end;

procedure TFrmPrincipal.PlanosdePagamento1Click(Sender: TObject);
begin
  try
    begin
    FrmConsPlano.show;
    if FrmConsPlano.WindowState=wsMinimized then
      FrmConsPlano.WindowState:=wsNormal;
    end;
  except
    begin
    FrmConsPlano:=TFrmConsPlano.create(application);
    FrmConsPlano.show;
    end;
  end;
end;

procedure TFrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.EfetuarVendas1Click(Sender: TObject);
begin
  try
    begin
    FrmVendas.show;
    if FrmVendas.WindowState=wsMinimized then
      FrmVendas.WindowState:=wsNormal;
    end;
  except
    begin
    FrmVendas:=TFrmVendas.create(application);
    FrmVendas.show;
    end;
  end;
end;

procedure TFrmPrincipal.Oramento1Click(Sender: TObject);
begin
  try
    begin
    FrmOrca.show;
    if FrmOrca.WindowState=wsMinimized then
      FrmOrca.WindowState:=wsNormal;
    end;
  except
    begin
    FrmOrca:=TFrmOrca.create(application);
    FrmOrca.show;
    end;
  end;
end;

procedure TFrmPrincipal.CancelarVendas1Click(Sender: TObject);
begin
  try
    begin
    FrmCancelVenda.show;
    if FrmCancelVenda.WindowState=wsMinimized then
      FrmCancelVenda.WindowState:=wsNormal;
    end;
  except
    begin
    FrmCancelVenda:=TFrmCancelVenda.create(application);
    FrmCancelVenda.show;
    end;
  end;
end;

procedure TFrmPrincipal.ComissoporProduto1Click(Sender: TObject);
begin
  try
    begin
    FrmProduto.show;
    if FrmProduto.WindowState=wsMinimized then
      FrmProduto.WindowState:=wsNormal;
    end;
  except
    begin
    FrmProduto:=TFrmProduto.create(application);
    FrmProduto.show;
    end;
  end;
end;

procedure TFrmPrincipal.ConsultadePreos1Click(Sender: TObject);
begin
  try
    begin
    FrmLocPreco.show;
    if FrmLocPreco.WindowState=wsMinimized then
      FrmLocPreco.WindowState:=wsNormal;
    end;
  except
    begin
    FrmLocPreco:=TFrmLocPreco.create(application);
    FrmLocPreco.show;
    end;
  end;
end;

procedure TFrmPrincipal.Compras1Click(Sender: TObject);
begin
  try
    begin
    FrmCompras.show;
    if FrmCompras.WindowState=wsMinimized then
      FrmCompras.WindowState:=wsNormal;
    end;
  except
    begin
    FrmCompras:=TFrmCompras.create(application);
    FrmCompras.show;
    end;
  end;
end;

procedure TFrmPrincipal.EntradadeProsutos1Click(Sender: TObject);
begin
  try
    begin
    FrmEntradaMat.show;
    if FrmEntradaMat.WindowState=wsMinimized then
      FrmEntradaMat.WindowState:=wsNormal;
    end;
  except
    begin
    FrmEntradaMat:=TFrmEntradaMat.create(application);
    FrmEntradaMat.show;
    end;
  end;
end;

procedure TFrmPrincipal.SadadeProdutos1Click(Sender: TObject);
begin
  try
    begin
    FrmSaidaMat.show;
    if FrmSaidaMat.WindowState=wsMinimized then
      FrmSaidaMat.WindowState:=wsNormal;
    end;
  except
    begin
    FrmSaidaMat:=TFrmSaidaMat.create(application);
    FrmSaidaMat.show;
    end;
  end;
end;

procedure TFrmPrincipal.Clientes2Click(Sender: TObject);
begin
  FrmRelCliente:=TFrmRelCliente.create(application);
  FrmRelCliente.showmodal;
end;

procedure TFrmPrincipal.Fornecedor2Click(Sender: TObject);
begin
  FrmRelFornec:=TFrmRelFornec.create(application);
  FrmRelFornec.showmodal;
end;

procedure TFrmPrincipal.Funcionrios2Click(Sender: TObject);
begin
  FrmRelFunc:=TFrmRelFunc.create(application);
  FrmRelFunc.showmodal;
end;

procedure TFrmPrincipal.Pedidos2Click(Sender: TObject);
begin
  FrmRelPedidos:=TFrmRelPedidos.create(application);
  FrmRelPedidos.showmodal;
end;

procedure TFrmPrincipal.NotaFiscaldeServios1Click(Sender: TObject);
begin
  FrmRelFatura:=TFrmRelFatura.create(application);
  FrmRelFatura.showmodal;
end;

procedure TFrmPrincipal.Estoque2Click(Sender: TObject);
begin
  FrmRelEstoque:=TFrmRelEstoque.create(application);
  FrmRelEstoque.showmodal;
end;

procedure TFrmPrincipal.Etiqueta1Click(Sender: TObject);
begin
  FrmRelEtiqueta:=TFrmRelEtiqueta.create(application);
  FrmRelEtiqueta.showmodal;
end;

procedure TFrmPrincipal.EvPassword1AfterInput(Sender: TObject);
begin
  Table1.Close;
end;

procedure TFrmPrincipal.EvPassword1BeforeInput(Sender: TObject);
begin
  table1.Open;
end;

procedure TFrmPrincipal.EvPassword1Error(Sender: TObject;
  Error: TEvPasswordError);
begin
  MsgDlg.MsgWarning('O usu�rio atual n�o pode ser confirmado.|A aplica��o ser� terminada.');
  Application.Terminate;
end;

procedure TFrmPrincipal.EvPassword1Validate(Sender: TObject; UserName,
  Password: String; var Valid: Boolean);
begin
  if Table1.FindKey([username]) then
    begin
    Valid := EvCripto.CriptoBinToText(Table1senha.AsString) = Password;
    Acesso:=StrtoInt(Table1TipoAcesso.Value);
    User:=Table1Usuario.Value;
    end
  else
    MsgDlg.MsgError('O nome de usu�rio e senha informado n�o s�o v�lidos.');
end;

procedure TFrmPrincipal.MudarUsurio1Click(Sender: TObject);
begin
  EvPassword1.Execute;
  UserAcess.UserID:=frmPrincipal.Acesso;
  UserAcess.ForceDefinitions;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  Topo:= -1;
  ListaTeclas:='[F2] Cadastros [F3] Pedidos [F4] Relat�rios [F5] Par�metros do Sistema [F6] Ajuda [ESC] Sai';
  StatusTeclas(True,ListaTeclas);
  if table1.RecordCount=1 then  //obriga o cadastro de senha no 1� uso
      begin
        frmCadSenha:=tfrmCadSenha.create(application);
        frmCadSenha.showModal;
      end;
  evPassword1.Execute; 
end;

procedure TFrmPrincipal.FormActivate(Sender: TObject);
begin
  UserAcess.UserID:=frmPrincipal.Acesso;
  UserAcess.ForceDefinitions;
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

procedure TFrmPrincipal.Fornecedor1Click(Sender: TObject);
begin
  try
    begin
    frmCadFornec.show;
    if frmCadFornec.WindowState=wsMinimized then
      frmCadFornec.WindowState:=wsNormal;
    end;
  except
    begin
    frmCadFornec:=TfrmCadFornec.create(application);
    frmCadFornec.show;
    end;
  end;
end;

procedure TFrmPrincipal.CentrodeCusto1Click(Sender: TObject);
begin
  try
    begin
    frmCCusto.show;
    if FrmCCusto.WindowState=wsMinimized then
      FrmCCusto.WindowState:=wsNormal;
    end;
  except
    begin
    FrmCCusto:=TFrmCCusto.create(application);
    FrmCCusto.show;
    end;
  end;
end;

procedure TFrmPrincipal.Histrico1Click(Sender: TObject);
begin
  try
    begin
    FrmHistorico.show;
    if FrmHistorico.WindowState=wsMinimized then
      FrmHistorico.WindowState:=wsNormal;
    end;
  except
    begin
    FrmHistorico:=TFrmHistorico.create(application);
    FrmHistorico.show;
    end;
  end;
end;

procedure TFrmPrincipal.TipodeDocumento1Click(Sender: TObject);
begin
  try
    begin
    FrmTipoDoc.show;
    if FrmTipoDoc.WindowState=wsMinimized then
      FrmTipoDoc.WindowState:=wsNormal;
    end;
  except
    begin
    FrmTipoDoc:=TFrmTipoDoc.create(application);
    FrmTipoDoc.show;
    end;
  end;
end;

procedure TFrmPrincipal.CartesConvnios1Click(Sender: TObject);
begin
  try
    begin
    FrmCadCartao.show;
    if FrmCadCartao.WindowState=wsMinimized then
      FrmCadCartao.WindowState:=wsNormal;
    end;
  except
    begin
    FrmCadCartao:=TFrmCadCartao.create(application);
    FrmCadCartao.show;
    end;
  end;
end;

procedure TFrmPrincipal.ContaCorrente1Click(Sender: TObject);
begin
  try
    begin
    FrmCCorrente.show;
    if FrmCCorrente.WindowState=wsMinimized then
      FrmCCorrente.WindowState:=wsNormal;
    end;
  except
    begin
    FrmCCorrente:=TFrmCCorrente.create(application);
    FrmCCorrente.show;
    end;
  end;
end;

procedure TFrmPrincipal.Lanamento1Click(Sender: TObject);
begin
  try
    begin
    FrmCReceber.show;
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

procedure TFrmPrincipal.BaixaemLotes1Click(Sender: TObject);
begin
  try
    begin
    FrmSelecCR.Show;
    if FrmSelecCR.WindowState=wsMinimized then
      FrmSelecCR.WindowState:=wsNormal;
    end;
  except
    begin
    FrmSelecCR:=TFrmSelecCR.create(application);
    FrmSelecCR.Show;
    end;
  end;
end;

procedure TFrmPrincipal.CancelamentodeContas1Click(Sender: TObject);
begin
  try
    begin
    FrmCancelCR.show;
    if FrmCancelCR.WindowState=wsMinimized then
      FrmCancelCR.WindowState:=wsNormal;
    end;
  except
    begin
    FrmCancelCR:=TFrmCancelCR.create(application);
    FrmCancelCR.show;
    end;
  end;
end;

procedure TFrmPrincipal.Lanamento2Click(Sender: TObject);
begin
  try
    begin
    frmCpagar.show;
    if frmCpagar.WindowState=wsMinimized then
      frmCpagar.WindowState:=wsNormal;
    end;
  except
    begin
    frmCpagar:=TfrmCpagar.create(application);
    frmCpagar.show;
    end;
  end;
end;

procedure TFrmPrincipal.BaixaemLote1Click(Sender: TObject);
begin
  try
    begin
    FrmSelecCP.Show;
    if FrmSelecCP.WindowState=wsMinimized then
      FrmSelecCP.WindowState:=wsNormal;
    end;
  except
    begin
    FrmSelecCP:=TFrmSelecCP.create(application);
    FrmSelecCP.Show;
    end;
  end;
end;

procedure TFrmPrincipal.CanelamentodeContas1Click(Sender: TObject);
begin
  try
    begin
    FrmCancelCP.show;
    if FrmCancelCP.WindowState=wsMinimized then
      FrmCancelCP.WindowState:=wsNormal;
    end;
  except
    begin
    FrmCancelCP:=TFrmCancelCP.create(application);
    FrmCancelCP.show;
    end;
  end;
end;

procedure TFrmPrincipal.Lanamento3Click(Sender: TObject);
begin
  try
    begin
    FrmMovCaixa.show;
    if FrmMovCaixa.WindowState=wsMinimized then
      FrmMovCaixa.WindowState:=wsNormal;
    end;
  except
    begin
    FrmMovCaixa:=TFrmMovCaixa.create(application);
    FrmMovCaixa.show;
    end;
  end;
end;

procedure TFrmPrincipal.Fechamento1Click(Sender: TObject);
begin
  try
    begin
    FrmFechCC.show;
    if FrmFechCC.WindowState=wsMinimized then
      FrmFechCC.WindowState:=wsNormal;
    end;
  except
    begin
    FrmFechCC:=TFrmFechCC.create(application);
    FrmFechCC.show;
    end;
  end;
end;

end.
