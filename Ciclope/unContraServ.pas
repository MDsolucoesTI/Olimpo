//////////////////////////////////////////////////////////////////////////
// Criacao...........: 05/2002
// Sistema...........: Ciclope - Controle de Funcionarios
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unContraServ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, SpeedBar, jpeg, Menus, RxMenus, Grids, DBGrids, RXCtrls,db,
  StdCtrls, Mask, DBCtrls, RackCtls, RXSplit, ToolEdit, CurrEdit, RXDBCtrl,
  RxDBComb, fcButton, fcImgBtn, RxLookup;

type
  TfrmContraServ = class(TForm)
    spBarBotoes: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnPrimeiro: TSpeedItem;
    BtnAnterior: TSpeedItem;
    BtnProximo: TSpeedItem;
    BtnUltimo: TSpeedItem;
    BtnNovo: TSpeedItem;
    BtnGravar: TSpeedItem;
    BtnCancelar: TSpeedItem;
    BtnAlterar: TSpeedItem;
    BtnDeletar: TSpeedItem;
    BtnLocalizar: TSpeedItem;
    BtnSair: TSpeedItem;
    pnCentro: TPanel;
    dbecodcli: TDBEdit;
    rxLbcodCli: TRxLabel;
    rxLbcodigo: TRxLabel;
    rxLbValor: TRxLabel;
    dbecodigo: TDBEdit;
    rxLbinicio: TRxLabel;
    imgTop: TImage;
    lbTop: TLabel;
    dbevalor: TRxDBCalcEdit;
    rxLbtermino: TRxLabel;
    RxSplitter1: TRxSplitter;
    dbeCliente: TDBEdit;
    rxLbCliente: TRxLabel;
    btLocCli: TfcImageBtn;
    spnTop: TScrewPanel;
    img: TImage;
    RxLabel1: TRxLabel;
    dbeCodServ: TDBEdit;
    RxLabel2: TRxLabel;
    dbeServ: TDBEdit;
    btLocServ: TfcImageBtn;
    RxSplitter5: TRxSplitter;
    RxSplitter2: TRxSplitter;
    RxSplitter3: TRxSplitter;
    RxLabel15: TRxLabel;
    dbeInicio: TDBDateEdit;
    dbeTermino: TDBDateEdit;
    dbcPeriodo: TDBComboBox;
    rxLbPeriodo: TRxLabel;
    procedure CadastrodeServios1Click(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbcPeriodoExit(Sender: TObject);
    procedure dbevalorExit(Sender: TObject);
    procedure btLocCliClick(Sender: TObject);
    procedure dbeCodServExit(Sender: TObject);
    procedure btLocServClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContraServ: TfrmContraServ;
  NovoItem:Boolean;


implementation

uses UnitDmdados, unServicos, unitLocCliente,UnitLocServ, unitPrincipal;


{$R *.DFM}

procedure TfrmContraServ.CadastrodeServios1Click(Sender: TObject);
begin
frmCadServicos.show;
end;

procedure TfrmContraServ.BtnSairClick(Sender: TObject);
begin
close;
end;


procedure TfrmContraServ.BtnPrimeiroClick(Sender: TObject);
begin
dmdados.tbContrato.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmContraServ.BtnAnteriorClick(Sender: TObject);
begin
dmdados.tbContrato.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
If dmdados.TbContrato.Bof Then
 Begin
  btnPrimeiro.Enabled:=False;
  btnAnterior.Enabled:=False;
end;
end;

procedure TfrmContraServ.BtnProximoClick(Sender: TObject);
begin
dmdados.tbContrato.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
If dmdados.tbContrato.Eof Then
 Begin
 btnProximo.Enabled:=False;
 btnUltimo.Enabled:=False;
 end;
end;

procedure TfrmContraServ.BtnUltimoClick(Sender: TObject);
begin
dmdados.tbContrato.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmContraServ.BtnNovoClick(Sender: TObject);
begin
novoitem:=true;
dmDados.vTabStt:=False;
dmdados.tbContrato.Append;
BtnGravar.Enabled := true;
BtnCancelar.Enabled:=true;
BtnNovo.Enabled:=False;
BtnPrimeiro.Enabled:=False;
BtnAnterior.Enabled:=False;
BtnProximo.Enabled:=False;
BtnUltimo.Enabled:=False;
BtnAlterar.Enabled:=False;
BtnDeletar.Enabled:=False;
BtnLocalizar.Enabled:=False;

{habilitar os objetos}
dbecodserv.Enabled:=true;
dbeserv.Enabled:=true;
dbeCodCli.Enabled:=true;
dbeCliente.Enabled:=true;
dbeInicio.Enabled:=true;
dbeTermino.Enabled:=true;
dbcPeriodo.Enabled:=TRUE;
dbevalor.Enabled:=true;
dbeCodserv.SetFocus;
end;

procedure TfrmContraServ.BtnGravarClick(Sender: TObject);
begin
dmdados.tbContrato.Post;
NovoItem:= False;
dmDados.vTabStt:=True;
BtnGravar.enabled := False;
BtnCancelar.Enabled := False;
BtnNovo.Enabled:=True;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
BtnProximo.Enabled:=True;
BtnUltimo.Enabled:=True;
BtnAlterar.Enabled:=True;
Btndeletar.Enabled:=True;
BtnLocalizar.Enabled:=True;
showmessage('Dados gravados com sucesso!');
{habilitar os objetos}
dbeCodServ.Enabled:=false;
dbeServ.Enabled:=false;
dbecodigo.Enabled:=false;
dbeCodCli.Enabled:=false;
dbeCliente.Enabled:=false;
dbeInicio.Enabled:=false;
dbeTermino.Enabled:=false;
dbcPeriodo.Enabled:=false;
dbevalor.Enabled:=false;
spbarBotoes.SetFocus;
end;

procedure TfrmContraServ.BtnCancelarClick(Sender: TObject);
begin
dmdados.tbContrato.Cancel;
novoItem:=False;
dmDados.vTabStt:=True;
{habilitando bot�es}
BtnGravar.enabled := false;
BtnCancelar.Enabled := false;
BtnNovo.Enabled:=True;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
Btnproximo.Enabled:=True;
BtnUltimo.Enabled:=True;
BtnAlterar.Enabled:=True;
BtnDeletar.Enabled:=True;
BtnLocalizar.Enabled:=True;

{desabilitando componentes}
dbecodserv.Enabled:=false;
dbeserv.Enabled:=false;
dbecodigo.Enabled:=false;
dbeCodCli.Enabled:=false;
dbeCliente.Enabled:=false;
dbeInicio.Enabled:=false;
dbeTermino.Enabled:=false;
dbcPeriodo.Enabled:=false;
dbevalor.Enabled:=false;

end;

procedure TfrmContraServ.BtnAlterarClick(Sender: TObject);
begin
novoitem:=true;
dmDados.vTabStt:=false;
dmdados.tbContrato.edit;
BtnCancelar.enabled:= true;
BtnGravar.Enabled:= true;
BtnNovo.Enabled:=False;
BtnPrimeiro.Enabled:=False;
BtnAnterior.Enabled:=False;
BtnProximo.Enabled:=False;
BtnUltimo.Enabled:=False;
BtnAlterar.Enabled:=False;
Btndeletar.Enabled:=False;
BtnLocalizar.Enabled:=False;
{habilitando os objetos}
dbecodigo.Enabled:=true;
dbeCodCli.Enabled:=true;
dbeCliente.Enabled:=true;
dbeInicio.Enabled:=true;
dbeTermino.Enabled:=true;
dbcPeriodo.Enabled:=true;
dbevalor.Enabled:=true;
dbecodigo.SetFocus;
end;

procedure TfrmContraServ.BtnDeletarClick(Sender: TObject);
begin
  if dmdados.tbcontrato.RecordCount=0 then
    begin
    ShowMessage('Tabela vazia');
    end
  else
    If application.MessageBox('Tem certeza que deseja encerrar este tipo de servi�o?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
    begin
     dmdados.tbContrato.Delete;
    end
    else
     dmdados.tbContrato.Cancel;
end;

procedure TfrmContraServ.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TfrmContraServ.BtnLocalizarClick(Sender: TObject);
begin
frmLocServ:=TfrmLocServ.create(application);
frmLocServ.show;
end;

procedure TfrmContraServ.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  Action:= Cafree;
end;

procedure TfrmContraServ.dbcPeriodoExit(Sender: TObject);
begin
if dbcPeriodo.Text = ' ' then
   begin
   ShowMessage('Necess�rio informar o per�odo para realiza��o do servi�o');
   dbcPeriodo.SetFocus;
   end;
end;

procedure TfrmContraServ.dbevalorExit(Sender: TObject);
begin
if dbevalor.text = '' then
   begin
   ShowMessage('Necess�rio informar o VALOR do servi�o');
   dbevalor.SetFocus;
   end;
end;

procedure TfrmContraServ.btLocCliClick(Sender: TObject);
begin
if (dmdados.tbContrato.State=dsEdit)or(dmdados.tbContrato.State=dsInsert) then
begin
frmlocCliente:=TfrmlocCliente.create(application);
frmlocCliente.showmodal;
dmdados.tbContratoCodCli.Value:=frmLocCliente.Resultado;
frmLocCliente.Free;
end;
end;

procedure TfrmContraServ.dbeCodServExit(Sender: TObject);
begin
If NovoItem Then
begin
   If dbeCodServ.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar C�digo do servi�o');
      dbeCodserv.SetFocus;
      End
   else
      begin
      if not dmdados.tbServicos.Locate('CodServ',dbeCodServ.Text,[]) then
         begin
         ShowMessage('SERVI�O  n�o cadastrado');
         dbeCodServ.Clear;
         dbeCodServ.SetFocus;
         end;
      end;
end;
end;

procedure TfrmContraServ.btLocServClick(Sender: TObject);
begin
if (dmdados.tbContrato.State=dsEdit)or(dmdados.tbContrato.State=dsInsert) then
begin
frmlocserv:=TFrmLocServ.create(application);
FrmLocServ.showmodal;
dmdados.tbContratoCodServ.Value:=FrmLocServ.Resultado;
FrmLocServ.Free;
end;
end;

procedure TfrmContraServ.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [F9] Localizar [Esc] Cancelar ou Sair');
  dmDados.vTabStt:=True;
end;

procedure TfrmContraServ.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_Home   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_Delete : if (dmDados.vTabStt) then BtnDeletar.Click;
      VK_End    : if not(dmDados.vTabStt) then BtnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
      VK_F9     : btnLocalizar.Click;
    end;
end;

end.
