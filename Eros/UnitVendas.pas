//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Registro de Vendas
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
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
  LMDCustomShapeHint, LMDShapeHint, RxGrdCpt, fcImager, EMsgDlg,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmVendas = class(TForm)
    MsgDlg: TEvMsgDlg;
    RxLabel12: TRxLabel;
    Image1: TImage;
    RxLabel8: TRxLabel;
    RxLabel9: TRxLabel;
    edtItens: TEdit;
    dbTotVen: TDBEdit;
    RxLabel13: TRxLabel;
    RxLabel2: TRxLabel;
    edCodCli: TDBEdit;
    DBLookVend: TDBLookupComboBox;
    BtnlocCli: TfcImageBtn;
    dbCliente: TDBEdit;
    btnCadCli: TfcImageBtn;
    dbimgProduto: TDBImage;
    Bevel2: TBevel;
    RxLabel7: TRxLabel;
    dbTotal: TDBEdit;
    DBMemo1: TDBMemo;
    dbVu: TDBEdit;
    RxLabel6: TRxLabel;
    dbeqtde: TDBEdit;
    RxLabel5: TRxLabel;
    btnLocProd: TfcImageBtn;
    edCodProd: TDBEdit;
    RxLabel3: TRxLabel;
    dbgridPedido: TRxDBGrid;
    Bevel1: TBevel;
    btnNovo: TfcImageBtn;
    btnPagto: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    btnSair: TfcImageBtn;
    LMDBackPanel2: TPanel;
    Panel3: TPanel;
    LMDBackPanel1: TPanel;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnLocProdClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure edCodCliExit(Sender: TObject);
    procedure edCodProdExit(Sender: TObject);
    procedure dbeqtdeExit(Sender: TObject);
    procedure DBLookVendExit(Sender: TObject);
    procedure btnPagtoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnDeletarClick(Sender: TObject);
    procedure dbVuExit(Sender: TObject);
    procedure fcImageBtn4Click(Sender: TObject);
    procedure fcImageBtn8Click(Sender: TObject);
    procedure btnPlanopgtoClick(Sender: TObject);
    procedure btnCadCliClick(Sender: TObject);
    procedure BtnlocCliClick(Sender: TObject);
    procedure edCodProdEnter(Sender: TObject);
  private
    { Private declarations }
  cli : longint;
  fDataVenda : TDateTime;
  fCodigoVenda : integer;
  fComissao : real;
  fCusto : real;
  public
    { Public declarations }
   property Codcli : longint read cli write cli;
   property DataVenda : TDateTime read fDataVenda write fDataVenda;
   property CodigoVenda : integer read fCodigoVenda write fCodigoVenda;
   property Comissao : real read fComissao write fComissao;
   property Custo : real read fCusto write fCusto;  
  end;

var
  FrmVendas : TFrmVendas;
  pagto,cancelar,NovoItem : boolean;
  DataVendaAnt : tdatetime;
  //codigoVenda : integer;
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

uses unitLocCliente, unitDmDados, UnitLocProd, UnitPrincipal, UnitConsPlano, UnitCadCliente,
  unitPagaPedido;

{$R *.DFM}

procedure TFrmVendas.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TFrmVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.tbFaturamento.Close;
  dmdados.tbFunc.CancelRange;
  dmDados.tbFuncEsto.Close;
  dmDados.tbFunc.Close;
  dmDados.tbEstoque.Close;
  dmDados.tbCliente.Close;
  dmDados.tbLibCredito.Close;
  dmDados.tbPlanos.Close;
  dmDados.tbCargoFunc.Close;
  dmDados.tbVisDetVen.Close;
  dmDados.tbDetVendas.Close;
  dmDados.tbVendas.Close;
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

procedure TFrmVendas.FormShow(Sender: TObject);
begin
  dmDados.tbFaturamento.Open;
  dmDados.tbFuncEsto.Open;
  dmDados.tbFunc.Open;
  dmDados.tbEstoque.Open;
  dmDados.tbCliente.Open;
  dmDados.tbLibCredito.Open;
  dmDados.tbPlanos.Open;
  dmDados.tbCargoFunc.Open;
  dmDados.tbVendas.Open;
  dmDados.tbVisDetVen.Open;
  dmDados.tbDetVendas.Open;
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
  Panel3.SetFocus;
end;

procedure TFrmVendas.BtnNovoClick(Sender: TObject);
begin
  novoItem:=true;
  Pagto:=False;
  if FileExists('Logogen.bmp') then
    frmVendas.dbimgProduto.Picture.LoadFromFile('Logogen.bmp');
  //
  // Recupera as informa��es da �ltima venda
  // Dados utilizados para a gera��o do c�digo de vendas
  // N�mera��o sequencial di�ria
  //
  dmdados.tbVendas.Last;
  CodigoVenda:=dmdados.tbVendasCodVen.Value;
  DataVendaAnt:=dmdados.tbVendasDataVen.Value;

  Comissao:=0;
  Custo:=0;

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
  //
  // calcula o c�digo da venda, com base no �ltimo lan�amento de vendas
  //
  if DataVendaAnt = date then
    dmdados.tbVendasCodVen.Value:=codigovenda+1
  else
    dmdados.tbVendasCodVen.Value:=1;

  codigovenda:=dmdados.tbVendasCodVen.value;
  DataVenda:=dmdados.tbVendasDataVen.Value;
  dmdados.tbVendasHoraVen.Value:=time;
  dmdados.tbVendasValor.Value:=0;
  dmdados.tbVendasDesconto.Value:=0;

  edtItens.Text:='0';
  edCodCli.SetFocus;
  VtabStt:=false;
end;

procedure TFrmVendas.edCodCliExit(Sender: TObject);
begin
  If NovoItem Then
    If edCodCli.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o C�DIGO DO CLIENTE');
      edCodCli.SetFocus;
      End
    Else
      begin
      if not (dmdados.tbCliente.Locate('CodCli',edcodCli.text,[])) then
        begin
        MsgDlg.MsgWarning('C�DIGO DO CLIENTE n�o cadastrado!');
        edcodcli.SetFocus;
        end
      else
        Begin
        if dmdados.tbLibCreditoRestricao.Value='Restrito' then
          BEGIN
          MsgDlg.MsgInformation('Consta restri��o para este cliente!|'+
                      'Venda n�o liberada. Favor consultar CPF OU CNPJ|'+
                      'no m�dulo CERES');
          BtnCancelar.Click;
          abort;
          end
        else
          begin
          {liberada a venda, calcular faturamento }
          if Not(dmDados.tbFaturamento.Locate('DataVen',Date,[])) then
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
    begin
      //localizar o produto
      if edcodprod.Text='' then
        begin
        MsgDlg.MsgWarning('Necess�rio informar o C�DIGO DO PRODUTO');
        edcodprod.SetFocus;
        end
      else
        if not (dmdados.tbEstoque.Locate('CodMerc',edcodprod.text,[])) then
          begin
          MsgDlg.MsgWarning('C�DIGO DO PRODUTO n�o cadastrado!');
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
      MsgDlg.MsgWarning('� obrigat�rio a Quantidade');
      dbeqtde.SetFocus;
      End
    else
      //Atualizando estoque
      if dmdados.tbEstoque.Locate('CodMerc',edcodprod.Text,[]) then
        begin
        if StrtoInt(dbeqtde.Text) > dmdados.tbEstoqueQuantidade.Value then
          begin
          MsgDlg.MsgError('Quantidade vendida ultrapassa a quantidade real em estoque');
          dmdados.tbDetVendasQuant.Value:=dmdados.tbEstoqueQuantidade.value;
          edCodProd.SetFocus;
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

procedure TFrmVendas.DBLookVendExit(Sender: TObject);
begin
 If NovoItem Then
    If dbLookVend.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o Nome do Vendedor');
      dbLookVend.SetFocus;
      End;
end;

procedure TFrmVendas.btnPagtoClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
begin
  Gravar:=True;
  Vazio:=False;
  dmDados.tbDetVendas.Cancel;
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
    frmConsPlano:=TfrmConsPlano.Create(application);
    frmConsPlano.Showmodal;
    if frmConsPlano.PagStt='S' then
      begin
      if dmDados.TbParametroPosCx.Value='N' then
        begin
        frmPagaPedido:=TfrmPagaPedido.Create(application);
        frmPagaPedido.VlCompra:=dmdados.tbVendasValor.Value;
        frmPagaPedido.Showmodal;
        end;
      NovoItem:=False;
      edCodCli.Enabled:=false;
      edCodProd.Enabled:=false;
      DBLookVend.Enabled:=false;
      dbeqtde.Enabled:=false;
      dbVu.Enabled:=false;
      BtnNovo.Enabled:=True;
      btnpagto.Enabled:=False;
      btncancelar.Enabled:=False;
      end
    else
      begin
      dmdados.tbDetVendas.Append;
      dmdados.tbDetVendasCodVen.Value:=codigovenda;
      dmdados.tbDetVendasDataVen.Value:=Date;
      edCodProd.SetFocus;
      end;
    frmConsPlano.Free;
    end
  else
    Begin
    pagto:=False;
    If Vazio Then
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbLooKVend.SetFocus;
    end;
end;

procedure TFrmVendas.BtnCancelarClick(Sender: TObject);
begin
  dmDados.tbDetVendas.Cancel;
  NovoItem:=False;
  //deletar os produtos atrav�s do �ltimo codigovenda
  dmdados.tbDetVendas.Filtered := false;
  dmdados.tbDetVendas.Filter := '(DataVen = '''+datetostr(DataVenda)+''')and' +
                                '(CodVen = '''+inttostr(codigovenda)+''')';
  dmdados.tbDetVendas.Filtered := true;
  dmdados.tbDetVendas.First;
  while not(dmdados.tbDetVendas.Eof) do
    begin
    //devolver o produto ao estoque
    if dmdados.tbEstoque.Locate('CodMerc',dmdados.tbDetVendasCodMerc.value,[]) then
      begin
      dmdados.tbEstoque.edit;
      dmdados.tbEstoqueQuantidade.Value := dmdados.tbEstoqueQuantidade.Value+
                                           dmdados.tbDetVendasQuant.Value;
      dmdados.tbEstoque.Post;
      //estoque atualizado
      end;
    dmdados.tbDetVendas.Delete; //excluir o registro do detvendas
    dmdados.tbDetVendas.First;
    end;
  dmdados.tbDetVendas.Filtered := false; // cancela o filtro
  //cancelar faturamento
  if pagto then
    if dmDados.TbFaturamento.Locate('DataVen',dmdados.tbVendasDataven.Value,[]) then
      begin
      dmdados.tbFaturamento.Edit;
      dmdados.tbFaturamentoTotalVenda.Value:=dmdados.tbFaturamentoTotalVenda.Value-dmdados.tbVendasValor.Value;
      dmdados.tbFaturamentoTotalDesc.Value:=dmdados.tbFaturamentoTotalDesc.Value-dmdados.tbVendasDesconto.Value;
      dmdados.tbFaturamentoTotalCom.Value:=dmdados.tbFaturamentoTotalCom.Value-Comissao;
      dmdados.tbFaturamentoTotalCusto.Value:=dmdados.tbFaturamentoTotalCusto.Value-Custo;
      dmdados.tbFaturamento.Post;
      end;
  //Deletar Venda
  //verificar - e a data ???????
  if dmdados.tbVendas.Locate('CodVen',CodigoVenda,[]) then
    dmDados.tbVendas.Delete;
  VtabStt:=true;
  //ceAcrescimo.Enabled:=false;
  //ceDesconto.Enabled:=false;
  edCodCli.Enabled:=false;
  edCodProd.Enabled:=false;
  DBLookVend.Enabled:=false;
  dbeqtde.Enabled:=false;
  dbVu.Enabled:=false;
  //dbstatus.Enabled:=false;
  //dbcbPagto.Enabled:=false;
  BtnNovo.Enabled:=True;
  btnpagto.Enabled:=False;
  btncancelar.Enabled:=False;
  //ceSubTotal.Value:=0;
  edcodprod.Clear;
  edcodcli.Clear;
  Panel3.SetFocus;
end;

procedure TFrmVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    Case (key) of
      VK_INSERT : if (vTabStt) then BtnNovo.Click;
      //VK_END    : if not(vTabStt) then BtnGravar.Click;
      VK_ESCAPE : if not(vTabStt) then BtnCancelar.Click
                  else btnsair.Click;
      VK_HOME   : if not(vTabStt) then BtnPagto.Click;
      VK_F2     : BtnLocCli.Click;
      VK_F3     : BtnLocProd.Click;
      Vk_F4     : btnPagto.Click;
    end;
end;

procedure TFrmVendas.BtnDeletarClick(Sender: TObject);
begin
  If application.MessageBox('Tem certeza que deseja excluir este registro?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
    dmdados.tbDetVendas.Delete;
end;

procedure TFrmVendas.dbVuExit(Sender: TObject);
begin
  if NovoItem Then
    begin
    if dbVu.Text='' then
      begin
      MsgDlg.MsgWarning('� obrigat�rio um valor para o PRODUTO');
      dbVu.SetFocus;
      end
    else
      begin
      //Buscar valores comiss�o
      if dmdados.tbFuncEsto.Locate('CodFunc;CodMerc',VarArrayOf([vendedor,edcodprod.text]),[]) then
        dmdados.tbDetVendasComissao.Value:=((dmdados.tbDetVendasPrecoUnit.Value*dmDados.tbDetVendasQuant.Value)*
                                           (dmdados.tbFuncEstoComissao.AsInteger/100))
      else
        if not dmdados.tbFuncComissao.IsNull then
          dmdados.tbDetVendasComissao.Value:=((dmdados.tbDetVendasPrecoUnit.Value*dmDados.tbDetVendasQuant.Value)*
                                             (dmdados.tbFuncComissao.Value/100))
        else
          if dmdados.tbCargoFunc.Locate('CodCargo',dmdados.tbFuncCodCargo.value,[]) then
            dmdados.tbDetVendasComissao.Value:=((dmdados.tbDetVendasPrecoUnit.Value*dmDados.tbDetVendasQuant.Value)*
                                               (dmdados.tbCargoFuncComissao.Value/100));
      Comissao:=Comissao+dmdados.tbDetVendasComissao.Value;
      //Registrando o Custo
      dmdados.tbDetVendasCustoUnit.Value:=dmdados.tbEstoquePrecoCompra.Value;
      Custo:=Custo+(dmdados.tbEstoquePrecoCompra.Value*dmDados.tbDetVendasQuant.Value);
      //Calculando valor total da venda
      dmdados.tbVendasValor.Value:=dmdados.tbVendasValor.Value+dmdados.tbDetVendasTotal.Value;
      dmdados.tbDetVendas.Post;
      edtItens.Text:=IntToStr(StrToInt(edtItens.Text)+StrtoInt(dbeqtde.Text));
      dmdados.tbVisDetVen.Refresh;
      edcodprod.Clear;
      //dbproduto.Clear;
      dmdados.tbDetVendas.Append;
      dmdados.tbDetVendasCodVen.Value:=codigovenda;
      dmdados.tbDetVendasDataVen.Value:=Date;
      edcodprod.SetFocus;
      end;
    end;
end;

procedure TFrmVendas.fcImageBtn4Click(Sender: TObject);
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

    //ceAcrescimo.Enabled:=false;
   // ceDesconto.Enabled:=false;
    edCodCli.Enabled:=false;
    edCodProd.Enabled:=false;
    DBLookVend.Enabled:=false;
    dbeqtde.Enabled:=false;
    dbVu.Enabled:=false;
    //dbstatus.Enabled:=false;
    //dbcbPagto.Enabled:=false;

    BtnNovo.Enabled:=True;
    btnpagto.Enabled:=False;
    btncancelar.Enabled:=False;
    edtItens.Text:='0';
    edcodprod.Clear;
    edcodcli.Clear;
    Panel3.SetFocus;
    end;
end;

procedure TFrmVendas.fcImageBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmVendas.btnPlanopgtoClick(Sender: TObject);
begin
  FrmConsPlano:=TFrmConsPlano.Create(application);
  FrmConsPlano.Showmodal;
end;

procedure TFrmVendas.btnCadCliClick(Sender: TObject);
begin
  FrmCadCliente:=TFrmCadCliente.Create(application);
  FrmCadCliente.Showmodal;
  dmDados.tbVendasCodCli.Value:=dmDados.tbClienteCodCli.Value;
end;

procedure TFrmVendas.BtnlocCliClick(Sender: TObject);
begin
  if (dmdados.tbVendas.State=DsInsert)or(dmdados.tbVendas.State=DsEdit) then
    begin
    FrmLocCliente:=TFrmLocCliente.Create(application);
    FrmLocCliente.Showmodal;
    dmDados.tbVendasCodCli.Value:=frmLocCliente.Resultado;
    frmLocCliente.Free;
    end;
end;

procedure TFrmVendas.edCodProdEnter(Sender: TObject);
begin
  edCodCli.Enabled:=False;
  DBLookVend.Enabled:=False;
end;

end.
