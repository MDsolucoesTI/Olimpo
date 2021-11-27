//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Cadastro e Manuten��o de Produtos
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, SpeedBar, jpeg, ExtCtrls, StdCtrls, RackCtls, fcButton,
  fcImgBtn, RXSplit, Mask, DBCtrls, RXCtrls, ToolEdit, CurrEdit, RXDBCtrl,
  dbTables,db,dbutils, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint, RxGrdCpt, fcImager, EMsgDlg,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmProduto = class(TForm)
    MsgDlg: TEvMsgDlg;
    Image3: TImage;
    RxLabel4: TRxLabel;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel2: TRxLabel;
    dbCodFunc: TDBEdit;
    RxLabel25: TRxLabel;
    dbCodMerc: TDBEdit;
    dbText2: TDBEdit;
    dbText1: TDBEdit;
    RxLabel3: TRxLabel;
    btnLocFunc: TfcImageBtn;
    btnLocMerc: TfcImageBtn;
    RxLabel26: TRxLabel;
    dbComissao: TRxDBCalcEdit;
    dbGridCadDep: TDBGrid;
    RxLabel1: TRxLabel;
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
    LMDBackPanel11: TPanel;
    procedure btnLocMercClick(Sender: TObject);
    procedure dbCodMercExit(Sender: TObject);
    procedure dbComissaoExit(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure dbCodFuncExit(Sender: TObject);
    procedure btnLocFuncClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProduto: TFrmProduto;
  NovoItem:Boolean;

implementation

uses UnitDmDados, UnitLocProd, UnitLocFunc, unitPrincipal;

{$R *.DFM}

procedure TFrmProduto.btnLocMercClick(Sender: TObject);
begin
if (dmdados.tbFuncEsto.State=dsedit)or(dmdados.tbFuncEsto.State=dsInsert) then
  Begin
  FrmLocProd:=TFrmLocProd.Create(Application);
  FrmLocProd.Showmodal;
  dmdados.tbFuncEstoCodMerc.Value:=frmLocProd.Resultado;
  FrmLocProd.Free;
  end;
end;

procedure TFrmProduto.dbCodMercExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbCodMerc.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o Produto');
      dbCodMerc.SetFocus;
      End
    Else
      If Not(dmDados.tbEstoque.Locate('CodMerc',dbCodMerc.Text,[loPartialKey,loCaseInsensitive])) Then
        Begin
        MsgDlg.MsgWarning('Produto n�o Cadastrado');
        dbCodMerc.SetFocus;
        End;
     end;
end;

procedure TFrmProduto.dbComissaoExit(Sender: TObject);
begin
  If NovoItem Then
    If dbComissao.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o Valor da Comiss�o');
      dbComissao.SetFocus;
      End;
end;

procedure TFrmProduto.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
	Tabela: TTable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbFuncEsto.DatabaseName;
  Tabela.TableName := dmDados.tbFuncEsto.TableName;
  Tabela.Open;
  //Campo que tem conte�do de outra Tabela
  If dbCodFunc.Text='' Then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'C�digo Funcion�rio';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    If Not(dmDados.tbFunc.Locate('CodFunc',dbCodFunc.Text,[])) Then
      Begin
      MsgDlg.MsgWarning('Funcion�rio n�o Cadastrado');
      Gravar:=False;
      End;
  If dbCodMerc.Text='' Then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'C�digo Produto';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    If Not(dmDados.tbEstoque.Locate('CodMerc',dbCodMerc.Text,[loPartialKey,loCaseInsensitive])) Then
      Begin
      MsgDlg.MsgWarning('Produto n�o Cadastrado');
      Gravar:=False;
      End;
  If dbComissao.Text= '' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Comiss�o';
    Gravar:=False;
    Vazio:=True;
    End;
  //verificar se n�o est� duplicando a chave
  if Gravar Then
    if (Tabela.Locate('CodFunc',dbCodFunc.Text,[])) Then
       if (Tabela.Locate('CodMerc',dbCodMerc.Text,[loPartialKey,loCaseInsensitive])) Then
        Begin
        MsgDlg.MsgInformation('J� foi cadastrado comiss�o para este produto !!!');
        Gravar:=False;
        end;
  Tabela.Free;
  If Gravar Then
    Begin
    DMDados.TbFuncEsto.Post;
    NovoItem:=False;
    BtnGravar.Enabled:=False;
    BtnCancelar.Enabled:=False;
    BtnNovo.Enabled:=True;
    BtnPrimeiro.Enabled:=True;
    BtnAnterior.Enabled:=True;
    BtnProximo.Enabled:=True;
    BtnUltimo.Enabled:=True;
    if (frmPrincipal.Acesso=1) or (frmPrincipal.Acesso=2) then
      BtnAlterar.Enabled:=True;
    if (frmPrincipal.Acesso=1) then
      Btndeletar.Enabled:=True;
    dbGridCadDep.Enabled:=true;
    dbCodFunc.Enabled:=False;
    dbCodMerc.Enabled:=False;
    dbComissao.Enabled:=False;
    Panel3.SetFocus;
    MsgDlg.MsgInformation ('Dados gravados com sucesso!');
    End
  Else
    Begin
    If Vazio Then
      MsgDlg.MsgInformation('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbCodFunc.SetFocus;
    end;
end;

procedure TFrmProduto.dbCodFuncExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbCodFunc.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o Funcion�rio');
      dbCodFunc.SetFocus;
      End
    Else
      If Not(dmDados.tbFunc.Locate('CodFunc',dbCodFunc.Text,[])) Then
        Begin
        MsgDlg.MsgWarning('Funcion�rio n�o Cadastrado');
        dbCodFunc.SetFocus;
        End;
    end;
end;

procedure TFrmProduto.btnLocFuncClick(Sender: TObject);
begin
  if (dmdados.tbFuncEsto.State=dsedit)or(dmdados.tbFuncEsto.State=dsInsert) then
    Begin
    FrmLocFunc:=TFrmLocFunc.Create(Application);
    FrmLocFunc.Showmodal;
    dmdados.tbFuncEstoCodFunc.Value:=frmLocFunc.Resultado;
    FrmLocFunc.Free;
    end;
end;

procedure TFrmProduto.BtnPrimeiroClick(Sender: TObject);
begin
  DMDados.tbFuncEsto.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmdados.vTabStt:=true;
end;

procedure TFrmProduto.BtnAnteriorClick(Sender: TObject);
begin
  DMDados.tbFuncEsto.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If DMDados.tbFuncEsto.Bof Then
    Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    End;
  dmdados.vTabStt:=true;
end;

procedure TFrmProduto.BtnProximoClick(Sender: TObject);
begin
  DMDados.tbFuncEsto.Next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If DMDados.tbFuncEsto.Eof Then
    Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    End;
  dmdados.vTabStt:=true;
end;

procedure TFrmProduto.BtnUltimoClick(Sender: TObject);
begin
  DMDados.tbFuncEsto.Last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmdados.vTabStt:=true;
end;

procedure TFrmProduto.BtnNovoClick(Sender: TObject);
begin
  DMDados.tbFuncEsto.Append;
  dmdados.vTabStt:=false;
  NovoItem:=True;
  {habilitando os bot�es}
  BtnGravar.Enabled :=True;
  BtnCancelar.Enabled:=True;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  {habilitando os componentes}
  dbGridCadDep.Enabled:=false;
  dbCodFunc.Enabled:=True;
  dbCodMerc.Enabled:=True;
  dbComissao.Enabled:=True;
  dbCodFunc.SetFocus;
end;

procedure TFrmProduto.BtnCancelarClick(Sender: TObject);
begin
  NovoItem:=False;
  DMDados.tbFuncEsto.Cancel;
  dmdados.vTabStt:=true;
  BtnGravar.Enabled:=False;
  BtnCancelar.Enabled:=False;
  BtnNovo.Enabled:=True;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  if (frmPrincipal.Acesso=1) or (frmPrincipal.Acesso=2) then
    BtnAlterar.Enabled:=True;
  if (frmPrincipal.Acesso=1) then
    Btndeletar.Enabled:=True;
  Panel3.SetFocus;
  {desabilitando os objetos}
  dbGridCadDep.Enabled:=true;
  dbCodFunc.Enabled:=False;
  dbCodMerc.Enabled:=False;
  dbComissao.Enabled:=False;
end;

procedure TFrmProduto.BtnAlterarClick(Sender: TObject);
begin
  NovoItem:=True;
  dmdados.vTabStt:=false;
  DMDados.tbFuncEsto.Edit;
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
  dbGridCadDep.Enabled:=false;
  dbCodFunc.Enabled:=True;
  dbCodMerc.Enabled:=True;
  dbComissao.Enabled:=True;
  dbCodFunc.SetFocus;
end;

procedure TFrmProduto.BtnDeletarClick(Sender: TObject);
begin
  If MsgDlg.MsgConfirmation('Tem certeza que deseja excluir esta comiss�o ?') = id_yes then
    DMDados.tbFuncEsto.Delete;
end;

procedure TFrmProduto.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TFrmProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.HabilitaTeclado:=True;
  DMDados.tbFuncEsto.Close;
  Action:= Cafree;
end;

procedure TFrmProduto.FormKeyDown(Sender: TObject; var Key: Word;
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
      VK_F2     : btnLocFunc.Click;
      Vk_F3     : btnLocMerc.Click;
      end;
end;

procedure TFrmProduto.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  NovoItem:= false;
  DMDados.tbFuncEsto.Open;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [F2] Localiza Cliente [F3] Localizar Produto [F9] Localizar [Esc] Cancelar ou Sair');
end;

procedure TFrmProduto.FormActivate(Sender: TObject);
begin
  DMDados.tbFuncEsto.Open;
  if (frmPrincipal.Acesso=1) or (frmPrincipal.Acesso=2) then
    BtnAlterar.Enabled:=True;
  if (frmPrincipal.Acesso=1) then
    Btndeletar.Enabled:=True;
end;

end.
