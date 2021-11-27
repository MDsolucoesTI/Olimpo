//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 11-01-2001
// Ultima modifica��o: 29-01-2001
// M�dulo............: Sa�da Simplificada de Mercadoris/Produtos
// Sistema...........: Pegasus - Controle de Estoque
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitSaidaMat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RackCtls, SpeedBar, fcButton, fcImgBtn, ToolEdit, CurrEdit,
  RXDBCtrl, Mask, DBCtrls, StdCtrls, RXSplit, Grids, DBGrids, RXCtrls,
  ExtCtrls, jpeg, EFocCol,db, RxGrdCpt, fcImager, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel,
  JvLabel, fcLabel, EMsgDlg, JvComponent, JvTransBtn;

type
  TFrmSaidaMat = class(TForm)
    dbCodMerc: TDBEdit;
    dbMotivo: TDBMemo;
    GridSaida: TRxDBGrid;
    dbDesc: TDBEdit;
    dbQuant: TRxDBCalcEdit;
    btnLocProd: TfcImageBtn;
    JvLabel10: TJvLabel;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    MsgDlg: TEvMsgDlg;
    fcLabel2: TfcLabel;
    btnPrimeiro: TJvTransparentButton;
    btnAnterior: TJvTransparentButton;
    btnProximo: TJvTransparentButton;
    btnUltimo: TJvTransparentButton;
    btnNovo: TJvTransparentButton;
    btnGravar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure dbCodMercExit(Sender: TObject);
    procedure btnLocMercClick(Sender: TObject);
    procedure dbQuantExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure btnLocProdClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSaidaMat: TFrmSaidaMat;
  NovoItem: Boolean;

implementation

uses unitDmDados, UnitLocProd, unitPrincipal;

{$R *.dfm}

procedure TFrmSaidaMat.dbCodMercExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If dbCodMerc.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o C�DIGO!');
      dbCodMerc.SetFocus;
      End
    Else
      begin
      If Not(dmDados.tbEstoque.Locate('CodMerc',dbCodMerc.Text,[])) Then
        Begin
        Showmessage('C�DIGO n�o Cadastrado');
        dbCodMerc.SetFocus;
        End;
      end;
    end;
end;

procedure TFrmSaidaMat.btnLocMercClick(Sender: TObject);
begin
  if (dmdados.tbSaida.State=dsInsert) or (dmdados.tbSaida.State=dsEdit) then
    begin
    frmLocProd := TfrmLocProd.Create(Application);
    frmLocProd.ShowModal;
    dmdados.tbSaidaCodMerc.Value:=frmLocProd.Resultado;
    frmLocprod.free;
    end;
end;

procedure TFrmSaidaMat.dbQuantExit(Sender: TObject);
begin
  dmDados.tbEstoque.Locate('CodMerc',dbCodMerc.Text,[]);
  If dmDados.tbEstoqueQuantidade.Value < dbQuant.Value Then
    Begin
    ShowMessage('Quantidade no estoque � menor, QUANTIDADE = '+FloatToStr(dmDados.tbEstoqueQuantidade.Value));
    dbQuant.Value:=dmDados.tbEstoqueQuantidade.Value;
    dbQuant.SetFocus;
    End;
end;

procedure TFrmSaidaMat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.tbEstoque.Close;
  dmDados.tbSaida.Close;
  dmDados.tbFuncEsto.Close;
  dmDados.tbMovEstoque.Close;
  dmDados.tbGrupo.Close;
  dmDados.tbSubGrupo.Close;
  dmDados.tbMarca.Close;
  dmDados.tbUnidade.Close;
  dmDados.tbDetVendas.Close;
  Action:=caFree;
end;

procedure TFrmSaidaMat.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmSaidaMat.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmSaidaMat.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  dmDados.HabilitaTeclado:= True;
  FrmPrincipal.StatusTeclas(True,'[F2] Localizar Descri��o [Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
  if (dmDados.tbEstoque.State    = dsInactive) then
    dmDados.tbEstoque.Open;
  if (dmDados.tbSaida.State    = dsInactive) then
    dmDados.tbSaida.Open;
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
end;

procedure TFrmSaidaMat.BtnPrimeiroClick(Sender: TObject);
begin
  DMDados.tbSaida.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmDados.vTabStt:=True;
end;

procedure TFrmSaidaMat.BtnAnteriorClick(Sender: TObject);
begin
  DMDados.tbSaida.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If DMDados.tbSaida.Bof Then
    Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TFrmSaidaMat.BtnProximoClick(Sender: TObject);
begin
  DMDados.tbSaida.Next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If DMDados.tbSaida.Eof Then
    Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TFrmSaidaMat.BtnUltimoClick(Sender: TObject);
begin
  DMDados.tbSaida.Last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmDados.vTabStt:=True;
end;

procedure TFrmSaidaMat.BtnNovoClick(Sender: TObject);
begin
  DMDados.tbSaida.Append;
  dmdados.tbSaidaData.Value:=date;
  NovoItem:=True;
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
  GridSaida.Enabled:=false;
  dmDados.vTabStt:=False;
  DBCodMerc.SetFocus;
end;

procedure TFrmSaidaMat.BtnGravarClick(Sender: TObject);
begin
  with dmDados do
    begin
    tbSaidaQuant.Value:=StrToFloat(dbQuant.Text);
    tbSaidaTipo.Value:='S';
    tbSaida.Post;
    tbEstoque.Locate('CodMerc',dbCodMerc.Text,[]);
    tbEstoque.Edit;
    tbEstoqueQuantidade.Value:=dmDados.tbEstoqueQuantidade.Value-StrToFloat(dbQuant.Text);
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
    GridSaida.Enabled:=true;
    ShowMessage ('Dados gravados com sucesso!');
end;

procedure TFrmSaidaMat.BtnCancelarClick(Sender: TObject);
begin
  NovoItem:=False;
  DMDados.tbSaida.Cancel;
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
  GridSaida.Enabled:=true;
  dmDados.vTabStt:=True;
end;

procedure TFrmSaidaMat.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmSaidaMat.btnLocProdClick(Sender: TObject);
begin
  if (dmdados.tbSaida.State=dsInsert) or (dmdados.tbSaida.State=dsEdit) then
    begin
    frmLocProd := TfrmLocProd.Create(Application);
    frmLocProd.ShowModal;
    dmdados.tbSaidaCodMerc.Value:=frmLocProd.Resultado;
    frmLocProd.free;
    end;
end;

end.
