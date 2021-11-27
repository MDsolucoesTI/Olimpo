//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, XPMenu, ComCtrls, ToolWin, ExtCtrls, ImgList,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDShapeHint,
  LMDMessageHint, TFlatHintUnit, SRLabel, LMDGraphicControl, LMDScrollText,
  LMDControl, LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomLabel, LMDCustomLabelFill, LMDLabelFill, ShellApi;

type
  TFrmPrincipal = class(TForm)
    ControlBar1: TControlBar;
    StandardToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton8: TToolButton;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton6: TToolButton;
    ToolButton11: TToolButton;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    CadastrodePessoas1: TMenuItem;
    Fornecedor1: TMenuItem;
    CadastrodeImobiliria1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    CentrodeCusto1: TMenuItem;
    Histrico1: TMenuItem;
    iposdeDocumentos2: TMenuItem;
    iposdeImveis1: TMenuItem;
    ndicedeAtualizao1: TMenuItem;
    N4: TMenuItem;
    Bancos1: TMenuItem;
    iposdeDocumentos1: TMenuItem;
    N6: TMenuItem;
    Sair1: TMenuItem;
    Operaes1: TMenuItem;
    EfetuarAluguel1: TMenuItem;
    N3: TMenuItem;
    Financeiro1: TMenuItem;
    ContasaReceber1: TMenuItem;
    ContasaPagar1: TMenuItem;
    Caixa1: TMenuItem;
    Lanamento1: TMenuItem;
    FechamentoeTransferncia1: TMenuItem;
    Relatrio1: TMenuItem;
    Configuraes1: TMenuItem;
    Gerais1: TMenuItem;
    Ajuda1: TMenuItem;
    EnviesuaDvidapeloEmail1: TMenuItem;
    SobreoTritonLigth1: TMenuItem;
    ImgBarra: TImageList;
    ImgCadastro: TImageList;
    Panel1: TPanel;
    LMDLabelFill1: TLMDLabelFill;
    LMDScrollText1: TLMDScrollText;
    LMDLabelFill2: TLMDLabelFill;
    SRLabel1: TSRLabel;
    StatusBar1: TStatusBar;
    LMDLabelFill3: TLMDLabelFill;
    Cliente: TMenuItem;
    fFornecedor1: TMenuItem;
    Receber1: TMenuItem;
    Pagar1: TMenuItem;
    PopCadastro: TPopupMenu;
    CadastrodeProprietrios1: TMenuItem;
    CadastrodeLocatrios1: TMenuItem;
    PopImob: TPopupMenu;
    PopAjuda: TPopupMenu;
    Enviesuadvidapeloemail2: TMenuItem;
    SobreoTriton1: TMenuItem;
    XPMenu1: TXPMenu;
    CadastrodeImobilirias1: TMenuItem;
    CadastrodeImveis1: TMenuItem;
    ValoresdosIndexadores1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure CadastrodePessoas1Click(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    procedure CadastrodeImobiliria1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure CentrodeCusto1Click(Sender: TObject);
    procedure Histrico1Click(Sender: TObject);
    procedure iposdeDocumentos2Click(Sender: TObject);
    procedure iposdeImveis1Click(Sender: TObject);
    procedure ndicedeAtualizao1Click(Sender: TObject);
    procedure Bancos1Click(Sender: TObject);
    procedure iposdeDocumentos1Click(Sender: TObject);
    procedure EfetuarAluguel1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure ContasaReceber1Click(Sender: TObject);
    procedure ContasaPagar1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure EnviesuaDvidapeloEmail1Click(Sender: TObject);
    procedure StatusTeclas(vAcao:boolean;vTeclas:string);
    procedure SobreoTritonLigth1Click(Sender: TObject);
    procedure CadastrodeProprietrios1Click(Sender: TObject);
    procedure CadastrodeLocatrios1Click(Sender: TObject);
    procedure CadastrodeImobilirias1Click(Sender: TObject);
    procedure CadastrodeImveis1Click(Sender: TObject);
    procedure SobreoTriton1Click(Sender: TObject);
    procedure Enviesuadvidapeloemail2Click(Sender: TObject);
    procedure ValoresdosIndexadores1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;
  ListaTeclas : String;
  PilhaTeclas : array[1..10] of string;
  Topo : integer;
  Acao:boolean;

implementation

uses UnitCadImob, UnitCadImovel, UnitIndiceAt,
     UnitEfAluguel, UnitDespImov, unitCadHist, unitCadTipoImovel,
     unitCadTipoDoc, unitCadCcusto, unitCadBancos, UnitCadClientes,
  UnitFornec, unitCcorrente, unitCpagar, unitCreceber, UnitSobre,
  UnitDmdados;

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

procedure TFrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= Cafree;
end;

procedure TFrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.CadastrodePessoas1Click(Sender: TObject);
begin
FrmCadCliente:=TFrmCadCliente.create(application);
FrmCadCliente.Showmodal;
end;

procedure TFrmPrincipal.Fornecedor1Click(Sender: TObject);
begin
FrmCadFornec:=TFrmCadFornec.create(application);
FrmCadFornec.Showmodal;
end;

procedure TFrmPrincipal.CadastrodeImobiliria1Click(Sender: TObject);
begin
FrmCadImob:=TFrmCadImob.create(application);
FrmCadImob.Showmodal;
end;

procedure TFrmPrincipal.N1Click(Sender: TObject);
begin
FrmCadImovel:=TFrmCadImovel.create(application);
FrmCadImovel.Showmodal;
end;

procedure TFrmPrincipal.CentrodeCusto1Click(Sender: TObject);
begin
FrmCCusto:=TFrmCCusto.create(application);
FrmCCusto.Showmodal;
end;

procedure TFrmPrincipal.Histrico1Click(Sender: TObject);
begin
FrmCadHist:=TFrmCadHist.create(application);
FrmCadHist.Showmodal;
end;

procedure TFrmPrincipal.iposdeDocumentos2Click(Sender: TObject);
begin
FrmCadTipoDoc:=TFrmCadTipoDoc.create(application);
FrmCadTipoDoc.Showmodal;
end;

procedure TFrmPrincipal.iposdeImveis1Click(Sender: TObject);
begin
FrmCadTipoImovel:=TFrmCadTipoImovel.create(application);
FrmCadTipoImovel.Showmodal;
end;

procedure TFrmPrincipal.ndicedeAtualizao1Click(Sender: TObject);
begin
FrmIndiceAt:=TFrmindiceAt.create(application);
FrmIndiceAt.Showmodal;
end;

procedure TFrmPrincipal.Bancos1Click(Sender: TObject);
begin
FrmCadBancos:=TFrmCadBancos.create(application);
FrmCadBancos.Showmodal;
end;

procedure TFrmPrincipal.iposdeDocumentos1Click(Sender: TObject);
begin
FrmCCorrente:=TFrmCCorrente.create(application);
FrmCCorrente.Showmodal;
end;

procedure TFrmPrincipal.EfetuarAluguel1Click(Sender: TObject);
begin
FrmEfAluguel:=TFrmEfAluguel.create(application);
FrmEfAluguel.Showmodal;
end;

procedure TFrmPrincipal.N3Click(Sender: TObject);
begin
FrmDespImov:=TFrmDespImov.create(application);
FrmDespImov.Showmodal;
end;

procedure TFrmPrincipal.ContasaReceber1Click(Sender: TObject);
begin
FrmCReceber:=TFrmCReceber.create(application);
FrmCReceber.Showmodal;
end;

procedure TFrmPrincipal.ContasaPagar1Click(Sender: TObject);
begin
FrmCPagar:=TFrmCPagar.create(application);
FrmCPagar.Showmodal;
end;

procedure TFrmPrincipal.ToolButton1Click(Sender: TObject);
begin
//FrmCadPes:=TFrmCadPes.create(application);
//FrmCadPes.Showmodal;
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
FrmSobre:=TFrmSobre.create(application);
FrmSobre.Showmodal;
end;

procedure TFrmPrincipal.CadastrodeProprietrios1Click(Sender: TObject);
begin
FrmCadCliente:=TFrmCadCliente.create(application);
FrmCadCliente.Showmodal;
end;

procedure TFrmPrincipal.CadastrodeLocatrios1Click(Sender: TObject);
begin
FrmCadFornec:=TFrmCadFornec.create(application);
FrmCadFornec.Showmodal;
end;

procedure TFrmPrincipal.CadastrodeImobilirias1Click(Sender: TObject);
begin
FrmCadImob:=TFrmCadImob.create(application);
FrmCadImob.Showmodal;
end;

procedure TFrmPrincipal.CadastrodeImveis1Click(Sender: TObject);
begin
FrmCadImovel:=TFrmCadImovel.create(application);
FrmCadImovel.Showmodal;
end;

procedure TFrmPrincipal.SobreoTriton1Click(Sender: TObject);
begin
FrmSobre:=TFrmSobre.create(application);
FrmSobre.Showmodal;
end;

procedure TFrmPrincipal.Enviesuadvidapeloemail2Click(Sender: TObject);
var
  url : string;
begin
  url :='mailto:gensysinfo_softwares@uol.com.br';
  shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;
procedure TFrmPrincipal.ValoresdosIndexadores1Click(Sender: TObject);
begin
FrmIndiceAt:=TFrmIndiceAt.create(application);
FrmIndiceAt.Showmodal;
end;

end.
