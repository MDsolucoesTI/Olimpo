//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcButton, fcImgBtn, RackCtls, StdCtrls, DBCtrls, RXDBCtrl,Variants,
  Mask, RXSplit, RXCtrls, ExtCtrls, SpeedBar, jpeg, Grids, DBGrids,db,
  ComCtrls, TFlatRadioButtonUnit, CurrEdit, RxLookup, Spin, EnhEdit,
  DBTables, RxDBComb, ToolEdit, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint;

type
  TFrmVendas = class(TForm)
    Image6: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    gbvendas: TGroupBox;
    RxLabel2: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel8: TRxLabel;
    DBLookVend: TDBLookupComboBox;
    dbimgProduto: TDBImage;
    ceTotNota: TCurrencyEdit;
    RxSplitter1: TRxSplitter;
    gbpagto: TGroupBox;
    RxLabel22: TRxLabel;
    RxLabel23: TRxLabel;
    RxLabel24: TRxLabel;
    RxLabel25: TRxLabel;
    ceAcrescimo: TCurrencyEdit;
    ceDesconto: TCurrencyEdit;
    dbgridPedido: TRxDBGrid;
    RxLabel3: TRxLabel;
    btnLocProd: TfcImageBtn;
    RxLabel1: TRxLabel;
    BtnlocCli: TfcImageBtn;
    RxLabel11: TRxLabel;
    dbNumPedido: TDBEdit;
    dbProduto: TDBEdit;
    dbCliente: TDBEdit;
    dbeqtde: TDBEdit;
    dbVu: TDBEdit;
    dbTotal: TDBEdit;
    RxSplitter2: TRxSplitter;
    RxSplitter3: TRxSplitter;
    dbValorFinal: TDBEdit;
    RxSplitter4: TRxSplitter;
    dbcbPagto: TRxDBComboBox;
    ceSubTotal: TCurrencyEdit;
    dbstatus: TRxDBComboBox;
    RxLabel15: TRxLabel;
    RxLabel9: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel10: TRxLabel;
    Image2: TImage;
    Label2: TLabel;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnPrimeiro: TSpeedItem;
    BtnAnterior: TSpeedItem;
    BtnProximo: TSpeedItem;
    BtnUltimo: TSpeedItem;
    BtnNovo: TSpeedItem;
    btnPagto: TSpeedItem;
    BtnGravar: TSpeedItem;
    BtnCancelar: TSpeedItem;
    BtnDeletar: TSpeedItem;
    BtnLocalizar: TSpeedItem;
    BtnSair: TSpeedItem;
    edCodCli: TDBEdit;
    edCodProd: TDBEdit;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnLocProdClick(Sender: TObject);
    procedure BtnlocCliClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure edCodCliExit(Sender: TObject);
    procedure edCodProdExit(Sender: TObject);
    procedure dbeqtdeExit(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure DBLookVendExit(Sender: TObject);
    procedure btnPagtoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure ceDescontoExit(Sender: TObject);
    procedure dbValorFinalExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbStatusExit(Sender: TObject);
    procedure dbcbPagtoExit(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure dbVuExit(Sender: TObject);
    procedure edCodProdEnter(Sender: TObject);
  private
    { Private declarations }
  cli : longint;
  public
    { Public declarations }
   property Codcli : longint read cli write cli;
  end;

var
  FrmVendas : TFrmVendas;
  pagto,cancelar,NovoItem : boolean;
  datavenda : tdatetime;
  codigoVenda : integer;
  qtdeVendida : integer;
  vendedor : integer;
  comissao : integer;
  x,i,pagamento : integer;
  Pos  : TBookMark;
  valorparc,limite : currency;
  cHabilitaTeclado : boolean=true;
  VtabStt : boolean=true;
  prazoPagto : integer;

implementation

uses UnitLocVenda, unitLocCliente, unitDmDados,
  UnitLocProd, UnitPrincipal;

{$R *.DFM}

procedure TFrmVendas.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TFrmVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.tbFunc.Filtered:=false;
  action:= Cafree;
end;

procedure TFrmVendas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmVendas.btnLocProdClick(Sender: TObject);
begin
if (dmdados.tbVendas.State=DsInsert)or(dmdados.tbVendas.State=DsEdit) then
begin
    frmLocProd:=tfrmLocProd.create(application);
    frmLocProd.showmodal;
    if not(dmdados.tbDetVendas.State=dsinsert) then
      dmdados.tbDetVendas.Append;
    dmdados.tbDetVendasCodMerc.Value:=frmLocProd.resultado;
    dmdados.tbDetVendasCodVen.Value:=codigovenda;
    dmdados.tbDetVendasDataVen.Value:=Date;
    frmLocProd.Free;
    edCodProd.SetFocus;
        
end;

end;

procedure TFrmVendas.BtnlocCliClick(Sender: TObject);
begin
  if (dmdados.tbVendas.State=DsInsert)or(dmdados.tbVendas.State=DsEdit) then
    begin
    frmLocCliente:=tfrmLocCliente.create(application);
    frmLocCliente.showmodal;
    dmdados.tbVendasCodCli.Value:=frmLocCliente.resultado;
    frmLocCliente.free;
    EdCodCli.SetFocus;
    end;
end;

procedure TFrmVendas.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [End] Gravar [F2] Loc. Cliente [F3] Loc. Produto [F4] Pagamento [Esc] Cancelar ou Sair');
  pagto:=false;
  cancelar:=false;
  NovoItem := True;
  dmdados.tbFunc.IndexName:='iCodCargo';
  dmdados.tbFunc.SetRangeStart;
  dmdados.tbFunc.FieldByName('CodCargo').asInteger:=1;
  dmdados.tbFunc.SetRangeEnd;
  dmdados.tbFunc.FieldByName('CodCargo').asInteger:=7;
  dmdados.tbFunc.ApplyRange;
  SpeedBar1.SetFocus;
end;

procedure TFrmVendas.BtnNovoClick(Sender: TObject);
begin
  novoItem:=true;
  if FileExists('Logogen.bmp') then
    frmVendas.dbimgProduto.Picture.LoadFromFile('Logogen.bmp');
  dmdados.tbVendas.Last;
  CodigoVenda:=dmdados.tbVendasCodVen.Value;
  DataVenda:=dmdados.tbVendasDataVen.Value;
  dblookVend.Enabled:=true;
  BtnNovo.Enabled:=False;
  btnpagto.Enabled:=true;
  btncancelar.Enabled:=true;
  edcodcli.Enabled:=true;
  edcodprod.Enabled:=true;
  dbeqtde.Enabled:=True;
  dbVu.Enabled:= True;
  dmdados.tbVendas.Append;
  dmdados.tbVendasDataVen.Value:=date;
  //calcula o c�digo da venda
  if dataVenda = date then
    dmdados.tbVendasCodVen.Value:=codigovenda+1
  else
    dmdados.tbVendasCodVen.Value:=1;
  codigovenda:=dmdados.tbVendasCodVen.value;
  dmdados.tbVendasHoraVen.Value:=time;
  dmdados.tbVendasValor.Value:=0;
  dmdados.tbVendasDesconto.Value:=0;
  dblookVend.SetFocus;
  VtabStt:=false;
end;

procedure TFrmVendas.edCodCliExit(Sender: TObject);
begin
  If NovoItem Then
    If edCodCli.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o C�DIGO DO CLIENTE');
      edCodCli.SetFocus;
      End
    Else
      begin
      if not (dmdados.tbCliente.Locate('CodCli',edcodCli.text,[])) then
        begin
        showmessage('C�DIGO DO CLIENTE n�o cadastrado!');
        edcodcli.SetFocus;
        end
      else
        Begin
        if dmdados.tbLibCreditoRestricao.Value='Restrito' then
          BEGIN
          ShowMessage('Consta restri��o para este cliente!'+#13+
                      'Venda n�o liberada.Favor consultar CPF OU CNPJ');
          BtnCancelar.Click;
          abort;
          end
        else
          begin
          {liberada a venda, calcular faturamento }
          if dataVenda<>date then
            begin
            dmdados.tbFaturamento.Append;
            dmdados.tbFaturamentoDataVen.Value:=date;
            dmdados.tbFaturamentoTotalVenda.Value:=0;
            dmdados.tbFaturamentoTotalDesc.Value:=0;
            dmdados.tbFaturamentoTotalCom.Value:=0;
            dmdados.tbFaturamentoTotalCusto.Value:=0;
            dmdados.tbFaturamento.Post;
            end;
          limite:=dmdados.tbLibCreditoLimite.Value;
          codcli:=dmdados.tbClienteCodCli.Value;

          if not(dmdados.tbDetVendas.State=dsinsert) then
          dmdados.tbDetVendas.Append;
          
          dmdados.tbDetVendasCodVen.Value:=codigovenda;
          dmdados.tbDetVendasDataVen.Value:=Date;
          //prazoPagto:=dmdados.tbClientePrazoPagto.AsInteger;
          End;
        End;
      end;
end;


procedure TFrmVendas.edCodProdExit(Sender: TObject);
begin
  if novoItem then
    if pagto then
      begin
      dmdados.tbDetVendas.cancel;
      btnNovo.Enabled:=false;
      btnGravar.Enabled:=true;
      edcodprod.Enabled:=false;
      ceacrescimo.Enabled:=true;
      cedesconto.Enabled:=true;
      dbStatus.Enabled:=true;
      dbcbPagto.Enabled:=true;
      ceacrescimo.SetFocus;
      end
    else
      begin
      //localizar o produto
      if edcodprod.Text='' then
        begin
        ShowMessage('Necess�rio informar o C�DIGO DO PRODUTO');
        edcodprod.SetFocus;
        end
      else
        if not (dmdados.tbEstoque.Locate('CodMerc',edcodprod.text,[])) then
          begin
          showmessage('C�DIGO DO PRODUTO n�o cadastrado!');
          edcodprod.SetFocus;
          End
        Else
          Begin
          dmdados.tbDetVendasDataVen.Value:=date;
          dmdados.tbDetVendasCodVen.Value:=codigoVenda;
          dmdados.tbDetVendasCustoUnit.Value:=dmdados.tbEstoquePrecoCompra.Value;
          end;
      end;
end;

procedure TFrmVendas.dbeqtdeExit(Sender: TObject);
begin
 If NovoItem Then
    If dbeqtde.Text= '' then
      Begin
      ShowMessage('� obrigat�rio a Quantidade');
      dbeqtde.SetFocus;
      End
    else
      //Atualizando estoque
      if dmdados.tbEstoque.Locate('CodMerc',edcodprod.Text,[]) then
        begin
        if dmdados.tbDetVendasQuant.Value > dmdados.tbEstoqueQuantidade.Value then
          begin
          ShowMessage('Quantidade vendida ultrapassa a quantidade real em estoque');
          dmdados.tbDetVendasQuant.Value:=dmdados.tbEstoqueQuantidade.value;
          dbeqtde.SetFocus;
          end
        else
          begin
          //Buscar Pre�o real de venda ou de promo��o
          dmdados.tbDetVendasPrecoUnit.Value:=dmdados.tbEstoquePrecoVenda.Value;
          dmdados.tbEstoque.edit;
          dmdados.tbEstoqueUltimaVenda.Value:=date;
          dmdados.tbEstoqueQuantidade.Value:=dmdados.tbEstoqueQuantidade.Value-dmdados.tbDetVendasQuant.Value;
          dmdados.tbEstoque.Post;
          end;
        end;
end;

procedure TFrmVendas.BtnGravarClick(Sender: TObject);
Var
  Campos               : String;
  Vazio,Gravar,flag    : Boolean;
  x                    : Integer;
  ano,mes,dia          : word;
  mesVen,anoVen,diaVen : string;
begin
  //VALIDA��ES
  NovoItem:=False;
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  If dbStatus.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Cliente Especial';
    Gravar:=False;
    Vazio:=True;
    end;
  If dbcbPagto.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Forma de Pagto';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to dbcbPagto.Items.Count-1 Do
      If dbcbPagto.Text=dbcbPagto.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor'+ dbcbPagto.Text+'inv�lido');
      Gravar:=False;
      End;
    End;
  If Gravar Then
    Begin
    pagto:=false;
    VtabStt:=true;
    dmdados.tbVendasEntrega.Value:=dmdados.tbVendasDataven.Value+1;
    dmdados.tbVendas.Post;
    //imprimir o pedido
    btnNovo.Enabled:=true;
    btnPagto.Enabled:=false;
    btngravar.Enabled:=false;
    btncancelar.Enabled:=false;
    speedbar1.SetFocus;
    //lan�ar pedido no contas a receber
    if dmdados.tbVendasCodForPag.Value='BO' then
    begin
    decodedate(now,ano,mes,dia);
    diaVen:=IntToStr(dia);
    mesVen:=IntToStr(mes);
    anoVen:=IntToStr(ano);
    dmdados.tbCReceber.Append;
    dmdados.tbCReceberCodVen.Value:=dmdados.tbVendasCodVen.Value;
    dmdados.tbCReceberCodDoc.Value:=1;
    dmdados.tbCReceberNumDoc.Value:=diaVen+mesVen+anoVen+dmdados.tbVendasCodVen.AsString;
    dmdados.tbCReceberCodCli.Value:=dmdados.tbVendasCodCli.Value;
    dmdados.tbCReceberDataVen.Value:=dmdados.tbVendasDataven.Value;
    dmdados.tbCReceberFormaPagto.Value:=dmdados.tbVendasCodForPag.Value;
    dmdados.tbCReceberDataEmis.Value:=date;
    dmdados.tbCReceberDataVenc.Value:=date+prazoPagto;
    dmdados.tbCReceberCompHist.Value:=('Pedido realizado no dia'+' '+
                                      DateToStr(date)+' '+'�s'+' '+TimeToStr(time));
    dmdados.tbCReceberValor.Value:=dmdados.tbVendasValor.Value;
    dmdados.tbCReceberPago.Value:='Aberto';
    dmdados.tbCReceber.Post;
    end;
    if dmdados.tbVendasCodForPag.Value='VI'   then
    begin
    {Atualizar movimento de conta}
    dmdados.TbMovConta.Append;
    dmdados.TbMovContaDosNumero.Value:=diaVen+mesVen+anoVen+dmdados.tbVendasCodVen.AsString;
    dmdados.TbMovContaConta.Value:='000000000000001';
    dmdados.TbMovContaDataMov.Value:=date;
    dmdados.tbMovContaDataReg.value:=date;
    dmdados.TbMovContaHoraReg.Value:=time;
    dmdados.TbMovContaValor.Value:=dmdados.tbVendasValor.Value;
    dmdados.TbMovContaTipoOper.Value:='E';
    dmdados.TbMovContaComplHist.Value:='Venda'+''+'n�'+dmdados.tbVendasCodVen.AsString+'do dia'+DateToStr(date);
    dmdados.TbMovContaCodDoc.Value:=1;
    dmdados.TbMovConta.Post;
    end;
  {atualizar conta corrente}
  if dmdados.TbCCorrente.Locate('Conta',000000000000001,[]) then
    begin
    dmdados.TbCCorrente.Edit;
    dmdados.TbCCorrenteSaldo.Value:=
        dmdados.TbCCorrenteSaldo.Value+dmdados.tbVendasValor.Value;
    dmdados.tbccorrenteUltMov.value:=date;
    dmdados.TbCCorrente.post;
    end;
    //calcular faturamento
    dmdados.tbFaturamento.Last;
    if not (dmdados.tbfaturamento.state=dsedit) then
      begin
      dmdados.dsFaturamento.Edit;
      dmdados.tbFaturamentoTotalVenda.Value:=dmdados.tbFaturamentoTotalVenda.Value+
                                           dmdados.tbVendasValor.Value;
      dmdados.tbFaturamentoTotalDesc.Value:=dmdados.tbFaturamentoTotalDesc.Value+
                                          dmdados.tbVendasDesconto.Value;
      //dmdados.tbFaturamentoTotalCom.Value:=dmdados.tbFaturamentoTotalCom.Value+
      //                                   (dmdados.tbDetvVendasComissao.Value/100);
      //dmdados.tbFaturamentoTotalCusto.Value:=dmdados.tbFaturamentoTotalCusto.Value+
      //                                     dmdados.tbVendasCustoUnit.Value;
      dmdados.tbFaturamento.Post;
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
    //lan�ar imposto PIS no contas a pagar
    dmdados.tbCPagar.Append;
    dmdados.tbCPagarDataEmis.Value:=date;
    dmdados.tbCPagarDataVenc.Value:=date;
    dmdados.tbCPagarNumDoc.Value:='Venda n�'+dmdados.tbVendasCodVen.AsString;
    dmdados.tbCPagarCodHist.AsString:='5';
    dmdados.tbCPagarCompHist.Value:='Imposto sobre a venda do dia'+' '+DateToStr(date);
    dmdados.tbCPagarValor.Value:=dmdados.tbVendasValor.Value*(dmdados.tbparametroPis.value/100);
    dmdados.tbCpagarPago.value:='Aberto';
    dmdados.tbcpagar.Post;
    //lan�ar imposto Cofins no contas a pagar
    dmdados.tbCPagar.Append;
    dmdados.tbCPagarDataEmis.Value:=date;
    dmdados.tbCPagarDataVenc.Value:=date;
    dmdados.tbCPagarNumDoc.Value:='Venda n�'+dmdados.tbVendasCodVen.AsString;
    dmdados.tbCPagarCodHist.AsString:='6';
    dmdados.tbCPagarCompHist.Value:='Imposto sobre a venda do dia'+' '+DateToStr(date);
    dmdados.tbCPagarValor.Value:=dmdados.tbVendasValor.Value*(dmdados.tbparametroCofins.value/100);
    dmdados.tbCpagarPago.value:='Aberto';
    dmdados.tbcpagar.Post;
    //lan�ar imposto C.S. no contas a pagar
    dmdados.tbCPagar.Append;
    dmdados.tbCPagarDataEmis.Value:=date;
    dmdados.tbCPagarDataVenc.Value:=date;
    dmdados.tbCPagarNumDoc.Value:='Venda n�'+dmdados.tbVendasCodVen.AsString;
    dmdados.tbCPagarCodHist.AsString:='7';
    dmdados.tbCPagarCompHist.Value:='Imposto sobre a venda do dia'+' '+DateToStr(date);
    dmdados.tbCPagarValor.Value:=dmdados.tbVendasValor.Value*(dmdados.tbparametroCS.value/100);
    dmdados.tbCpagarPago.value:='Aberto';
    dmdados.tbcpagar.Post;
    ShowMessage('Dados Gravados com Sucesso!!');

    ceAcrescimo.Enabled:=false;
    ceDesconto.Enabled:=false;
    edCodCli.Enabled:=false;
    edCodProd.Enabled:=false;
    DBLookVend.Enabled:=false;
    dbeqtde.Enabled:=false;
    dbVu.Enabled:=false;
    dbstatus.Enabled:=false;
    dbcbPagto.Enabled:=false;
    
    end
  else
    Begin
    If Vazio Then
      begin
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbLooKVend.SetFocus;
      end;
    end;
end;

procedure TFrmVendas.DBLookVendExit(Sender: TObject);
begin
  If NovoItem Then
    If dbLookVend.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Nome do Vendedor');
      dbLookVend.SetFocus;
      End;
end;

procedure TFrmVendas.btnPagtoClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar,Flag:Boolean;
  x:Integer;
begin
  pagto:=True;
  //valida��es
  If dbLookVend.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Vendedor';
    Gravar:=False;
    Vazio:=True;
    end;
  If edCodCli.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'C�d.Cliente';
    Gravar:=False;
    Vazio:=True;
    end;
  If gravar then
    begin
    pagto:=true;
    edcodprod.Enabled:=false;
    ceacrescimo.Enabled:=true;
    cedesconto.Enabled:=true;
    dbStatus.Enabled:=true;
    dbcbPagto.Enabled:=true;
    ceacrescimo.SetFocus;
    end
  else
    Begin
    pagto:=False;
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbLooKVend.SetFocus;
    end;
end;

procedure TFrmVendas.BtnCancelarClick(Sender: TObject);
var
  qtde     : Real;
  produto  : string;
begin
  NovoItem:=False;
  cancelar:=true;
  if cancelar  then
    BEGIN
    //deletar os produtos atrav�s do �ltimo codigovenda
    dmdados.tbDetVendas.Filtered := false;
    dmdados.tbDetVendas.Filter := '(DataVen = '''+datetostr(date)+''')and' +
                                  '(CodVen = '''+inttostr(codigovenda)+''')';
    dmdados.tbDetVendas.Filtered := true;
    dmdados.tbDetVendas.First;
    while not dmdados.tbDetVendas.Eof do
    begin
      //devolver o produto ao estoque
      produto := dmdados.tbDetVendasCodMerc.value;
      qtde    := dmdados.tbDetVendasQuant.AsFloat;
      if dmdados.tbEstoque.Locate('CodMerc',produto,[]) then
        begin
        dmdados.tbEstoque.edit;
        dmdados.tbEstoqueQuantidade.Value := dmdados.tbEstoqueQuantidade.Value+qtde;
        dmdados.tbEstoque.Post;
        //estoque atualizado
        dmdados.tbDetVendas.Delete; //excluir o registro do detvendas
        end;
      dmdados.tbDetVendas.Refresh;
      dmdados.tbDetVendas.Next;
      end;
     //cancelar faturamento
  If (dmDados.TbFaturamento.RecordCount > 0) then
  begin
     dmdados.tbFaturamento.Last;
     dmdados.tbFaturamento.Delete;
     dmdados.tbFaturamento.Refresh;
  end;
    //cancelar a �ltima venda
    dmdados.tbVendas.Cancel;
    VtabStt:=true;

    ceAcrescimo.Enabled:=false;
    ceDesconto.Enabled:=false;
    edCodCli.Enabled:=false;
    edCodProd.Enabled:=false;
    DBLookVend.Enabled:=false;
    dbeqtde.Enabled:=false;
    dbVu.Enabled:=false;
    dbstatus.Enabled:=false;
    dbcbPagto.Enabled:=false;

    BtnNovo.Enabled:=True;
    btnpagto.Enabled:=False;
    btncancelar.Enabled:=False;
    ceSubTotal.Value:=0;
    edcodprod.Clear;
    edcodcli.Clear;
    speedbar1.SetFocus;
    end;
end;

procedure TFrmVendas.ceDescontoExit(Sender: TObject);
begin
  dmdados.tbVendasDesconto.Value:=ceDesconto.Value;
  dmdados.tbVendasValor.Value:=
  ceSubTotal.Value+ceacrescimo.Value-ceDesconto.Value;
end;

procedure TFrmVendas.dbValorFinalExit(Sender: TObject);
begin
  ceTotNota.Value:=dmdados.tbVendasValor.Value;
end;

procedure TFrmVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    Case (key) of
      VK_INSERT : if (vTabStt) then BtnNovo.Click;
      VK_END    : if not(vTabStt) then BtnGravar.Click;
      VK_ESCAPE : if not(vTabStt) then BtnCancelar.Click
                  else btnsair.Click;
      VK_HOME   : if not(vTabStt) then BtnPagto.Click;
      VK_DELETE : if (vTabStt) then BtnDeletar.Click;
      VK_F2     : BtnLocCli.Click;
      VK_F3     : BtnLocProd.Click;
      Vk_F4     : btnPagto.Click;
    end;
end;

procedure TFrmVendas.dbStatusExit(Sender: TObject);
begin
  If NovoItem Then
    If dbStatus.Text= '' then
      Begin
      ShowMessage('� obrigat�rio a Classifica��o do Cliente');
      dbStatus.SetFocus;
      End;
end;

procedure TFrmVendas.dbcbPagtoExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If NovoItem Then
    Begin
    If dbcbPagto.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar a Forma de Pagamento');
      dbcbPagto.SetFocus;
      End
    Else
      Begin
      Flag:=True;
      For x:=0 to dbcbPagto.Items.Count-1 Do
        If dbcbPagto.Text=dbcbPagto.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor'+ dbcbPagto.Text+'inv�lido');
        dbcbPagto.SetFocus;
        End;
        speedbar1.SetFocus;
      End;
    speedbar1.SetFocus;
    end;
end;

procedure TFrmVendas.BtnDeletarClick(Sender: TObject);
begin
  If application.MessageBox('Tem certeza que deseja excluir este registro?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
    dmdados.tbDetVendas.Delete
  else
    dmdados.tbDetVendas.Cancel;
end;

procedure TFrmVendas.dbVuExit(Sender: TObject);
begin
  if NovoItem Then
    begin
    //Buscar valores comiss�o
    if dmdados.tbFuncEsto.Locate('CodFunc;CodMerc',VarArrayOf([vendedor,edcodprod.text]),[]) then
      dmdados.tbDetVendasComissao.Value:=((dmdados.tbDetVendasPrecoUnit.Value)*(dmdados.tbFuncEstoComissao.AsInteger/100))
    else
      if not dmdados.tbFuncComissao.IsNull then
        dmdados.tbDetVendasComissao.Value:=((dmdados.tbDetVendasPrecoUnit.Value)*(dmdados.tbFuncComissao.Value/100))
      else
        if dmdados.tbCargoFunc.Locate('CodCargo',dmdados.tbFuncCodCargo.value,[]) then
          dmdados.tbDetVendasComissao.Value:=((dmdados.tbDetVendasPrecoUnit.Value)*(dmdados.tbCargoFuncComissao.Value/100));
    //Calculando valor total da venda
    dmdados.tbVendasValor.Value:=dmdados.tbVendasValor.Value+dmdados.tbDetVendasTotal.Value;
    ceSubTotal.Value:=dmdados.tbVendasValor.Value;
    dmdados.tbDetVendas.Post;
    dmdados.tbVisDetVen.Refresh;
    edcodprod.Clear;
    dbproduto.Clear;
    dmdados.tbDetVendas.Append;
    dmdados.tbDetVendasCodVen.Value:=codigovenda;
    dmdados.tbDetVendasDataVen.Value:=Date;
    edcodprod.SetFocus;
    end;
end;


procedure TFrmVendas.edCodProdEnter(Sender: TObject);
begin
{if dataVenda<>date then
  begin
  dmdados.tbFaturamento.Append;
  dmdados.tbFaturamentoDataVen.Value:=date;
  dmdados.tbFaturamentoTotalVenda.Value:=0;
  dmdados.tbFaturamentoTotalDesc.Value:=0;
  dmdados.tbFaturamentoTotalCom.Value:=0;
  dmdados.tbFaturamentoTotalCusto.Value:=0;
  dmdados.tbFaturamento.Post;
  end;
limite:=dmdados.tbLibCreditoLimite.Value;
codcli:=dmdados.tbClienteCodCli.Value;
dmdados.tbDetVendas.Append;
dmdados.tbDetVendasCodVen.Value:=codigovenda;
dmdados.tbDetVendasDataVen.Value:=Date;}
end;




end.
