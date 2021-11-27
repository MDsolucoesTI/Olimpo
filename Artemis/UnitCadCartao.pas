//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCadCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxGrdCpt, fcButton, fcImgBtn, Grids, DBGrids, RXSplit, StdCtrls,
  Mask, DBCtrls, RXCtrls, jpeg, fcImager, ExtCtrls, EMsgDlg,dbTables,db,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmCadCartao = class(TForm)
    Image3: TImage;
    RxGradientCaption2: TRxGradientCaption;
    MsgDlg: TEvMsgDlg;
    LMDBackPanel2: TLMDBackPanel;
    RxLabel3: TRxLabel;
    Image1: TImage;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel1: TRxLabel;
    dbeCod: TDBEdit;
    RxLabel4: TRxLabel;
    dbeCodCli: TDBEdit;
    BtnlocCli: TfcImageBtn;
    dbCliente: TDBEdit;
    dbeDesc: TDBEdit;
    RxLabel2: TRxLabel;
    RxLabel8: TRxLabel;
    dbeDia: TDBEdit;
    dbeCarencia: TDBEdit;
    RxLabel9: TRxLabel;
    Panel4: TLMDBackPanel;
    btnPrimeiro: TfcImageBtn;
    btnAnterior: TfcImageBtn;
    btnProximo: TfcImageBtn;
    btnUltimo: TfcImageBtn;
    btnNovo: TfcImageBtn;
    btnGravar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    btnAlterar: TfcImageBtn;
    btnDeletar: TfcImageBtn;
    btnSair: TfcImageBtn;
    RxLabel5: TRxLabel;
    procedure btnSairClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure dbeCodExit(Sender: TObject);
    procedure dbeDescExit(Sender: TObject);
    procedure BtnlocCliClick(Sender: TObject);
    procedure dbeCodCliExit(Sender: TObject);
    procedure dbeDiaExit(Sender: TObject);
    procedure dbeCarenciaExit(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadCartao: TFrmCadCartao;
  NovoItem, Mudar : Boolean;
  
implementation

uses unitDmDados, UnitPrincipal, unitLocCliente;

{$R *.dfm}

procedure TFrmCadCartao.btnSairClick(Sender: TObject);
begin
  if (DmDados.tbConvenio.State=dsEdit) or (DmDados.tbConvenio.State=dsInsert) then
    DmDados.tbConvenio.Cancel;
  Close;
end;

procedure TFrmCadCartao.btnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbConvenio.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmdados.vTabStt:=true
end;

procedure TFrmCadCartao.btnAnteriorClick(Sender: TObject);
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

procedure TFrmCadCartao.btnProximoClick(Sender: TObject);
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

procedure TFrmCadCartao.btnUltimoClick(Sender: TObject);
begin
  dmdados.tbConvenio.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmdados.vTabStt:=true;
end;

procedure TFrmCadCartao.btnNovoClick(Sender: TObject);
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
  dbeCod.Enabled:=True;
  dbeDesc.Enabled:= True;
  dbeDia.Enabled:=True;
  dbeCarencia.Enabled:=True;
  dbeCodCli.Enabled:=True;
  dbeCod.SetFocus;
end;

procedure TFrmCadCartao.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  NovoItem:= false;
  dmDados.tbConvenio.Open;
  dmDados.tbCliente.Open;
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

procedure TFrmCadCartao.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmCadCartao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    end;
end;

procedure TFrmCadCartao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.HabilitaTeclado:=True;
  dmDados.tbConvenio.Close;
  dmDados.tbCliente.Close;
  Action:= Cafree;
end;

procedure TFrmCadCartao.btnAlterarClick(Sender: TObject);
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
    dbeCod.Enabled:=True;
    dbeDesc.Enabled:= True;
    dbeDia.Enabled:=True;
    dbeCarencia.Enabled:=True;
    dbeCodCli.Enabled:=True;
    dbeCod.SetFocus;
    end;
end;

procedure TFrmCadCartao.btnDeletarClick(Sender: TObject);
begin
  NovoItem:=False;
  if dmdados.tbConvenio.RecordCount=0 then
    MsgDlg.MsgInformation('Tabela vazia')
  else
    if MsgDlg.MsgConfirmation('Tem certeza que deseja exluir esse registro?') = id_yes then
        dmdados.tbConvenio.Delete;
end;

procedure TFrmCadCartao.dbeCodExit(Sender: TObject);
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
    if dbecod.Text = '' Then
      begin
      MsgDlg.MsgError('� necess�rio Informar o C�digo');
      Dbecod.setfocus;
      end
    else
      begin
      if Tabela.Locate('CodConv',dbecod.Text,[]) then
        begin
        if not ((DmDados.tbConvenio.State=dsEdit) And (dmDados.tbConvenio.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('C�digo j� cadastrado');
          dbecod.Clear;
          dbecod.setfocus;
          end;
        end;
      end;
    end;
  Tabela.Free;
end;

procedure TFrmCadCartao.dbeDescExit(Sender: TObject);
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
    If dbeDesc.Text = '' Then
      Begin
      MsgDlg.MsgError('� necess�rio Informar a DESCRI��O');
      DbeDesc.setfocus;
      end
    else
      begin
      if Tabela.Locate('Descricao',dbeDesc.Text,[]) Then
        begin
        if not ((DmDados.tbConvenio.State=dsEdit) And (dmDados.tbConvenio.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('DESCRI��O j� cadastrado');
          dbeDesc.Clear;
          dbeDesc.setfocus;
          end
        end;
      end;
    end;
  Tabela.Free;
end;

procedure TFrmCadCartao.BtnlocCliClick(Sender: TObject);
begin
  if (dmdados.tbConvenio.State=DsInsert)or(dmdados.tbConvenio.State=DsEdit) then
    begin
    FrmLocCliente:=TFrmLocCliente.Create(application);
    FrmLocCliente.Showmodal;
    dmDados.tbConvenioCodcli.Value:=frmLocCliente.Resultado;
    frmLocCliente.Free;
    end;
end;

procedure TFrmCadCartao.dbeCodCliExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbConvenio.DatabaseName;
  Tabela.TableName := dmDados.tbConvenio.TableName;
  Tabela.IndexName := dmdados.tbConvenio.IndexName;
  Tabela.Open;
  if NovoItem then
    if dbeCodCli.Text= '' then
      begin
      MsgDlg.MsgWarning('� obrigat�rio o C�DIGO DO CLIENTE');
      dbeCodCli.SetFocus;
      end
    else
      if not (dmdados.tbCliente.Locate('CodCli',dbeCodCli.text,[])) then
        begin
        MsgDlg.MsgWarning('C�DIGO DO CLIENTE n�o cadastrado!');
        dbeCodCli.SetFocus;
        end
      else
        if Tabela.Locate('CodCli',dbeCodCli.Text,[]) then
          if not ((DmDados.tbConvenio.State=dsEdit) And (dmDados.tbConvenio.RecNo = Tabela.RecNo)) then
            begin
            MsgDlg.MsgWarning('Cliente com conv�nio');
            dbeCodCli.Clear;
            dbeCodCli.setfocus;
            end;
end;

procedure TFrmCadCartao.dbeDiaExit(Sender: TObject);
begin
  if NovoItem then
    if dbeDia.Text = '' then
      Begin
      MsgDlg.MsgError('� necess�rio Informar o DIA DE RECEBIMENTO');
      dbeDia.setfocus;
      end;
end;

procedure TFrmCadCartao.dbeCarenciaExit(Sender: TObject);
begin
  if dbeCarencia.Text = '' then
    Begin
    MsgDlg.MsgError('� necess�rio Informar a CAR�NCIA');
    dbeCarencia.setfocus;
    end;
end;

procedure TFrmCadCartao.btnGravarClick(Sender: TObject);
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
  if dbeCod.Text='' then
    begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'C�digo';
    Gravar:=false;
    Vazio:=True;
    end
  else
    begin
    if Tabela.Locate('CodConv',dbeCod.Text,[]) then
      if not((DmDados.tbConvenio.State=dsEdit) And (dmDados.tbConvenio.RecNo = Tabela.RecNo)) Then
        begin
        Gravar:=false;
        MsgDlg.MsgWarning('C�DIGO j� cadastrado');
        end;
    end;
  if dbeDesc.Text='' then
    begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'Descri��o';
    Gravar:=False;
    Vazio:=True;
    end
  else
    begin
    if Tabela.Locate('Descricao',dbeDesc.Text,[]) then
      if not((DmDados.tbConvenio.State=dsEdit) And (dmDados.tbConvenio.RecNo = Tabela.RecNo)) Then
        begin
        Gravar:=False;
        MsgDlg.MsgWarning('CONV�NIO j� cadastrado');
        end;
    end;
  if dbeDia.Text = '' then
    begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'Dia do Recebimento';
    Gravar:=false;
    Vazio:=True;
    end;
  if dbeCarencia.Text = '' then
    begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'Car�ncia';
    Gravar:=false;
    Vazio:=True;
    end;
    if dbeCodCli.Text= '' then
      begin
      if Length(Campos)>0 then Campos:=Campos+', ';
      Campos:=Campos+'C�digo do Cliente';
      Gravar:=false;
      Vazio:=True;
      end
    else
      if not (dmdados.tbCliente.Locate('CodCli',dbeCodCli.text,[])) then
        begin
        Gravar:=False;
        MsgDlg.MsgWarning('C�DIGO DO CLIENTE n�o cadastrado!');
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
    dbeCod.Enabled:=false;
    dbeDesc.Enabled:=false;
    dbeCodCli.Enabled:=False;
    dbeDia.Enabled:=False;
    dbeCarencia.Enabled:=False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    Panel4.SetFocus;
    end
  else
    begin
    if Vazio then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbeCod.SetFocus;
      end;
    end;
  tabela.Free;
end;

procedure TFrmCadCartao.btnCancelarClick(Sender: TObject);
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
  dbeCod.Enabled:=false;
  dbeDesc.Enabled:=false;
  dbeCodCli.Enabled:=False;
  dbeDia.Enabled:=False;
  dbeCarencia.Enabled:=False;
  Panel4.SetFocus;
end;

procedure TFrmCadCartao.FormActivate(Sender: TObject);
begin
  dmDados.tbConvenio.Open;
  dmDados.tbCliente.Open;
  if (frmPrincipal.Acesso=1) or (frmPrincipal.Acesso=2) then
    BtnAlterar.Enabled:=True;
  if (frmPrincipal.Acesso=1) then
    Btndeletar.Enabled:=True;
end;

end.
