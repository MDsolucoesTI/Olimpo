//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 15-01-2001
// Ultima modifica��o: 07-07-2005
// M�dulo............: Cadastro, Manuten��o e Pagamento de Compras 
//                      de Produtos/Mercadorias
// Sistema...........: Pegasus - Controle de Estoque
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////
unit unitCompras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcButton, fcImgBtn, RackCtls, StdCtrls, DBCtrls, RXDBCtrl,Variants,
  Mask, RXSplit, RXCtrls, ExtCtrls, SpeedBar, jpeg, Grids, DBGrids,db,
  ComCtrls, CurrEdit, RxLookup, Spin, EnhEdit, DBTables, RxDBComb,
  ToolEdit, EFocCol, RxGrdCpt, fcImager, EMsgDlg, EUserAcs;

type
  TfrmCompras = class(TForm)
    Image1: TImage;
    RxLabel9: TRxLabel;
    dbgridPedido: TRxDBGrid;
    btnAlterar: TfcImageBtn;
    btnAnterior: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    btnDeletar: TfcImageBtn;
    btnGravar: TfcImageBtn;
    btnNovo: TfcImageBtn;
    btnPagto: TfcImageBtn;
    btnPrimeiro: TfcImageBtn;
    btnProximo: TfcImageBtn;
    btnSair: TfcImageBtn;
    btnUltimo: TfcImageBtn;
    RxLabel25: TRxLabel;
    RxLabel23: TRxLabel;
    RxLabel22: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel24: TRxLabel;
    RxSplitter4: TRxSplitter;
    dbValorFinal: TDBEdit;
    dbcbPedidoPen: TRxDBComboBox;
    ceSubTotal: TCurrencyEdit;
    ceAcrescimo: TCurrencyEdit;
    ceDesconto: TCurrencyEdit;
    btnPagamento: TfcImageBtn;
    RxLabel11: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel8: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel10: TRxLabel;
    dbVu: TDBEdit;
    dbtotal: TDBEdit;
    dbeqtde: TDBEdit;
    dbNumPedido: TDBEdit;
    dbCodFor: TDBEdit;
    btnLocFor: TfcImageBtn;
    dbFornec: TDBEdit;
    dbProduto: TDBEdit;
    btnLocProd: TfcImageBtn;
    dbcodprod: TDBEdit;
    dbimgProduto: TDBImage;
    Mascara1: TEdit;
    Mascara2: TEdit;
    ceTotalCompra: TCurrencyEdit;
    Mascara3: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    UserAcess: TEvUserAccess;
    MsgDlg: TEvMsgDlg;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnLocProdClick(Sender: TObject);
    procedure btnLocForClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure dbeqtdeExit(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure btnPagtoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure ceDescontoExit(Sender: TObject);
    procedure dbValorFinalExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnDeletarClick(Sender: TObject);
    procedure dbVuExit(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbcbPedidoPenExit(Sender: TObject);
    procedure dbCodForExit(Sender: TObject);
    procedure dbCodProdExit(Sender: TObject);
    procedure dbcodprodEnter(Sender: TObject);
    procedure ceAcrescimoChange(Sender: TObject);
    procedure btnPagamentoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmCompras : TfrmCompras;
  pagto,cancelar,NovoItem,alterar : boolean;
  datacompra : tdatetime;
  codigoVenda : integer;
  qtdeVendida : integer;
  comissao : integer;
  x,i,pagamento : integer;
  Pos  : TBookMark;
  valorparc,limite : currency;
  prazoPagto : integer;

implementation

uses unitDmDados, unitLocFornec, unitLocProd, UnitPrincipal, unitPagaPedido;

{$R *.DFM}

procedure TfrmCompras.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmCompras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  action:= caFree;
end;

procedure TfrmCompras.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TfrmCompras.btnLocProdClick(Sender: TObject);
begin
  if (dmdados.tbCompras.State=DsInsert)or(dmdados.tbCompras.State=DsEdit) then
    begin
    frmLocProd:=tfrmLocProd.create(application);
    frmLocProd.showmodal;
    if not(dmdados.tbDetCompras.State=dsInsert)then
      begin
      dmdados.tbDetCompras.Append;
      dmdados.tbDetComprasCodComp.Value:=dmdados.tbComprasCodComp.Value;
      dmdados.tbDetComprasDataComp.Value:=dmdados.tbComprasDataComp.Value;
      end;
    dmdados.tbDetComprasCodMerc.Value:=frmLocProd.resultado;
//    dbproduto.Text:=frmlocprod.Nome;
    frmLocProd.Free;
    end;
end;

procedure TfrmCompras.btnLocForClick(Sender: TObject);
begin
  if (dmdados.tbCompras.State=dsInsert)or(dmdados.tbCompras.State=dsEdit) then
    begin
    frmLocFornec:=tfrmLocFornec.create(application);
    frmLocFornec.showmodal;
    dmdados.tbComprasCodFor.Value:=frmLocFornec.resultado;
    frmLocFornec.free;
    end;
end;

procedure TfrmCompras.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [F2] Loc.Fornec [F3] Loc. Produto [F4] Pagamento [Esc] Cancelar ou Sair');
  dmdados.vTabStt:= True;
  pagto:=false;
  cancelar:=true;
  NovoItem := True;
  alterar := false;
end;

procedure TfrmCompras.BtnNovoClick(Sender: TObject);
begin
  NovoItem:=true;
  //iniciar Compra;
  if FileExists('LogoGen.bmp') then
    frmCompras.dbimgProduto.Picture.LoadFromFile('Logogen.bmp');
  //Gravar dados principais
  dmdados.tbCompras.Append;
  dmdados.tbComprasPedidoPen.Value:='Sim';
  dmdados.tbComprasDataComp.Value:=date;
  dmdados.tbComprasHoraComp.Value:=time;
  dmdados.tbComprasValor.Value:=0;
  dmdados.tbComprasDesconto.Value:=0;
  dmdados.tbCompras.Post;
  dmdados.tbCompras.Edit;
  //Zerar total da compra
  cesubtotal.Value:=0;
  ceTotalCompra.Value:=0;
  //Retirar mascaras
  Mascara1.Visible:=False;
  Mascara2.Visible:=False;
  Mascara3.Visible:=False;
  //habilitar e desabilitar componentes
  btnNovo.Enabled:=false;
  btnpagto.Enabled:=true;
  btncancelar.Enabled:=true;
  btnLocFor.Enabled:=True;
  dbvu.Enabled:=true;
  dbcodfor.Enabled:=true;
  dbcodprod.Enabled:=true;
  dbeqtde.Enabled:=True;
  dbCodFor.Enabled:=true;
  dbCodProd.Enabled:=true;
  dbcodfor.SetFocus;
  dmdados.vTabStt:=false;
end;

procedure TfrmCompras.dbeqtdeExit(Sender: TObject);
begin
  If NovoItem Then
    If dbeqtde.Text= '' then
      Begin
      ShowMessage('� obrigat�rio a Quantidade');
      dbeqtde.SetFocus;
      End;
end;

procedure TfrmCompras.BtnPrimeiroClick(Sender: TObject);
begin
  DMDados.tbCompras.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
end;

procedure TfrmCompras.BtnAnteriorClick(Sender: TObject);
begin
  DMDados.tbCompras.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If DMDados.tbCompras.Bof Then
    Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    End;
end;

procedure TfrmCompras.BtnProximoClick(Sender: TObject);
begin
  DMDados.tbCompras.next;
  BtnPrimeiro.Enabled:=true;
  BtnAnterior.Enabled:=true;
  If DMDados.tbCompras.Eof Then
    Begin
    BtnProximo.Enabled:=false;
    BtnUltimo.Enabled:=false;
    End;
end;

procedure TfrmCompras.BtnUltimoClick(Sender: TObject);
begin
  DMDados.tbCompras.last;
  BtnPrimeiro.Enabled:=true;
  BtnAnterior.Enabled:=true;
  BtnProximo.Enabled:=false;
  BtnUltimo.Enabled:=false;
end;

procedure TfrmCompras.BtnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar,flag: Boolean;
  x:Integer;
begin
  //VALIDA��ES
  NovoItem:=False;
  dmdados.vTabStt:=true;
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  If dbcbPedidoPen.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Pedido Pendente';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to dbcbPedidoPen.Items.Count-1 Do
      If dbcbPedidoPen.Text=dbcbPedidoPen.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor'+' '+dbcbPedidoPen.Text+' '+'inv�lido');
      Gravar:=False;
      End;
    End;
  If Gravar Then
    Begin
    pagto:=false;
    dmDados.VtabStt:=true;
    dmdados.tbCompras.Post;
    cesubtotal.Value:=0;
    ceTotalCompra.Value:=0;
    ShowMessage('Pedido gravado com sucesso');
    //Colocar Mascaras
    Mascara1.Visible:=True;
    Mascara2.Visible:=True;
    Mascara3.Visible:=True;
    //Restaura Bot�es
    btnNovo.Enabled:=true;
    btnPagto.Enabled:=false;
    btngravar.Enabled:=false;
    btncancelar.Enabled:=false;
    Panel3.SetFocus;
    end
  else
    Begin
    If Vazio Then
      begin
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      end;
    end;
end;


procedure TfrmCompras.btnPagtoClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
begin
//  pagto:=True;
  Vazio:=False;
  Gravar:=True;
  btnpagto.Enabled:=false;
  //valida��es
  If dbCodFor.Text= '' then
    begin
    If Length(Campos)>0 Then
       Campos:=Campos+', ';
    Campos:=Campos+'C�d.Fornecedor';
    Gravar:=False;
    Vazio:=True;
    end;
  If gravar then
    begin
    pagto:=true;
    dbCodFor.Enabled:=False;
    dbcodprod.Enabled:=false;
    dbeqtde.Enabled:=false;
    dbVu.Enabled:=false;
    ceacrescimo.Enabled:=true;
    cedesconto.Enabled:=true;
    ceacrescimo.SetFocus;
    end
  else
    Begin
    pagto:=False;
    If Vazio Then
      ShowMessage('O(s) Campo(s)'+Campos+'n�o tem Valor(es)');
    end;
end;

procedure TfrmCompras.BtnCancelarClick(Sender: TObject);
begin
  NovoItem:=False;
  if alterar then
  begin
  alterar:=false;
  dmdados.tbCompras.Cancel;
  dbcbpedidopen.Enabled:=false;
  btnPagto.Enabled:=false;
  BtnNovo.Enabled:= True;
  btnPagamento.Enabled:=False;
  Panel3.SetFocus;
  end
  else
    begin
      if cancelar  then
      BEGIN
      //deletar os produtos atrav�s do �ltimo codigo de Compra
      dmdados.tbdetCompras.Filtered := false;
      dmdados.tbDetCompras.Filter:='(CodComp = '''+dmdados.tbComprasCodComp.AsString+''')';
      dmdados.tbdetCompras.Filtered := true;
      dmdados.tbdetCompras.First;
      while not dmdados.tbdetCompras.Eof do
        begin
        dmdados.tbdetCompras.Delete; {excluir o registro do detcompras}
        //dmdados.tbdetCompra.Refresh;
        dmdados.tbdetCompras.first;
        end;
      //cancelar a �ltima Compra
      dmdados.tbCompras.delete;
      Dmdados.vTabStt:=true;
      //Colocar Mascaras
      Mascara1.Visible:=True;
      Mascara2.Visible:=True;
      Mascara3.Visible:=True;
      //Restaura Bot�es
      btnPagto.Enabled:=False;
      btnPagamento.Enabled:=False;
      BtnNovo.Enabled:= True;
      btncancelar.Enabled:=false;
      ceSubTotal.Value:=0;
      ceTotalCompra.Value:=0;
      Panel3.SetFocus;
      end;
    end;
end;    

procedure TfrmCompras.ceDescontoExit(Sender: TObject);
begin
  if not(dmdados.tbCompras.State=dsedit) then
    dmdados.tbCompras.Edit;
  dmdados.tbComprasValor.Value:=dmdados.tbComprasValor.Value-(dmdados.tbComprasValor.Value*(ceDesconto.Value/100));
  Panel3.SetFocus;
end;

procedure TfrmCompras.dbValorFinalExit(Sender: TObject);
begin
  ceTotalCompra.Value:=dmdados.tbComprasValor.Value;
end;

procedure TfrmCompras.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    Case (key) of
      VK_INSERT : if (dmdados.vTabStt) then BtnNovo.Click;
      VK_END    : if not(dmdados.vTabStt) then BtnGravar.Click;
      VK_ESCAPE : if not(dmdados.vTabStt) then BtnCancelar.Click
                  else btnsair.Click;
      VK_F4     : if not(dmdados.vTabStt) then BtnPagto.Click;
      VK_DELETE : if (dmdados.vTabStt) then BtnDeletar.Click;
      VK_F2     : BtnLocProd.Click;
      VK_F3     : btnLocFor.Click;
      VK_Home   : btnAlterar.Click;
    end;
end;

procedure TfrmCompras.BtnDeletarClick(Sender: TObject);
begin
  If application.MessageBox('Tem certeza que deseja excluir este registro?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
    begin
    //deletar os produtos atrav�s do �ltimo codigo de Compra
    dmdados.tbdetCompras.Filtered := false;
    dmdados.tbDetCompras.Filter:='(CodComp = '''+dmdados.tbComprasCodComp.AsString+''')';
    dmdados.tbdetCompras.Filtered := true;
    dmdados.tbdetCompras.First;
    while not dmdados.tbdetCompras.Eof do
      begin
      dmdados.tbdetCompras.Delete; {excluir o registro do detcompras}
      dmdados.tbdetCompras.first;
      end;
      dmdados.tbCompras.Delete;
    end
  else
    dmdados.tbdetCompras.Cancel;
end;

procedure TfrmCompras.dbVuExit(Sender: TObject);
begin
  if dbvu.Text='' then
    begin
    ShowMessage('Obrigat�rio o PRE�O DO PRODUTO');
    dbvu.SetFocus;
    end
  else
    begin
    //Calculando valor total da compra
    if not(dmdados.tbCompras.State=dsedit) then
      dmdados.tbCompras.Edit;
    dmdados.tbComprasValor.Value:=dmdados.tbComprasValor.Value+dmdados.tbdetComprasTotal.Value;
    cesubtotal.Value:=dmdados.tbComprasValor.Value;
    ceTotalCompra.Value:=dmdados.tbComprasValor.Value;
    dmdados.tbdetCompras.Post;
    dmdados.tbdetCompras.Append;
    dmdados.tbDetComprasCodComp.Value:=dmdados.tbComprasCodComp.Value;
    dmdados.tbDetComprasDataComp.Value:=dmdados.tbComprasDataComp.Value;
    dbcodprod.Clear;
    dbcodprod.SetFocus;
    end;
end;

procedure TfrmCompras.btnAlterarClick(Sender: TObject);
begin
  if dmdados.tbCompras.RecordCount=0 then
     ShowMessage('Tabela vazia')
  else
    begin
    if dmdados.tbComprasPedidoPen.Value='N�o' then
       showMessage('Pedido j� foi alterado. N�o est� mais pendente')
    else
       begin
       dmdados.tbCompras.Edit;
       novoitem:=true;
       alterar:=true;
       dmdados.vTabStt:=false;
       dbgridPedido.Enabled:=true;
       dbgridPedido.ReadOnly:=false;
       btnAlterar.Enabled:=false;
       btnNovo.Enabled:=false;
       btnCancelar.Enabled:=true;
       dbcbPedidoPen.Enabled:=true;
       dbcbPedidoPen.SetFocus;
       end;
    end;
end;

procedure TfrmCompras.dbcbPedidoPenExit(Sender: TObject);
begin
  if alterar then
    begin
    if dmDados.tbComprasPedidoPen.Value='N�o' then
      begin
      dbcbPedidoPen.Enabled:=false;
      btnPagamento.Enabled:=True;
      btnPagamento.SetFocus;
      end;
    end;
end;

procedure TfrmCompras.dbCodForExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbCodFor.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o C�digo do Fornecedor');
      dbCodFor.SetFocus;
      End
    Else
      begin
      if not (dmdados.tbFornecedor.Locate('CodFor',dbcodFor.text,[])) then
         begin
         showmessage('Fornecedor n�o cadastrado!');
         dbcodfor.SetFocus;
         end
      else
        begin
        if not(dmdados.tbDetCompras.State=dsInsert)then
          dmdados.tbDetCompras.Append;
        dmdados.tbDetComprasCodComp.Value:=dmdados.tbComprasCodComp.Value;
        dmdados.tbDetComprasDataComp.Value:=dmdados.tbComprasDataComp.Value;
        dbCodFor.Enabled:=False;
        btnLocFor.Enabled:=False;
        end;
      end;
   end;
end;

procedure TfrmCompras.dbCodProdExit(Sender: TObject);
begin
  if novoItem then
    begin
    if pagto then
      begin
      dmdados.tbdetCompras.cancel;
      btnNovo.Enabled:=false;
      btnGravar.Enabled:=true;
      dbcodprod.Enabled:=false;
      dbeqtde.Enabled:=False;
      dbVu.Enabled:=False;
      ceacrescimo.Enabled:=true;
      cedesconto.Enabled:=true;
      ceacrescimo.SetFocus;
      end
    else
      begin
      //localizar o produto
      if dbcodprod.Text='' then
        begin
        ShowMessage('Obrigat�rio o C�DIGO DO PRODUTO!');
        dbcodprod.SetFocus;
        end
      else
        begin
        if not (dmdados.tbEstoque.Locate('CodMerc',dbcodprod.text,[])) then
          begin
          showmessage('PRODUTO n�o cadastrado!');
          dbcodprod.SetFocus;
          End;
        end;
      end;
    end;
end;

procedure TfrmCompras.dbcodprodEnter(Sender: TObject);
begin
  dmdados.tbVisDetCompra.Refresh;
end;

procedure TfrmCompras.ceAcrescimoChange(Sender: TObject);
begin
  if not(dmdados.tbCompras.State=dsedit) then
    dmdados.tbCompras.Edit;
  dmdados.tbComprasValor.Value:=ceSubTotal.Value-ceAcrescimo.Value;
end;

procedure TfrmCompras.btnPagamentoClick(Sender: TObject);
begin
  frmPagaPedido:=TfrmPagaPedido.Create(Application);
  frmPagaPedido.VlCompra:=dmdados.tbComprasValor.Value;
  frmPagaPedido.ShowModal;
  if frmPagaPedido.PagStt='S' then
    begin
    dbgridPedido.Enabled:=false;
    dbgridPedido.ReadOnly:=true;
    alterar:=false;
    btnAlterar.Enabled:=True;
    btnNovo.Enabled:=True;
    btnCancelar.Enabled:=False;
    ShowMessage('Confirma��o do Pedido Efetuada !!!');
    Panel3.SetFocus;
    end
  else
    btnCancelar.Click;
  frmPagaPedido.free;
end;

procedure TfrmCompras.FormActivate(Sender: TObject);
begin
  UserAcess.UserID:=frmPrincipal.Acesso;
end;

end.

