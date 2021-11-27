//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Registro de Or�amentos
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untOrca;

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
  TfrmOrca = class(TForm)
    MsgDlg: TEvMsgDlg;
    btnNovo: TfcImageBtn;
    btnPagto: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    btnSair: TfcImageBtn;
    RxLabel12: TRxLabel;
    Image1: TImage;
    RxLabel9: TRxLabel;
    RxLabel8: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel13: TRxLabel;
    edtItens: TEdit;
    edCodProd: TDBEdit;
    edCodCli: TDBEdit;
    dbVu: TDBEdit;
    dbTotVen: TDBEdit;
    dbTotal: TDBEdit;
    DBMemo1: TDBMemo;
    DBLookVend: TDBLookupComboBox;
    dbItem: TDBEdit;
    dbimgProduto: TDBImage;
    dbgridPedido: TRxDBGrid;
    dbeqtde: TDBEdit;
    dbCliente: TDBEdit;
    btnPlanopgto: TfcImageBtn;
    btnLocProd: TfcImageBtn;
    BtnlocCli: TfcImageBtn;
    btnCadCli: TfcImageBtn;
    Bevel2: TBevel;
    Bevel1: TBevel;
    LMDBackPanel2: TPanel;
    Panel3: TPanel;
    LMDBackPanel3: TPanel;
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
  fDataOrca : TDateTime;
  fCodigoOrca : integer;
  fComissao : real;
  fCusto : real;
  public
    { Public declarations }
   property Codcli : longint read cli write cli;
   property DataOrca : TDateTime read fDataOrca write fDataOrca;
   property CodigoOrca : integer read fCodigoOrca write fCodigoOrca;
   property Comissao : real read fComissao write fComissao;
   property Custo : real read fCusto write fCusto;  
  end;

var
  frmOrca : TfrmOrca;
  pagto,cancelar,NovoItem : boolean;
  DataOrcaAnt : tdatetime;
  //CodigoOrca : integer;
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
  UnitLocProd, UnitPrincipal, UnitConsPlano, UnitCadCliente,UnitVendas;

{$R *.DFM}

procedure TfrmOrca.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmOrca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.tbFunc.Filtered:=false;
  dmDados.tbFuncEsto.Close;
  dmDados.tbFunc.Close;
  dmDados.tbEstoque.Close;
  dmDados.tbCliente.Close;
  dmDados.tbLibCredito.Close;
  dmDados.tbPlanos.Close;
  dmDados.tbCargoFunc.Close;
  dmDados.tbVisDetOrc.Close;
  dmDados.tbDetOrc.Close;
  dmDados.tbOrc.Close;
  action:= Cafree;
end;

procedure TfrmOrca.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TfrmOrca.btnLocProdClick(Sender: TObject);
begin
  if (dmdados.tbOrc.State=DsInsert)or(dmdados.tbOrc.State=DsEdit) then
    begin
    frmLocProd:=tfrmLocProd.create(application);
    frmLocProd.showmodal;
    if not(dmdados.tbDetOrc.State=dsinsert) then
      dmdados.tbDetOrc.Append;
    dmdados.tbDetOrcCodMerc.Value:=frmLocProd.resultado;
    dmdados.tbDetOrcCodOrca.Value:=CodigoOrca;
    dmdados.tbDetOrcDataOrca.Value:=Date;
    frmLocProd.Free;
    edCodProd.SetFocus;
    end;
end;

procedure TfrmOrca.FormShow(Sender: TObject);
begin
  dmDados.tbFunc.Open;
  dmDados.tbFuncEsto.Open;
  dmDados.tbEstoque.Open;
  dmDados.tbCliente.Open;
  dmDados.tbLibCredito.Open;
  dmDados.tbPlanos.Open;
  dmDados.tbCargoFunc.Open;
  dmDados.tbOrc.Open;
  DmDados.tbVisDetOrc.Open;
  dmDados.tbDetOrc.Open;
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

procedure TfrmOrca.BtnNovoClick(Sender: TObject);
begin
  novoItem:=true;
  Pagto:=False;
  if FileExists('Logogen.bmp') then
    frmVendas.dbimgProduto.Picture.LoadFromFile('Logogen.bmp');
  dmdados.tbOrc.Last;
  CodigoOrca:=dmdados.tbOrcCodOrca.Value;
  DataOrcaAnt:=dmdados.tbOrcDataOrca.Value;
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
  dmdados.tbOrc.Append;
  dmdados.tbOrcDataOrca.Value:=date;
  //calcula o c�digo da venda
  if DataOrcaAnt = date then
    dmdados.tbOrcCodOrca.Value:=CodigoOrca+1
  else
    dmdados.tbOrcCodOrca.Value:=1;
  CodigoOrca:=dmdados.tbOrcCodOrca.value;
  DataOrca:=dmdados.tbOrcDataOrca.Value;
  dmdados.tbOrcValor.Value:=0;
  dmdados.tbOrcDesconto.Value:=0;
  edtItens.Text:='0';
  edCodCli.SetFocus;
  VtabStt:=false;
end;

procedure TfrmOrca.edCodCliExit(Sender: TObject);
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
        {liberada a venda, calcular faturamento }
        limite:=dmdados.tbLibCreditoLimite.Value;
        codcli:=dmdados.tbClienteCodCli.Value;
        if not(dmdados.tbDetOrc.State=dsinsert) then
          dmdados.tbDetOrc.Append;
        dmdados.tbDetOrcCodOrca.Value:=CodigoOrca;
        dmdados.tbDetOrcDataOrca.Value:=Date;
        //prazoPagto:=dmdados.tbClientePrazoPagto.AsInteger;
        End;
      end;
end;


procedure TfrmOrca.edCodProdExit(Sender: TObject);
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
          dmdados.tbDetOrcDataOrca.Value:=date;
          dmdados.tbDetOrcCodOrca.Value:=CodigoOrca;
          dmdados.tbDetOrcCustoUnit.Value:=dmdados.tbEstoquePrecoCompra.Value;
          end;
    end;
end;

procedure TfrmOrca.dbeqtdeExit(Sender: TObject);
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
          dmdados.tbDetOrcQuant.Value:=dmdados.tbEstoqueQuantidade.value;
          edCodProd.SetFocus;
          end
        else
          begin
          //Buscar Pre�o real de venda ou de promo��o
          dmdados.tbDetOrcPrecoUnit.Value:=dmdados.tbEstoquePrecoVenda.Value;
          dmdados.tbEstoque.edit;
          dmdados.tbEstoqueUltimaVenda.Value:=date;
          dmdados.tbEstoqueQuantidade.Value:=dmdados.tbEstoqueQuantidade.Value-dmdados.tbDetOrcQuant.Value;
          dmdados.tbEstoque.Post;
          end;
        end;
end;

procedure TfrmOrca.DBLookVendExit(Sender: TObject);
begin
 If NovoItem Then
    If dbLookVend.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o Nome do Vendedor');
      dbLookVend.SetFocus;
      End;
end;

procedure TfrmOrca.btnPagtoClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
begin
  Gravar:=True;
  Vazio:=False;
  dmDados.tbDetOrc.Cancel;
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
        //frmPagaPedido:=TfrmPagaPedido.Create(application);
        //frmPagaPedido.VlCompra:=dmdados.tbOrcValor.Value;
        //frmPagaPedido.Showmodal;
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
      dmdados.tbDetOrc.Append;
      dmdados.tbDetOrcCodOrca.Value:=CodigoOrca;
      dmdados.tbDetOrcDataOrca.Value:=Date;
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

procedure TfrmOrca.BtnCancelarClick(Sender: TObject);
begin
  dmDados.tbDetOrc.Cancel;
  NovoItem:=False;
  //deletar os produtos atrav�s do �ltimo CodigoOrca
  dmdados.tbDetOrc.Filtered := false;
  dmdados.tbDetOrc.Filter := '(DataOrca = '''+datetostr(DataOrca)+''')and' +
                                '(CodOrca = '''+inttostr(CodigoOrca)+''')';
  dmdados.tbDetOrc.Filtered := true;
  dmdados.tbDetOrc.First;
  while not(dmdados.tbDetOrc.Eof) do
    begin
    //devolver o produto ao estoque
    if dmdados.tbEstoque.Locate('CodMerc',dmdados.tbDetOrcCodMerc.value,[]) then
      begin
      dmdados.tbEstoque.edit;
      dmdados.tbEstoqueQuantidade.Value := dmdados.tbEstoqueQuantidade.Value+
                                           dmdados.tbDetOrcQuant.Value;
      dmdados.tbEstoque.Post;
      //estoque atualizado
      end;
    dmdados.tbDetOrc.Delete; //excluir o registro do detvendas
    dmdados.tbDetOrc.First;
    end;
  //Deletar Venda
  if dmdados.tbOrc.Locate('CodOrca',CodigoOrca,[]) then
    dmDados.tbOrc.Delete;
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

procedure TfrmOrca.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmOrca.BtnDeletarClick(Sender: TObject);
begin
  If application.MessageBox('Tem certeza que deseja excluir este registro?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
    dmdados.tbDetOrc.Delete;
end;

procedure TfrmOrca.dbVuExit(Sender: TObject);
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
        dmdados.tbDetOrcComissao.Value:=((dmdados.tbDetOrcPrecoUnit.Value*dmDados.tbDetOrcQuant.Value)*
                                           (dmdados.tbFuncEstoComissao.AsInteger/100))
      else
        if not dmdados.tbFuncComissao.IsNull then
          dmdados.tbDetOrcComissao.Value:=((dmdados.tbDetOrcPrecoUnit.Value*dmDados.tbDetOrcQuant.Value)*
                                             (dmdados.tbFuncComissao.Value/100))
        else
          if dmdados.tbCargoFunc.Locate('CodCargo',dmdados.tbFuncCodCargo.value,[]) then
            dmdados.tbDetOrcComissao.Value:=((dmdados.tbDetOrcPrecoUnit.Value*dmDados.tbDetOrcQuant.Value)*
                                               (dmdados.tbCargoFuncComissao.Value/100));
      Comissao:=Comissao+dmdados.tbDetOrcComissao.Value;
      //Registrando o Custo
      dmdados.tbDetOrcCustoUnit.Value:=dmdados.tbEstoquePrecoCompra.Value;
      Custo:=Custo+(dmdados.tbEstoquePrecoCompra.Value*dmDados.tbDetOrcQuant.Value);
      //Calculando valor total da venda
      dmdados.tbOrcValor.Value:=dmdados.tbOrcValor.Value+dmdados.tbDetOrcTotal.Value;
      dmdados.tbDetOrc.Post;
      edtItens.Text:=IntToStr(StrToInt(edtItens.Text)+StrtoInt(dbeqtde.Text));
      dmdados.tbVisDetOrc.Refresh;
      edcodprod.Clear;
      //dbproduto.Clear;
      dmdados.tbDetOrc.Append;
      dmdados.tbDetOrcCodOrca.Value:=CodigoOrca;
      dmdados.tbDetOrcDataOrca.Value:=Date;
      edcodprod.SetFocus;
      end;
    end;
end;

procedure TfrmOrca.fcImageBtn4Click(Sender: TObject);
var
  qtde     : Real;
  produto  : string;
begin
  NovoItem:=False;
  cancelar:=true;
  if cancelar  then
    BEGIN
    //deletar os produtos atrav�s do �ltimo CodigoOrca
    dmdados.tbDetOrc.Filtered := false;
    dmdados.tbDetOrc.Filter := '(DataOrca = '''+datetostr(date)+''')and' +
                               '(CodOrca = '''+inttostr(CodigoOrca)+''')';
    dmdados.tbDetOrc.Filtered := true;
    dmdados.tbDetOrc.First;
    while not dmdados.tbDetOrc.Eof do
    begin
      //devolver o produto ao estoque
      produto := dmdados.tbDetOrcCodMerc.value;
      qtde    := dmdados.tbDetOrcQuant.AsFloat;
      if dmdados.tbEstoque.Locate('CodMerc',produto,[]) then
        begin
        dmdados.tbEstoque.edit;
        dmdados.tbEstoqueQuantidade.Value := dmdados.tbEstoqueQuantidade.Value+qtde;
        dmdados.tbEstoque.Post;
        //estoque atualizado
        dmdados.tbDetOrc.Delete; //excluir o registro do detvendas
        end;
      dmdados.tbDetOrc.Refresh;
      dmdados.tbDetOrc.Next;
      end;
    //cancelar a �ltima venda
    dmdados.tbOrc.Cancel;
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

procedure TfrmOrca.fcImageBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmOrca.btnPlanopgtoClick(Sender: TObject);
begin
  FrmConsPlano:=TFrmConsPlano.Create(application);
  FrmConsPlano.Showmodal;
end;

procedure TfrmOrca.btnCadCliClick(Sender: TObject);
begin
  FrmCadCliente:=TFrmCadCliente.Create(application);
  FrmCadCliente.Showmodal;
  dmDados.tbCliente.Open;
  dmDados.tbLibCredito.Open;
  dmDados.tbOrcCodCli.Value:=dmDados.tbClienteCodCli.Value;
end;

procedure TfrmOrca.BtnlocCliClick(Sender: TObject);
begin
  if (dmdados.tbOrc.State=DsInsert)or(dmdados.tbOrc.State=DsEdit) then
    begin
    FrmLocCliente:=TFrmLocCliente.Create(application);
    FrmLocCliente.Showmodal;
    dmDados.tbOrcCodCli.Value:=frmLocCliente.Resultado;
    frmLocCliente.Free;
    end;
end;

procedure TfrmOrca.edCodProdEnter(Sender: TObject);
begin
  edCodCli.Enabled:=False;
  DBLookVend.Enabled:=False;
end;

end.
