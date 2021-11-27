//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
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
  ECripto, EPaswd, DB, DBTables;

type
  TFrmPrincipal = class(TForm)
    ControlBar1: TControlBar;
    StandardToolBar: TToolBar;
    BTClientes: TToolButton;
    ToolButton2: TToolButton;
    BTPatrimonio: TToolButton;
    ToolButton7: TToolButton;
    BTRelatorio: TToolButton;
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
    Cliente2: TMenuItem;
    Fornecedor1: TMenuItem;
    Estoque3: TMenuItem;
    Pedidos1: TMenuItem;
    Ajuda2: TMenuItem;
    EnviesuaDvidapeloEmail2: TMenuItem;
    SobreoTriton1: TMenuItem;
    BTParametros: TToolButton;
    BTAjuda: TToolButton;
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
    Emprstimo1: TMenuItem;
    Patrimnio1: TMenuItem;
    Relatrios1: TMenuItem;
    Clientes2: TMenuItem;
    Seguradora1: TMenuItem;
    Patrimnio2: TMenuItem;
    Emprstimo2: TMenuItem;
    Clientes3: TMenuItem;
    Fornecedores1: TMenuItem;
    CentrodeCusto1: TMenuItem;
    Servios1: TMenuItem;
    Perodo1: TMenuItem;
    Servios2: TMenuItem;
    ContratosdeServios1: TMenuItem;
    LocaodeModeObra1: TMenuItem;
    LocaodePatrimnio1: TMenuItem;
    N3: TMenuItem;
    EvPassword1: TEvPassword;
    EvCriptografa1: TEvCriptografa;
    Senhas: TMenuItem;
    Table1: TTable;
    DataSource1: TDataSource;
    Table1Usuario: TStringField;
    Table1Senha: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
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
    procedure BTParametrosClick(Sender: TObject);
    procedure BTClientesClick(Sender: TObject);
    procedure Emprstimo1Click(Sender: TObject);
    procedure Patrimnio1Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure Seguradora1Click(Sender: TObject);
    procedure Emprstimo2Click(Sender: TObject);
    procedure Patrimnio2Click(Sender: TObject);
    procedure BTPatrimonioClick(Sender: TObject);
    procedure Cliente2Click(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    procedure Estoque3Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
    procedure Clientes3Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure CentrodeCusto1Click(Sender: TObject);
    procedure Servios1Click(Sender: TObject);
    procedure Perodo1Click(Sender: TObject);
    procedure ContratosdeServios1Click(Sender: TObject);
    procedure LocaodeModeObra1Click(Sender: TObject);
    procedure LocaodePatrimnio1Click(Sender: TObject);
    procedure SenhasClick(Sender: TObject);
    procedure EvPassword1AfterInput(Sender: TObject);
    procedure EvPassword1BeforeInput(Sender: TObject);
    procedure EvPassword1Error(Sender: TObject;Error: TEvPasswordError);
    procedure EvPassword1Validate(Sender: TObject; UserName,
              Password: String; var Valid: Boolean);
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
   UnitSobre, unitDmDados, unitParametro, UnitCompra, unitSeguradora,
  Unitcademprestimo, UnitPatri, UnitRelCliente, UnitRelSeg,
  UnitRelEmprestimo, UnitRelPatrimonio, unitCliente, UnitFornec,
  unitCadCcusto, unServicos, unContraServ, unitPeriodo, UnitMaoObra,
  UnitServPatri, UnitCadSenha;

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
      VK_F1   : BTAjuda.Click;
      VK_F2   : BTClientes.Click;
      VK_F3   : BTPatrimonio.Click;
      VK_F4   : BTRelatorio.CheckMenuDropdown;
      VK_F5   : BTParametros.Click;

      VK_ESCAPE : close;
    end;
end;


procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  Topo:= -1;
  ListaTeclas:='[F1] Ajuda [F2] Cliente/Comprador [F3] Patrim�nio [F4] Relat�rios  [F5] Par�metros  [ESC] Sai';
  StatusTeclas(True,ListaTeclas);
end;

procedure TFrmPrincipal.Clientes1Click(Sender: TObject);
begin
  frmCadComprador:=tfrmCadComprador.create(application);
  frmCadComprador.showmodal;
end;

procedure TFrmPrincipal.Bancos1Click(Sender: TObject);
begin
  frmSeguradora:=tfrmSeguradora.create(application);
  frmSeguradora.showmodal;
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
url :='mailto:gensysinfo_softwares@uol.com.br';
shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);

end;

procedure TFrmPrincipal.SobreoTritonLigth1Click(Sender: TObject);
begin
  frmSobre:=tfrmSobre.create(application);
  frmSobre.showmodal;
end;

procedure TFrmPrincipal.BTParametrosClick(Sender: TObject);
begin
  frmParametro:=tfrmParametro.create(application);
  frmParametro.showmodal;
end;

procedure TFrmPrincipal.BTClientesClick(Sender: TObject);
begin
  FrmCadCliente:=TFrmCadCliente.create(application);
  FrmCadCliente.showmodal;
end;

procedure TFrmPrincipal.Emprstimo1Click(Sender: TObject);
begin
frmCadEmprestimo:=tfrmCadEmprestimo.create(application);
frmCadEmprestimo.showmodal;
end;

procedure TFrmPrincipal.Patrimnio1Click(Sender: TObject);
begin
frmPatri:=tfrmPatri.create(application);
frmPatri.showmodal;
end;

procedure TFrmPrincipal.Clientes2Click(Sender: TObject);
begin
frmrelcliente:=tfrmrelcliente.create(application);
frmrelcliente.showmodal;
end;

procedure TFrmPrincipal.Seguradora1Click(Sender: TObject);
begin
frmrelseg:=tfrmrelseg.create(application);
frmrelseg.showmodal;
end;

procedure TFrmPrincipal.Emprstimo2Click(Sender: TObject);
begin
frmrelemprestimo:=tfrmrelemprestimo.create(application);
frmrelemprestimo.showmodal;
end;

procedure TFrmPrincipal.Patrimnio2Click(Sender: TObject);
begin
frmrelpatrimonio:=tfrmrelpatrimonio.create(application);
frmrelpatrimonio.showmodal;
end;

procedure TFrmPrincipal.BTPatrimonioClick(Sender: TObject);
begin
  frmpatri:=tfrmpatri.Create(application);
  frmpatri.ShowModal; 
end;

procedure TFrmPrincipal.Cliente2Click(Sender: TObject);
begin
frmrelcliente:=tfrmrelcliente.create(application);
frmrelcliente.showmodal;
end;

procedure TFrmPrincipal.Fornecedor1Click(Sender: TObject);
begin
frmrelseg:=tfrmrelseg.create(application);
frmrelseg.showmodal;
end;

procedure TFrmPrincipal.Estoque3Click(Sender: TObject);
begin
frmrelemprestimo:=tfrmrelemprestimo.create(application);
frmrelemprestimo.showmodal;
end;

procedure TFrmPrincipal.Pedidos1Click(Sender: TObject);
begin
frmrelpatrimonio:=tfrmrelpatrimonio.create(application);
frmrelpatrimonio.showmodal;
end;

procedure TFrmPrincipal.Clientes3Click(Sender: TObject);
begin
  frmCadCliente:=tfrmCadCliente.create(application);
  frmCadCliente.showmodal;
end;

procedure TFrmPrincipal.Fornecedores1Click(Sender: TObject);
begin
  frmCadFornec:=tfrmCadFornec.create(application);
  frmCadFornec.showmodal;
end;

procedure TFrmPrincipal.CentrodeCusto1Click(Sender: TObject);
begin
  frmCCusto:=tfrmCCusto.create(application);
  frmCCusto.showmodal;
end;

procedure TFrmPrincipal.Servios1Click(Sender: TObject);
begin
  frmCadservicos:=tfrmCadServicos.create(application);
  frmCadservicos.showmodal;
end;

procedure TFrmPrincipal.Perodo1Click(Sender: TObject);
begin
  frmperiodo:=tfrmperiodo.create(application);
  frmperiodo.showmodal;
end;

procedure TFrmPrincipal.ContratosdeServios1Click(Sender: TObject);
begin
  frmContraserv:=tfrmContraserv.create(application);
  frmContraserv.showmodal;
end;

procedure TFrmPrincipal.LocaodeModeObra1Click(Sender: TObject);
begin
  frmMaoObra:=tfrmMaoObra.create(application);
  frmMaoObra.showmodal;
end;

procedure TFrmPrincipal.LocaodePatrimnio1Click(Sender: TObject);
begin
  frmServPatri:=tfrmServPatri.create(application);
  frmServPatri.showmodal;
end;

procedure TFrmPrincipal.SenhasClick(Sender: TObject);
begin
FrmCadSenha:=TFrmCadSenha.create(application);
FrmCadSenha.showModal;
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
     if Table1.FindKey([username]) then
        Valid := EvCriptografa1.CriptoBinToText(Table1senha.AsString) = Password
    else
       ShowMessage('O nome de usu�rio e senha informado n�o s�o v�lidos.');
end;

procedure TFrmPrincipal.EvPassword1AfterInput(Sender: TObject);
begin
  Table1.Close;
end;

procedure TFrmPrincipal.EvPassword1BeforeInput(Sender: TObject);
begin
 table1.Open;
end;

end.
