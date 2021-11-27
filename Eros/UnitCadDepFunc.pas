//////////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Cadastro e Manuten��o de Dependentes - Funcion�rios
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////////

unit UnitCadDepFunc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, RxGrdCpt, fcButton, fcImgBtn, ExtCtrls, StdCtrls,
  DBCtrls, ToolEdit, RXDBCtrl, Mask, Grids, DBGrids, RXSplit, RXCtrls,
  jpeg, fcImager, Db, DbTables, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmCadDepFunc = class(TForm)
    MsgDlg: TEvMsgDlg;
    RxLabel2: TRxLabel;
    Image1: TImage;
    dbNome: TDBEdit;
    RxLabel22: TRxLabel;
    Bevel1: TBevel;
    DBgridDepFunc: TDBGrid;
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
    procedure dbNomeExit(Sender: TObject);
    procedure DBedtNascExit(Sender: TObject);
    procedure dbcmbParenExit(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadDepFunc: TFrmCadDepFunc;
  novoitem: boolean;

implementation

uses unitDmDados, UnitPrincipal;

{$R *.dfm}

procedure TFrmCadDepFunc.dbNomeExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  If NovoItem Then
    Begin
    Tabela := TTable.Create(Application);
    Tabela.DatabaseName := dmDados.tbDepenFunc.DatabaseName;
    Tabela.TableName := dmDados.tbDepenFunc.TableName;
    Tabela.IndexName := dmDados.tbDepenFunc.IndexName;
    Tabela.MasterSource := dmDados.tbDepenFunc.MasterSource;
    Tabela.MasterFields := dmDados.tbDepenFunc.MasterFields;
    Tabela.Open;
    If dbNome.Text= '' then
      begin
      MsgDlg.MsgWarning('� obrigat�rio o Nome do Dependente');
      dbNome.SetFocus;
      end
    else
      Begin
      If Tabela.Locate('NomeDep',dbNome.Text,[]) Then
        If (DmDados.tbDepenFunc.State=dsEdit) And (dmDados.tbDepenFunc.RecNo = Tabela.RecNo) Then
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

procedure TFrmCadDepFunc.DBedtNascExit(Sender: TObject);
begin
  If NovoItem Then
    If DBedtNasc.Text= '  /  /    ' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio a Data de Nascimento');
      DBedtNasc.SetFocus;
      End;
end;

procedure TFrmCadDepFunc.dbcmbParenExit(Sender: TObject);
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

procedure TFrmCadDepFunc.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadDepFunc.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar,Flag:Boolean;
  x:Integer;
  Tabela: TTable;
begin
  btnGravar.Default:= False;
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbDepenFunc.DatabaseName;
  Tabela.TableName    := dmDados.tbDepenFunc.TableName;
  Tabela.IndexName    := dmDados.tbDepenFunc.IndexName;
  Tabela.MasterSource := dmDados.tbDepenFunc.MasterSource;
  Tabela.MasterFields := dmDados.tbDepenFunc.MasterFields;
  Tabela.Open;
  //Campo que n�o pode repetir
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
      If Not((DmDados.tbDepenFunc.State=dsEdit) And (dmDados.tbDepenFunc.RecNo = Tabela.RecNo)) Then
        Begin
       	Gravar:=False;
        MsgDlg.MsgWarning('Dependente j� Cadastrado');
        End;
  //Campos com uso de Combo
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
  //Campo Data n�o podendo ser vazio
  If DBedtNasc.Text= '  /  /    ' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Data Nascimento';
    Gravar:=False;
    Vazio:=True;
    End;
  If Gravar Then
    Begin
    NovoItem:= False;
    dmdados.tbDepenFunc.Post;
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
    End
  Else
    Begin
    If Vazio Then
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    	dbNome.SetFocus;
    end;
  Tabela.Free;
  dmDados.tbDepenFunc.Append;
end;

procedure TFrmCadDepFunc.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  NovoItem:= false;
  dmDados.tbDepenFunc.Open;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [F9] Localizar [Delete] Excluir [Esc] Cancelar ou Sair');
  if dmdados.tbDepenFunc.RecordCount=0 then
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

procedure TFrmCadDepFunc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.tbDepenFunc.Close;
  dmDados.HabilitaTeclado:=True;
  Action:= Cafree;
end;

procedure TFrmCadDepFunc.btnPrimeiroClick(Sender: TObject);
begin
  DMDados.tbDepenFunc.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadDepFunc.btnAnteriorClick(Sender: TObject);
begin
  DMDados.tbDepenFunc.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If DMDados.tbDepenFunc.Bof Then
    Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadDepFunc.btnProximoClick(Sender: TObject);
begin
  DMDados.tbDepenFunc.Next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If DMDados.tbDepenFunc.Eof Then
    Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadDepFunc.btnUltimoClick(Sender: TObject);
begin
  DMDados.tbDepenFunc.Last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadDepFunc.btnNovoClick(Sender: TObject);
begin
  DMDados.tbDepenFunc.Append;
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

procedure TFrmCadDepFunc.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbDepenFunc.cancel;
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

procedure TFrmCadDepFunc.btnAlterarClick(Sender: TObject);
begin
  if dmdados.tbDepenFunc.RecordCount=0 then
    MsgDlg.MsgError('Tabela vazia')
  else
    begin
    novoitem:=true;
    dmdados.vTabStt:=false;
    dmdados.tbDepenFunc.Edit;
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

procedure TFrmCadDepFunc.btnDeletarClick(Sender: TObject);
begin
  if dmdados.tbDepenFunc.RecordCount=0 then
    MsgDlg.MsgError('Tabela sem registro')
  else
    If Application.MessageBox('Tem certeza que deseja excluir este Dependente?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      dmDados.tbDepenFunc.Delete;
      dmDados.tbDepenFunc.Refresh;
end;

procedure TFrmCadDepFunc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmCadDepFunc.FormKeyDown(Sender: TObject; var Key: Word;
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

end.
