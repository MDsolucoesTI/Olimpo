//////////////////////////////////////////////////////////////////////////
// Criacao...........: 05/2002
// Sistema...........: Metallum - Controle de Serviços
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
  LMDCustomShapeHint, LMDShapeHint, EHintBal, EAppProt, RXCtrls, EFocCol;

type
  TFrmPrincipal = class(TForm)
    ControlBar1: TControlBar;
    StandardToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    ToolButton10: TToolButton;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Relatrio1: TMenuItem;
    Configuraes1: TMenuItem;
    Gerais1: TMenuItem;
    Ajuda1: TMenuItem;
    MenuItem5: TMenuItem;
    EnviesuaDvidapeloEmail1: TMenuItem;
    SobreoTritonLigth1: TMenuItem;
    ImageList2: TImageList;
    PopRelatorio: TPopupMenu;
    PopAjuda: TPopupMenu;
    Cliente2: TMenuItem;
    Ajuda2: TMenuItem;
    EnviesuaDvidapeloEmail2: TMenuItem;
    SobreoTriton1: TMenuItem;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    EvHintBalloon1: TEvHintBalloon;
    EvAppProtect1: TEvAppProtect;
    Fornecedor3: TMenuItem;
    ImageList1: TImageList;
    Produtos1: TMenuItem;
    N1: TMenuItem;
    Panel1: TPanel;
    LMDLabelFill2: TLMDLabelFill;
    LMDLabelFill3: TLMDLabelFill;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    StatusBar1: TStatusBar;
    XPMenu1: TXPMenu;
    EvFocusColor1: TEvFocusColor;
    Sair2: TMenuItem;
    Cargos1: TMenuItem;
    Cadastro1: TMenuItem;
    Atualizarsalrio1: TMenuItem;
    Cliente1: TMenuItem;
    Funcionrio1: TMenuItem;
    Atendimento1: TMenuItem;
    OS1: TMenuItem;
    Agenda1: TMenuItem;
    Funcionrio2: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure CadastrodaEmpresa1Click(Sender: TObject);
    procedure SobreoOlimpoLigth1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure StatusTeclas(vAcao:boolean;vTeclas:string);
    procedure Gerais1Click(Sender: TObject);
    procedure EnviesuaDvidapeloEmail1Click(Sender: TObject);
    procedure SobreoTritonLigth1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure Fornecedor3Click(Sender: TObject);
    procedure Cargos1Click(Sender: TObject);
    procedure Cadastro1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Funcionrio1Click(Sender: TObject);
    procedure Atualizarsalrio1Click(Sender: TObject);
    procedure OS1Click(Sender: TObject);
    procedure Agenda1Click(Sender: TObject);
    procedure Cliente2Click(Sender: TObject);
    procedure Funcionrio2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
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

uses unitDmDados,unitParametro,UnitSobre, UnitCadClientes, unitFunc,
     UnitCargos, UnitRelCliente, UnitRelFunc,
     UnitAtSalario, UnitOS, UnitAgenda;

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
      VK_F2   : ToolButton1.Click;
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
  ListaTeclas:='[F2] Fornecedor [F3] Pedidos [F4] Relat�rio [F5] Par�metros [F6] Ajuda [ESC] Sai';
  StatusTeclas(True,ListaTeclas);
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

procedure TFrmPrincipal.ToolButton3Click(Sender: TObject);
begin
frmParametro:=tfrmParametro.create(application);
frmParametro.showmodal;
end;

procedure TFrmPrincipal.Fornecedor3Click(Sender: TObject);
begin
frmCadCliente:=tfrmCadCliente.create(application);
frmCadCliente.showModal;
end;

procedure TFrmPrincipal.Cargos1Click(Sender: TObject);
begin
frmCargos:=tfrmCargos.create(application);
frmCargos.showModal;
end;

procedure TFrmPrincipal.Cadastro1Click(Sender: TObject);
begin
frmFuncionario:=tfrmFuncionario.Create(application);
frmfuncionario.ShowModal;
end;

procedure TFrmPrincipal.Cliente1Click(Sender: TObject);
begin
frmRelCliente:=tfrmRelCliente.create(application);
frmRelCliente.showModal;
end;

procedure TFrmPrincipal.Funcionrio1Click(Sender: TObject);
begin
frmRelFunc:=tfrmRelFunc.create(application);
frmRelFunc.showModal;
end;

procedure TFrmPrincipal.Atualizarsalrio1Click(Sender: TObject);
begin
frmAtualSalario:=tfrmAtualSalario.create(application);
frmAtualSalario.showModal;
end;

procedure TFrmPrincipal.OS1Click(Sender: TObject);
begin
frmOs:=tfrmOs.create(application);
frmOs.showModal;
end;

procedure TFrmPrincipal.Agenda1Click(Sender: TObject);
begin
frmAgenda:=tfrmAgenda.create(application);
frmAgenda.showModal;
end;

procedure TFrmPrincipal.Cliente2Click(Sender: TObject);
begin
frmRelCliente:=tfrmRelCliente.Create(application);
frmRelCliente.ShowModal;
end;

procedure TFrmPrincipal.Funcionrio2Click(Sender: TObject);
begin
frmRelFunc:=tfrmRelFunc.Create(application);
frmRelFunc.ShowModal;
end;

procedure TFrmPrincipal.ToolButton1Click(Sender: TObject);
begin
frmOs:=tfrmOs.create(application);
frmOs.showModal;
end;

procedure TFrmPrincipal.ToolButton4Click(Sender: TObject);
begin
frmAgenda:=tfrmAgenda.create(application);
frmAgenda.showModal;
end;

end.
