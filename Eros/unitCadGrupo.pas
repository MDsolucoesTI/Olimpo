//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Cadastro e Manuten��o de Grupos - Produtos
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCadGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RackCtls, SpeedBar, Grids, DBGrids, RXDBCtrl, RXSplit, fcButton,
  fcImgBtn, StdCtrls, Mask, DBCtrls, RXCtrls, ExtCtrls, jpeg, db, dbTABLES,
  EFocCol, RxGrdCpt, TFlatSplitterUnit, fcImager, EMsgDlg, EUserAcs,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmCadGrupo = class(TForm)
    MsgDlg: TEvMsgDlg;
    UserAcess: TEvUserAccess;
    RxLabel3: TRxLabel;
    Image1: TImage;
    RxLabel1: TRxLabel;
    DBEdit2: TDBEdit;
    Bevel1: TBevel;
    GridGrupo: TRxDBGrid;
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
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit2Exit(Sender: TObject);
    procedure btngravarClick(Sender: TObject);
    procedure GridGrupoEnter(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadGrupo: TFrmCadGrupo;
  NovoItem: Boolean;

implementation

uses unitDmDados, unitPrincipal;

{$R *.dfm}

procedure TFrmCadGrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.tbGrupo.Close;
  Action:= caFree;
end;

procedure TFrmCadGrupo.DBEdit2Exit(Sender: TObject);
Var
  Tabela: TTable;
begin
  If NovoItem Then
    Begin
    Tabela := TTable.Create(Application);
    Tabela.DatabaseName := dmDados.tbGrupo.DatabaseName;
    Tabela.TableName := dmDados.tbGrupo.TableName;
    Tabela.Open;
    If DBEdit2.Text= '' then
      begin
      MsgDlg.MsgWarning('� obrigat�rio o Nome do Grupo');
      DBEdit2.SetFocus;
      end
    else
      Begin
      If Tabela.Locate('Grupo',DBEdit2.Text,[]) Then
        If (DmDados.tbGrupo.State=dsEdit) And (dmDados.tbGrupo.RecNo = Tabela.RecNo) Then
        Else
          Begin
          MsgDlg.MsgWarning('Grupo j� Cadastrado');
          DBEdit2.Clear;
          DBEdit2.setfocus;
          End;
    Tabela.Free;
      end;
    end;
Panel3.setfocus;
end;


procedure TFrmCadGrupo.GridGrupoEnter(Sender: TObject);
begin
  NovoItem:=False;
end;

procedure TFrmCadGrupo.BtnPrimeiroClick(Sender: TObject);
begin
  DMDados.tbGrupo.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadGrupo.BtnAnteriorClick(Sender: TObject);
begin
  DMDados.tbGrupo.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If DMDados.tbGrupo.Bof Then
    Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadGrupo.BtnProximoClick(Sender: TObject);
begin
  DMDados.tbGrupo.Next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If DMDados.tbGrupo.Eof Then
    Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadGrupo.BtnUltimoClick(Sender: TObject);
begin
  DMDados.tbGrupo.Last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadGrupo.BtnNovoClick(Sender: TObject);
begin
  dmdados.tbGrupo.append;
  NovoItem:= True;
  dmDados.vTabStt:=False;
  BtnGravar.Enabled := true;
  BtnCancelar.Enabled:=true;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  {desabilitando os componentes}
  gridgrupo.enabled:=true;
  Dbedit2.enabled:=True;
  dbedit2.SetFocus;
  UserAcess.ForceDefinitions;
end;

procedure TFrmCadGrupo.BtnCancelarClick(Sender: TObject);
begin
  dmdados.tbGrupo.cancel;
  NovoItem:= False;
  btngravar.Enabled:=false;
  {Habilitando os bot�es}
  BtnNovo.Enabled:=True;
  BtnCancelar.Enabled := false;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  Panel3.SetFocus;
  {habilitando os objetos}
  gridgrupo.enabled:=true;
  DBEdit2.Enabled:=false;
  dmDados.vTabStt:=True;
  Panel3.SetFocus;
  UserAcess.ForceDefinitions;
end;

procedure TFrmCadGrupo.BtnAlterarClick(Sender: TObject);
begin
  if dmdados.tbGrupo.RecordCount=0 then
    MsgDlg.MsgError('Tabela sem registro!!!')
  else
    begin
    novoitem:=true;
    dmdados.tbGRupo.Edit;
    dbedit2.Enabled:=True;
    btnGravar.Enabled:=True;
    btnCancelar.Enabled:=true;
    Dbedit2.SetFocus;
  {habilitando os bot�es}
    BtnCancelar.Enabled:=True;
    BtnGravar.Enabled:=True;
    BtnNovo.Enabled:=False;
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    BtnAlterar.Enabled:=False;
    Btndeletar.Enabled:=False;
  {habilitando os componentes}
    DBEdit2.Enabled:=True;
    dmDados.vTabStt:=False;
    DBEdit2.SetFocus;
    End;
  UserAcess.ForceDefinitions;
end;

procedure TFrmCadGrupo.BtnDeletarClick(Sender: TObject);
begin
  If dmDados.tbGrupo.RecordCount=0 Then
    MsgDlg.MsgError('Tabela vazia!!!')
  Else
    if Application.MessageBox('Deseja realmente excluir o registro?','Aten��o !',MB_YESNO + MB_DEFBUTTON2 + MB_ICONEXCLAMATION) = IDYES then
      if dmDados.tbSubGrupo.Locate('CodGrupo',dmDados.tbGrupoCodGrupo.Value,[]) Then
        MsgDlg.MsgInformation('Grupo possue SubGrupos ativos, n�o pode ser exclu�do !!!')
      else
        begin
        DMdados.tbGrupo.Delete;
        DMdados.tbGrupo.Refresh;
      End
    Else
      DMdados.tbGrupo.Cancel;
end;

procedure TFrmCadGrupo.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadGrupo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmDados.HabilitaTeclado then
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

procedure TFrmCadGrupo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmCadGrupo.FormShow(Sender: TObject);
begin
  dbedit2.Clear;
  dmDados.vTabStt:=True;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
  dmdados.tbGrupo.Open;
  If dmDados.tbGrupo.RecordCount=0 Then
   begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    BtnNovo.Enabled:=True;
    BtnCancelar.Enabled:=False;
    BtnAlterar.Enabled:=False;
    Btndeletar.Enabled:=False;
   end;
    BtnSair.Enabled:= True;
    BtnGravar.Enabled:=False;
end;


procedure TFrmCadGrupo.BtnGravarClick(Sender: TObject);
var
  Tabela: TTable;
  Gravar:Boolean;
begin
  Gravar:=False;
  Tabela := TTable.Create(Application);
	If dbEdit2.Text='' Then
  	Begin
	  MsgDlg.MsgWarning('Necess�rio informar o GRUPO !');
	  dbEdit2.SetFocus;
  	End
  Else
    Begin
    Tabela.DatabaseName := dmDados.tbGrupo.DatabaseName;
    Tabela.TableName := dmDados.TbGrupo.TableName;
    Tabela.Open;
    If NovoItem Then
      If Tabela.Locate('GRUPO',dbedit2.Text,[]) Then
        If (DmDados.tbGrupo.State=dsEdit) And (dmDados.tbGrupo.RecNo = Tabela.RecNo) Then
          Gravar:=True
        Else
          Begin
          MsgDlg.MsgWarning('NOME DO GRUPO j� Cadastrado!!');
          dbedit2.Clear;
          dbedit2.setfocus;
          gravar:=false;
          End
      Else
      	Gravar:=True;
    End;
  Tabela.Free;
  If Gravar Then
    begin
    NovoItem:= False;
    dmdados.tbGrupo.Post;
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
    DBEdit2.Enabled:=False;
    gridgrupo.enabled:=true;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    Panel3.SetFocus;
    end;
  UserAcess.ForceDefinitions;
end;

procedure TFrmCadGrupo.FormActivate(Sender: TObject);
begin
  UserAcess.UserID:=frmPrincipal.Acesso;
end;

end.
