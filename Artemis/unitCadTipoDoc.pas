//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitCadTipoDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, DBCtrls, RXCtrls, ExtCtrls, SpeedBar,
  jpeg, fcButton, fcImgBtn, RXSplit, RackCtls, DbTables, DB,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDShapeHint,
  RxGrdCpt, fcImager, EMsgDlg;

type
  TFrmTipoDoc = class(TForm)
    Panel1: TPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    DBEcod: TDBEdit;
    RxSplitter1: TRxSplitter;
    DBEdesc: TDBEdit;
    DBGridTipoDoc: TDBGrid;
    Panel2: TPanel;
    RxLabel3: TRxLabel;
    RxGradientCaption2: TRxGradientCaption;
    Panel4: TPanel;
    btnDeletar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    btnAlterar: TfcImageBtn;
    btnNovo: TfcImageBtn;
    btnGravar: TfcImageBtn;
    btnProximo: TfcImageBtn;
    btnUltimo: TfcImageBtn;
    btnPrimeiro: TfcImageBtn;
    btnAnterior: TfcImageBtn;
    btnSair: TfcImageBtn;
    Image1: TImage;
    MsgDlg: TEvMsgDlg;
    procedure BtnSairClick(Sender: TObject);
    procedure DBEdescExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
//    procedure BtnLocalizarClick0(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure dbgridTipodocEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnGravarClick(Sender: TObject);
    procedure DBEcodExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTipoDoc: TFrmTipoDoc;
  NovoItem: Boolean;

implementation

uses UnitDmdados, unitPrincipal;

{$R *.DFM}

procedure TFrmTipoDoc.BtnSairClick(Sender: TObject);
begin
  if (DmDados.tbTipoDoc.State=dsEdit) or (dmDados.tbTipoDoc.
                  State = dsInsert) then
      dmDados.tbTipoDoc.Cancel;
  Close;
end;


procedure TFrmTipoDoc.DBEdescExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbTipoDoc.DatabaseName;
  Tabela.TableName := dmDados.TbTipoDoc.TableName;
  Tabela.Open;
  if NovoItem then
    begin
    if dbeDesc.Text = '' then
      begin
      MsgDlg.MsgError('� necess�rio Informar o DOCUMENTO');
      DbeDesc.setfocus;
      end
    else
      begin
      if Tabela.Locate('DESCRICAO',dbeDesc.Text,[]) then
        begin
        if not ((DmDados.tbTipoDoc.State=dsEdit) And (dmDados.tbTipoDoc.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('DOCUMENTO j� Cadastrado');
          dbeDesc.Clear;
          dbeDesc.setfocus;
          end;
        end;
      end;
    end;
  Tabela.Free;
end;

procedure TFrmTipoDoc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.HabilitaTeclado:=True;
  dmDados.tbTipoDoc.Close;
  dmDados.tbCReceber.Close;
  dmDados.TbMovConta.Close;
  dmDados.tbCPagar.Close;
  Action:= Cafree;
end;

procedure TFrmTipoDoc.BtnNovoClick(Sender: TObject);
begin
  DMDados.tbTipoDoc.Append;
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
  dbgridTipodoc.Enabled:=true;
  DBeDesc.Enabled:= True;
  dbeCod.Enabled:=True;
  DBEcod.SetFocus;
end;

procedure TFrmTipoDoc.BtnCancelarClick(Sender: TObject);
begin
  dmdados.tbTipoDoc.cancel;
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
  DbeDesc.enabled:=false;
  dbeCod.Enabled:=False;
  dbgridTipodoc.Enabled:=false;
  Panel4.SetFocus;
end;

procedure TFrmTipoDoc.BtnAlterarClick(Sender: TObject);
begin
  if dmdados.tbTipoDoc.RecordCount=0 then
    MsgDlg.MsgInformation('Tabela vazia')
  else
    begin
    novoitem:=true;
    dmdados.vTabStt:=false;
    dmdados.tbTipoDoc.Edit;
    //habilitar bot�es
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
    dbeDesc.Enabled:=True;
    dbeCod.Enabled:=True;
    dbgridTipodoc.Enabled:=true;
    DBEcod.SetFocus;
    end;
end;

procedure TFrmTipoDoc.BtnDeletarClick(Sender: TObject);
var
  flag:boolean;
begin
  NovoItem:=False;
  Flag:=False;
  if dmdados.tbTipoDoc.RecordCount=0 then
    MsgDlg.MsgInformation('Tabela vazia')
  else
  if MsgDlg.MsgConfirmation('Tem certeza que deseja exluir esse registro?') = id_yes then
    begin
      if dmDados.tbCReceber.Locate('CodDoc',dmDados.tbTipoDocCodDoc.Value,[]) then
        Flag:=True;
      if dmDados.tbMovConta.Locate('CodDoc',dmDados.tbTipoDocCodDoc.Value,[]) then
        Flag:=True;
      if dmDados.tbCPagar.Locate('CodDoc',dmDados.tbTipoDocCodDoc.Value,[]) then
        Flag:=True;
      if Flag then
        MsgDlg.MsgWarning('Documento ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
      else
        dmdados.TbTipoDoc.Delete;
    end
  else
    dmdados.tbTipoDoc.Cancel;
end;


procedure TFrmTipoDoc.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbTipoDoc.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmdados.vTabStt:=true;
end;

procedure TFrmTipoDoc.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.tbTipoDoc.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  if dmdados.TbTipoDoc.bof then
    begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    end;
  dmdados.vTabStt:=true;
end;

procedure TFrmTipoDoc.BtnProximoClick(Sender: TObject);
begin
  dmdados.tbTipoDoc.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  if dmdados.TbTipoDoc.Eof then
    begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    end;
  dmdados.vTabStt:=true;
end;

procedure TFrmTipoDoc.BtnUltimoClick(Sender: TObject);
begin
  dmdados.tbTipoDoc.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmdados.vTabStt:=true;
end;

procedure TFrmTipoDoc.dbgridTipodocEnter(Sender: TObject);
begin
  NovoItem:=False;
end;

procedure TFrmTipoDoc.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  NovoItem:= false;
  dmDados.tbTipoDoc.Open;
  dmDados.tbCReceber.Open;
  dmDados.TbMovConta.Open;
  dmDados.tbCPagar.Open;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
  if dmdados.TbTipoDoc.RecordCount=0 then
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

procedure TFrmTipoDoc.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmTipoDoc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmTipoDoc.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
  tabela: ttable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbTipoDoc.DatabaseName;
  Tabela.TableName := dmDados.tbTipoDoc.TableName;
  Tabela.IndexName := dmdados.tbTipoDoc.IndexName;
  Tabela.Open;
	if DBEcod.Text='' then
  	begin
    if Length(Campos)>0 then
    	Campos:=Campos+', ';
    Campos:=Campos+'C�digo';
    Gravar:=False;
    Vazio:=True;
  	end
   else
     begin
     if Tabela.Locate('CodDoc',DBEcod.Text,[]) then
       if not((DmDados.tbTipoDoc.State=dsEdit) And (dmDados.tbTipoDoc.RecNo = Tabela.RecNo)) then
          begin
          Gravar:=False;
          MsgDlg.MsgWarning('C�DIGO j� cadastrado');
          end;
     end;
	if dbeDesc.Text='' then
  	begin
    if Length(Campos)>0 then
    	Campos:=Campos+', ';
    Campos:=Campos+'Documento';
    Gravar:=False;
    Vazio:=True;
  	end
   else
     begin
     if Tabela.Locate('Descricao',dbeDesc.Text,[]) then
       if not((DmDados.tbTipoDoc.State=dsEdit) And (dmDados.tbTipoDoc.RecNo = Tabela.RecNo)) then
          begin
          Gravar:=False;
          MsgDlg.MsgWarning('DOCUMENTO j� cadastrado');
          end;
     end;
  if gravar then
    begin
    NovoItem:= False;
    dmdados.tbTipoDoc.Post;
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
    dbgridTipodoc.Enabled:=false;
    dbeDesc.Enabled:=false;
    dbeCod.Enabled:=False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    Panel4.SetFocus;
    end
  else
    begin
    if Vazio then
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      DBEcod.Enabled:=true;
    end;
  Tabela.Free;
end;

procedure TFrmTipoDoc.DBEcodExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbTipoDoc.DatabaseName;
  Tabela.TableName := dmDados.TbTipoDoc.TableName;
  Tabela.Open;
  if NovoItem then
    begin
    if DBEcod.Text = '' then
      begin
      MsgDlg.MsgError('� necess�rio Informar o C�DIGO');
      DBEcod.setfocus;
      end
    else
      begin
      if Tabela.Locate('CodDoc',DBEcod.Text,[]) then
        begin
        if not ((DmDados.tbTipoDoc.State=dsEdit) And (dmDados.tbTipoDoc.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('C�DIGO j� Cadastrado');
          DBEcod.Clear;
          DBEcod.setfocus;
          end;
        end;
      end;
    end;
  Tabela.Free;
end;

procedure TFrmTipoDoc.FormActivate(Sender: TObject);
begin
  dmDados.tbTipoDoc.Open;
  dmDados.tbCReceber.Open;
  dmDados.TbMovConta.Open;
  dmDados.tbCPagar.Open;
  if (frmPrincipal.Acesso=1) or (frmPrincipal.Acesso=2) then
    BtnAlterar.Enabled:=True;
  if (frmPrincipal.Acesso=1) then
    Btndeletar.Enabled:=True;  
end;

end.
