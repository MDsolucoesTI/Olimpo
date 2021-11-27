/////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Entrada de Produtos
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitEntMat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, JvComponent, JvTransBtn, StdCtrls, Mask, DBCtrls,
  Grids, DBGrids, RXDBCtrl, JvLabel, fcLabel, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel,
  fcButton, fcImgBtn, JvToolEdit, JvCurrEdit, JvDBCtrl, DB, DBTables,
  ExtCtrls;

type
  TFrmEntrMat = class(TForm)
    fcLabel2: TfcLabel;
    JvLabel10: TJvLabel;
    GridEnt: TRxDBGrid;
    dbDesc: TDBEdit;
    btnUltimo: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    btnProximo: TJvTransparentButton;
    btnPrimeiro: TJvTransparentButton;
    btnNovo: TJvTransparentButton;
    btnGravar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    btnAnterior: TJvTransparentButton;
    MsgDlg: TEvMsgDlg;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    dbCodMerc: TDBEdit;
    dbQuant: TJvDBCalcEdit;
    btnLocProd: TfcImageBtn;
    JvLabel3: TJvLabel;
    dbMotivo: TDBMemo;
    LMDBackPanel2: TPanel;
    Panel3: TPanel;
    LMDBackPanel1: TPanel;
    procedure btnSairClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLocProdClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEntrMat: TFrmEntrMat;
  NovoItem, Mudar: Boolean;

implementation

uses unitDmDados, UnitLocProd, UnitPrincipal;

{$R *.dfm}

procedure TFrmEntrMat.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmEntrMat.btnPrimeiroClick(Sender: TObject);
begin
  DMDados.tbEntrada.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmDados.vTabStt:=True;
end;

procedure TFrmEntrMat.btnAnteriorClick(Sender: TObject);
begin
  DMDados.tbEntrada.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If DMDados.tbEntrada.Bof Then
    Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TFrmEntrMat.btnProximoClick(Sender: TObject);
begin
  DMDados.tbEntrada.Next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If DMDados.tbEntrada.Eof Then
    Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TFrmEntrMat.btnUltimoClick(Sender: TObject);
begin
  DMDados.tbEntrada.Last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmDados.vTabStt:=True;
end;

procedure TFrmEntrMat.btnNovoClick(Sender: TObject);
begin
  DMDados.tbEntrada.Append;
  NovoItem:=True;
  dmdados.tbEntradaData.Value:=date;
{habilitando os bot�es}
  BtnGravar.Enabled :=True;
  BtnCancelar.Enabled:=True;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
{habilitando os componentes}
  DBQuant.Enabled:=True;
  DBMotivo.Enabled:=True;
  DBCodMerc.Enabled:=True;
  GridEnt.Enabled:=False;
  dmDados.vTabStt:=False;
  DBCodMerc.SetFocus;
end;

procedure TFrmEntrMat.btnGravarClick(Sender: TObject);
begin
  with dmDados do
    begin
    tbEntradaQuant.Value:=StrToFloat(dbQuant.Text);
    tbEntradaTipo.Value:='E';
    tbEntrada.Post;
    tbEstoque.Locate('CodMerc',dbCodMerc.Text,[]);
    tbEstoque.Edit;
    tbEstoqueQuantidade.Value:=tbEstoqueQuantidade.Value+StrToFloat(dbQuant.Text);
    tbEstoque.Post;
    end;
    dmDados.vTabStt:=true;
    NovoItem:=False;
    BtnGravar.Enabled:=False;
    BtnCancelar.Enabled:=False;
    BtnNovo.Enabled:=True;
    BtnPrimeiro.Enabled:=True;
    BtnAnterior.Enabled:=True;
    BtnProximo.Enabled:=True;
    BtnUltimo.Enabled:=True;
    Panel3.SetFocus;
    {desabilitando os componentes}
    DBQuant.Enabled:=False;
    DBMotivo.Enabled:=False;
    DBCodMerc.Enabled:=False;
    GridEnt.Enabled:=true;
    ShowMessage ('Dados gravados com sucesso!');
end;

procedure TFrmEntrMat.btnCancelarClick(Sender: TObject);
begin
  NovoItem:=False;
  DMDados.tbEntrada.Cancel;
  BtnGravar.Enabled:=False;
  BtnCancelar.Enabled:=False;
  BtnNovo.Enabled:=True;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  Panel3.SetFocus;
{desabilitando os objetos}
  DBQuant.Enabled:=False;
  DBMotivo.Enabled:=False;
  DBCodMerc.Enabled:=False;
  GridEnt.Enabled:=true;
  dmDados.vTabStt:=True;
end;

procedure TFrmEntrMat.btnLocProdClick(Sender: TObject);
begin
  if (dmdados.tbEntrada.State=dsInsert) or (dmdados.tbEntrada.State=dsEdit) then
    begin
    frmLocProd := TfrmLocProd.Create(Application);
    frmLocProd.ShowModal;
    dmdados.tbEntradaCodMerc.Value:=frmLocProd.Resultado;
    frmLocProd.free;
    end;
end;

procedure TFrmEntrMat.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmEntrMat.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmDados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_INSERT : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_END    : if not(dmDados.vTabStt) then BtnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
      VK_F2     : btnLocProd.Click;
    end;
end;

procedure TFrmEntrMat.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  if (dmDados.tbEstoque.State    = dsInactive) then
    dmDados.tbEstoque.Open;
  if (dmDados.tbEntrada.State    = dsInactive) then
    dmDados.tbEntrada.Open;
  if (dmDados.tbFuncEsto.State   = dsInactive) then
    dmDados.tbFuncEsto.Open;
  if (dmDados.tbMovEstoque.State = dsInactive) then
    dmDados.tbMovEstoque.Open;
  if (dmDados.tbGrupo.State      = dsInactive) then
    dmDados.tbGrupo.Open;
  if (dmDados.tbSubGrupo.State   = dsInactive) then
    dmDados.tbSubGrupo.Open;
  if (dmDados.tbMarca.State      = dsInactive) then
    dmDados.tbMarca.Open;
  if (dmDados.tbUnidade.State    = dsInactive) then
    dmDados.tbUnidade.Open;
  if (dmDados.tbDetVendas.State  = dsInactive) then
    dmDados.tbDetVendas.Open;
  dmDados.HabilitaTeclado:= True;
  FrmPrincipal.StatusTeclas(True,'[F2] Localizar Produto [Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

procedure TFrmEntrMat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.tbEstoque.Close;
  dmDados.tbEntrada.Close;
  dmDados.tbFuncEsto.Close;
  dmDados.tbMovEstoque.Close;
  dmDados.tbGrupo.Close;
  dmDados.tbSubGrupo.Close;
  dmDados.tbMarca.Close;
  dmDados.tbUnidade.Close;
  dmDados.tbDetVendas.Close;
  Action:=caFree;
end;

end.
