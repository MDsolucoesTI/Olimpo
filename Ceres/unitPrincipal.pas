//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2002
// Sistema...........: Ceres - Controle de Cheques
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
  DB, DBTables, EPaswd, ECripto;

type
  TFrmPrincipal = class(TForm)
    ControlBar1: TControlBar;
    StandardToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Configuraes1: TMenuItem;
    Gerais1: TMenuItem;
    Ajuda1: TMenuItem;
    MenuItem5: TMenuItem;
    EnviesuaDvidapeloEmail1: TMenuItem;
    SobreoTritonLigth1: TMenuItem;
    ImageList2: TImageList;
    Clientes1: TMenuItem;
    Bancos1: TMenuItem;
    PopRelatorio: TPopupMenu;
    PopAjuda: TPopupMenu;
    Ajuda2: TMenuItem;
    EnviesuaDvidapeloEmail2: TMenuItem;
    SobreoTriton1: TMenuItem;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    Cheques1: TMenuItem;
    Lanamento4: TMenuItem;
    Baixa1: TMenuItem;
    ChequesemFundos1: TMenuItem;
    Renegociarcheque1: TMenuItem;
    ConsultarCPFCNPJ1: TMenuItem;
    EvHintBalloon1: TEvHintBalloon;
    EvAppProtect1: TEvAppProtect;
    ImageList1: TImageList;
    N1: TMenuItem;
    EvFocusColor1: TEvFocusColor;
    Panel1: TPanel;
    LMDLabelFill2: TLMDLabelFill;
    LMDLabelFill3: TLMDLabelFill;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    StatusBar1: TStatusBar;
    N2: TMenuItem;
    XPMenu1: TXPMenu;
    DataSource1: TDataSource;
    Table1: TTable;
    Senhas1: TMenuItem;
    EvPassword1: TEvPassword;
    EvCripto: TEvCriptografa;
    Table1Usuario: TStringField;
    Table1Senha: TStringField;
    ToolButton6: TToolButton;
    PopupMenu1: TPopupMenu;
    Relatrios1: TMenuItem;
    ChequesemAberto1: TMenuItem;
    ChequesemAbertoporCliente1: TMenuItem;
    ChequesDevolvidos1: TMenuItem;
    ChequesDevolvidosporCliente1: TMenuItem;
    Image1: TImage;
    ChequesemAberto2: TMenuItem;
    ChequesemAbertoporCliente2: TMenuItem;
    ChequesDevolvidos2: TMenuItem;
    ChequesDevolvidosporCliente2: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure Bancos3Click(Sender: TObject);
    procedure CadastrodaEmpresa1Click(Sender: TObject);
    procedure SobreoOlimpoLigth1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure StatusTeclas(vAcao:boolean;vTeclas:string);
    procedure Clientes1Click(Sender: TObject);
    procedure Bancos1Click(Sender: TObject);
    procedure Gerais1Click(Sender: TObject);
    procedure EnviesuaDvidapeloEmail1Click(Sender: TObject);
    procedure SobreoTritonLigth1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure Lanamento4Click(Sender: TObject);
    procedure Baixa1Click(Sender: TObject);
    procedure ConsultarCPFCNPJ1Click(Sender: TObject);
    procedure Renegociarcheque1Click(Sender: TObject);
    procedure ChequesemFundos1Click(Sender: TObject);
    procedure Cliente3Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure Senhas1Click(Sender: TObject);
    procedure EvPassword1Error(Sender: TObject; Error: TEvPasswordError);
    procedure EvPassword1Validate(Sender: TObject; UserName,
      Password: String; var Valid: Boolean);
    procedure EvPassword1AfterInput(Sender: TObject);
    procedure EvPassword1BeforeInput(Sender: TObject);
    procedure ChequesemAberto1Click(Sender: TObject);
    procedure ChequesemAbertoporCliente1Click(Sender: TObject);
    procedure ChequesDevolvidos1Click(Sender: TObject);
    procedure ChequesDevolvidosporCliente1Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ChequesemAberto2Click(Sender: TObject);
    procedure ChequesemAbertoporCliente2Click(Sender: TObject);
    procedure ChequesDevolvidos2Click(Sender: TObject);
    procedure ChequesDevolvidosporCliente2Click(Sender: TObject);
    procedure Ajuda2Click(Sender: TObject);
    procedure EnviesuaDvidapeloEmail2Click(Sender: TObject);
    procedure SobreoTriton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal : TFrmPrincipal;
  ListaTeclas : String;
  PilhaTeclas : array[1..10] of string;
  Topo : integer;
  Acao:boolean;

implementation

uses
   UnitSobre, unitDmDados, unitCadBancos, unitParametro,
   unitLanCheque, unitBaixaCheque, unitLanChequeSF, unitRenCheque,
   unitConsultaCPF, unitRelCheAberto, untRelCheAbreCli,
   untRelCheDev, untRelCheDevCli, UnitCadSenha, UnitCadCliente;

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

procedure TFrmPrincipal.Clientes2Click(Sender: TObject);
begin
  FrmCadCliente:=TFrmCadCliente.create(application);
  FrmCadCliente.Showmodal;
end;

procedure TFrmPrincipal.Bancos3Click(Sender: TObject);
begin
  FrmCadBancos:=TFrmCadBancos.create(application);
  FrmCadBancos.Showmodal;
end;


procedure TFrmPrincipal.CadastrodaEmpresa1Click(Sender: TObject);
begin
  FrmParametro:=tfrmParametro.create(application);
  FrmParametro.showmodal;
end;

procedure TFrmPrincipal.SobreoOlimpoLigth1Click(Sender: TObject);
begin
  FrmSobre:=TFrmSobre.create(application);
  FrmSobre.Showmodal;
end;

procedure TFrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmDados.HabilitaTeclado then
    case (key) of
      // Teclas de navega��o
      VK_F2   : ToolButton1.Click;
      VK_F3   : ToolButton4.Click;
      VK_F4   : ToolButton8.Click;
//      VK_F5   : ToolButton10.CheckMenuDropdown;
      VK_F6   : ToolButton3.Click;
      VK_F7   : ToolButton5.Click;

      VK_ESCAPE : close;
    end;
end;


procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
Topo:= -1;
ListaTeclas:='[F1] Ajuda [F2] Cliente [F3] Banco [F4] Cheques [F5] Relat�rio [F6] Par�metros [ESC] Sai';
StatusTeclas(True,ListaTeclas);
if table1.RecordCount=1 then  //obriga o cadastro de senha no 1� uso
   begin
   frmCadSenha:=tfrmCadSenha.create(application);
   frmCadSenha.showModal;
   end;
evPassword1.Execute;
end;

procedure TFrmPrincipal.Clientes1Click(Sender: TObject);
begin
  frmCadCliente:=tfrmCadCliente.create(application);
  frmCadCliente.show;
end;

procedure TFrmPrincipal.Bancos1Click(Sender: TObject);
begin
  frmCadBancos:=tfrmCadBancos.create(application);
  frmCadBancos.showmodal;
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

procedure TFrmPrincipal.Lanamento4Click(Sender: TObject);
begin
  frmLanCheque:=tfrmLanCheque.Create(application);
  frmLanCheque.Show;
end;

procedure TFrmPrincipal.Baixa1Click(Sender: TObject);
begin
  FrmBaixaCheque:=TFrmbaixaCheque.create(application);
  FrmBaixaCheque.Show;
end;

procedure TFrmPrincipal.ConsultarCPFCNPJ1Click(Sender: TObject);
begin
  FrmConsultaCPF:=TFrmConsultaCPF.create(application);
  FrmConsultaCPF.Show;
end;

procedure TFrmPrincipal.Renegociarcheque1Click(Sender: TObject);
begin
  FrmRengCheque:=TFrmRengCheque.create(application);
  FrmRengCheque.Show;
end;

procedure TFrmPrincipal.ChequesemFundos1Click(Sender: TObject);
begin
  FrmLanChequeSF:=TFrmLanChequeSF.create(application);
  FrmLanChequeSF.Show;
end;

procedure TFrmPrincipal.Cliente3Click(Sender: TObject);
begin
  frmCadCliente:=tfrmCadCliente.create(application);
  frmCadCliente.showmodal;
end;

procedure TFrmPrincipal.ToolButton1Click(Sender: TObject);
begin
  frmCadCliente:=tfrmCadCliente.create(application);
  frmCadCliente.showmodal;
end;

procedure TFrmPrincipal.ToolButton4Click(Sender: TObject);
begin
  frmCadBancos:=tfrmCadBancos.create(application);
  frmCadBancos.showmodal;
end;

procedure TFrmPrincipal.ToolButton8Click(Sender: TObject);
begin
  frmLanCheque:=tfrmLanCheque.Create(application);
  frmLanCheque.ShowModal;
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

procedure TFrmPrincipal.EvPassword1Validate(Sender: TObject; UserName,
  Password: String; var Valid: Boolean);
begin
  if table1.FindKey([username]) then
   Valid := EvCripto.CriptoBinToText(Table1Senha.Value) = Password
  else
   ShowMessage('O nome de usu�rio e senha informado n�o s�o v�lidos.');
end;


procedure TFrmPrincipal.EvPassword1AfterInput(Sender: TObject);
begin
  table1.Close;
end;

procedure TFrmPrincipal.EvPassword1BeforeInput(Sender: TObject);
begin
  table1.open;
end;

procedure TFrmPrincipal.ChequesemAberto1Click(Sender: TObject);
begin
  frmRelCheAberto:=TfrmRelCheAberto.create(application);
  frmRelCheAberto.showModal;
end;

procedure TFrmPrincipal.ChequesemAbertoporCliente1Click(Sender: TObject);
begin
  frmRelCheAbreCli:=TfrmRelCheAbreCli.create(application);
  frmRelCheAbreCli.showModal;
end;

procedure TFrmPrincipal.ChequesDevolvidos1Click(Sender: TObject);
begin
  frmRelCheDev:=TfrmRelCheDev.create(application);
  frmRelCheDev.showModal;
end;

procedure TFrmPrincipal.ChequesDevolvidosporCliente1Click(Sender: TObject);
begin
  frmRelCheDevCli:=TfrmRelCheDevCli.create(application);
  frmRelCheDevCli.showModal;
end;

procedure TFrmPrincipal.MenuItem5Click(Sender: TObject);
begin
  Winhelp(FrmPrincipal.Handle,'D:\Projetos Novos\Manuais On-Line\Help Ceres',HELP_CONTENTS,0);
end;

procedure TFrmPrincipal.ToolButton5Click(Sender: TObject);
begin
  Winhelp(FrmPrincipal.Handle,'D:\Projetos Novos\Manuais On-Line\Help Ceres',HELP_CONTENTS,0);
end;

procedure TFrmPrincipal.ChequesemAberto2Click(Sender: TObject);
begin
  frmRelCheAberto:=TfrmRelCheAberto.create(application);
  frmRelCheAberto.showModal;
end;

procedure TFrmPrincipal.ChequesemAbertoporCliente2Click(Sender: TObject);
begin
  frmRelCheAbreCli:=TfrmRelCheAbreCli.create(application);
  frmRelCheAbreCli.showModal;
end;

procedure TFrmPrincipal.ChequesDevolvidos2Click(Sender: TObject);
begin
  frmRelCheDev:=TfrmRelCheDev.create(application);
  frmRelCheDev.showModal;
end;

procedure TFrmPrincipal.ChequesDevolvidosporCliente2Click(Sender: TObject);
begin
  frmRelCheDevCli:=TfrmRelCheDevCli.create(application);
  frmRelCheDevCli.showModal;
end;

procedure TFrmPrincipal.Ajuda2Click(Sender: TObject);
begin
  Winhelp(FrmPrincipal.Handle,'D:\Projetos Novos\Manuais On-Line\Help Ceres',HELP_CONTENTS,0);
end;

procedure TFrmPrincipal.EnviesuaDvidapeloEmail2Click(Sender: TObject);
var
 url : string;
begin
  url :='mailto:suporte@gensysinfo.com.br';
  shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;

procedure TFrmPrincipal.SobreoTriton1Click(Sender: TObject);
begin
  frmSobre:=tfrmSobre.create(application);
  frmSobre.showmodal;
end;

end.
