///////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Cadastro e Manuten��o de Dependentes - Clientes
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untDepende;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolEdit, RXDBCtrl, Grids, DBGrids, SpeedBar, jpeg, ExtCtrls, StdCtrls,
  RackCtls, fcButton, fcImgBtn, RXSplit, Mask, DBCtrls, RXCtrls, ComCtrls,
  db,dbutils, CurrEdit,dbTables, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint, EFocCol, RxGrdCpt, fcImager, EMsgDlg,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TfrmDependentes = class(TForm)
    MsgDlg: TEvMsgDlg;
    RxLabel2: TRxLabel;
    Image1: TImage;
    RxLabel22: TRxLabel;
    dbNome: TDBEdit;
    Bevel1: TBevel;
    DBgridCargo: TDBGrid;
    RxLabel23: TRxLabel;
    DBedtNasc: TDBDateEdit;
    RxLabel24: TRxLabel;
    dbcmbParen: TDBComboBox;
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
    LMDBackPanel2: TPanel;
    Panel3: TPanel;
    LMDBackPanel1: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnGravarClick(Sender: TObject);
    procedure dbNomeExit(Sender: TObject);
    procedure DBedtNascExit(Sender: TObject);
    procedure dbcmbParenExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDependentes: TfrmDependentes;
  NovoItem,mudar,vAltera:Boolean;

implementation

uses UnitDmDados, unitPrincipal;

{$R *.DFM}

procedure TfrmDependentes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.tbDepende.Close;
  dmDados.HabilitaTeclado:=True;
  Action:= Cafree;
end;

procedure TfrmDependentes.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmDependentes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TfrmDependentes.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  NovoItem:= false;
  dmdados.tbDepende.Open;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [F9] Localizar [Delete] Excluir [Esc] Cancelar ou Sair');
  if dmdados.tbDepende.RecordCount=0 then
    begin
    btnPrimeiro.Enabled:=false;
    btnAnterior.Enabled:=false;
    btnProximo.Enabled:=false;
    btnUltimo.Enabled:=false;
    btnAlterar.Enabled:=false;
    btnGravar.Enabled:=false;
    btnCancelar.Enabled:=false;
    BtnDeletar.Enabled:=false;
    end;
end;

procedure TfrmDependentes.BtnNovoClick(Sender: TObject);
begin
  DMDados.tbDepende.Append;
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
  dbNome.Enabled:=True;
  DBedtNasc.Enabled:= True;
  dbcmbParen.Enabled:=True;
  dbNome.SetFocus;
end;

procedure TfrmDependentes.BtnCancelarClick(Sender: TObject);
begin
  dmdados.tbDepende.cancel;
  NovoItem:= False;
  dmdados.vTabStt:=true;
  {Desabilitando os bot�es}
  BtnGravar.enabled := false;
  BtnCancelar.Enabled := false;
  BtnNovo.Enabled:=True;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  Btnproximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  {Habilitando os componentes}
  dbNome.Enabled:=False;
  DBedtNasc.Enabled:= False;
  dbcmbParen.Enabled:=False;
  Panel3.SetFocus;
end;

procedure TfrmDependentes.BtnAlterarClick(Sender: TObject);
begin
  if dmdados.tbDepende.RecordCount=0 then
    MsgDlg.MsgError('Tabela vazia')
  else
    begin
    novoitem:=true;
    dmdados.vTabStt:=false;
    dmdados.tbDepende.Edit;
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
    dbNome.Enabled:=True;
    DBedtNasc.Enabled:= True;
    dbcmbParen.Enabled:=True;
    dbNome.SetFocus;
    end;
end;

procedure TfrmDependentes.BtnDeletarClick(Sender: TObject);
begin
  if dmdados.tbDepende.RecordCount=0 then
    MsgDlg.MsgError('Tabela sem registro')
  else
    If Application.MessageBox('Tem certeza que deseja excluir este Dependente?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      dmDados.tbDepende.Delete;
      dmDados.tbDepende.Refresh;
end;

procedure TfrmDependentes.BtnPrimeiroClick(Sender: TObject);
begin
  DMDados.tbDepende.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmDados.vTabStt:=True;
end;

procedure TfrmDependentes.BtnAnteriorClick(Sender: TObject);
begin
  DMDados.tbDepende.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If DMDados.tbDepende.Bof Then
    Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TfrmDependentes.BtnProximoClick(Sender: TObject);
begin
  DMDados.tbDepende.Next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If DMDados.tbDepende.Eof Then
    Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TfrmDependentes.BtnUltimoClick(Sender: TObject);
begin
  DMDados.tbDepende.Last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmDados.vTabStt:=True;
end;

procedure TfrmDependentes.FormKeyDown(Sender: TObject; var Key: Word;
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
    end;
end;

procedure TfrmDependentes.BtnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar,Flag:Boolean;
  tabela: ttable;
  x:integer;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbDepende.DatabaseName;
  Tabela.TableName := dmDados.tbDepende.TableName;
  Tabela.IndexName := dmdados.tbDepende.IndexName;
  Tabela.MasterSource := dmDados.tbDepende.MasterSource;
  Tabela.MasterFields := dmDados.tbDepende.MasterFields;
  Tabela.Open;
  If dbNome.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Nome Dependente';
    Gravar:=False;
    Vazio:=True;
    end
  else
    If Tabela.Locate('NomeDep',dbNome.Text,[]) Then
      If Not((DmDados.tbDepende.State=dsEdit) And (dmDados.tbDepende.RecNo = Tabela.RecNo)) Then
        Begin
       	Gravar:=False;
        MsgDlg.MsgWarning('Dependente j� Cadastrado');
        End;
  If dbcmbParen.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Parentesco';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to dbcmbParen.Items.Count-1 Do
      If dbcmbParen.Text=dbcmbParen.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      MsgDlg.MsgWarning('Valor de Parentesco inv�lido');
      Gravar:=False;
      End;
    End;
  If DBedtNasc.Text= '  /  /    ' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Data Nascimento';
    Gravar:=False;
    Vazio:=True;
    End;
  if gravar then
    begin
    NovoItem:= False;
    dmdados.tbDepende.Post;
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
    dbNome.Enabled:=False;
    DBedtNasc.Enabled:= False;
    dbcmbParen.Enabled:=False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    Panel3.SetFocus;
    end
  else
    If Vazio Then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbNome.SetFocus;
      end;
  Tabela.Free;
  dmDados.tbDepende.Append;
end;

procedure TfrmDependentes.dbNomeExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  If NovoItem Then
    Begin
    Tabela := TTable.Create(Application);
    Tabela.DatabaseName := dmDados.tbDepende.DatabaseName;
    Tabela.TableName := dmDados.tbDepende.TableName;
    Tabela.IndexName := dmDados.tbDepende.IndexName;
    Tabela.MasterSource := dmDados.tbDepende.MasterSource;
    Tabela.MasterFields := dmDados.tbDepende.MasterFields;
    Tabela.Open;
    If dbNome.Text= '' then
      begin
      MsgDlg.MsgWarning('� obrigat�rio o Nome do Dependente');
      dbNome.SetFocus;
      end
    else
      Begin
      If Tabela.Locate('NomeDep',dbNome.Text,[]) Then
        If (DmDados.tbDepende.State=dsEdit) And (dmDados.tbDepende.RecNo = Tabela.RecNo) Then
        Else
          Begin
          MsgDlg.MsgWarning('Dependente j� Cadastrado');
          dbNome.Clear;
          dbNome.setfocus;
          End;
      End;
    Tabela.Free;
  end;
end;

procedure TfrmDependentes.DBedtNascExit(Sender: TObject);
begin
  If NovoItem Then
    If DBedtNasc.Text= '  /  /    ' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio a Data de Nascimento');
      DBedtNasc.SetFocus;
      End;
end;

procedure TfrmDependentes.dbcmbParenExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If NovoItem Then
    Begin
    If dbcmbParen.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio informar o Parentesco');
      dbcmbParen.SetFocus;
      End
    Else
      Begin
      Flag:=True;
      For x:=0 to dbcmbParen.Items.Count-1 Do
        If dbcmbParen.Text=dbcmbParen.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        MsgDlg.MsgWarning('Valor de Parentesco inv�lido');
        dbcmbParen.SetFocus;
        End
      Else
        Begin
        btnGravar.Default:= True;
        btnGravar.SetFocus;
        End;
      End;
    End;
end;

end.
