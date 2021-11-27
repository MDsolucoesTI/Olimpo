//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
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
  LMDShapeHint;

type
  TFrmLibCred = class(TForm)
    RxLabel4: TRxLabel;
    Panel1: TPanel;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    Panel2: TPanel;
    Image2: TImage;
    Label2: TLabel;
    lbUltCompra: TRxLabel;
    dbUltCompra: TDBDateEdit;
    lbrenda: TRxLabel;
    dbrenda: TRxDBCalcEdit;
    lblimite: TRxLabel;
    dblimite: TRxDBCalcEdit;
    dbrestricao: TDBEdit;
    lbrestricao: TRxLabel;
    RxSplitter1: TRxSplitter;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxSplitter2: TRxSplitter;
    lbBancos: TRxLabel;
    dbBanco1: TDBEdit;
    lbpessoas: TRxLabel;
    RxSplitter3: TRxSplitter;
    lbnome: TRxLabel;
    dbnome1: TDBEdit;
    dbnome2: TDBEdit;
    dbBanco2: TDBEdit;
    RxLabel11: TRxLabel;
    RxSplitter4: TRxSplitter;
    lbempresa: TRxLabel;
    dbEmpresa: TDBEdit;
    dbCargo: TDBEdit;
    lbcargo: TRxLabel;
    lbtel: TRxLabel;
    dbTel: TDBEdit;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnGravar: TSpeedItem;
    BtnCancelar: TSpeedItem;
    BtnAlterar: TSpeedItem;
    BtnSair: TSpeedItem;
    btnNovo: TSpeedItem;
    btnDeletar: TSpeedItem;
    RxLabel15: TRxLabel;
    LMDShapeHint1: TLMDShapeHint;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbUltCompraEnter(Sender: TObject);
    procedure dbrendaEnter(Sender: TObject);
    procedure dblimiteEnter(Sender: TObject);
    procedure dbrestricaoEnter(Sender: TObject);
    procedure dbBanco1Enter(Sender: TObject);
    procedure dbBanco2Enter(Sender: TObject);
    procedure dbnome1Enter(Sender: TObject);
    procedure dbnome2Enter(Sender: TObject);
    procedure dbEmpresaEnter(Sender: TObject);
    procedure dbCargoEnter(Sender: TObject);
    procedure dbTelEnter(Sender: TObject);
    procedure dbUltCompraExit(Sender: TObject);
    procedure dbrendaExit(Sender: TObject);
    procedure dblimiteExit(Sender: TObject);
    procedure dbrestricaoExit(Sender: TObject);
    procedure dbBanco1Exit(Sender: TObject);
    procedure dbBanco2Exit(Sender: TObject);
    procedure dbnome1Exit(Sender: TObject);
    procedure dbnome2Exit(Sender: TObject);
    procedure dbEmpresaExit(Sender: TObject);
    procedure dbTelExit(Sender: TObject);
    procedure dbCargoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLibCred: TFrmLibCred;
  NovoItem : Boolean;

implementation

uses unitDmdados, unitCadClientes;

{$R *.DFM}

procedure TFrmLibCred.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLibCred.BtnGravarClick(Sender: TObject);
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
  dbBanco1.Enabled:=false;
  dbBanco2.Enabled:=false;
  dbNome1.Enabled:=false;
  dbNome2.Enabled:=false;
  dbEmpresa.Enabled:=false;
  dbCargo.Enabled:=false;
  dbtel.Enabled:=false;
  speedbar1.SetFocus;
  dmDados.vTabStt:=true;
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
  dbBanco1.Enabled:=false;
  dbBanco2.Enabled:=false;
  dbNome1.Enabled:=false;
  dbNome2.Enabled:=false;
  dbEmpresa.Enabled:=false;
  dbCargo.Enabled:=false;
  dbtel.Enabled:=false;
  dmDados.vTabStt:=true;
  speedbar1.SetFocus;
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

procedure TFrmLibCred.dbUltCompraEnter(Sender: TObject);
begin
  (Sender as TdbDateEdit).color:=$00d2e2ff;
end;

procedure TFrmLibCred.dbrendaEnter(Sender: TObject);
begin
  (Sender as TRxdbCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmLibCred.dblimiteEnter(Sender: TObject);
begin
  (Sender as TRxdbCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmLibCred.dbrestricaoEnter(Sender: TObject);
begin
  (Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmLibCred.dbBanco1Enter(Sender: TObject);
begin
  (Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmLibCred.dbBanco2Enter(Sender: TObject);
begin
  (Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmLibCred.dbnome1Enter(Sender: TObject);
begin
  (Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmLibCred.dbnome2Enter(Sender: TObject);
begin
  (Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmLibCred.dbEmpresaEnter(Sender: TObject);
begin
  (Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmLibCred.dbCargoEnter(Sender: TObject);
begin
  (Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmLibCred.dbTelEnter(Sender: TObject);
begin
  (Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmLibCred.dbUltCompraExit(Sender: TObject);
begin
  (Sender as TdbDateEdit).color:=clWindow;
end;

procedure TFrmLibCred.dbrendaExit(Sender: TObject);
var
  limite : real;
begin
  If NovoItem Then
    Begin
    If dbrenda.Value = 0 then
      Begin
      ShowMessage('� obrigat�rio a RENDA MENSAL');
      dbrenda.SetFocus;
      End
    Else
      begin
      limite:=dmdados.TbParametroCredRenda.Value;
      dmdados.tbLibCreditoLimite.AsCurrency:=(dmdados.tbLibCreditoRenda.value*(limite/100));
      (Sender as TRxDBCalcEdit).color:=clWindow;
      end;
    End
  Else
    (Sender as TRxDBCalcEdit).color:=clWindow;
end;

procedure TFrmLibCred.dblimiteExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dblimite.Value= 0 then
      Begin
      ShowMessage('� obrigat�rio o LIMITE DE CR�DITO');
      dblimite.SetFocus;
      End
    Else
      (Sender as TRxDBCalcEdit).color:=clWindow;
    End
  Else
    (Sender as TRxDBCalcEdit).color:=clWindow;
end;

procedure TFrmLibCred.dbrestricaoExit(Sender: TObject);
begin
  (Sender as TdbEdit).color:=clwindow;
end;

procedure TFrmLibCred.dbBanco1Exit(Sender: TObject);
begin
  (Sender as TdbEdit).color:=clwindow;
end;

procedure TFrmLibCred.dbBanco2Exit(Sender: TObject);
begin
  (Sender as TdbEdit).color:=clwindow;
end;

procedure TFrmLibCred.dbnome1Exit(Sender: TObject);
begin
  (Sender as TdbEdit).color:=clwindow;
end;

procedure TFrmLibCred.dbnome2Exit(Sender: TObject);
begin
  (Sender as TdbEdit).color:=clwindow;
end;

procedure TFrmLibCred.dbEmpresaExit(Sender: TObject);
begin
  (Sender as TdbEdit).color:=clwindow;
end;

procedure TFrmLibCred.dbTelExit(Sender: TObject);
begin
  speedbar1.SetFocus;
  (Sender as TdbEdit).color:=clwindow;
end;

procedure TFrmLibCred.dbCargoExit(Sender: TObject);
begin
  (Sender as TdbEdit).color:=clwindow;
end;

procedure TFrmLibCred.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmCadCliente.visible:=true;
  action:=cafree;
end;

procedure TFrmLibCred.btnNovoClick(Sender: TObject);
begin
  dmdados.tbLibCredito.append;
  NovoItem:=True;
  dmdados.tbLibCreditoRestricao.Value:='Nada Consta';
  dbUltCompra.Enabled:=true;
  dbrenda.Enabled:=true;
  dbLimite.Enabled:=true;
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

procedure TFrmLibCred.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_INSERT : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_HOME   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_DELETE : if (dmDados.vTabStt) then BtnDeletar.Click;
      VK_END    : if not(dmDados.vTabStt) then BtnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
    end;
end;

procedure TFrmLibCred.btnDeletarClick(Sender: TObject);
begin
  if dmdados.tbLibCredito.RecordCount=0 then
    begin
    ShowMessage('Tabela sem registro');
    end
  else
    begin
      If application.MessageBox('Tem certeza que deseja excluir este registro?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
        dmdados.TbLibCredito.Delete
      else
        dmdados.TbLibCredito.cancel;
    end;
end;

procedure TFrmLibCred.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
end;

end.
