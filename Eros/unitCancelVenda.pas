////////////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Cancelamento de Vendasdastro e Manuten��o de Produtos
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
////////////////////////////////////////////////////////////////////////////////

unit unitCancelVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RackCtls, SpeedBar, fcButton, fcImgBtn, ToolEdit, CurrEdit,
  RXDBCtrl, Mask, DBCtrls, StdCtrls, RXSplit, Grids, DBGrids, RXCtrls,
  ExtCtrls, jpeg, DB, DBTables, EFocCol, RxGrdCpt, fcImager, EMsgDlg,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TfrmCancelVenda = class(TForm)
    MsgDlg: TEvMsgDlg;
    RxLabel6: TRxLabel;
    Image2: TImage;
    RxLabel4: TRxLabel;
    dbCodMerc: TDBEdit;
    RxLabel5: TRxLabel;
    DBDateEdit1: TDBDateEdit;
    RxLabel3: TRxLabel;
    DBEdit2: TDBEdit;
    RxLabel2: TRxLabel;
    dbQuant: TRxDBCalcEdit;
    RxDBGrid1: TRxDBGrid;
    btnPrimeiro: TfcImageBtn;
    btnAnterior: TfcImageBtn;
    btnProximo: TfcImageBtn;
    btnUltimo: TfcImageBtn;
    btnLocaliza: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    btnSair: TfcImageBtn;
    Bevel1: TBevel;
    LMDBackPanel2: TPanel;
    LMDBackPanel3: TPanel;
    LMDBackPanel1: TPanel;
    procedure dbCodMercExit(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnLocalizaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCancelVenda: TfrmCancelVenda;
  NovoItem,Mudar:Boolean;

implementation

uses unitDmDados, UnitLocProd, unitPrincipal, unitLocVenda;

{$R *.dfm}

procedure TfrmCancelVenda.dbCodMercExit(Sender: TObject);
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

procedure TfrmCancelVenda.BtnPrimeiroClick(Sender: TObject);
begin
  DMDados.tbVendas.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmDados.vTabStt:=True;
end;

procedure TfrmCancelVenda.BtnAnteriorClick(Sender: TObject);
begin
  DMDados.tbVendas.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If DMDados.tbVendas.Bof Then
    Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TfrmCancelVenda.BtnProximoClick(Sender: TObject);
begin
  DMDados.tbVendas.Next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If DMDados.tbVendas.Eof Then
    Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TfrmCancelVenda.BtnUltimoClick(Sender: TObject);
begin
  DMDados.tbVendas.Last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmDados.vTabStt:=True;
end;

procedure TfrmCancelVenda.BtnCancelarClick(Sender: TObject);
var
  Comissao,Custo       : real;
  ano,mes,dia          : word;
  mesVen,anoVen,diaVen : string;
  Doc,Conta            : string;
  VlMov                : real;
begin
  decodedate(dmDados.tbVendasDataven.Value,ano,mes,dia);
  diaVen:=IntToStr(dia);
  mesVen:=IntToStr(mes);
  anoVen:=IntToStr(ano);
  dmdados.tbDetVendas.Filtered := false;
  dmdados.tbDetVendas.Filter := '(DataVen = '''+datetostr(dmDados.tbVendasDataven.Value)+''')and' +
                                '(CodVen = '''+inttostr(dmDados.tbVendasCodVen.Value)+''')';
  dmdados.tbDetVendas.Filtered := true;
  dmdados.tbDetVendas.First;
  Comissao:=0;
  Custo:=0;
  while not(dmdados.tbDetVendas.Eof) do
    begin
    //devolver o produto ao estoque
    Comissao:=Comissao+dmDados.tbDetVendasComissao.Value;
    Custo:=Custo+(dmDados.tbDetVendasCustoUnit.Value*dmDados.tbDetVendasQuant.Value);
    if dmdados.tbEstoque.Locate('CodMerc',dmdados.tbDetVendasCodMerc.value,[]) then
      begin
      dmdados.tbEstoque.edit;
      dmdados.tbEstoqueQuantidade.Value:=dmdados.tbEstoqueQuantidade.Value+dmdados.tbDetVendasQuant.Value;
      dmdados.tbEstoque.Post;
      //estoque atualizado
      end;
    dmdados.tbDetVendas.Delete; //excluir o registro do detvendas
    dmdados.tbDetVendas.First;
    end;
  dmDados.tbDetVendas.Filtered:=False;
  //cancelar faturamento
  If dmDados.TbFaturamento.Locate('DataVen',dmdados.tbVendasDataven.Value,[]) then
    begin
    dmdados.tbFaturamento.Edit;
    dmdados.tbFaturamentoTotalVenda.Value:=dmdados.tbFaturamentoTotalVenda.Value-dmdados.tbVendasValor.Value;
    dmdados.tbFaturamentoTotalDesc.Value:=dmdados.tbFaturamentoTotalDesc.Value-dmdados.tbVendasDesconto.Value;
    dmdados.tbFaturamentoTotalCom.Value:=dmdados.tbFaturamentoTotalCom.Value-Comissao;
    dmdados.tbFaturamentoTotalCusto.Value:=dmdados.tbFaturamentoTotalCusto.Value-Custo;
    dmdados.tbFaturamento.Post;
    end;
  dmdados.tbCReceber.Filtered := false;
  dmdados.tbCReceber.Filter := '(DataVen = '''+datetostr(dmDados.tbVendasDataven.Value)+''')and' +
                               '(CodVen = '''+inttostr(dmDados.tbVendasCodVen.Value)+''')';
  dmdados.tbCReceber.Filtered := true;
  dmdados.tbCReceber.First;
  while not dmDados.tbCReceber.Eof do
    begin
    dmDados.tbCReceber.Delete;
    dmDados.tbCReceber.First;
    end;
  dmdados.tbCReceber.Filtered := false;
  dmdados.tbCheque.Filtered := false;
  dmdados.tbCheque.Filter := '(DataVen = '''+datetostr(dmDados.tbVendasDataven.Value)+''')and' +
                             '(CodVen = '''+inttostr(dmDados.tbVendasCodVen.Value)+''')';
  dmdados.tbCheque.Filtered := true;
  dmdados.tbCheque.First;
  while not dmDados.tbCheque.Eof do
    begin
    dmDados.tbCheque.Delete;
    dmDados.tbCheque.First;
    end;
  dmdados.tbCheque.Filtered := false;
  dmdados.TbMovConta.Filtered := false;
  dmdados.TbMovConta.Filter := '(DataMov = '''+datetostr(dmDados.tbVendasDataven.Value)+''')';
  dmdados.TbMovConta.Filtered := true;
  dmdados.TbMovConta.First;
  if dmDados.TbMovConta.Locate('DosNumero',diaVen+mesVen+anoVen+'-'+dmdados.tbVendasCodVen.AsString,[loPartialKey]) then
    begin
    Doc:=dmdados.TbMovContaDosNumero.Value;
    Conta:=dmdados.TbMovContaConta.Value;
    VlMov:=dmdados.TbMovContaValor.Value;
    //estorno do lan�amento
    dmdados.TbMovConta.Append;
    dmdados.TbMovContaDosNumero.Value:=Doc;
    dmdados.TbMovContaConta.Value:=Conta;
    dmdados.TbMovContaDataMov.Value:=date;
    dmdados.tbMovContaDataReg.value:=date;
    dmdados.TbMovContaHoraReg.Value:=time;
    dmdados.TbMovContaValor.Value:=VlMov;
    dmdados.TbMovContaTipoOper.Value:='S';
    dmdados.TbMovContaComplHist.Value:='Cancelamento de Venda';
    dmdados.TbMovContaCodDoc.Value:=1;
    dmdados.TbMovConta.Post;
    {atualizar conta corrente}
    if dmdados.TbCCorrente.Locate('Conta',Conta,[]) then
      begin
      dmdados.TbCCorrente.Edit;
      dmdados.TbCCorrenteSaldo.Value:=dmdados.TbCCorrenteSaldo.Value-VlMov;
      dmdados.tbccorrenteUltMov.value:=date;
      dmdados.TbCCorrente.post;
      end;
    end;
  dmDados.TbMovConta.Filtered := false;
  dmDados.tbVendas.Delete;
  MsgDlg.MsgInformation('Vendas cancelada com sucesso!!!');
end;

procedure TfrmCancelVenda.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCancelVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.tbVendas.Close;
  dmdados.tbDetVendas.Close;
  dmdados.tbEstoque.Close;
  dmdados.tbFaturamento.Close;
  dmdados.tbCReceber.Close;
  dmdados.tbCheque.Close;
  dmdados.TbMovConta.Close;
  dmdados.TbCCorrente.Close;
  Action:=caFree;
end;

procedure TfrmCancelVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmDados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_Delete : BtnCancelar.Click;
      VK_ESCAPE : BtnSair.Click;
      VK_F2     : btnLocaliza.Click;
    end;
end;

procedure TfrmCancelVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TfrmCancelVenda.FormShow(Sender: TObject);
begin
  dmdados.tbVendas.Open;
  dmdados.tbDetVendas.Open;
  dmdados.tbEstoque.Open;
  dmdados.tbFaturamento.Open;
  dmdados.tbCReceber.Open;
  dmdados.tbCheque.Open;
  dmdados.TbMovConta.Open;
  dmdados.TbCCorrente.Open;
  dmDados.vTabStt:=True;
  FrmPrincipal.StatusTeclas(True,'[F2] Localizar [Delete] Cancelar Venda [Esc] Sair');
end;

procedure TfrmCancelVenda.btnLocalizaClick(Sender: TObject);
begin
  FrmLocVenda:=TFrmLocVenda.Create(Application);
  FrmLocVenda.showmodal;
end;

end.
