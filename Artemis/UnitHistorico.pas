//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitHistorico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, DBCtrls, RXCtrls, ExtCtrls, SpeedBar,
  jpeg, RXSplit, fcButton, fcImgBtn, RackCtls, DbTables, DB,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDShapeHint,
  RxGrdCpt, fcImager, EMsgDlg;

type
  TFrmHistorico = class(TForm)
    Panel1: TPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    DBEcod: TDBEdit;
    DBGridHistorico: TDBGrid;
    RxSplitter1: TRxSplitter;
    DBEdesc: TDBEdit;
    Panel2: TPanel;
    RxLabel5: TRxLabel;
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
    Image1: TImage;
    btnSair: TfcImageBtn;
    RxGradientCaption2: TRxGradientCaption;
    MsgDlg: TEvMsgDlg;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdescExit(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridHistoricoEnter(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGravarClick(Sender: TObject);
    procedure DBEcodExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHistorico: TFrmHistorico;
  NovoItem,Mudar: Boolean;

implementation

uses UnitDmdados, unitPrincipal;

{$R *.DFM}

procedure TFrmHistorico.BtnSairClick(Sender: TObject);
begin
  if (DmDados.tbHistorico.State=dsEdit) or (dmDados.tbHistorico.State=dsInsert) then
    dmDados.tbHistorico.Cancel;
  Close;
end;

procedure TFrmHistorico.FormClose(Sender: TObject;
var
  Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.HabilitaTeclado:=True;
  dmDados.tbHistorico.Close;
  dmDados.tbCReceber.Close;
  dmDados.TbMovConta.Close;
  dmDados.tbCPagar.Close;
  Action:=Cafree;
end;

procedure TFrmHistorico.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmHistorico.DBEdescExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbHistorico.DatabaseName;
  Tabela.TableName := dmDados.TbHistorico.TableName;
  Tabela.IndexName := dmdados.tbHistorico.IndexName;
  Tabela.Open;
  if NovoItem then
    if dbeDesc.Text = '' then
      Begin
      MsgDlg.MsgError('� necess�rio Informar a DESCRI��O DO HIST�RICO');
      DbeDesc.setfocus;
      end
    else
      begin
      if Tabela.Locate('DESCRICAO',dbeDesc.Text,[]) then
        begin
        if not((DmDados.tbHistorico.State=dsEdit) And (dmDados.tbHistorico.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('DESCRI��O DO HIST�RICO j� Cadastrada');
          dbeDesc.setfocus;
          End
        else
          begin
          Panel4.SetFocus;
          dbgridHistorico.Enabled:=false;
          end;
        end;
     end;
  Tabela.Free;
end;

procedure TFrmHistorico.BtnAlterarClick(Sender: TObject);
begin
  if dmdados.TbHistorico.RecordCount=0 then
    MsgDlg.MsgInformation('Tabela vazia')
  else
    begin
    novoitem:=true;
    dmdados.vTabStt:=false;
    dmdados.tbHistorico.Edit;
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
    dbgridHistorico.Enabled:=true;
    DBEcod.SetFocus;
    end;
end;

procedure TFrmHistorico.BtnDeletarClick(Sender: TObject);
var
   flag:boolean;
begin
  NovoItem:=False;
  flag:=false;
  if dmdados.tbHistorico.RecordCount=0 then
    MsgDlg.MsgInformation('Tabela vazia')
  else
    If MsgDlg.MsgConfirmation('Tem certeza que deseja excluir esse registro?') = id_yes then
      begin
      if dmdados.tbCReceber.Locate('CodHist',dmdados.tbHistoricoCodHist.Value,[]) then
        flag:=true;
      if dmdados.TbMovConta.Locate('CodHist',dmdados.tbHistoricoCodHist.Value,[]) then
        flag:=true;
      if dmdados.tbCPagar.Locate('CodHist',dmdados.tbHistoricoCodHist.Value,[]) then
        flag:=true;
      if flag then
        MsgDlg.MsgWarning('Hist�rico ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
      else
        dmdados.tbHistorico.Delete;
      end
    else
      dmdados.tbHistorico.Cancel;
end;

procedure TFrmHistorico.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  NovoItem:= false;
  dmDados.tbHistorico.Open;
  dmDados.tbCReceber.Open;
  dmDados.TbMovConta.Open;
  dmDados.tbCPagar.Open;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
  if dmdados.TbHistorico.RecordCount=0 then
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

procedure TFrmHistorico.DBGridHistoricoEnter(Sender: TObject);
begin
  NovoItem:=False;
end;

procedure TFrmHistorico.BtnCancelarClick(Sender: TObject);
begin
  dmdados.tbHistorico.cancel;
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
  dbeCod.Enabled:=False;
  DbeDesc.enabled:=false;
  dbgridHistorico.Enabled:=false;
  Panel4.SetFocus;
end;

procedure TFrmHistorico.BtnNovoClick(Sender: TObject);
begin
  DMDados.tbHistorico.Append;
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
  dbgridHistorico.Enabled:=true;
  DBeDesc.Enabled:= True;
  dbeCod.Enabled:=True;
  DBEcod.SetFocus;
end;

procedure TFrmHistorico.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbHistorico.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmdados.vTabStt:=true;
end;

procedure TFrmHistorico.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.tbHistorico.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  if dmdados.TbHistorico.bof then
    begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    end;
  dmdados.vTabStt:=true;
end;

procedure TFrmHistorico.BtnProximoClick(Sender: TObject);
begin
  dmdados.tbHIstorico.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  if dmdados.TbHistorico.Eof then
    begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    end;
  dmdados.vTabStt:=true;
end;

procedure TFrmHistorico.BtnUltimoClick(Sender: TObject);
begin
  dmdados.tbHistorico.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmdados.vTabStt:=true;
end;

procedure TFrmHistorico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_Home   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_Delete : if (dmDados.vTabStt) then BtnDeletar.Click;
      VK_End    : if not(dmDados.vTabStt) then BTNgRAVAR.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
    end;
end;

procedure TFrmHistorico.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
  tabela: ttable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbHistorico.DatabaseName;
  Tabela.TableName := dmDados.tbHistorico.TableName;
  Tabela.IndexName := dmdados.tbHistorico.IndexName;
  Tabela.Open;
	If DBEcod.Text='' Then
  	Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'C�digo do Hist�rico';
    Gravar:=False;
    Vazio:=True;
  	End
   else
     begin
     if Tabela.Locate('CodHist',DBEcod.Text,[]) then
       if not((DmDados.tbHistorico.State=dsEdit) And (dmDados.tbHistorico.RecNo = Tabela.RecNo)) then
          begin
          Gravar:=False;
          MsgDlg.MsgWarning('C�DIGO DO HIST�RICO j� cadastrado');
          end;
     end;
	If dbeDesc.Text='' Then
  	Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Descri��o do Hist�rico';
    Gravar:=False;
    Vazio:=True;
  	End
   else
     begin
     if Tabela.Locate('Descricao',dbeDesc.Text,[]) then
       if not((DmDados.tbHistorico.State=dsEdit) And (dmDados.tbHistorico.RecNo = Tabela.RecNo)) then
          begin
          Gravar:=False;
          MsgDlg.MsgWarning('DESCRI��O DE HIST�RICO j� cadastrado');
          end;
     end;
  if gravar then
    begin
    NovoItem:= False;
    dmdados.tbHistorico.Post;
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
    dbgridHistorico.Enabled:=false;
    dbeDesc.Enabled:=false;
    dbeCod.Enabled:=False;
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

procedure TFrmHistorico.DBEcodExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbHistorico.DatabaseName;
  Tabela.TableName := dmDados.TbHistorico.TableName;
  Tabela.IndexName := dmdados.tbHistorico.IndexName;
  Tabela.Open;
  if NovoItem then
    if DBEcod.Text = '' then
      Begin
      MsgDlg.MsgError('� necess�rio Informar o C�DIGO DO HIST�RICO');
      DBEcod.setfocus;
      end
    else
      begin
      if Tabela.Locate('CodHist',DBEcod.Text,[]) then
        begin
        if not((DmDados.tbHistorico.State=dsEdit) And (dmDados.tbHistorico.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('C�DIGO DO HIST�RICO j� Cadastrada');
          DBEcod.setfocus;
          End
        else
          begin
          Panel4.SetFocus;
          dbgridHistorico.Enabled:=false;
          end;
        end;
     end;
  Tabela.Free;
end;

procedure TFrmHistorico.FormActivate(Sender: TObject);
begin
  dmDados.tbHistorico.Open;
  dmDados.tbCReceber.Open;
  dmDados.TbMovConta.Open;
  dmDados.tbCPagar.Open;
  if (frmPrincipal.Acesso=1) or (frmPrincipal.Acesso=2) then
    BtnAlterar.Enabled:=True;
  if (frmPrincipal.Acesso=1) then
    Btndeletar.Enabled:=True;
end;

end.
