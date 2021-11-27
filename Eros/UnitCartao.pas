//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Cadastro e Manuten��o de Conv�nios - Clientes
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponent, JvTransBtn, StdCtrls, Mask, DBCtrls, JvLabel, DB,
  DBTables, fcLabel, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel, ToolEdit, CurrEdit, JvToolEdit,
  JvCurrEdit, JvDBCtrl, EMsgDlg, EUserAcs, EDBZero;

type
  TFrmCartao = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    fcLabel2: TfcLabel;
    LMDBackPanel1: TLMDBackPanel;
    Panel3: TLMDBackPanel;
    btnDeletar: TJvTransparentButton;
    btnUltimo: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    btnProximo: TJvTransparentButton;
    btnPrimeiro: TJvTransparentButton;
    btnNovo: TJvTransparentButton;
    btnGravar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    btnAnterior: TJvTransparentButton;
    btnAlterar: TJvTransparentButton;
    MsgDlg: TEvMsgDlg;
    JvLabel1: TJvLabel;
    dbCod: TDBEdit;
    dbCartao: TDBEdit;
    dbAdmin: TDBEdit;
    dbContato: TDBEdit;
    dbTel1: TDBEdit;
    dbTel2: TDBEdit;
    dbTaxa: TJvDBCalcEdit;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    JvLabel6: TJvLabel;
    JvLabel7: TJvLabel;
    JvLabel8: TJvLabel;
    JvLabel9: TJvLabel;
    EvUserAccess1: TEvUserAccess;
    dbDia: TEvDBZeroEdit;
    dbCarencia: TEvDBZeroEdit;
    procedure btnSairClick(Sender: TObject);
    procedure dbCodExit(Sender: TObject);
    procedure dbDiaExit(Sender: TObject);
    procedure dbCartaoExit(Sender: TObject);
    procedure dbCarenciaExit(Sender: TObject);
    procedure dbAdminExit(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCartao      :  TFrmCartao;
  NovoItem, Mudar:  Boolean;

implementation

uses unitDmDados, UnitPrincipal;

{$R *.dfm}

procedure TFrmCartao.btnSairClick(Sender: TObject);
begin
  DmDados.tbConvenio.Close;
  Close;
end;

procedure TFrmCartao.dbCodExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbConvenio.DatabaseName;
  Tabela.TableName := dmDados.tbConvenio.TableName;
  Tabela.IndexName := dmdados.tbConvenio.IndexName;
  Tabela.Open;
  if NovoItem then
    begin
    if dbCod.Text = '' Then
      begin
      MsgDlg.MsgError('� necess�rio Informar o C�digo');
      dbCod.setfocus;
      end
    else
      begin
      if Tabela.Locate('CodConv',dbCod.Text,[]) then
        begin
        if not ((DmDados.tbConvenio.State=dsEdit) And (dmDados.tbConvenio.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('C�digo j� cadastrado');
          dbCod.Clear;
          dbCod.setfocus;
          end;
        end;
      end;
    end;
  Tabela.Free;
end;

procedure TFrmCartao.dbDiaExit(Sender: TObject);
begin
  if NovoItem then
    if dbDia.Text = '' then
      Begin
      MsgDlg.MsgError('� necess�rio Informar o DIA DE RECEBIMENTO');
      dbDia.setfocus;
      end;
end;

procedure TFrmCartao.dbCartaoExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbConvenio.DatabaseName;
  Tabela.TableName := dmDados.tbConvenio.TableName;
  Tabela.IndexName := dmdados.tbConvenio.IndexName;
  Tabela.Open;
  if NovoItem Then
    begin
    If dbCartao.Text = '' Then
      Begin
      MsgDlg.MsgError('� necess�rio Informar o CONV�NIO');
      dbCartao.setfocus;
      end
    else
      begin
      if Tabela.Locate('Descricao',dbCartao.Text,[]) Then
        begin
        if not ((DmDados.tbConvenio.State=dsEdit) And (dmDados.tbConvenio.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('DESCRI��O j� cadastrado');
          dbCartao.Clear;
          dbCartao.setfocus;
          end
        end;
      end;
    end;
  Tabela.Free;
end;

procedure TFrmCartao.dbCarenciaExit(Sender: TObject);
begin
  if dbCarencia.Text = '' then
    Begin
    MsgDlg.MsgError('� necess�rio Informar a CAR�NCIA');
    dbCarencia.setfocus;
    Panel3.SetFocus;
    end;
end;

procedure TFrmCartao.dbAdminExit(Sender: TObject);
begin
  if dbAdmin.Text = '' then
    Begin
    MsgDlg.MsgError('� necess�rio Informar a ADMINISTRADORA');
    dbAdmin.setfocus;
    end;
end;

procedure TFrmCartao.btnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbConvenio.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmdados.vTabStt:=true
end;

procedure TFrmCartao.btnAnteriorClick(Sender: TObject);
begin
  dmdados.tbConvenio.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  if dmdados.tbConvenio.bof then
    begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    end;
  dmdados.vTabStt:=true;
end;

procedure TFrmCartao.btnProximoClick(Sender: TObject);
begin
  dmdados.tbConvenio.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  if dmdados.tbConvenio.Eof then
    begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    end;
  dmdados.vTabStt:=true;
end;

procedure TFrmCartao.btnUltimoClick(Sender: TObject);
begin
  dmdados.tbConvenio.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmdados.vTabStt:=true;
end;

procedure TFrmCartao.btnNovoClick(Sender: TObject);
begin
  DMDados.tbConvenio.Append;
  NovoItem:=True;
  dmdados.vTabStt:=false;
  {habilitando os bot�es}
  BtnGravar.Enabled := true;
  BtnCancelar.Enabled:=true;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  {habilitando os componentes}
  dbCod.Enabled:=True;
  dbCartao.Enabled:= True;
  dbAdmin.Enabled:=True;
  dbContato.Enabled:=True;
  dbTel1.Enabled:=True;
  dbTel2.Enabled:=True;
  dbTaxa.Enabled:=True;
  dbDia.Enabled:=True;
  dbCarencia.Enabled:=True;
  dbCod.SetFocus;
end;

procedure TFrmCartao.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
  tabela: ttable;
begin
  Campos:='';
  Gravar:=true;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbConvenio.DatabaseName;
  Tabela.TableName := dmDados.tbConvenio.TableName;
  Tabela.IndexName := dmdados.tbConvenio.IndexName;
  Tabela.Open;
  if dbCod.Text='' then
    begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'C�digo';
    Gravar:=false;
    Vazio:=True;
    end
  else
    begin
  if Tabela.Locate('CodConv',dbCod.Text,[]) then
      if not((DmDados.tbConvenio.State=dsEdit) And (dmDados.tbConvenio.RecNo = Tabela.RecNo)) Then
        begin
        Gravar:=false;
        MsgDlg.MsgWarning('C�DIGO j� cadastrado');
        end;
    end;
  if dbCartao.Text='' then
    begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'Descri��o';
    Gravar:=False;
    Vazio:=True;
    end
  else
    begin
    if Tabela.Locate('Descricao',dbCartao.Text,[]) then
      if not((DmDados.tbConvenio.State=dsEdit) And (dmDados.tbConvenio.RecNo = Tabela.RecNo)) Then
        begin
        Gravar:=False;
        MsgDlg.MsgWarning('CONV�NIO j� cadastrado');
        end;
    end;
  if dbDia.Text = '' then
    begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'Dia do Recebimento';
    Gravar:=false;
    Vazio:=True;
    end;
  if dbCarencia.Text = '' then
    begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'Car�ncia';
    Gravar:=false;
    Vazio:=True;
    end;
  if gravar then
    begin
    NovoItem:= False;
    dmdados.tbConvenio.Post;
    dmDados.vTabStt:=True;
    BtnGravar.enabled := False;
    BtnCancelar.Enabled := False;
    BtnNovo.Enabled:=True;
    BtnPrimeiro.Enabled:=True;
    BtnAnterior.Enabled:=True;
    BtnProximo.Enabled:=True;
    BtnUltimo.Enabled:=True;
    if (frmPrincipal.Acesso=1) or (frmPrincipal.Acesso=2) then
      BtnAlterar.Enabled:=True;
    if (frmPrincipal.Acesso=1) then
      Btndeletar.Enabled:=True;
    dbCod.Enabled:=False;
    dbCartao.Enabled:=False;
    dbAdmin.Enabled:=False;
    dbContato.Enabled:=False;
    dbTel1.Enabled:=False;
    dbTel2.Enabled:=False;
    dbTaxa.Enabled:=False;
    dbDia.Enabled:=False;
    dbCarencia.Enabled:=False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    Panel3.SetFocus;
    end
  else
    begin
    if Vazio then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbCartao.SetFocus;
      end;
    end;
  tabela.Free;
end;

procedure TFrmCartao.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbConvenio.cancel;
  NovoItem:= False;
  dmdados.vTabStt:=true;
  {Desabilitando os bot�es}
  BtnGravar.enabled := false;
  BtnCancelar.Enabled := false;
  BtnNovo.Enabled:=True;
  btnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  Btnproximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  if (frmPrincipal.Acesso=1) or (frmPrincipal.Acesso=2) then
    BtnAlterar.Enabled:=True;
  if (frmPrincipal.Acesso=1) then
    Btndeletar.Enabled:=True;
  {Habilitando os componentes}
  dbCod.Enabled:=False;
  dbCartao.Enabled:=False;
  dbAdmin.Enabled:=False;
  dbContato.Enabled:=False;
  dbTel1.Enabled:=False;
  dbTel2.Enabled:=False;
  dbTaxa.Enabled:=False;
  dbDia.Enabled:=False;
  dbCarencia.Enabled:=False;
  Panel3.SetFocus;
end;

procedure TFrmCartao.btnAlterarClick(Sender: TObject);
begin
  if dmdados.tbConvenio.RecordCount=0 then
    MsgDlg.MsgInformation('Tabela vazia')
  else
    begin
    novoitem:=true;
    dmdados.vTabStt:=false;
    dmdados.tbConvenio.Edit;
    BtnCancelar.enabled:= true;
    BtnGravar.Enabled:= true;
    BtnNovo.Enabled:=False;
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    BtnAlterar.Enabled:=False;
    Btndeletar.Enabled:=False;
    //habilitar objetos
    dbCod.Enabled:=True;
    dbCartao.Enabled:= True;
    dbAdmin.Enabled:=True;
    dbContato.Enabled:=True;
    dbTel1.Enabled:=True;
    dbTel2.Enabled:=True;
    dbTaxa.Enabled:=True;
    dbDia.Enabled:=True;
    dbCarencia.Enabled:=True;
    dbCod.SetFocus;
    end;
end;

procedure TFrmCartao.btnDeletarClick(Sender: TObject);
begin
  NovoItem:=False;
  if dmdados.tbConvenio.RecordCount=0 then
    MsgDlg.MsgInformation('Tabela vazia')
  else
    if MsgDlg.MsgConfirmation('Tem certeza que deseja exluir esse registro?') = id_yes then
        dmdados.tbConvenio.Delete;
end;

procedure TFrmCartao.FormActivate(Sender: TObject);
begin
  dmDados.tbConvenio.Open;
  dmDados.tbCliente.Open;
  if (frmPrincipal.Acesso=1) or (frmPrincipal.Acesso=2) then
    BtnAlterar.Enabled:=True;
  if (frmPrincipal.Acesso=1) then
    Btndeletar.Enabled:=True;
  dmDados.vTabStt:=True;
  NovoItem:= false;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
  if dmdados.tbConvenio.RecordCount=0 then
    begin
    Btnprimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=false;
    BtnUltimo.Enabled:=false;
    btnGravar.Enabled:=false;
    btnAlterar.Enabled:=false;
    btnCancelar.Enabled:=false;
    btnDeletar.Enabled:=false;
    end;
end;

procedure TFrmCartao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.HabilitaTeclado:=True;
  dmDados.tbConvenio.Close;
  dmDados.tbCliente.Close;
  Action:= Cafree;
end;

procedure TFrmCartao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_Home   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_Delete : if (dmDados.vTabStt) then BtnDeletar.Click;
      VK_End    : if not(dmDados.vTabStt) then btnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
    end;
end;

procedure TFrmCartao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    end;
end;

end.
