//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 11-01-2001
// Ultima modifica��o: 29-01-2001
// M�dulo............: Entrada Simplificada de Mercadoris/Produtos
// Sistema...........: Pegasus - Controle de Estoque
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////
unit UnitEntradaMat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RackCtls, SpeedBar, fcButton, fcImgBtn, ToolEdit, CurrEdit,
  RXDBCtrl, Mask, DBCtrls, StdCtrls, RXSplit, Grids, DBGrids, RXCtrls,
  ExtCtrls, jpeg, DB, DBTables, EFocCol, RxGrdCpt, fcImager,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmEntradaMat = class(TForm)
    RxLabel6: TRxLabel;
    Image2: TImage;
    RxLabel4: TRxLabel;
    dbCodMerc: TDBEdit;
    RxLabel1: TRxLabel;
    dbMotivo: TDBMemo;
    RxDBGrid1: TRxDBGrid;
    DBEdit2: TDBEdit;
    RxLabel3: TRxLabel;
    btnLocMerc: TfcImageBtn;
    RxLabel2: TRxLabel;
    dbQuant: TRxDBCalcEdit;
    btnPrimeiro: TfcImageBtn;
    btnAnterior: TfcImageBtn;
    btnProximo: TfcImageBtn;
    btnUltimo: TfcImageBtn;
    btnNovo: TfcImageBtn;
    btnGravar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    btnSair: TfcImageBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure dbCodMercExit(Sender: TObject);
    procedure btnLocMercClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEntradaMat: TFrmEntradaMat;
  NovoItem,Mudar:Boolean;

implementation

uses unitDmDados, UnitLocProd, unitPrincipal;

{$R *.dfm}

procedure TFrmEntradaMat.dbCodMercExit(Sender: TObject);
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
        end;
      end;
    end;
end;

procedure TFrmEntradaMat.btnLocMercClick(Sender: TObject);
begin
  if (dmdados.tbEntrada.State=dsInsert) or (dmdados.tbEntrada.State=dsEdit) then
    begin
    frmLocProd := TfrmLocProd.Create(Application);
    frmLocProd.ShowModal;
    dmdados.tbEntradaCodMerc.Value:=frmLocProd.Resultado;
    frmLocProd.free;
    end;
end;

procedure TFrmEntradaMat.BtnPrimeiroClick(Sender: TObject);
begin
  DMDados.tbEntrada.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmDados.vTabStt:=True;
end;

procedure TFrmEntradaMat.BtnAnteriorClick(Sender: TObject);
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

procedure TFrmEntradaMat.BtnProximoClick(Sender: TObject);
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

procedure TFrmEntradaMat.BtnUltimoClick(Sender: TObject);
begin
  DMDados.tbEntrada.Last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmDados.vTabStt:=True;
end;

procedure TFrmEntradaMat.BtnNovoClick(Sender: TObject);
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
  RxDBGrid1.Enabled:=False;
  dmDados.vTabStt:=False;
  DBCodMerc.SetFocus;
end;

procedure TFrmEntradaMat.BtnGravarClick(Sender: TObject);
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
    RxDBGrid1.Enabled:=true;
    ShowMessage ('Dados gravados com sucesso!');
end;

procedure TFrmEntradaMat.BtnCancelarClick(Sender: TObject);
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
  RxDBGrid1.Enabled:=true;
  dmDados.vTabStt:=True;
end;

procedure TFrmEntradaMat.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmEntradaMat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  Action:=caFree;
end;

procedure TFrmEntradaMat.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmDados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_INSERT : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_END    : if not(dmDados.vTabStt) then BtnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
      VK_F2     : btnLocMerc.Click;
    end;
end;

procedure TFrmEntradaMat.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmEntradaMat.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  FrmPrincipal.StatusTeclas(True,'[F2] Localizar Descri��o [Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

end.
