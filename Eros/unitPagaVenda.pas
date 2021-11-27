//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Pagamento de Vendas
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitPagaVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxGIF, RackCtls, SpeedBar, fcButton, fcImgBtn, RXSplit,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, RXDBCtrl, RXCtrls, ExtCtrls,
  jpeg, DBTables, DB, EFocCol, TFlatSplitterUnit, RxGrdCpt, ToolEdit,
  CurrEdit, lmdstdcA, fcImager, EMsgDlg;

type
  TfrmPagaVenda = class(TForm)
    Panel1: TPanel;
    RxLabel15: TRxLabel;
    Panel2: TPanel;
    RxLabel2: TRxLabel;
    Image2: TImage;
    Panel3: TPanel;
    FlatSplitter1: TFlatSplitter;
    edtParcelas: TLMDSpinEdit;
    edtParc1: TCurrencyEdit;
    RxLabel1: TRxLabel;
    dtVencimento: TDateEdit;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    edtParc2: TCurrencyEdit;
    dtVenc1: TDateEdit;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    edtIntervalo: TLMDSpinEdit;
    dtVenc2: TDateEdit;
    RxLabel8: TRxLabel;
    edtParc3: TCurrencyEdit;
    dtVenc3: TDateEdit;
    btnGravar: TfcImageBtn;
    RxLabel9: TRxLabel;
    rbDin: TRadioButton;
    rbCart: TRadioButton;
    RxLabel10: TRxLabel;
    RxLabel11: TRxLabel;
    rbCarn: TRadioButton;
    RxLabel12: TRxLabel;
    rbCheque: TRadioButton;
    RxLabel13: TRxLabel;
    FlatSplitter3: TFlatSplitter;
    RxLabel14: TRxLabel;
    RxLabel16: TRxLabel;
    edtAgencia: TEdit;
    edtBanco: TEdit;
    RxLabel17: TRxLabel;
    RxLabel18: TRxLabel;
    RxLabel19: TRxLabel;
    edtCh1: TEdit;
    edtCh2: TEdit;
    edtCh3: TEdit;
    RxLabel20: TRxLabel;
    edtConta: TEdit;
    btnCancelar: TfcImageBtn;
    MsgDlg: TEvMsgDlg;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBGridMarcaEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtParcelasExit(Sender: TObject);
    function GeraData(iData:TdateTime;iDias:integer):TDateTime;
    procedure edtIntervaloExit(Sender: TObject);
    procedure edtParc1Exit(Sender: TObject);
    procedure edtParc2Exit(Sender: TObject);
    procedure edtParc3Exit(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure dtVencimentoExit(Sender: TObject);
    procedure rbChequeClick(Sender: TObject);
    procedure rbDinClick(Sender: TObject);
    procedure rbCartClick(Sender: TObject);
    procedure rbCarnClick(Sender: TObject);
  private
    { Private declarations }
    fVlCompra : real;
    fPagStt : char;
  public
    { Public declarations }
    Property VlCompra:real Read fVlCompra Write fVlCompra;
    Property PagStt:char Read fPagStt Write fPagStt;
  end;

var
  frmPagaVenda: TfrmPagaVenda;
  NovoItem: Boolean;
  VlParcela,VlResto : real;
  VlParc : array[1..12] of real;
  dtVenc : array[1..12] of TDateTime;
  RestParc : integer;
implementation

uses unitDmDados, unitPrincipal, UnitCarne, UnitVendas;

{$R *.dfm}

procedure TfrmPagaVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  Action:= Cafree;
end;

procedure TfrmPagaVenda.RxDBGridMarcaEnter(Sender: TObject);
begin
  NovoItem:=False;
end;

procedure TfrmPagaVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmDados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_END    : btnGravar.Click;
      VK_ESCAPE : btnCancelar.Click;
    end;
end;

procedure TfrmPagaVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TfrmPagaVenda.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[End] Gravar e Sair [Esc] Cancelar e Sair');
end;

procedure TfrmPagaVenda.btnCancelarClick(Sender: TObject);
begin
  PagStt:='N';
  Close;
end;

procedure TfrmPagaVenda.edtParcelasExit(Sender: TObject);
begin
  if edtParcelas.Value=1 then
    begin
    edtParc1.Value:=VlCompra;
    VlParc[1]:=VlCompra;
    rbDin.Enabled:=True;
    rbCart.Enabled:=True;
    rbCheque.Enabled:=True;
    end
  else
    edtIntervalo.Enabled:=True;
end;

function TfrmPagaVenda.GeraData(iData:TdateTime;iDias:integer):TDateTime;
var
  vVenc,vDia,vMes,vAno:Word;
  iDia,iMes,iAno:string;
  x:integer;
begin
  decodedate(iData,vAno,vMes,vDia);
  vVenc:=vDia;
  if iDias >= 30 then
    begin
    For x:=1 to (iDias div 30) do
      begin
      vMes:=vMes+1;
      if vMes=13 Then
        Begin
        vAno:=vAno+1;
        vMes:=1;
        End;
      End;
    if ((vDia<=31)and(vDia>=29))and(vMes=2) then
      begin
      if (vAno mod 4)=0 then
        vDia:=29
      else
        vDia:=28;
      end;
    if (vDia=31)and((vMes=4)or(vMes=6)or(vMes=9)or(vMes=11)) then
      vDia:=30;
    if vDia < vVenc then
      if vMes <> 2 Then
        if (vMes=4)or(vMes=6)or(vMes=9)or(vMes=11) then
          if vVenc=31 Then
            vDia:=30
          else
            vDia:=vVenc
        else
          vDia:=vVenc;
    iDia:=IntToStr(vDia);
    iMes:=IntToStr(vMes);
    iAno:=IntToStr(vAno);
    GeraData:=StrToDate(iDia+'/'+iMes+'/'+iAno);
    end
  else
    GeraData:=iData+iDias;
end;

procedure TfrmPagaVenda.edtIntervaloExit(Sender: TObject);
var
  c : integer;
begin
  VlParcela:=VlCompra/edtParcelas.Value;
  VlResto:=VlCompra;
  case edtParcelas.Value of
    2:begin
      edtParc1.Enabled:=True;
      edtParc1.Value:=VlParcela;
      dtVenc1.Date:=dtVencimento.Date;
      edtParc2.Enabled:=True;
      edtParc2.Value:=VlParcela;
      dtVenc2.Date:=GeraData(dtVenc1.Date,edtIntervalo.Value);
      dtVenc[1]:=dtVenc1.Date;
      dtVenc[2]:=dtVenc2.Date;
      end;
    3:begin
      edtParc1.Enabled:=True;
      edtParc1.Value:=VlParcela;
      dtVenc1.Date:=dtVencimento.Date;
      edtParc2.Enabled:=True;
      edtParc2.Value:=VlParcela;
      dtVenc2.Date:=GeraData(dtVenc1.Date,edtIntervalo.Value);
      edtParc3.Enabled:=True;
      edtParc3.Value:=VlParcela;
      dtVenc3.Date:=GeraData(dtVenc2.Date,edtIntervalo.Value);
      dtVenc[1]:=dtVenc1.Date;
      dtVenc[2]:=dtVenc2.Date;
      dtVenc[3]:=dtVenc3.Date;
      end;
  end;
  for c:=1 to edtParcelas.Value do
    VlParc[c]:=VlParcela;
  edtParcelas.Enabled:=False;
  dtVencimento.Enabled:=False;
  edtIntervalo.Enabled:=False;
  rbCart.Enabled:=True;
  rbCarn.Enabled:=True;
  rbCheque.Enabled:=True;
  edtParc1.SetFocus;
end;

procedure TfrmPagaVenda.edtParc1Exit(Sender: TObject);
var
  c : integer;
begin
  if edtParcelas.Value=1 then
    begin
    if edtParc1.Value<>VlResto then
      begin
      MsgDlg.MsgWarning('N�o existe mais parcelas|A Parcela Atual deve ter o valor restante');
      edtParc1.Value:=VlResto;
      VlParc[1]:=VlResto;
      end;
    end
  else
    begin
    VlResto:=VlResto-edtParc1.Value;
    VlParcela:=VlResto/(edtParcelas.Value-1);
    case edtParcelas.Value of
      2:begin
        edtParc2.Value:=VlResto;
        end;
      3:begin
        edtParc2.Value:=VlParcela;
        edtParc3.Value:=VlParcela;
        end;
    end;
    VlParc[1]:=edtParc1.Value;
    for c:=2 to edtParcelas.Value do
      VlParc[c]:=VlParcela;
    end;
    edtParc1.TabStop:=false;
end;

procedure TfrmPagaVenda.edtParc2Exit(Sender: TObject);
var
  c : integer;
begin
  if edtParcelas.Value=2 then
    begin
    if edtParc2.Value<>VlResto then
      begin
      MsgDlg.MsgWarning('N�o existe mais parcelas|A Parcela Atual deve ter o valor restante');
      edtParc2.Value:=VlResto;
      VlParc[2]:=VlResto;
      end;
    end
  else
    begin
    VlResto:=VlResto-edtParc2.Value;
    VlParcela:=VlResto/(edtParcelas.Value-2);
    case edtParcelas.Value of
      3:begin
        edtParc3.Value:=VlParcela;
        end;
    end;
    VlParc[2]:=edtParc2.Value;
    for c:=3 to edtParcelas.Value do
      VlParc[c]:=VlParcela;
  end;
  edtParc2.TabStop:=false;
end;

procedure TfrmPagaVenda.edtParc3Exit(Sender: TObject);
begin
  if edtParcelas.Value=3 then
    begin
    if edtParc3.Value<>VlResto Then
      begin
      MsgDlg.MsgWarning('N�o existe mais parcelas|A Parcela Atual deve ter o valor restante');
      edtParc3.Value:=VlResto;
      VlParc[3]:=VlResto;
      end;
    end;
    EdtParc3.TabStop:=False;
end;

procedure TfrmPagaVenda.btnGravarClick(Sender: TObject);
Var
  c                    : Integer;
  ano,mes,dia          : Word;
  mesVen,anoVen,diaVen : String;
  v                    : Variant;
begin
if ((rbDin.Checked)or(rbCart.Checked)or(rbCarn.Checked)or(rbCheque.Checked)) then
  begin
  dmdados.tbVendasEntrega.Value:=dmdados.tbVendasDataven.Value+1;
  dmdados.tbVendas.Post;
  decodedate(dmDados.tbVendasDataven.Value,ano,mes,dia);
  diaVen:=IntToStr(dia);
  mesVen:=IntToStr(mes);
  anoVen:=IntToStr(ano);
  //lan�ar pedido no contas a receber
  if (rbCart.Checked)or(rbCarn.Checked) then
    begin
    for c:=1 to edtParcelas.Value do
      begin
      dmdados.tbCReceber.Append;
      dmdados.tbCReceberCodVen.Value:=dmdados.tbVendasCodVen.Value;
      if rbCart.Checked then
        dmdados.tbCReceberCodDoc.Value:=3
      else
        dmdados.tbCReceberCodDoc.Value:=2;
      dmdados.tbCReceberNumDoc.Value:=diaVen+mesVen+anoVen+'-'+dmdados.tbVendasCodVen.AsString+'-'+IntToStr(c);
      dmdados.tbCReceberCodCli.Value:=dmdados.tbVendasCodCli.Value;
      dmdados.tbCReceberDataVen.Value:=dmdados.tbVendasDataven.Value;
      //dmdados.tbCReceberFormaPagto.Value:=dmdados.tbVendasCodForPag.Value;
      dmdados.tbCReceberDataEmis.Value:=date;
      dmdados.tbCReceberDataVenc.Value:=dtVenc[c];
      dmdados.tbCReceberCompHist.Value:=(IntTostr(c)+'/'+IntToStr(edtParcelas.Value)+
                                        ' Pedido realizado no dia '+
                                        DateToStr(date)+' �s '+TimeToStr(time));
      dmdados.tbCReceberValor.Value:=VlParc[c];
      dmdados.tbCReceberPago.Value:='ABERTO';
      dmdados.tbCReceber.Post;
      end;
    if rbCarn.Checked then
      begin
      dmdados.tbCReceber.Filtered:=False;
      dmdados.tbCReceber.Filter:='(DataVen = '''+DateToStr(dmdados.tbVendasDataven.Value)+''') and'+
                                 '(CodVen = '''+IntToStr(dmdados.tbVendasCodVen.Value)+''')';
      dmdados.tbCReceber.Filtered:=True;
      QrCarne.Print;
      end;
    end;
  if (rbCheque.Checked) then
    begin
    v:=dmDados.tbBanco.Lookup('NumBanco',edtBanco.Text,'NomeBanco');
    for c:=1 to edtParcelas.Value do
      begin
      dmdados.tbCheque.Append;
      dmdados.tbChequeNumBanco.Value:=edtBanco.Text;
      if not (VarType(v) in [varNull]) then
        dmdados.tbChequeNomeBanco.Value:=v;
      dmdados.tbChequeAgencia.Value:=edtAgencia.Text;
      dmdados.tbChequeCodVen.Value:=dmdados.tbVendasCodVen.Value;
      dmdados.tbChequeDataVen.Value:=dmdados.tbVendasDataven.Value;
      dmdados.tbChequeCodCli.Value:=dmdados.tbVendasCodCli.Value;
      dmdados.tbChequeConta.Value:=edtConta.Text;
      dmdados.tbChequeValor.Value:=VlParc[c];
      dmdados.tbChequeVencimento.Value:=dtVenc[c];
      dmdados.tbChequeStatus.Value:='ABERTO';
      if c=1 then
        dmdados.tbChequeNumCheque.Value:=StrToFloat(edtCh1.Text);
      if c=2 then
        dmdados.tbChequeNumCheque.Value:=StrToFloat(edtCh2.Text);
      if c=3 then
        dmdados.tbChequeNumCheque.Value:=StrToFloat(edtCh3.Text);
      dmdados.tbCheque.Post;
      if Date=dmDados.tbChequeVencimento.Value Then
        begin
        {Atualizar movimento de conta}
        dmdados.TbMovConta.Append;
        dmdados.TbMovContaDosNumero.Value:=diaVen+mesVen+anoVen+'-'+dmdados.tbVendasCodVen.AsString+'-'+InttoStr(c);
        dmdados.TbMovContaConta.Value:='000000000000001';
        dmdados.TbMovContaDataMov.Value:=date;
        dmdados.tbMovContaDataReg.value:=date;
        dmdados.TbMovContaHoraReg.Value:=time;
        dmdados.TbMovContaValor.Value:=dmdados.tbVendasValor.Value;
        dmdados.TbMovContaTipoOper.Value:='E';
        dmdados.TbMovContaComplHist.Value:='Venda n� '+dmdados.tbVendasCodVen.AsString+' do dia '+DateToStr(date);
        dmdados.TbMovContaCodDoc.Value:=1;
        dmdados.TbMovConta.Post;
        {atualizar conta corrente}
        if dmdados.TbCCorrente.Locate('Conta','000000000000001',[]) then
          begin
          dmdados.TbCCorrente.Edit;
          dmdados.TbCCorrenteSaldo.Value:=dmdados.TbCCorrenteSaldo.Value+dmdados.tbVendasValor.Value;
          dmdados.tbccorrenteUltMov.value:=date;
          dmdados.TbCCorrente.post;
          end;
        end;
      end;
    end;
  if (rbDin.Checked) then
    begin
    {Atualizar movimento de conta}
    dmdados.TbMovConta.Append;
    dmdados.TbMovContaDosNumero.Value:=diaVen+mesVen+anoVen+'-'+dmdados.tbVendasCodVen.AsString+'-1';
    dmdados.TbMovContaConta.Value:='000000000000001';
    dmdados.TbMovContaDataMov.Value:=date;
    dmdados.tbMovContaDataReg.value:=date;
    dmdados.TbMovContaHoraReg.Value:=time;
    dmdados.TbMovContaValor.Value:=dmdados.tbVendasValor.Value;
    dmdados.TbMovContaTipoOper.Value:='E';
    dmdados.TbMovContaComplHist.Value:='Venda n� '+dmdados.tbVendasCodVen.AsString+' do dia '+DateToStr(date);
    dmdados.TbMovContaCodDoc.Value:=1;
    dmdados.TbMovConta.Post;
    {atualizar conta corrente}
    if dmdados.TbCCorrente.Locate('Conta','000000000000001',[]) then
      begin
      dmdados.TbCCorrente.Edit;
      dmdados.TbCCorrenteSaldo.Value:=dmdados.TbCCorrenteSaldo.Value+dmdados.tbVendasValor.Value;
      dmdados.tbccorrenteUltMov.value:=date;
      dmdados.TbCCorrente.post;
      end;
    end;
  //calcular faturamento
  dmdados.tbFaturamento.Last;
  dmdados.dsFaturamento.Edit;
  dmdados.tbFaturamentoTotalVenda.Value:=dmdados.tbFaturamentoTotalVenda.Value+dmdados.tbVendasValor.Value;
  dmdados.tbFaturamentoTotalDesc.Value:=dmdados.tbFaturamentoTotalDesc.Value+dmdados.tbVendasDesconto.Value;
  dmdados.tbFaturamentoTotalCom.Value:=dmdados.tbFaturamentoTotalCom.Value+frmVendas.Comissao;
  dmdados.tbFaturamentoTotalCusto.Value:=dmdados.tbFaturamentoTotalCusto.Value+frmVendas.Custo;
  dmdados.tbFaturamento.Post;
  //Registro de comiss�es
  dmdados.tbDetVendas.Filtered := false;
  dmdados.tbDetVendas.Filter := '(DataVen = '''+datetostr(frmVendas.DataVenda)+''')and' +
                                '(CodVen = '''+inttostr(frmVendas.CodigoVenda)+''')';
  dmdados.tbDetVendas.Filtered := true;
  dmdados.tbDetVendas.First;
  while not(dmdados.tbDetVendas.Eof) do
    begin
    if dmDados.tbFunc.Locate('CodFunc',dmDados.tbVendasCodFunc.Value,[]) then
      begin
      if dmDados.tbSalMes.Locate('CodFunc;Mes;Ano',VarArrayOf([dmDados.tbVendasCodFunc.Value,mes,ano]),[]) then
        dmDados.tbSalMesVlComissao.Value:=dmDados.tbSalMesVlComissao.Value+dmDados.tbDetVendasComissao.Value
      else
        begin
        dmDados.tbSalMes.Append;
        dmDados.tbSalMesVlComissao.Value:=dmDados.tbSalMesVlComissao.Value+dmDados.tbDetVendasComissao.Value;
        end;
      end;
    dmDados.tbDetVendas.Next;
    end;
  //atualizar ultimaCompra e ultimaVenda
  if dmdados.tbFunc.Locate('Codfunc',dmdados.tbVendasCodFunc.Value,[]) then
    begin
    dmdados.tbFunc.Edit;
    dmdados.tbFuncUltimaVenda.Value:=date;
    dmdados.tbFunc.Post;
    end;
  if dmdados.tbCliente.Locate('CodCli',dmdados.tbVendasCodCLi.Value,[]) then
    begin
    dmdados.tbCliente.Edit;
    dmdados.tbClienteUltimaCompra.Value:=date;
    dmdados.tbCliente.Post;
    end;
  PagStt:='S';
  Close;
  end
else
  MsgDlg.MsgWarning('N�o existe forma de pagamento selecionada.|Selecione uma para prosseguir!!!');
end;

procedure TfrmPagaVenda.dtVencimentoExit(Sender: TObject);
begin
  if edtParcelas.Value=1 then
    begin
    dtVenc1.Date:=dtVencimento.Date;
    dtVenc[1]:=dtVenc1.Date;
    Panel3.SetFocus;
    end;
end;

procedure TfrmPagaVenda.rbChequeClick(Sender: TObject);
begin
  edtBanco.Enabled:=True;
  edtAgencia.Enabled:=True;
  edtConta.Enabled:=True;
  if edtParcelas.Value=1 then
    edtCh1.Enabled:=True;
  if edtParcelas.Value=2 then
    begin
    edtCh1.Enabled:=True;
    edtCh2.Enabled:=True;
    end;
  if edtParcelas.Value=3 then
    begin
    edtCh1.Enabled:=True;
    edtCh2.Enabled:=True;
    edtCh3.Enabled:=True;
    end;
  edtbanco.SetFocus;
end;

procedure TfrmPagaVenda.rbDinClick(Sender: TObject);
begin
  edtBanco.Enabled:=False;
  edtAgencia.Enabled:=False;
  edtConta.Enabled:=False;
  edtCh1.Enabled:=False;
  edtCh2.Enabled:=False;
  edtCh3.Enabled:=False;
end;

procedure TfrmPagaVenda.rbCartClick(Sender: TObject);
begin
  edtBanco.Enabled:=False;
  edtAgencia.Enabled:=False;
  edtConta.Enabled:=False;
  edtCh1.Enabled:=False;
  edtCh2.Enabled:=False;
  edtCh3.Enabled:=False;
end;

procedure TfrmPagaVenda.rbCarnClick(Sender: TObject);
begin
  edtBanco.Enabled:=False;
  edtAgencia.Enabled:=False;
  edtConta.Enabled:=False;
  edtCh1.Enabled:=False;
  edtCh2.Enabled:=False;
  edtCh3.Enabled:=False;
end;

end.

