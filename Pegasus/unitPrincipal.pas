//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 08-01-2001
// Ultima modifica��o: 12-07-2005
// M�dulo............: Menu e tela Principal
// Sistema...........: Pegasus - Controle de Estoque
// Integra��o........: Olimpo - Automa��o Comercial
/// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
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
  LMDCustomShapeHint, LMDShapeHint, EHintBal, EAppProt, RXCtrls, EFocCol,
  DB, DBTables, EPaswd, ECripto, WinSkinData;

type
  TFrmPrincipal = class(TForm)
    ControlBar1: TControlBar;
    StandardToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton10: TToolButton;
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
    SobreoTritonLigth1: TMenuItem;
    ImageList2: TImageList;
    Pedidos2: TMenuItem;
    EfetuarPedido1: TMenuItem;
    Estoque1: TMenuItem;
    Manuteno2: TMenuItem;
    EntradadeProdutos2: TMenuItem;
    SadadeProdutos2: TMenuItem;
    Fornecedor2: TMenuItem;
    Estoque2: TMenuItem;
    PopRelatorio: TPopupMenu;
    PopAjuda: TPopupMenu;
    Fornecedor1: TMenuItem;
    Estoque3: TMenuItem;
    Pedidos1: TMenuItem;
    ContasaReceber2: TMenuItem;
    Ajuda2: TMenuItem;
    EnviesuaDvidapeloEmail2: TMenuItem;
    SobreoTriton1: TMenuItem;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    EvHintBalloon1: TEvHintBalloon;
    EvAppProtect1: TEvAppProtect;
    Fornecedor3: TMenuItem;
    ImageList1: TImageList;
    Compra: TMenuItem;
    Produtos1: TMenuItem;
    Grupo1: TMenuItem;
    SubGrupo1: TMenuItem;
    Unidade1: TMenuItem;
    Marca1: TMenuItem;
    N1: TMenuItem;
    N3: TMenuItem;
    Etiqueta1: TMenuItem;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    EvFocusColor1: TEvFocusColor;
    XPMenu1: TXPMenu;
    EvPassword1: TEvPassword;
    Table1: TTable;
    Table1Usuario: TStringField;
    Table1Senha: TStringField;
    DataSource1: TDataSource;
    Senhas1: TMenuItem;
    evCripto: TEvCriptografa;
    Mercadoria1: TMenuItem;
    Fornecedor4: TMenuItem;
    Mercadoria2: TMenuItem;
    FornecedorePorPerodo1: TMenuItem;
    ToolButton6: TToolButton;
    SkinData1: TSkinData;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure Fornecedores2Click(Sender: TObject);
    procedure CadastrodaEmpresa1Click(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    procedure SobreoOlimpoLigth1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Grupo1Click(Sender: TObject);
    procedure SubGrupo1Click(Sender: TObject);
    procedure Unidade1Click(Sender: TObject);
    procedure Marca1Click(Sender: TObject);
    procedure EntradadeProdutos1Click(Sender: TObject);
    procedure SadadeProdutos1Click(Sender: TObject);
    procedure ContasaReceber2Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure StatusTeclas(vAcao:boolean;vTeclas:string);
    procedure EntradadeProdutos2Click(Sender: TObject);
    procedure SadadeProdutos2Click(Sender: TObject);
    procedure Fornecedor2Click(Sender: TObject);
    procedure Gerais1Click(Sender: TObject);
    procedure EnviesuaDvidapeloEmail1Click(Sender: TObject);
    procedure SobreoTritonLigth1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure Fornecedor3Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Estoque2Click(Sender: TObject);
    procedure EfetuarPedido1Click(Sender: TObject);
    procedure Etiqueta1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure Estoque3Click(Sender: TObject);
    procedure Senhas1Click(Sender: TObject);
    procedure EvPassword1Error(Sender: TObject; Error: TEvPasswordError);
    procedure EvPassword1BeforeInput(Sender: TObject);
    procedure EvPassword1AfterInput(Sender: TObject);
    procedure EvPassword1Validate(Sender: TObject; UserName,
      Password: String; var Valid: Boolean);
    procedure Mercadoria1Click(Sender: TObject);
    procedure Fornecedor4Click(Sender: TObject);
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

uses
 unitSaidaMat, unitCadSubgrupo, unitCadUnidade, unitCadMarca, unitCadGrupo,
 unitCadmaterial, unitDmDados, unitParametro,UnitRelFornec,unitEntradaMat,
 UnitRelEstoque, unitRelEtiqueta, UnitSobre, unitCompras, unitRelCompras,
 UnitCadSenha, Unitcompra1, UnitCadFornec;

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

procedure TFrmPrincipal.Button2Click(Sender: TObject);
begin
  frmParametro:=tfrmParametro.create(application);
  frmParametro.showmodal;
end;

procedure TFrmPrincipal.Sair2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.Fornecedores2Click(Sender: TObject);
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

procedure TFrmPrincipal.CadastrodaEmpresa1Click(Sender: TObject);
begin
  FrmParametro:=tfrmParametro.create(application);
  FrmParametro.showmodal;
end;

procedure TFrmPrincipal.Fornecedor1Click(Sender: TObject);
begin
  FrmRelFornec:=TFrmRelFornec.Create(Application);
  FrmRelFornec.showmodal;
end;

procedure TFrmPrincipal.SobreoOlimpoLigth1Click(Sender: TObject);
begin
  FrmSobre:=TFrmSobre.create(application);
  FrmSobre.Showmodal;
end;

procedure TFrmPrincipal.Produtos1Click(Sender: TObject);
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

procedure TFrmPrincipal.SubGrupo1Click(Sender: TObject);
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

procedure TFrmPrincipal.EntradadeProdutos1Click(Sender: TObject);
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
    FrmEntradaMat.Show;
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
    FrmSaidaMat.Showmodal;
    end;
  end;
  
end;

procedure TFrmPrincipal.ContasaReceber2Click(Sender: TObject);
begin
frmRelEtiqueta:=TfrmRelEtiqueta.Create(application);
frmrelEtiqueta.ShowModal;
end;

procedure TFrmPrincipal.Pedidos1Click(Sender: TObject);
begin
frmRelCompras:=tfrmRelCompras.create(application);
frmRelCompras.showmodal;
end;

procedure TFrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmDados.HabilitaTeclado then
    case (key) of
      // Teclas de navega��o
      VK_F1   : ToolButton5.Click;
      VK_F2   : ToolButton1.Click;
      VK_F3   : ToolButton4.Click;
      VK_F4   : ToolButton10.CheckMenuDropdown;
      VK_F5   : ToolButton3.Click;
      VK_ESCAPE : close;
    end;
end;


procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
 Topo:= -1;
 ListaTeclas:='[F1] Ajuda [F2] Fornecedor [F3] Pedidos [F4] Relat�rio [F5] Par�metros [ESC] Sai';
 StatusTeclas(True,ListaTeclas);
 if table1.RecordCount<1 then  //obriga o cadastro de senha no 1� uso
    begin
    frmCadSenha:=tfrmCadSenha.create(application);
    frmCadSenha.showModal;
    end;
 evPassword1.Execute;
end;

procedure TFrmPrincipal.EntradadeProdutos2Click(Sender: TObject);
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

procedure TFrmPrincipal.SadadeProdutos2Click(Sender: TObject);
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

procedure TFrmPrincipal.Fornecedor2Click(Sender: TObject);
begin
frmRelFornec:=tfrmRelFornec.create(application);
frmRelFornec.showmodal;
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

procedure TFrmPrincipal.SobreoTritonLigth1Click(Sender: TObject);
begin
frmSobre:=tfrmSobre.create(application);
frmSobre.showmodal;
end;

procedure TFrmPrincipal.ToolButton3Click(Sender: TObject);
begin
frmParametro:=tfrmParametro.create(application);
frmParametro.showmodal;
end;

procedure TFrmPrincipal.ToolButton4Click(Sender: TObject);
begin
frmCompras:=tfrmCompras.create(application);
frmCompras.showModal;
end;

procedure TFrmPrincipal.Fornecedor3Click(Sender: TObject);
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


procedure TFrmPrincipal.Fornecedores1Click(Sender: TObject);
begin
frmCadFornec:=tfrmCadFornec.create(application);
frmCadFornec.showmodal;
end;

procedure TFrmPrincipal.Estoque2Click(Sender: TObject);
begin
frmRelestoque:=tfrmRelestoque.create(application);
frmRelestoque.showmodal;
end;


procedure TFrmPrincipal.EfetuarPedido1Click(Sender: TObject);
begin
  try
    begin
    frmCompras.show;
    if frmCompras.WindowState=wsMinimized then
      frmCompras.WindowState:=wsNormal;
    end;
  except
    begin
    frmCompras:=TfrmCompras.create(application);
    frmCompras.show;
    end;
  end;
end;

procedure TFrmPrincipal.Etiqueta1Click(Sender: TObject);
begin
frmRelEtiqueta:=TfrmRelEtiqueta.Create(application);
frmrelEtiqueta.ShowModal;
end;

procedure TFrmPrincipal.ToolButton1Click(Sender: TObject);
begin
frmCadFornec:=tfrmCadFornec.create(application);
frmCadFornec.showmodal;
end;

procedure TFrmPrincipal.Estoque3Click(Sender: TObject);
begin
frmRelestoque:=tfrmRelestoque.create(application);
frmRelestoque.showmodal;
end;

procedure TFrmPrincipal.Senhas1Click(Sender: TObject);
begin
frmCadSenha:=tfrmCadSenha.create(application);
frmCadSenha.showModal;
end;

procedure TFrmPrincipal.EvPassword1Error(Sender: TObject;
  Error: TEvPasswordError);
begin
      ShowMessage('O usu�rio atual n�o pode ser confirmado. ' +
        'A aplica��o ser� terminada.');
      Application.Terminate;
end;

procedure TFrmPrincipal.EvPassword1BeforeInput(Sender: TObject);
begin
  Table1.Open;
end;

procedure TFrmPrincipal.EvPassword1AfterInput(Sender: TObject);
begin
  Table1.close;
end;

procedure TFrmPrincipal.EvPassword1Validate(Sender: TObject; UserName,
  Password: String; var Valid: Boolean);
begin
  if table1.FindKey([username]) then
    Valid := EvCripto.CriptoBinToText(table1Senha.Value) = Password
  else
    ShowMessage('O nome de usu�rio e senha informado n�o s�o v�lidos.');
end;

procedure TFrmPrincipal.Mercadoria1Click(Sender: TObject);
begin
  frmRelCompras:=tfrmRelCompras.create(application);
  frmRelCompras.showmodal;
end;

procedure TFrmPrincipal.Fornecedor4Click(Sender: TObject);
begin
  FrmRelCompPer:=TFrmRelCompPer.create(application);
  FrmRelCompPer.showmodal;
end;

end.
