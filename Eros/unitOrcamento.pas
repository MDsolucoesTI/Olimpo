/////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Cadastro e Manuten��o de Or�amento
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VerCPF, VerCNPJ, fcButton, fcImgBtn, ToolEdit, RXDBCtrl,
  RXSplit, RxLookup, StdCtrls, DBCtrls, Mask, DCStdCtrls,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDShapeHint,
  SpeedBar, jpeg, RXCtrls, ExtCtrls, RackCtls, DBTables, DB, ShellAPI,
  Grids, DBGrids, RxDBComb, CurrEdit, RxGrdCpt, fcImager;

type
  TFrmOrcamento = class(TForm)
    VerCNPJ1: TVerCNPJ;
    VerCPF1: TVerCPF;
    Panel2: TPanel;
    RxLabel8: TRxLabel;
    Image3: TImage;
    Panel3: TPanel;
    btnAlterar: TfcImageBtn;
    btnSair: TfcImageBtn;
    btnNovo: TfcImageBtn;
    btnGravar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    btnAnterior: TfcImageBtn;
    btnProximo: TfcImageBtn;
    btnUltimo: TfcImageBtn;
    btnPrimeiro: TfcImageBtn;
    btnPagto: TfcImageBtn;
    Panel1: TPanel;
    dbgridOrc: TRxDBGrid;
    RxLabel11: TRxLabel;
    dbNumPedido: TDBEdit;
    RxLabel1: TRxLabel;
    dbCodCli: TDBEdit;
    RxLabel3: TRxLabel;
    dbCodProd: TDBEdit;
    dbimgProduto: TDBImage;
    dbProduto: TDBEdit;
    btnLocProd: TfcImageBtn;
    BtnlocCli: TfcImageBtn;
    dbCliente: TDBEdit;
    RxLabel4: TRxLabel;
    DBLookVend: TDBLookupComboBox;
    RxLabel2: TRxLabel;
    dbeqtde: TDBEdit;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    dbTotal: TDBEdit;
    dbVu: TDBEdit;
    RxLabel22: TRxLabel;
    ceSubTotal: TCurrencyEdit;
    ceAcrescimo: TCurrencyEdit;
    RxLabel23: TRxLabel;
    RxLabel24: TRxLabel;
    ceDesconto: TCurrencyEdit;
    dbValorFinal: TDBEdit;
    RxLabel25: TRxLabel;
    RxSplitter1: TRxSplitter;
    Bevel2: TBevel;
    Bevel1: TBevel;
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPagtoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure dbCodCliExit(Sender: TObject);
    procedure dbCodProdExit(Sender: TObject);
    procedure BtnlocCliClick(Sender: TObject);
    procedure btnLocProdClick(Sender: TObject);
    procedure dbeqtdeExit(Sender: TObject);
    procedure dbVuExit(Sender: TObject);
    procedure ceDescontoExit(Sender: TObject);
    procedure dbValorFinalExit(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure fcImageBtn10Click(Sender: TObject);
    procedure fcImageBtn7Click(Sender: TObject);
    procedure fcImageBtn8Click(Sender: TObject);
    procedure fcImageBtn9Click(Sender: TObject);
    procedure fcImageBtn4Click(Sender: TObject);
    procedure fcImageBtn11Click(Sender: TObject);
    procedure fcImageBtn5Click(Sender: TObject);
    procedure fcImageBtn6Click(Sender: TObject);
    procedure fcImageBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOrcamento: TFrmOrcamento;
  NovoItem,pagto,cancelar: Boolean;

implementation

uses unitDmDados, unitPrincipal, unitLibCredito,unitLocCliente, UnitLocProd,
  unitQrOrcamento;

{$R *.dfm}

procedure TFrmOrcamento.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbOrc.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
end;


procedure TFrmOrcamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_Home   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_End    : if not(dmDados.vTabStt) then BtnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
      VK_F2     : btnLocCli.Click;
      VK_F3     : btnLocProd.Click;
      VK_F4     : btnPagto.Click;
    end;
end;

procedure TFrmOrcamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmOrcamento.FormShow(Sender: TObject);
begin
	dmDados.tbOrc.Open;
  dmDados.tbDetOrc.Open;
  dmDados.tbVisDetOrc.Open;
  dmDados.tbFuncEsto.Open;
  dmDados.tbFunc.Open;
  dmDados.tbEstoque.Open;
  dmDados.tbCliente.Open;
  dmDados.tbLibCredito.Open;
  dmDados.tbPlanos.Open;
  dmDados.tbCargoFunc.Open;
  dmDados.vTabStt:=True;
  pagto:=false;
  cancelar:=false;
  NovoItem := True;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [F2] Loc. Cliente [F3] Loc. Produto [F4] Pagamento [Esc] Cancelar ou Sair');
end;

procedure TFrmOrcamento.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmOrcamento.BtnCancelarClick(Sender: TObject);
begin
  NovoItem:=False;
  dmdados.vTabStt:=True;
  cancelar:=true;
  {deletar os produtos atrav�s do �ltimo codigovenda}
  dmdados.tbDetOrc.Filtered := false;
  dmdados.tbDetOrc.Filter:='(CodOrca = '''+dmdados.tbOrcCodOrca.AsString+''')';
  dmdados.tbDetOrc.Filtered := true;
  dmdados.tbDetOrc.First;
  while not dmdados.tbDetOrc.Eof do
  begin
  dmdados.tbDetOrc.Delete; {excluir o registro do detcompras}
  dmdados.tbDetOrc.Refresh;
  dmdados.tbDetOrc.Next;
  end;
  {cancelar a �ltima venda}
  dmdados.tbOrc.delete;
  //VtabStt:=true;

  BtnPrimeiro.Enabled:=true;
  Btnanterior.Enabled:=true;
  Btnproximo.Enabled:=true;
  Btnultimo.Enabled:=true;
  BtnNovo.Enabled:=true;
  btnalterar.Enabled:=true;
  btnCancelar.Enabled:=false;
  btnPagto.Enabled:=false;

  dbvu.Enabled:=false;
  dbeqtde.Enabled:=false;
  dbCodCli.Enabled:=false;
  dbCodProd.Enabled:=false;
  dbLookVend.Enabled:=false;
  ceAcrescimo.Enabled:=false;
  ceDesconto.Enabled:=false;


  ceSubTotal.Value:=0;
  Panel3.SetFocus;
end;

procedure TFrmOrcamento.BtnAlterarClick(Sender: TObject);
begin
  if dmdados.tbOrc.RecordCount=0 then
    ShowMessage('Tabela vazia')
  else
    begin
    dmdados.tbOrc.Edit;
    novoitem:=false;
    dmdados.vTabStt:=True;
    dbgridOrc.Enabled:=true;
    dbgridOrc.ReadOnly:=false;

    BtnPrimeiro.Enabled:=false;
    Btnanterior.Enabled:=false;
    Btnproximo.Enabled:=false;
    Btnultimo.Enabled:=false;
    btnalterar.Enabled:=false;
    btnNovo.Enabled:=false;
    btnpagto.Enabled:=true;
    btncancelar.Enabled:=true;

    dbvu.Enabled:=true;
    dbcodCli.Enabled:=true;
    dbcodprod.Enabled:=true;
    dbeqtde.Enabled:=True;
    dbCodCli.Enabled:=true;
    dbCodProd.Enabled:=true;
    dbLookVend.Enabled:=true;

    dbLookVend.SetFocus;
    end;
end;

procedure TFrmOrcamento.BtnDeletarClick(Sender: TObject);
begin
  if dmdados.tbOrc.RecordCount=0 then
    begin
    ShowMessage('Tabela vazia');
    end
  else
    If application.MessageBox('Tem certeza que deseja excluir este registro?','Aten��o', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      Begin
      dmdados.tbOrc.Delete;
      dmdados.tbOrc.Refresh;
      End
    else
      dmdados.tbOrc.cancel;
end;

procedure TFrmOrcamento.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.tbOrc.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.tbOrc.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
end;

procedure TFrmOrcamento.BtnProximoClick(Sender: TObject);
begin
  DMDados.tbOrc.next;
  BtnPrimeiro.Enabled:=true;
  BtnAnterior.Enabled:=true;
  If DMDados.tbOrc.Eof Then
    Begin
    BtnProximo.Enabled:=false;
    BtnUltimo.Enabled:=false;
    End;
end;

procedure TFrmOrcamento.BtnUltimoClick(Sender: TObject);
begin
  dmdados.tbOrc.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
end;

procedure TFrmOrcamento.BtnNovoClick(Sender: TObject);
begin
   NovoItem:=true;
   dmdados.vTabStt:= false;
  {iniciarVenda;}
  if fileexists('Logogen.bmp') Then
    frmOrcamento.dbimgProduto.Picture.LoadFromFile('Logogen.bmp');
  dmdados.tbOrc.Append;
  dmdados.tbOrcDataOrca.Value:=date;
  dmdados.tbOrcValor.Value:=0;
  dmdados.tbOrcDesconto.Value:=0;
  dmdados.tbOrc.Post;
  dmdados.tbOrc.Edit;

  BtnPrimeiro.Enabled:=false;
  Btnanterior.Enabled:=false;
  Btnproximo.Enabled:=false;
  Btnultimo.Enabled:=false;
  btnNovo.Enabled:=false;
  btnalterar.Enabled:=false;
  btnpagto.Enabled:=true;
  btncancelar.Enabled:=true;

  dbvu.Enabled:=true;
  dbeqtde.Enabled:=True;
  dbCodCli.Enabled:=true;
  dbCodProd.Enabled:=true;
  dbLookVend.Enabled:=true;

  dbLookVend.SetFocus;
end;

procedure TFrmOrcamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	dmDados.tbOrc.Cancel;
  dmDados.tbDetOrc.Cancel;
  dmDados.tbVisDetOrc.Cancel;
  dmDados.tbFuncEsto.Cancel;
  dmDados.tbFunc.Cancel;
  dmDados.tbEstoque.Cancel;
  dmDados.tbCliente.Cancel;
  dmDados.tbLibCredito.Cancel;
  dmDados.tbPlanos.Cancel;
  dmDados.tbCargoFunc.Cancel;
  FrmPrincipal.StatusTeclas(False,'');
  Action:= Cafree;
end;

procedure TFrmOrcamento.btnPagtoClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
begin
  Gravar:=True;
  Vazio:=False;
  pagto:=True;
  //valida��es
  If dbCodCli.Text= '' then
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
    dbcodprod.Enabled:=false;
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

procedure TFrmOrcamento.BtnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar : Boolean;
begin
  //VALIDA��ES
  NovoItem:=False;
  dmdados.vTabStt:= True;
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  If Gravar Then
    Begin
    pagto:=false;
    dmdados.tbOrc.Post;
    ShowMessage('Pedido gravado com sucesso');
    BtnPrimeiro.Enabled:=true;
    Btnanterior.Enabled:=true;
    Btnproximo.Enabled:=true;
    Btnultimo.Enabled:=true;
    btnNovo.Enabled:=true;
    btnalterar.Enabled:=true;
    btnPagto.Enabled:=false;
    btngravar.Enabled:=false;
    btncancelar.Enabled:=false;

    dbvu.Enabled:=false;
    dbeqtde.Enabled:=false;
    dbCodCli.Enabled:=false;
    dbCodProd.Enabled:=false;
    dbLookVend.Enabled:=false;
    ceAcrescimo.Enabled:=false;
    ceDesconto.Enabled:=false;


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

procedure TFrmOrcamento.dbCodCliExit(Sender: TObject);
begin
If NovoItem Then
   Begin
   If dbCodCli.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o C�DIGO DO CLIENTE');
      dbCodCli.SetFocus;
      End
   Else
      if not (dmdados.tbCliente.Locate('CodCli',dbcodCli.text,[])) then
         begin
         showmessage('C�DIGO DO CLIENTE n�o cadastrado!');
         dbCodCli.SetFocus;
         end
      else
        begin
        dmdados.tbDetOrc.Append;
        dmdados.tbDetOrcCodOrca.Value:=dmdados.tbOrcCodOrca.Value;
        end;
   End;
end;

procedure TFrmOrcamento.dbCodProdExit(Sender: TObject);
begin
if novoItem then
begin
  if pagto then
     begin
     dmdados.tbDetOrc.cancel;
     btnNovo.Enabled:=false;
     btnGravar.Enabled:=true;
     dbcodprod.Enabled:=false;
     ceacrescimo.Enabled:=true;
     cedesconto.Enabled:=true;
     ceacrescimo.SetFocus;
     end
  else
     begin
     {localizar o produto}
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
            End
        end;
     end;
  end;
end;


procedure TFrmOrcamento.BtnlocCliClick(Sender: TObject);
begin
if (dmdados.tbOrc.State=DsInsert)or(dmdados.tbOrc.State=DsEdit) then
   begin
   frmLocCliente:=tfrmLocCliente.create(application);
   frmLocCliente.showmodal;
   dmdados.tbOrcCodCli.Value:=frmLocCliente.resultado;
   frmLocCliente.free;
   end;

end;

procedure TFrmOrcamento.btnLocProdClick(Sender: TObject);
begin
  if (dmdados.tbOrc.State=DsInsert)or(dmdados.tbOrc.State=DsEdit) then
    begin
    frmLocProd:=tfrmLocProd.create(application);
    frmLocProd.showmodal;

    if not(dmdados.tbDetorc.State=dsinsert) then
      dmdados.tbDetorc.Append;

    dmdados.tbDetOrcCodMerc.Value:=frmLocProd.resultado;
    frmLocProd.Free;
    end;
end;

procedure TFrmOrcamento.dbeqtdeExit(Sender: TObject);
begin
If NovoItem Then
   If dbeqtde.Text= '' then
      Begin
      ShowMessage('� obrigat�rio a Quantidade');
      dbeqtde.SetFocus;
      End;
end;

procedure TFrmOrcamento.dbVuExit(Sender: TObject);
begin
if dbvu.Text='' then
   begin
   ShowMessage('Obrigat�rio o PRE�O DO PRODUTO');
   dbvu.SetFocus;
   end
else
   cesubtotal.Value:=0;
   begin
   {Calculando valor total da compra}
   dmdados.tbOrcValor.Value:=dmdados.tbOrcValor.Value+dmdados.tbDetOrcTotal.Value;
   cesubtotal.Value:=cesubtotal.Value+dmdados.tbOrcValor.Value;
   dmdados.tbDetOrc.Post;
   dmdados.tbVisDetOrc.Refresh;
   dbcodprod.Clear;
   dmdados.tbDetOrc.Append;
   dmdados.tbDetOrcCodOrca.Value:=dmdados.tbOrcCodOrca.Value;
   dbcodprod.SetFocus;
   end;
end;

procedure TFrmOrcamento.ceDescontoExit(Sender: TObject);
begin
  dmdados.tbOrcValor.Value:=
  ceSubTotal.Value+ceacrescimo.Value-ceDesconto.Value;
  Panel3.SetFocus;
end;

procedure TFrmOrcamento.dbValorFinalExit(Sender: TObject);
begin
  Panel3.SetFocus;
end;

procedure TFrmOrcamento.btnImprimirClick(Sender: TObject);
begin
QrOrcamento:=tqrOrcamento.create(application);
QrOrcamento.QuickRep1.Preview;
QrOrcamento.free;
end;

procedure TFrmOrcamento.fcImageBtn10Click(Sender: TObject);
begin
  dmdados.tbOrc.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
end;

procedure TFrmOrcamento.fcImageBtn7Click(Sender: TObject);
begin
  dmdados.tbOrc.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.tbOrc.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
end;

procedure TFrmOrcamento.fcImageBtn8Click(Sender: TObject);
begin
  DMDados.tbOrc.next;
  BtnPrimeiro.Enabled:=true;
  BtnAnterior.Enabled:=true;
  If DMDados.tbOrc.Eof Then
    Begin
    BtnProximo.Enabled:=false;
    BtnUltimo.Enabled:=false;
    End;
end;

procedure TFrmOrcamento.fcImageBtn9Click(Sender: TObject);
begin
  dmdados.tbOrc.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
end;

procedure TFrmOrcamento.fcImageBtn4Click(Sender: TObject);
begin
  NovoItem:=true;
  dmdados.vTabStt:= false;
  {iniciarVenda;}
  if fileexists('Logogen.bmp') Then
    frmOrcamento.dbimgProduto.Picture.LoadFromFile('Logogen.bmp');
  dmdados.tbOrc.Append;
  dmdados.tbOrcDataOrca.Value:=date;
  dmdados.tbOrcValor.Value:=0;
  dmdados.tbOrcDesconto.Value:=0;
  dmdados.tbOrc.Post;
  dmdados.tbOrc.Edit;
  BtnPrimeiro.Enabled:=false;
  Btnanterior.Enabled:=false;
  Btnproximo.Enabled:=false;
  Btnultimo.Enabled:=false;
  btnNovo.Enabled:=false;
  btnalterar.Enabled:=false;
  btnpagto.Enabled:=true;
  btncancelar.Enabled:=true;
  dbvu.Enabled:=true;
  dbeqtde.Enabled:=True;
  dbCodCli.Enabled:=true;
  dbCodProd.Enabled:=true;
  dbLookVend.Enabled:=true;
  dbLookVend.SetFocus;
end;


procedure TFrmOrcamento.fcImageBtn11Click(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
begin
  pagto:=True;
  Gravar:=True;
  Vazio:=False;
  //valida��es
  If dbCodCli.Text= '' then
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
    dbcodprod.Enabled:=false;
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

procedure TFrmOrcamento.fcImageBtn5Click(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar : Boolean;
begin
  //VALIDA��ES
  NovoItem:=False;
  dmdados.vTabStt:= True;
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  If Gravar Then
    Begin
    pagto:=false;
    dmdados.tbOrc.Post;
    ShowMessage('Pedido gravado com sucesso');
    BtnPrimeiro.Enabled:=true;
    Btnanterior.Enabled:=true;
    Btnproximo.Enabled:=true;
    Btnultimo.Enabled:=true;
    btnNovo.Enabled:=true;
    btnalterar.Enabled:=true;
    btnPagto.Enabled:=false;
    btngravar.Enabled:=false;
    btncancelar.Enabled:=false;
    dbvu.Enabled:=false;
    dbeqtde.Enabled:=false;
    dbCodCli.Enabled:=false;
    dbCodProd.Enabled:=false;
    dbLookVend.Enabled:=false;
    ceAcrescimo.Enabled:=false;
    ceDesconto.Enabled:=false;
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

procedure TFrmOrcamento.fcImageBtn6Click(Sender: TObject);
begin
  NovoItem:=False;
  dmdados.vTabStt:=True;
  cancelar:=true;
  {deletar os produtos atrav�s do �ltimo codigovenda}
  dmdados.tbDetOrc.Filtered := false;
  dmdados.tbDetOrc.Filter:='(CodOrca = '''+dmdados.tbOrcCodOrca.AsString+''')';
  dmdados.tbDetOrc.Filtered := true;
  dmdados.tbDetOrc.First;
  while not dmdados.tbDetOrc.Eof do
  	begin
  	dmdados.tbDetOrc.Delete; {excluir o registro do detorc}
  	dmdados.tbDetOrc.Refresh;
  	dmdados.tbDetOrc.Next;
  	end;
  {cancelar a �ltima venda}
  dmdados.tbOrc.delete;
  //VtabStt:=true;
  BtnPrimeiro.Enabled:=true;
  Btnanterior.Enabled:=true;
  Btnproximo.Enabled:=true;
  Btnultimo.Enabled:=true;
  BtnNovo.Enabled:=true;
  btnalterar.Enabled:=true;
  btnCancelar.Enabled:=false;
  btnPagto.Enabled:=false;
  dbvu.Enabled:=false;
  dbeqtde.Enabled:=false;
  dbCodCli.Enabled:=false;
  dbCodProd.Enabled:=false;
  dbLookVend.Enabled:=false;
  ceAcrescimo.Enabled:=false;
  ceDesconto.Enabled:=false;
  ceSubTotal.Value:=0;
  Panel3.SetFocus;
end;

procedure TFrmOrcamento.fcImageBtn1Click(Sender: TObject);
begin
  if dmdados.tbOrc.RecordCount=0 then
    ShowMessage('Tabela vazia')
  else
    begin
    dmdados.tbOrc.Edit;
    novoitem:=false;
    dmdados.vTabStt:=True;
    dbgridOrc.Enabled:=true;
    dbgridOrc.ReadOnly:=false;
    BtnPrimeiro.Enabled:=false;
    Btnanterior.Enabled:=false;
    Btnproximo.Enabled:=false;
    Btnultimo.Enabled:=false;
    btnalterar.Enabled:=false;
    btnNovo.Enabled:=false;
    btnpagto.Enabled:=true;
    btncancelar.Enabled:=true;
    dbvu.Enabled:=true;
    dbcodCli.Enabled:=true;
    dbcodprod.Enabled:=true;
    dbeqtde.Enabled:=True;
    dbCodCli.Enabled:=true;
    dbCodProd.Enabled:=true;
    dbLookVend.Enabled:=true;
    dbLookVend.SetFocus;
    end;
end;

end.
