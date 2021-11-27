//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Cadastro e Manuten��o de Usu�rios
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCadSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXCtrls, ExtCtrls, StdCtrls, Mask, DBCtrls, ToolEdit, RXDBCtrl, RXSplit,
  TFlatCheckBoxUnit, SpeedBar, jpeg, RxDBComb, RxLookup, fcLabel, ComCtrls,
  Grids, DBGrids, ECripto, RackCtls, fcButton, fcImgBtn, RxGrdCpt, fcImager,
  ImgList, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TfrmCadSenha = class(TForm)
    evCripto: TEvCriptografa;
    RxGradientCaption2: TRxGradientCaption;
    img1: TImageList;
    img2: TImageList;
    Image1: TImage;
    RxLabel4: TRxLabel;
    lbdoc: TRxLabel;
    dbCod: TDBEdit;
    RxLabel3: TRxLabel;
    dbUsuario: TDBEdit;
    TreeView1: TTreeView;
    TreeView2: TTreeView;
    dbsenha: TDBEdit;
    RxLabel2: TRxLabel;
    dbFunc: TDBEdit;
    RxLabel1: TRxLabel;
    edtConfSenha: TEdit;
    RxLabel5: TRxLabel;
    cmbNivel: TRxDBComboBox;
    btlocdoc: TfcImageBtn;
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
    RxLabel6: TRxLabel;
    LMDBackPanel2: TPanel;
    Panel3: TPanel;
    LMDBackPanel1: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure dbsenhaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSenha: TfrmCadSenha;

implementation

uses UnitDmdados, UnitPrincipal;


{$R *.DFM}

procedure TfrmCadSenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.tbSenha.Open;
  action:=cafree;
end;

procedure TfrmCadSenha.FormShow(Sender: TObject);
begin
  dmdados.tbSenha.Filtered:=false;
  dmdados.tbSenha.Filter:='(usuario <> '''+'Gensys'+''')';
  dmdados.tbSenha.filtered:=true;
  dmdados.tbSenha.Open;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

procedure TfrmCadSenha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt) then btnNovo.Click;
      VK_Home   : if (dmDados.vTabStt) then btnAlterar.Click;
      VK_Delete : if (dmDados.vTabStt) then btnDeletar.Click;
      VK_End    : if not(dmDados.vTabStt) then btnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then btnCancelar.Click
                  else btnSair.Click;
    end;
end;

procedure TfrmCadSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TfrmCadSenha.btnPrimeiroClick(Sender: TObject);
begin
dmdados.tbSenha.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmCadSenha.btnAnteriorClick(Sender: TObject);
begin
dmdados.tbSenha.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
If dmdados.tbSenha.Bof Then
 Begin
  btnPrimeiro.Enabled:=False;
  btnAnterior.Enabled:=False;
  End;
end;

procedure TfrmCadSenha.btnProximoClick(Sender: TObject);
begin
dmdados.tbSenha.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
If dmdados.tbSenha.Eof Then
 Begin
 btnProximo.Enabled:=False;
 btnUltimo.Enabled:=False;
 end;
end;

procedure TfrmCadSenha.btnUltimoClick(Sender: TObject);
begin
dmdados.tbSenha.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmCadSenha.btnNovoClick(Sender: TObject);
begin
dmdados.tbSenha.Append;
dmdados.vTabStt:=false;
btnGravar.Enabled := true;
btnCancelar.Enabled:=true;
btnNovo.Enabled:=False;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
btnAlterar.Enabled:=False;
btnDeletar.Enabled:=False;
dbUsuario.Enabled:=true;
dbSenha.Enabled:=true;
dbUsuario.SetFocus;
end;

procedure TfrmCadSenha.btnGravarClick(Sender: TObject);
var
  campos : string;
begin
If (dbUsuario.Text = 'Gensys') then
  begin
  ShowMessage('Palavra Reservada!  Por favor utilize outra.');
  dbUsuario.SetFocus;
  end
else
  begin
  if (dbUsuario.Text='') then campos:='USUARIO';
   if (dbSenha.Text='') then campos:=campos+'  SENHA';
    If Length(campos)=0 then
    begin
    dbSenha.Text:= EvCripto.TextToCriptoBin(dbSenha.Text);
    dmdados.tbSenha.Post;
    dmdados.vTabStt:=true;
    btnGravar.enabled := False;
    btnCancelar.Enabled := False;
    btnNovo.Enabled:=True;
    btnPrimeiro.Enabled:=True;
    btnAnterior.Enabled:=True;
    btnProximo.Enabled:=True;
    btnUltimo.Enabled:=True;
    btnAlterar.Enabled:=True;
    btnDeletar.Enabled:=True;
    dbUsuario.Enabled:=false;
    dbSenha.Enabled:=true;
    showmessage('Dados gravados com sucesso!');
    Panel3.SetFocus;
    end;
  end;

end;

procedure TfrmCadSenha.btnCancelarClick(Sender: TObject);
begin
dmdados.tbSenha.cancel;
dmdados.vTabStt:=true;
btnGravar.enabled := false;
btnCancelar.Enabled := false;
btnNovo.Enabled:=True;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnproximo.Enabled:=True;
btnUltimo.Enabled:=True;
btnAlterar.Enabled:=True;
btnDeletar.Enabled:=True;
dbUsuario.Enabled:=false;
dbSenha.Enabled:=false;
Panel3.SetFocus
end;

procedure TfrmCadSenha.btnAlterarClick(Sender: TObject);
begin
dmdados.tbSenha.Edit;
dmdados.vTabStt:=false;
btnCancelar.enabled:= true;
btnGravar.Enabled:= true;
btnNovo.Enabled:=False;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
btnAlterar.Enabled:=False;
btnDeletar.Enabled:=False;
dbUsuario.Enabled:=true;
dbSenha.Enabled:=true;
dbUsuario.SetFocus;
end;

procedure TfrmCadSenha.btnDeletarClick(Sender: TObject);
begin
If application.MessageBox('Tem certeza que deseja excluir este registro?','Aten��o', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
   begin
   dmdados.tbSenha.Delete;
   end
   else
   dmdados.tbSenha.Cancel;
end;

procedure TfrmCadSenha.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadSenha.dbsenhaExit(Sender: TObject);
begin
  Panel3.SetFocus;
end;

end.
