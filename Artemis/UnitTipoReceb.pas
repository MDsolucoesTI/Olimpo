//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitTipoReceb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, RackCtls, fcButton, fcImgBtn, RXSplit, Grids,variants,
  DBGrids, Mask, DBCtrls, RXCtrls, SpeedBar, jpeg, SRColBtn, EnhEdit,
  CurrEdit, ToolEdit, db, RxLookup, ComCtrls, RxDBComb, EFocCol, EExtenso,
  RxGrdCpt, fcImager, LMDControl, LMDBaseControl, LMDBaseGraphicButton,
  LMDCustomShapeButton, LMDShapeButton, RXDBCtrl;

type
  TFrmTipoReceb = class(TForm)
    cbPagto: TPanel;
    Panel3: TPanel;
    RxLabel4: TRxLabel;
    Image1: TImage;
    RxGradientCaption2: TRxGradientCaption;
    btnDinheiro: TLMDShapeButton;
    btnCheque: TLMDShapeButton;
    btnCartao: TLMDShapeButton;
    PanelDinh: TPanel;
    btnDeposito: TLMDShapeButton;
    PanelCheq: TPanel;
    RxLabel7: TRxLabel;
    dbNum: TDBEdit;
    RxLabel16: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel8: TRxLabel;
    edtValor: TCurrencyEdit;
    PanelCartao: TPanel;
    RxLabel10: TRxLabel;
    RxLabel14: TRxLabel;
    vlConvenio: TCurrencyEdit;
    Panel4: TPanel;
    btnCancelar: TfcImageBtn;
    PanelFrente: TPanel;
    PanelDep: TPanel;
    RxLabel11: TRxLabel;
    lookCC: TRxLookupEdit;
    dbBanco: TDBEdit;
    RxLabel12: TRxLabel;
    RxLabel13: TRxLabel;
    edtVlReceb: TCurrencyEdit;
    RxLabel1: TRxLabel;
    edtVlPago: TRxLabel;
    edtTroco: TRxLabel;
    edtVlTotal: TCurrencyEdit;
    VlPago: TCurrencyEdit;
    Troco: TCurrencyEdit;
    btnConfirmar: TfcImageBtn;
    lkConvenio: TRxLookupEdit;
    dbNumCheq: TEdit;
    CheckPre: TCheckBox;
    dbLookBanc: TRxLookupEdit;
    dbBomPara: TDateEdit;
    dbAgencia: TEdit;
    RxLabel2: TRxLabel;
    dbNumConta: TEdit;
    RxLabel9: TRxLabel;
    procedure SRColorButton4Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDepositoClick(Sender: TObject);
    procedure btnDinheiroClick(Sender: TObject);
    procedure btnChequeClick(Sender: TObject);
    procedure btnCartaoClick(Sender: TObject);
    procedure VlPagoExit(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure CheckPreClick(Sender: TObject);
    procedure RegBaixaLote;
    procedure RecDin;
    procedure RegPgParcial;
    procedure RecCon;
    procedure AtualBalCusto;
  private
    { Private declarations }
    fPagoStt:char;
  public
    { Public declarations }
    Property PagoStt:char Read fPagoStt Write fPagoStt;
  end;

var
  FrmTipoReceb: TFrmTipoReceb;
  TipoPag : String;
  iPerc,Resto : real;
  ano,mes,dia : word;
  mesCusto,anoCusto,Custo : string;
implementation

uses UnitDmdados, UnitBaixaCReceber,unitCreceber, UnitPrincipal,
  UnitBaixaLoteCR;

{$R *.DFM}

procedure TFrmTipoReceb.SRColorButton4Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmTipoReceb.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    end;
end;

procedure TFrmTipoReceb.btnCancelarClick(Sender: TObject);
begin
  PagoStt:='N';
  Close;
end;

procedure TFrmTipoReceb.btnDepositoClick(Sender: TObject);
begin
  PanelFrente.Visible:=False;
  PanelDinh.Visible:=False;
  PanelCheq.Visible:=False;
  PanelCartao.Visible:=False;
  PanelDep.Visible:=True;
  TipoPag:='Dep';
  if dmDados.BaixaLote then
    edtVlReceb.Value:=dmDados.ValorReceb
  else
    edtVlReceb.Value:=FrmCReceber.dbVlReceb.Value;
  lookCC.SetFocus;
end;

procedure TFrmTipoReceb.btnDinheiroClick(Sender: TObject);
begin
  PanelFrente.Visible:=False;
  PanelDinh.Visible:=True;
  PanelCheq.Visible:=False;
  PanelCartao.Visible:=False;
  PanelDep.Visible:=False;
  TipoPag:='Din'; 
  if dmDados.BaixaLote then
    edtVlTotal.Value:=dmDados.ValorReceb
  else
    edtVlTotal.Value:=FrmCReceber.dbVlReceb.Value;
  VlPago.SetFocus;
end;

procedure TFrmTipoReceb.btnChequeClick(Sender: TObject);
begin
  PanelFrente.Visible:=False;
  PanelDinh.Visible:=False;
  PanelCheq.Visible:=True;
  PanelCartao.Visible:=False;
  PanelDep.Visible:=False;
  TipoPag:='Che';
  if dmDados.BaixaLote then
    edtvalor.Value:=dmDados.ValorReceb
  else
    edtValor.Value:=FrmCReceber.dbVlReceb.Value;
  dbLookBanc.SetFocus;
end;

procedure TFrmTipoReceb.btnCartaoClick(Sender: TObject);
begin
  PanelFrente.Visible:=False;
  PanelDinh.Visible:=False;
  PanelCheq.Visible:=False;
  PanelCartao.Visible:=True;
  PanelDep.Visible:=False;
  TipoPag:='Con';
  if dmDados.BaixaLote then
    vlConvenio.Value:=dmDados.ValorReceb
  else
    vlConvenio.Value:=FrmCReceber.dbVlReceb.Value;
  lkConvenio.SetFocus
end;

procedure TFrmTipoReceb.VlPagoExit(Sender: TObject);
begin
  Troco.Value:=VlPago.Value-edtVlTotal.Value;
end;

procedure TFrmTipoReceb.btnConfirmarClick(Sender: TObject);
begin
  PagoStt:='S';
  if dmDados.BaixaLote then
    begin
    //Calculando e registrando os valores
    Resto:=FrmBaixaLoteCR.edtTotal.Value-FrmBaixaLoteCR.dbVlPg.Value;
    iPerc:=((FrmBaixaLoteCR.dbVlPg.Value*100)/FrmBaixaLoteCR.edtTotal.Value)/100;
    end;
  if TipoPag='Din' then
    begin
    //Baixa em Lote
    if dmDados.BaixaLote then
      begin
      FrmBaixaLoteCR.tbCRecSele.First;
      while not(FrmBaixaLoteCR.tbCRecSele.Eof) do
        begin
        RegBaixaLote; //atualiza tbCReceber
        RecDin; //registrar o movimento de caixa
        if FrmBaixaLoteCR.ForPag='P' then //registro o valor restante
          RegPgParcial;
        FrmBaixaLoteCR.tbCRecSele.Next;
        end;
      end
    else
      RecDin; //pagamento padr�o
    end;
  if TipoPag='Con' then
    begin
    //Baixa em Lote
    if dmDados.BaixaLote then
      begin
      FrmBaixaLoteCR.tbCRecSele.First;
      while not(FrmBaixaLoteCR.tbCRecSele.Eof) do
        begin
        RegBaixaLote; //atualiza tbCReceber
        RecCon; //registrar o movimento de conv�nio
        if FrmBaixaLoteCR.ForPag='P' then //registro o valor restante
          RegPgParcial;
        FrmBaixaLoteCR.tbCRecSele.Next;
        end;
      end
    else
      RecCon; //pagamento padr�o
    end;
  if TipoPag='Che' then
    begin
    //registrar o movimento de Cheque
    dmdados.tbCheque.Append;
    dmdados.tbChequeNumBanco.Value:=dbNum.Text;
    dmdados.tbChequeNomeBanco.Value:=dbLookBanc.Text;
    dmdados.tbChequeAgencia.Value:=dbAgencia.Text;
    dmdados.tbChequeCodCli.Value:=dmdados.tbCReceberCodCli.Value;
    dmdados.tbChequeConta.Value:=dbNumConta.Text;
    if dmDados.BaixaLote then
      dmdados.tbChequeValor.Value:=dmDados.ValorReceb
    else
      dmdados.tbChequeValor.Value:=FrmCReceber.dbVlReceb.Value;
    if CheckPre.Checked then
      begin
      dmdados.tbChequeVencimento.Value:=dbBomPara.Date;
      dmDados.tbChequePre.Value:='S';
      end
    else
      begin
      if dmDados.BaixaLote then
        dmdados.tbChequeVencimento.Value:=FrmBaixaLoteCR.dbDtReceb.Date
      else
        dmdados.tbChequeVencimento.Value:=FrmCReceber.dbDtReceb.Date;
      dmDados.tbChequePre.Value:='N';
      end;
    dmdados.tbChequeStatus.Value:='ABERTO';
    dmdados.tbChequeNumCheque.Value:=StrToFloat(dbNumCheq.Text);
    dmDados.tbCheque.Post;
    if Not CheckPre.Checked then
      begin
      dmdados.TbMovConta.Append;
      dmdados.TbMovContaDosNumero.Value:=dmdados.tbCReceberNumDoc.Value;
      dmdados.TbMovContaConta.Value:='000000000000001';
      if dmDados.BaixaLote then
        dmdados.TbMovContaValor.Value:=FrmBaixaLoteCR.dbDtReceb.Date
      else
        dmdados.TbMovContaDataMov.Value:=FrmCReceber.dbDtReceb.Date;
      dmdados.tbMovContaDataReg.value:=date;
      dmdados.TbMovContaHoraReg.Value:=time;
      dmdados.TbMovContaTipoOper.Value:='E';
      dmdados.TbMovContaCodHist.Value:=dmdados.tbCReceberCodHist.Value;
      dmdados.TbMovContaCodDoc.Value:=dmdados.tbCReceberCodDoc.Value;
      dmdados.TbMovContaComplHist.Value:='Recebimento em Cheque n� '+dbNumCheq.Text;
      if dmDados.BaixaLote then
        dmdados.TbMovContaDataMov.Value:=dmDados.ValorReceb
      else
        dmdados.TbMovContaValor.Value:=FrmCReceber.dbVlReceb.Value;
      dmdados.TbMovConta.Post;
      {atualizar conta corrente}
      if dmdados.TbCCorrente.Locate('Conta','000000000000001',[]) then
        begin
        dmdados.TbCCorrente.Edit;
        if dmDados.BaixaLote then
          dmdados.TbCCorrenteSaldo.Value:=dmDados.TbCCorrenteSaldo.Value+dmDados.ValorReceb
        else
          dmdados.TbCCorrenteSaldo.Value:=dmDados.TbCCorrenteSaldo.Value+FrmCReceber.dbVlReceb.Value;
        dmdados.tbccorrenteUltMov.value:=date;
        dmdados.TbCCorrente.post;
        end;
      end;
    {atualizar centro de custo}
    DecodeDate(now,ano,mes,dia);
    mesCusto:=IntToStr(mes);
    anoCusto:=IntTostr(ano);
    Custo:=dmdados.tbCReceberCodCCusto.Value;
    if dmdados.TbBalCusto.Locate('CodCcusto;Mes;Ano',VarArrayOf([Custo,mesCusto,anoCusto]),[]) then
      begin
      dmdados.tbBalcusto.edit;
      if dmDados.BaixaLote then
        dmdados.tbBalcustoReceitas.value:=dmdados.tbBalcustoReceitas.value+dmDados.ValorReceb
      else
        dmdados.tbBalcustoReceitas.value:=dmdados.tbBalcustoReceitas.value+FrmCReceber.dbVlReceb.Value;
      dmdados.tbBalCusto.Post;
      end
    else
      begin
      dmdados.tbBalCusto.Append;
      dmdados.tbBalCustoCodCcusto.Value:=Custo;
      dmdados.tbBalCustoMes.Value:=IntToStr(mes);
      dmdados.tbBalCustoAno.Value:=IntToStr(ano);
      if dmDados.BaixaLote then
        dmdados.tbBalcustoReceitas.value:=dmDados.ValorReceb
      else
        dmdados.tbBalcustoReceitas.value:=FrmCReceber.dbVlReceb.Value;
      dmdados.tbBalCustoDespesas.Value:=0;
      dmdados.tbBalCusto.Post;
      end;
    //Baixa em Lote
    if dmDados.BaixaLote then
      begin
      FrmBaixaLoteCR.tbCRecSele.First;
      while not(FrmBaixaLoteCR.tbCRecSele.Eof) do
        begin
        RegBaixaLote; //atualiza tbCReceber
        if FrmBaixaLoteCR.ForPag='P' then //registro o valor restante
          RegPgParcial;
        FrmBaixaLoteCR.tbCRecSele.Next;
        end;
      end;
    end;
  if TipoPag='Dep' then
    begin
    dmdados.TbMovConta.Append;
    dmdados.TbMovContaDosNumero.Value:=dmdados.tbCReceberNumDoc.Value;
    dmdados.TbMovContaConta.Value:=lookCC.Text;
    dmdados.TbMovContaDataMov.Value:=FrmCReceber.dbDtReceb.Date;
    dmdados.tbMovContaDataReg.value:=date;
    dmdados.TbMovContaHoraReg.Value:=time;
    dmdados.TbMovContaTipoOper.Value:='E';
    dmdados.TbMovContaCodHist.Value:=dmdados.tbCReceberCodHist.Value;
    dmdados.TbMovContaCodDoc.Value:=dmdados.tbCReceberCodDoc.Value;
    dmdados.TbMovContaComplHist.Value:='Recebimento por Deposito';
    if dmDados.BaixaLote then
      dmdados.TbMovContaValor.Value:=dmDados.ValorReceb
    else
      dmdados.TbMovContaValor.Value:=FrmCReceber.dbVlReceb.Value;
    dmdados.TbMovConta.Post;
    {atualizar conta corrente}
    if dmdados.TbCCorrente.Locate('Conta',LookCC.Text,[]) then
      begin
      dmdados.TbCCorrente.Edit;
      if dmDados.BaixaLote then
        dmdados.TbCCorrenteSaldo.Value:=dmDados.TbCCorrenteSaldo.Value+dmDados.ValorReceb
      else
        dmdados.TbCCorrenteSaldo.Value:=dmDados.TbCCorrenteSaldo.Value+FrmCReceber.dbVlReceb.Value;
      dmdados.tbccorrenteUltMov.value:=date;
      dmdados.TbCCorrente.post;
      end;
    {atualizar centro de custo}
    DecodeDate(now,ano,mes,dia);
    mesCusto:=IntToStr(mes);
    anoCusto:=IntTostr(ano);
    Custo:=dmdados.tbCReceberCodCCusto.Value;
    if dmdados.TbBalCusto.Locate('CodCcusto;Mes;Ano',VarArrayOf([Custo,mesCusto,anoCusto]),[]) then
      begin
      dmdados.tbBalcusto.edit;
      if dmDados.BaixaLote then
        dmdados.tbBalcustoReceitas.value:=dmdados.tbBalcustoReceitas.value+dmDados.ValorReceb
      else
        dmdados.tbBalcustoReceitas.value:=dmdados.tbBalcustoReceitas.value+FrmCReceber.dbVlReceb.Value;
      dmdados.tbBalCusto.Post;
      end
    else
      begin
      dmdados.tbBalCusto.Append;
      dmdados.tbBalCustoCodCcusto.Value:=Custo;
      dmdados.tbBalCustoMes.Value:=IntToStr(mes);
      dmdados.tbBalCustoAno.Value:=IntToStr(ano);
      if dmDados.BaixaLote then
        dmdados.tbBalcustoReceitas.value:=dmDados.ValorReceb
      else
        dmdados.tbBalcustoReceitas.value:=FrmCReceber.dbVlReceb.Value;
      dmdados.tbBalCustoDespesas.Value:=0;
      dmdados.tbBalCusto.Post;
      end;
    if dmDados.BaixaLote then
      begin
      FrmBaixaLoteCR.tbCRecSele.First;
      while not(FrmBaixaLoteCR.tbCRecSele.Eof) do
        begin
        RegBaixaLote; //atualiza tbCReceber
        if FrmBaixaLoteCR.ForPag='P' then //registro o valor restante
          RegPgParcial;
        FrmBaixaLoteCR.tbCRecSele.Next;
        end;
      end;
    end;
  Close;
end;

procedure TFrmTipoReceb.CheckPreClick(Sender: TObject);
begin
  if CheckPre.Checked then
    dbBomPara.Enabled:=True;
end;

procedure TFrmTipoReceb.RegBaixaLote;
begin
  dmDados.tbCReceber.Locate('CodCRec',FrmBaixaLoteCR.tbCRecSeleCodRec.Value,[]);
  dmDados.tbCReceber.Edit;
  dmDados.tbCReceberPago.Value:='PAGO';
  if FrmBaixaLoteCR.ForPag='P' then
    dmDados.tbCReceberTipoPago.Value:='Pagamento Parcial'
  else
    dmDados.tbCReceberTipoPago.Value:='Pagamento Total';
  dmDados.tbCReceberDataPaga.Value:=FrmBaixaLoteCR.dbDtReceb.Date;
  if FrmBaixaLoteCR.ForPag='N' then
    begin
    dmDados.tbCReceberValorPago.Value:=FrmBaixaLoteCR.tbCRecSeleValTotal.Value;
    dmDados.tbCReceberDescPago.Value:=FrmBaixaLoteCR.tbCRecSeleDesconto.Value;
    dmDados.tbCReceberMuJuPago.Value:=FrmBaixaLoteCR.tbCRecSeleJuroMulta.Value;
    end
  else
    begin
    dmDados.tbCReceberValorPago.Value:=FrmBaixaLoteCR.tbCRecSeleValTotal.Value*iPerc;
    dmDados.tbCReceberMuJuPago.Value:=FrmBaixaLoteCR.tbCRecSeleJuroMulta.Value;
    dmDados.tbCReceberDescPago.Value:=FrmBaixaLoteCR.tbCRecSeleDesconto.Value;
    if FrmBaixaLoteCR.ForPag='D' then
      dmDados.tbCReceberDescPago.Value:=FrmBaixaLoteCR.tbCRecSeleDesconto.Value+(FrmBaixaLoteCR.tbCRecSeleValTotal.Value-(FrmBaixaLoteCR.tbCRecSeleValTotal.Value*iPerc));
    end;
  dmdados.tbCReceber.Post;
end;

procedure TFrmTipoReceb.RecDin;
begin
  dmdados.TbMovConta.Append;
  dmdados.TbMovContaDosNumero.Value:=dmdados.tbCReceberNumDoc.Value;
  dmdados.TbMovContaConta.Value:='000000000000001';
  if dmDados.BaixaLote then
    dmdados.TbMovContaValor.Value:=FrmBaixaLoteCR.dbDtReceb.Date
  else
    dmdados.TbMovContaDataMov.Value:=FrmCReceber.dbDtReceb.Date;
  dmdados.tbMovContaDataReg.value:=date;
  dmdados.TbMovContaHoraReg.Value:=time;
  dmdados.TbMovContaTipoOper.Value:='E';
  dmdados.TbMovContaCodHist.Value:=dmdados.tbCReceberCodHist.Value;
  dmdados.TbMovContaCodDoc.Value:=dmdados.tbCReceberCodDoc.Value;
  dmdados.TbMovContaComplHist.Value:=dmDados.tbCReceberCompHist.Value;
  if dmDados.BaixaLote then
    if FrmBaixaLoteCR.ForPag='N' then
      dmdados.TbMovContaDataMov.Value:=FrmBaixaLoteCR.tbCRecSeleValTotal.Value
    else
      dmdados.TbMovContaDataMov.Value:=FrmBaixaLoteCR.tbCRecSeleValTotal.Value*iPerc
  else
    dmdados.TbMovContaValor.Value:=FrmCReceber.dbVlReceb.Value;
  dmdados.TbMovConta.Post;
  {atualizar conta corrente}
  if dmdados.TbCCorrente.Locate('Conta','000000000000001',[]) then
    begin
    dmdados.TbCCorrente.Edit;
    if dmDados.BaixaLote then
      if FrmBaixaLoteCR.ForPag='N' then
        dmdados.TbCCorrenteSaldo.Value:=dmDados.TbCCorrenteSaldo.Value+FrmBaixaLoteCR.tbCRecSeleValTotal.Value
      else
        dmdados.TbCCorrenteSaldo.Value:=dmDados.TbCCorrenteSaldo.Value+FrmBaixaLoteCR.tbCRecSeleValTotal.Value*iPerc
    else
      dmdados.TbCCorrenteSaldo.Value:=dmDados.TbCCorrenteSaldo.Value+FrmCReceber.dbVlReceb.Value;
    dmdados.tbccorrenteUltMov.value:=date;
    dmdados.TbCCorrente.post;
    end;
   {atualizar centro de custo}
   AtualBalCusto;
end;

procedure TFrmTipoReceb.RegPgParcial;
var
  NumDoc,CodDoc,CodHist,CompHist,CodcCusto,Portador,NumBanco : string;
  CodCli : integer;
  DataEmis,DataVenc,MultaDia,DescDia,JurosDia : TDateTime;
  ValorMulta,PercMulta,ValorDesc,PercDesc,ValorJuros,PercJuros : Real;
begin
  NumDoc:=dmDados.tbCReceberNumDoc.Value;
  CodDoc:=dmDados.tbCReceberCodDoc.Value;
  CodCli:=dmDados.tbCReceberCodCli.Value;
  DataEmis:=dmDados.tbCReceberDataEmis.Value;
  DataVenc:=dmDados.tbCReceberDataVenc.Value;
  CodHist:=dmDados.tbCReceberCodHist.Value;
  MultaDia:=dmDados.tbCReceberMultaDia.Value;
  ValorMulta:=dmDados.tbCReceberValorMulta.Value;
  PercMulta:=dmDados.tbCReceberPercMulta.Value;
  DescDia:=dmDados.tbCReceberDescDia.Value;
  ValorDesc:=dmDados.tbCReceberValorDesc.Value;
  PercDesc:=dmDados.tbCReceberPercDesc.Value;
  JurosDia:=dmDados.tbCReceberJurosDia.Value;
  ValorJuros:=dmDados.tbCReceberValorJuros.Value;
  PercJuros:=dmDados.tbCReceberPercJuros.Value;
  CodCCusto:=dmDados.tbCReceberCodCCusto.Value;
  Portador:=dmDados.tbCReceberPortador.Value;
  NumBanco:=dmDados.tbCReceberNumBanco.Value;
  dmDados.tbCReceber.Append;
  dmdados.tbCReceberPago.Value:='ABERTO';
  dmDados.tbCReceberCompHist.Value:=CompHist+' - Pagto Parcial';
  dmDados.tbCReceberNumDoc.Value:=NumDoc;
  dmDados.tbCReceberCodDoc.Value:=CodDoc;
  dmDados.tbCReceberCodCli.Value:=CodCli;
  dmDados.tbCReceberDataEmis.Value:=DataEmis;
  dmDados.tbCReceberDataVenc.Value:=Date;
  dmDados.tbCReceberCodHist.Value:=CodHist;
  dmDados.tbCReceberValor.Value:=FrmBaixaLoteCR.tbCRecSeleValTotal.Value-(FrmBaixaLoteCR.tbCRecSeleValTotal.Value*iPerc);
  dmDados.tbCReceberMultaDia.Value:=MultaDia;
  dmDados.tbCReceberValorMulta.Value:=ValorMulta;
  dmDados.tbCReceberPercMulta.Value:=PercMulta;
  dmDados.tbCReceberDescDia.Value:=DescDia;
  dmDados.tbCReceberValorDesc.Value:=ValorDesc;
  dmDados.tbCReceberPercDesc.Value:=PercDesc;
  dmDados.tbCReceberJurosDia.Value:=JurosDia;
  dmDados.tbCReceberValorJuros.Value:=ValorJuros;
  dmDados.tbCReceberPercJuros.Value:=PercJuros;
  dmDados.tbCReceberCodCCusto.Value:=CodCCusto;
  dmDados.tbCReceberPortador.Value:=Portador;
  dmDados.tbCReceberNumBanco.Value:=NumBanco;
  dmDados.tbCReceber.Post;
end;

procedure TFrmTipoReceb.RecCon;
begin
  dmdados.TbMovConta.Append;
  dmdados.TbMovContaDosNumero.Value:=dmdados.tbCReceberNumDoc.Value;
  dmdados.TbMovContaConta.Value:='000000000000001';
  if dmDados.BaixaLote then
    dmdados.TbMovContaValor.Value:=FrmBaixaLoteCR.dbDtReceb.Date
  else
    dmdados.TbMovContaDataMov.Value:=FrmCReceber.dbDtReceb.Date;
  dmdados.tbMovContaDataReg.value:=date;
  dmdados.TbMovContaHoraReg.Value:=time;
  dmdados.TbMovContaTipoOper.Value:='E';
  dmdados.TbMovContaCodHist.Value:=dmdados.tbCReceberCodHist.Value;
  dmdados.TbMovContaCodDoc.Value:=dmdados.tbCReceberCodDoc.Value;
  dmdados.TbMovContaComplHist.Value:=dmDados.tbConvenioDescricao.Value;
  if dmDados.BaixaLote then
    if FrmBaixaLoteCR.ForPag='N' then
      dmdados.TbMovContaDataMov.Value:=FrmBaixaLoteCR.tbCRecSeleValTotal.Value
    else
      dmdados.TbMovContaDataMov.Value:=FrmBaixaLoteCR.tbCRecSeleValTotal.Value*iPerc
  else
    dmdados.TbMovContaValor.Value:=FrmCReceber.dbVlReceb.Value;
  dmdados.TbMovConta.Post;
  {atualizar conta corrente}
  if dmdados.TbCCorrente.Locate('Conta','000000000000001',[]) then
    begin
    dmdados.TbCCorrente.Edit;
    if dmDados.BaixaLote then
      if FrmBaixaLoteCR.ForPag='N' then
        dmdados.TbCCorrenteSaldo.Value:=dmDados.TbCCorrenteSaldo.Value+FrmBaixaLoteCR.tbCRecSeleValTotal.Value
      else
        dmdados.TbCCorrenteSaldo.Value:=dmDados.TbCCorrenteSaldo.Value+FrmBaixaLoteCR.tbCRecSeleValTotal.Value*iPerc
    else
      dmdados.TbCCorrenteSaldo.Value:=dmDados.TbCCorrenteSaldo.Value+FrmCReceber.dbVlReceb.Value;
    dmdados.tbccorrenteUltMov.value:=date;
    dmdados.TbCCorrente.post;
    end;
  {atualizar centro de custo}
   AtualBalCusto;
end;

procedure TFrmTipoReceb.AtualBalCusto;
begin
  {atualizar centro de custo}
  DecodeDate(now,ano,mes,dia);
  mesCusto:=IntToStr(mes);
  anoCusto:=IntTostr(ano);
  Custo:=dmdados.tbCReceberCodCCusto.Value;
  if dmdados.TbBalCusto.Locate('CodCcusto;Mes;Ano',VarArrayOf([Custo,mesCusto,anoCusto]),[]) then
    begin
    dmdados.tbBalcusto.edit;
    if dmDados.BaixaLote then
      if FrmBaixaLoteCR.ForPag='N' then
        dmdados.tbBalcustoReceitas.value:=dmdados.tbBalcustoReceitas.value+FrmBaixaLoteCR.tbCRecSeleValTotal.Value
      else
        dmdados.tbBalcustoReceitas.value:=dmdados.tbBalcustoReceitas.value+FrmBaixaLoteCR.tbCRecSeleValTotal.Value*iPerc
    else
      dmdados.tbBalcustoReceitas.value:=dmdados.tbBalcustoReceitas.value+FrmCReceber.dbVlReceb.Value;
    dmdados.tbBalCusto.Post;
    end
  else
    begin
    dmdados.tbBalCusto.Append;
    dmdados.tbBalCustoCodCcusto.Value:=Custo;
    dmdados.tbBalCustoMes.Value:=IntToStr(mes);
    dmdados.tbBalCustoAno.Value:=IntToStr(ano);
    if dmDados.BaixaLote then
      if FrmBaixaLoteCR.ForPag='N' then
        dmdados.tbBalcustoReceitas.value:=FrmBaixaLoteCR.tbCRecSeleValTotal.Value
      else
        dmdados.tbBalcustoReceitas.value:=FrmBaixaLoteCR.tbCRecSeleValTotal.Value*iPerc
    else
      dmdados.tbBalcustoReceitas.value:=FrmCReceber.dbVlReceb.Value;
    dmdados.tbBalCustoDespesas.Value:=0;
    dmdados.tbBalCusto.Post;
    end;
end;

end.
