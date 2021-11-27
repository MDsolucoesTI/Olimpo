//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitConfPagto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, RackCtls, fcButton, fcImgBtn, RXSplit, Grids,variants,
  DBGrids, Mask, DBCtrls, RXCtrls, SpeedBar, jpeg, SRColBtn, EnhEdit,
  CurrEdit, ToolEdit, db, RxLookup, ComCtrls, RxDBComb, RxGrdCpt, fcImager;

type
  TFrmConfPagto = class(TForm)
    cbPagto: TPanel;
    lbNdoc: TRxLabel;
    edDoc: TEdit;
    lbvalorpagar: TRxLabel;
    lbtotalpago: TRxLabel;
    lbrestante: TRxLabel;
    lbprevisao: TRxLabel;
    edPrev: TDateEdit;
    edRestante: TCurrencyEdit;
    edTotalPago: TCurrencyEdit;
    edValorPagar: TCurrencyEdit;
    lbNumCheque: TRxLabel;
    lbConta: TRxLabel;
    edconta: TEdit;
    edcheque: TEdit;
    RxSplitter1: TRxSplitter;
    RxSplitter2: TRxSplitter;
    RxSplitter3: TRxSplitter;
    lbBanco: TRxLabel;
    RxLabel1: TRxLabel;
    cbConta: TRxLookupEdit;
    cbBanco: TRxLookupEdit;
    RxLabel2: TRxLabel;
    cmbPagto: TComboBox;
    Edit1: TEdit;
    Panel2: TPanel;
    RxLabel3: TRxLabel;
    Panel4: TPanel;
    fcImageBtn2: TfcImageBtn;
    fcImageBtn3: TfcImageBtn;
    Image1: TImage;
    btnSair: TfcImageBtn;
    RxGradientCaption2: TRxGradientCaption;
    fcImager1: TfcImager;
    fcImager2: TfcImager;
    fcImager3: TfcImager;
    procedure SRColorButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edChequeExit(Sender: TObject);
    procedure btnsairClick(Sender: TObject);
    procedure btnChequeClick(Sender: TObject);
    procedure btnDinheiroClick(Sender: TObject);
    procedure edcontaExit(Sender: TObject);
    procedure cmbPagtoExit(Sender: TObject);
    procedure edPrevExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbContaExit(Sender: TObject);
    procedure fcImageBtn2Click(Sender: TObject);
    procedure fcImageBtn3Click(Sender: TObject);
    procedure fcImageBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfPagto: TFrmConfPagto;

implementation

uses UnitDmdados, unitBaixaCpagar, UnitPrincipal;

{$R *.DFM}

procedure TFrmConfPagto.SRColorButton4Click(Sender: TObject);
begin
     Close;
end;

procedure TFrmConfPagto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//frmPrincipal.statusteclas(False,'');
Action:= Cafree;
end;

procedure TFrmConfPagto.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;

end;

procedure TFrmConfPagto.FormShow(Sender: TObject);
begin
//FrmPrincipal.StatusTeclas(True,'[F2] Cheque [F3] Dinheiro [Esc] Sair');
edValorPagar.Value:=frmBaixaCpagar.resultado;
edTotalPago.Value:=dmdados.tbCpagarValorPago.value;
edrestante.Value:=edvalorpagar.Value-edTotalPago.Value;
edDoc.Text:=frmBaixaCpagar.DBENdocbaixa.Text;
cmbPagto.SetFocus;
end;

procedure TFrmConfPagto.edChequeExit(Sender: TObject);
begin
if cbBanco.Text='' then
   ShowMessage('Obrigat�rio informar o NOME DO BANCO')
   else
     If Not(dmDados.TbBanco.Locate('NomeBanco',cbBanco.Text,[])) Then
        Begin
        Showmessage('Banco n�o Cadastrado');
        cbBanco.Clear;
        cbBanco.setfocus;
        End;
end;

procedure TFrmConfPagto.btnsairClick(Sender: TObject);
begin
frmbaixaCpagar.Close;
//FrmConfPagto.Free;
close;
end;

procedure TFrmConfPagto.btnChequeClick(Sender: TObject);
begin
lbnumcheque.visible:=true;
edcheque.visible:=true;
lbConta.Visible:=true;
edconta.Visible:=true;
lbBanco.Visible:=true;
cbBanco.visible:=true;
edcheque.SetFocus;

end;

procedure TFrmConfPagto.btnDinheiroClick(Sender: TObject);
var
  codfor : longint;
  hist,custo : string[10];
  ano,mes,dia : word;
  TipoDoc,mesCusto,anoCusto : string;

begin
   {buscando valores para o novo cadastro}
   dmdados.tbCpagar.GotoBookmark(pos);
    custo := dmdados.tbCpagarCodCcusto.Value;
     hist := dmdados.tbCpagarCodHist.Value;
  tipodoc := dmdados.tbCpagarCodDoc.Value;
   codfor := dmdados.tbCpagarCodFor.value;
{se houve desconto ou normal}
if (cmbPagto.text = 'Normal') or(cmbPagto.text = 'Desconto')or
   (edrestante.Value=0)  then
   begin
   if not (dmdados.tbCpagar.State=dsEdit) then
      begin
      dmdados.tbCpagar.Edit;
      dmdados.tbCpagarValorPago.Value:=edTotalPago.Value;
      dmdados.tbCpagarPago.Value:='Pago';
      if (cmbPagto.text = 'Desconto') then
         begin
         dmdados.tbCpagarCompHist.value:='Desconto';
         end;
      dmdados.tbCpagar.Post;
      end;
   end;
 {}
 if (edTotalPago.Value < edValorPagar.Value) or (cmbPagto.Text='Parcial') then
   begin
   {gravar o pagamento parcial}
   if not (dmdados.tbCpagar.State=dsedit) then
    begin
    dmdados.tbCpagar.edit;
    dmdados.tbCpagarValorPago.Value:=edTotalPago.Value;
    dmdados.tbCpagarPago.Value:='Pago';
    dmdados.tbCpagar.Post;
    end;
   {inserindo a diferen�a no contas a pagar}
   dmdados.tbCpagar.Append;
   dmdados.tbCpagarNumDoc.Value := edDoc.Text+'/1';
   dmdados.tbCpagarCodDoc.Value:=tipodoc;
   dmdados.tbCPagarCodFor.Value:=codfor;
   dmdados.tbCpagarCodCCusto.Value:=custo;
   dmdados.tbCpagarCodHist.Value:=hist;
   dmdados.tbCpagarDataEmis.Value:=date;
   dmdados.tbCpagarDataVenc.Value:=StrToDate(edprev.text);
   dmdados.tbCpagarValor.Value:=edrestante.Value;
   dmdados.tbCpagarPago.Value:='ABERTO';
   dmdados.tbCpagarCompHist.Value:='Restante de pagamento';
   dmdados.tbCpagar.Post;
end;
{}
 {Atualizar movimento de conta}
 dmdados.TbMovConta.Append;
  dmdados.TbMovContaDosNumero.Value:=edDoc.Text;
 dmdados.TbMovContaConta.Value:=edit1.Text;
 dmdados.TbMovContaDataMov.Value:=date;
 dmdados.tbMovContaDataReg.value:=date;
 dmdados.TbMovContaHoraReg.Value:=time;
 dmdados.TbMovContaValor.Value:=edtotalpago.Value;
 dmdados.TbMovContaTipoOper.Value:='S';
 // dmdados.TbMovContaUserName.Value:=frmprincipal.username;
 dmdados.TbMovContaCodHist.Value:=hist;
 dmdados.TbMovContaComplHist.Value:='Pagamento do doc n�'+''+edDoc.Text;
 dmdados.TbMovContaCodDoc.Value:=tipodoc;
 dmdados.TbMovConta.Post;

 {atualizar conta corrente}
 if dmdados.TbCCorrente.Locate('Conta',cbConta.Text,[]) then
    begin
    dmdados.TbCCorrente.Edit;
    dmdados.TbCCorrenteSaldo.Value:=
        dmdados.TbCCorrenteSaldo.Value-edtotalpago.Value;
    dmdados.tbccorrenteUltMov.value:=date;
    dmdados.TbCCorrente.post;
    end;

{atualizar centro de custo}
decodedate(now,ano,mes,dia);
mesCusto:=IntToStr(mes);
anoCusto:=IntToStr(ano);
if dmdados.TbBalCusto.Locate('CodCcusto;Mes;Ano',VarArrayOf([Custo,mesCusto,anoCusto]),[]) then
   begin
   dmdados.tbBalcusto.edit;
   dmdados.tbBalcustoReceitas.value:=
       dmdados.tbBalCustoDespesas.value+edtotalpago.Value;
       dmdados.tbBalCustoReceitas.Value:=0;
       dmdados.tbBalCusto.Post;
   end
    else
    begin
    dmdados.tbBalCusto.Append;
    dmdados.tbBalCustoCodCcusto.Value:=Custo;
    dmdados.tbBalCustoMes.Value:=IntToStr(mes);
    dmdados.tbBalCustoAno.Value:=IntToStr(ano);
    dmdados.tbBalCustoDespesas.Value:=edtotalpago.Value;
    dmdados.tbBalCustoReceitas.Value:=0;
    dmdados.tbBalCusto.Post;
    end;
{}
ShowMessage('Baixa efetuada com sucesso');
close;
end;

procedure TFrmConfPagto.edcontaExit(Sender: TObject);
var
  VDesc,VMulta,VJuros : real;
  PDesc,PMulta,PJuros : real;
  codfor : longint;
  custo : string[10];
  dia,mes,ano : word;
  TipoDoc,mesCusto,anoCusto,hist : string;
begin
if edConta.Text='' then
   begin
   ShowMessage('Obrigat�rio informar o N�MERO da conta');
   edConta.SetFocus;
   end
   else
begin
{buscando valores para o novo cadastro}
 dmdados.tbCpagar.GotoBookmark(pos);
 custo := dmdados.tbCpagarcodCcusto.Value;
 hist := dmdados.tbCpagarCodHist.Value;
 tipodoc := dmdados.tbCpagarCodDoc.Value;
 codfor := dmdados.tbCpagarCodFor.Value;

if (cmbPagto.text = 'Normal') or(cmbPagto.text = 'Desconto')or
   (edrestante.Value=0)  then
   begin
   if not (dmdados.tbCpagar.State=dsEdit) then
      begin
      dmdados.tbCpagar.Edit;
      dmdados.tbCpagarValorPago.Value:=edTotalPago.Value;
      dmdados.tbCpagarPago.Value:='Pago';
      if (cmbPagto.text = 'Desconto') then
         begin
         dmdados.tbCpagarCompHist.value:='Desconto';
         end;
      dmdados.tbCpagar.Post;
      end;
   end;
 {}

IF (edTotalPago.Value < edValorPagar.Value) or (cmbpagto.text='Parcial') then
BEGIN
 {gravar o pagamento parcial}
 if not (dmdados.tbCpagar.State=dsedit) then
   begin
   dmdados.tbCpagar.edit;
   dmdados.tbCpagarValorPago.Value:=edTotalPago.Value;
   dmdados.tbCpagarPago.Value:='Pago';
   dmdados.tbCpagar.Post;
   end;
   {inserindo a diferen�a no contas a pagar}
   if not (dmdados.tbCpagar.State=dsInsert) then
   dmdados.tbCpagar.Append;
   dmdados.tbCpagarNumDoc.Value := edDoc.Text+'/1';
   dmdados.tbCpagarCodFor.Value := codFor;
   dmdados.tbCpagarCodDoc.Value := tipodoc;
   dmdados.tbCpagarCodCCusto.Value := custo;
   dmdados.tbCpagarCodHist.Value := hist;
   dmdados.tbCpagarDataEmis.Value := date;
   dmdados.tbCpagarDataVenc.Value := StrTodate(edprev.text);
   dmdados.tbCpagarValor.Value := edrestante.Value;
   dmdados.tbCpagarPago.Value := 'ABERTO';
   dmdados.tbCpagarCompHist.Value := 'Restante de pagamento';
   dmdados.tbCpagar.Post;
END;
{atualizar controle de cheques}
 dmdados.tbCheque.append;
 dmdados.tbChequeValor.Value:=edTotalPago.Value;
 dmdados.tbChequeConta.Value:=edconta.Text;
 dmdados.tbChequeVencimento.Value:=date;
 dmdados.tbCheque.Post;

 {Atualizar movimento de conta}
 dmdados.TbMovConta.Append;
 dmdados.TbMovContaDosNumero.Value:=edDoc.Text;
 dmdados.TbMovContaConta.Value:=edit1.Text;
 dmdados.TbMovContaDataMov.Value:=date;
 dmdados.tbMovContaDataReg.value:=date;
 dmdados.TbMovContaHoraReg.Value:=time;
 dmdados.TbMovContaValor.Value:=edtotalpago.Value;
 dmdados.TbMovContaTipoOper.Value:='S';
// dmdados.TbMovContaUserName.Value:=frmprincipal.username;
 dmdados.TbMovContaCodHist.Value:=hist;
 dmdados.TbMovContaComplHist.Value:='Pagamento do doc n�'+''+edDoc.Text;
 dmdados.TbMovContaCodDoc.Value:=tipodoc;
 dmdados.TbMovConta.Post;

 {atualizar conta corrente}
 if dmdados.TbCCorrente.Locate('Conta',cbConta.Text,[]) then
    begin
    dmdados.TbCCorrente.Edit;
    dmdados.TbCCorrenteSaldo.Value:=
        dmdados.TbCCorrenteSaldo.Value-edtotalpago.Value;
    dmdados.tbccorrenteUltMov.value:=date;
    dmdados.TbCCorrente.post;
    end;

{atualizar centro de custo}
decodedate(now,ano,mes,dia);
mesCusto:=IntToStr(mes);
anoCusto:=IntToStr(ano);
if dmdados.TbBalCusto.Locate('CodCcusto;Mes;Ano',VarArrayOf([custo,mesCusto,anoCusto]),[]) then
   begin
   dmdados.tbBalcusto.edit;
   dmdados.tbBalcustoReceitas.value:=
       dmdados.tbBalcustoDespesas.value+edtotalpago.Value;
   dmdados.tbBalCustoReceitas.Value:=0;
   dmdados.tbBalCusto.Post;
   end
   else
    begin
    dmdados.tbBalCusto.Append;
    dmdados.tbBalCustoCodCcusto.Value:=Custo;
    dmdados.tbBalCustoMes.Value:=IntToStr(mes);
    dmdados.tbBalCustoAno.Value:=IntToStr(ano);
    dmdados.tbBalCustoDespesas.Value:=edtotalpago.Value;
    dmdados.tbBalCustoReceitas.Value:=0;
    dmdados.tbBalCusto.Post;
end;
ShowMessage('Baixa efetuada com sucesso');
close;
end;
{fim}
end;

procedure TFrmConfPagto.cmbPagtoExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
   If cmbPagto.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar a forma de pagamento');
      cmbPagto.SetFocus;
      End
    Else
      Begin
        Flag:=True;
        For x:=0 to cmbPagto.Items.Count-1 Do
         If cmbPagto.Text=cmbPagto.Items[x] Then
           Flag:=False;
        If Flag Then
          Begin
          ShowMessage('Valor'+' '+ cmbPagto.Text+' '+ 'inv�lido');
          cmbPagto.SetFocus;
          End
        else
          begin
          if cmbPagto.Text='Parcial' then
             begin
             edprev.Enabled:=true;
             edprev.SetFocus;
            end;
          end;
      end;
end;

procedure TFrmConfPagto.edPrevExit(Sender: TObject);
begin
if edprev.Text=' / /   ' then
   begin
   ShowMessage('Necess�rio a pr�xima DATA DE VENCIMENTO');
   end
else
   begin
   try
     StrToDate(edPrev.Text);
     except
       on EConvertError do
       begin
       ShowMessage ('Data Inv�lida');
       edPrev.SetFocus;
       end;
   end;
   end;
end;
procedure TFrmConfPagto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : if dmDados.vTabStt then BtnSair.Click;
      VK_F2     : btnCheque.click;
      VK_F3     : btndinheiro.click;
end;}
end;

procedure TFrmConfPagto.cbContaExit(Sender: TObject);
begin
if cbConta.Text='' then
   begin
   ShowMessage('Obrigat�rio informar a Conta de Recebimento');
   cbConta.SetFocus;
   end
else
   begin
   If Not(dmDados.TbCcorrente.Locate('Descricao',cbConta.Text,[])) Then
        Begin
        Showmessage('Conta n�o Cadastrado');
        cbConta.Clear;
        cbConta.setfocus;
        End
    else
        if dmdados.TbCCorrente.Locate('Descricao',cbConta.Text,[]) then
           edit1.Text:=dmdados.TbCCorrenteConta.Value;
    Panel4.SetFocus;
   end;
end;

procedure TFrmConfPagto.fcImageBtn2Click(Sender: TObject);
begin
lbnumcheque.visible:=true;
edcheque.visible:=true;
lbConta.Visible:=true;
edconta.Visible:=true;
lbBanco.Visible:=true;
cbBanco.visible:=true;
edcheque.SetFocus;
end;

procedure TFrmConfPagto.fcImageBtn3Click(Sender: TObject);
var
  VDesc,VMulta,VJuros : real;
  PDesc,PMulta,PJuros : real;
  codfor : longint;
  custo : string[10];
  ano,mes,dia : word;
  TipoDoc,DocmesCusto,MesCusto,anoCusto,hist : string;

begin
   {buscando valores para o novo cadastro}
   dmdados.tbCpagar.GotoBookmark(pos);
    custo := dmdados.tbCpagarCodCcusto.Value;
     hist := dmdados.tbCpagarCodHist.Value;
  tipodoc := dmdados.tbCpagarCodDoc.Value;
   codfor := dmdados.tbCpagarCodFor.value;
{se houve desconto ou normal}
if (cmbPagto.text = 'Normal') or(cmbPagto.text = 'Desconto')or
   (edrestante.Value=0)  then
   begin
   if not (dmdados.tbCpagar.State=dsEdit) then
      begin
      dmdados.tbCpagar.Edit;
      dmdados.tbCpagarValorPago.Value:=edTotalPago.Value;
      dmdados.tbCpagarPago.Value:='Pago';
      if (cmbPagto.text = 'Desconto') then
         begin
         dmdados.tbCpagarCompHist.value:='Desconto';
         end;
      dmdados.tbCpagar.Post;
      end;
   end;
 {}
 if (edTotalPago.Value < edValorPagar.Value) or (cmbPagto.Text='Parcial') then
   begin
   {gravar o pagamento parcial}
   if not (dmdados.tbCpagar.State=dsedit) then
    begin
    dmdados.tbCpagar.edit;
    dmdados.tbCpagarValorPago.Value:=edTotalPago.Value;
    dmdados.tbCpagarPago.Value:='Pago';
    dmdados.tbCpagar.Post;
    end;
   {inserindo a diferen�a no contas a pagar}
   dmdados.tbCpagar.Append;
   dmdados.tbCpagarNumDoc.Value := edDoc.Text+'/1';
   dmdados.tbCpagarCodDoc.Value:=tipodoc;
   dmdados.tbCPagarCodFor.Value:=codfor;
   dmdados.tbCpagarCodCCusto.Value:=custo;
   dmdados.tbCpagarCodHist.Value:=hist;
   dmdados.tbCpagarDataEmis.Value:=date;
   dmdados.tbCpagarDataVenc.Value:=StrToDate(edprev.text);
   dmdados.tbCpagarValor.Value:=edrestante.Value;
   dmdados.tbCpagarPago.Value:='ABERTO';
   dmdados.tbCpagarCompHist.Value:='Restante de pagamento';
   dmdados.tbCpagar.Post;
end;
{}
 {Atualizar movimento de conta}
 dmdados.TbMovConta.Append;
  dmdados.TbMovContaDosNumero.Value:=edDoc.Text;
 dmdados.TbMovContaConta.Value:=edit1.Text;
 dmdados.TbMovContaDataMov.Value:=date;
 dmdados.tbMovContaDataReg.value:=date;
 dmdados.TbMovContaHoraReg.Value:=time;
 dmdados.TbMovContaValor.Value:=edtotalpago.Value;
 dmdados.TbMovContaTipoOper.Value:='S';
 // dmdados.TbMovContaUserName.Value:=frmprincipal.username;
 dmdados.TbMovContaCodHist.Value:=hist;
 dmdados.TbMovContaComplHist.Value:='Pagamento do doc n�'+''+edDoc.Text;
 dmdados.TbMovContaCodDoc.Value:=tipodoc;
 dmdados.TbMovConta.Post;

 {atualizar conta corrente}
 if dmdados.TbCCorrente.Locate('Conta',cbConta.Text,[]) then
    begin
    dmdados.TbCCorrente.Edit;
    dmdados.TbCCorrenteSaldo.Value:=
        dmdados.TbCCorrenteSaldo.Value-edtotalpago.Value;
    dmdados.tbccorrenteUltMov.value:=date;
    dmdados.TbCCorrente.post;
    end;

{atualizar centro de custo}
decodedate(now,ano,mes,dia);
mesCusto:=IntToStr(mes);
anoCusto:=IntToStr(ano);
if dmdados.TbBalCusto.Locate('CodCcusto;Mes;Ano',VarArrayOf([Custo,mesCusto,anoCusto]),[]) then
   begin
   dmdados.tbBalcusto.edit;
   dmdados.tbBalcustoReceitas.value:=
       dmdados.tbBalCustoDespesas.value+edtotalpago.Value;
       dmdados.tbBalCustoReceitas.Value:=0;
       dmdados.tbBalCusto.Post;
   end
    else
    begin
    dmdados.tbBalCusto.Append;
    dmdados.tbBalCustoCodCcusto.Value:=Custo;
    dmdados.tbBalCustoMes.Value:=IntToStr(mes);
    dmdados.tbBalCustoAno.Value:=IntToStr(ano);
    dmdados.tbBalCustoDespesas.Value:=edtotalpago.Value;
    dmdados.tbBalCustoReceitas.Value:=0;
    dmdados.tbBalCusto.Post;
    end;
{}
ShowMessage('Baixa efetuada com sucesso');
close;

end;

procedure TFrmConfPagto.fcImageBtn1Click(Sender: TObject);
begin
frmbaixaCpagar.Close;
end;

end.
