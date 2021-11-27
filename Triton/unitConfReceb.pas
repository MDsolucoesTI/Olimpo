//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitConfReceb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, RackCtls, fcButton, fcImgBtn, RXSplit, Grids,variants,
  DBGrids, Mask, DBCtrls, RXCtrls, SpeedBar, jpeg, SRColBtn, EnhEdit,
  CurrEdit, ToolEdit, db, RxLookup, ComCtrls, RxDBComb;

type
  TFrmConfReceb = class(TForm)
    Panel1: TPanel;
    ScrewPanel1: TScrewPanel;
    Panel2: TPanel;
    Image1: TImage;
    Image2: TImage;
    Label2: TLabel;
    lbNdoc: TRxLabel;
    edDoc: TEdit;
    rbdesc: TRadioButton;
    rbpagto: TRadioButton;
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
    lbInfDesc: TRxLabel;
    lbInfParc: TRxLabel;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    btnCheque: TSpeedItem;
    btnDinheiro: TSpeedItem;
    btnsair: TSpeedItem;
    lbBanco: TRxLabel;
    RxLabel6: TRxLabel;
    cbBanco: TComboBox;
    RxLabel1: TRxLabel;
    cbConta: TComboBox;
    procedure SRColorButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edChequeEnter(Sender: TObject);
    procedure edChequeExit(Sender: TObject);
    procedure edBancoEnter(Sender: TObject);
    procedure edBancoExit(Sender: TObject);
    procedure edcontaEnter(Sender: TObject);
    procedure btnsairClick(Sender: TObject);
    procedure btnChequeClick(Sender: TObject);
    procedure btnDinheiroClick(Sender: TObject);
    procedure edcontaExit(Sender: TObject);
    procedure rbpagtoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfReceb: TFrmConfReceb;

implementation

uses UnitDmdados, UnitBaixaCReceber,unitCreceber;

{$R *.DFM}

procedure TFrmConfReceb.SRColorButton4Click(Sender: TObject);
begin
     Close;
end;

procedure TFrmConfReceb.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
frmBaixaCreceber.Visible:=true;
Action:= Cafree;
end;

procedure TFrmConfReceb.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;

end;

procedure TFrmConfReceb.FormShow(Sender: TObject);
begin
edValorPagar.Value:=frmBaixaCReceber.resultado;
edTotalPago.Value:=dmdados.tbCReceberValorPago.value;
edrestante.Value:=edvalorpagar.Value-edTotalPago.Value;
edDoc.Text:=frmBaixaCreceber.DBENdocbaixa.Text;
cbconta.Items.Add(dmdados.TbCCorrenteDescricao.Value);
cbbanco.Items.Add(dmdados.tbBancoNomeBanco.Value);
end;

procedure TFrmConfReceb.edChequeEnter(Sender: TObject);
begin
(Sender as TEdit).color:=$00d2e2ff;
end;

procedure TFrmConfReceb.edChequeExit(Sender: TObject);
begin
if edcheque.Text= ' '  then
   begin
   ShowMessage('Necess�rio informar o N�MERO do cheque');
   edcheque.SetFocus;
   end
   else
   (Sender as TEdit).color:=clWindow;

end;

procedure TFrmConfReceb.edBancoEnter(Sender: TObject);
begin
(Sender as TEnhancedEdit).color:=$00d2e2ff;
end;

procedure TFrmConfReceb.edBancoExit(Sender: TObject);
begin
   (Sender as TEnhancedEdit).color:=clWindow;
end;

procedure TFrmConfReceb.edcontaEnter(Sender: TObject);
begin
(Sender as TEdit).color:=$00d2e2ff;
end;

procedure TFrmConfReceb.btnsairClick(Sender: TObject);
begin
frmbaixaCreceber.Close;
close;
end;

procedure TFrmConfReceb.btnChequeClick(Sender: TObject);
begin
dmdados.tbCreceberFormaPagto.Value:='CH';
lbnumcheque.visible:=true;
edcheque.visible:=true;
lbConta.Visible:=true;
edconta.Visible:=true;
lbBanco.Visible:=true;
cbBanco.visible:=true;
edcheque.SetFocus;

end;

procedure TFrmConfReceb.btnDinheiroClick(Sender: TObject);
var
  VDesc,VMulta,VJuros : real;
  PDesc,PMulta,PJuros : real;
  hist,tipodoc,codcli : longint;
                custo : string[10];
          ano,mes,dia : word;

begin
{se houve desconto}
if (rbdesc.Checked = true) or (edrestante.Value=0)  then
 begin
 dmdados.tbCReceberFormaPagto.Value:='DH';
 dmdados.tbCReceberValorPago.Value:=edTotalPago.Value;
 dmdados.tbCReceberPago.Value:='Pago';
 dmdados.tbCReceber.Post;
 end;
 {}
 if (edTotalPago.Value < edValorPagar.Value) and (rbpagto.checked=true) then
   begin
   {buscando valores para o novo cadastro}
   dmdados.tbCReceber.GotoBookmark(pos);
    vdesc := dmdados.tbCReceberValorDesc.Value;
   vmulta := dmdados.tbCReceberValorMulta.Value;
   vjuros := dmdados.tbCReceberValorJuros.Value;
    pdesc := dmdados.tbCReceberPercDesc.Value;
   pmulta := dmdados.tbCReceberPercMulta.Value;
   pjuros := dmdados.tbCReceberPercJuros.Value;
    custo := dmdados.tbcRecebercodCcusto.Value;
     hist := dmdados.tbCReceberCodHist.Value;
  tipodoc := dmdados.tbCReceberCodDoc.Value;
   codcli := dmdados.tbCReceberCodCli.value;
   {gravar o pagamento parcial}
   if not (dmdados.tbCReceber.State=dsedit) then
    begin
    dmdados.tbCReceber.edit;
    dmdados.tbCReceberFormaPagto.Value:='DH';
    dmdados.tbCReceberValorPago.Value:=edTotalPago.Value;
    dmdados.tbCReceberPago.Value:='Pago';
    dmdados.tbCReceber.Post;
    end;
   {inserindo a diferen�a no contas a pagar}
   dmdados.tbCReceber.Append;
   dmdados.tbCReceberNumDoc.Value:=edDoc.Text;
   dmdados.tbCReceberCodDoc.Value:=tipodoc;
   dmdados.tbCReceberCodCCusto.Value:=custo;
   dmdados.tbCReceberCodHist.Value:=hist;
   dmdados.tbCReceberDataEmis.Value:=date;
   dmdados.tbCReceberDataVenc.Value:=edprev.Date;
   dmdados.tbCReceberPercMulta.Value:=pmulta;
   dmdados.tbCReceberPercJuros.Value:=pjuros;
   dmdados.tbCReceberPercDesc.Value:= pdesc;
   dmdados.tbCReceberValor.Value:=edrestante.Value;
   dmdados.tbCReceberValorMulta.Value:=vmulta;
   dmdados.tbCReceberValorDesc.Value:=vdesc;
   dmdados.tbCReceberValorJuros.Value:=vjuros;
   dmdados.tbCReceberPago.Value:='Aberto';
   dmdados.tbCReceberCompHist.Value:='Restante de recebimento';
   dmdados.tbCReceber.Post;
end;
{}
 {Atualizar movimento de conta}
 dmdados.TbMovConta.Append;
 dmdados.TbMovContaConta.Value:=cbConta.Text;
 dmdados.TbMovContaDataMov.Value:=date;
 dmdados.tbMovContaDataReg.value:=date;
 dmdados.TbMovContaHoraReg.Value:=time;
 dmdados.TbMovContaValor.Value:=edtotalpago.Value;
 dmdados.TbMovContaTipoOper.Value:='E';
 // dmdados.TbMovContaUserName.Value:=frmprincipal.username;
 dmdados.TbMovConta.Post;

 {atualizar conta corrente}
 if dmdados.TbCCorrente.Locate('Conta',cbConta.Text,[]) then
    begin
    dmdados.TbCCorrente.Edit;
    dmdados.TbCCorrenteSaldo.Value:=
        dmdados.TbCCorrenteSaldo.Value+edtotalpago.Value;
    dmdados.tbccorrenteUltMov.value:=date;
    dmdados.TbCCorrente.post;
    end;

{atualizar centro de custo}
decodedate(now,ano,mes,dia);
if dmdados.TbBalCusto.Locate('CodCcusto;Mes;Ano',VarArrayOf([Custo,mes,ano]),[]) then
   begin
   dmdados.tbBalcusto.edit;
   dmdados.tbBalcustoReceitas.value:=
       dmdados.tbBalcustoReceitas.value+edtotalpago.Value;
   end
    else
    begin
    dmdados.tbBalCusto.Append;
    dmdados.tbBalCustoCodCcusto.Value:=Custo;
    dmdados.tbBalCustoMes.Value:=IntToStr(mes);
    dmdados.tbBalCustoAno.Value:=IntToStr(ano);
    dmdados.tbBalCustoReceitas.Value:=edtotalpago.Value;
    dmdados.tbBalCusto.Post;
end;
{}

end;

procedure TFrmConfReceb.edcontaExit(Sender: TObject);
var
  VDesc,VMulta,VJuros : real;
  PDesc,PMulta,PJuros : real;
  hist,tipodoc,codcli : longint;
  custo               : string[10];
  dia,mes,ano         : word;

begin
IF (rbdesc.Checked = true)or(edrestante.value=0) then
   begin
   dmdados.tbCReceberValorPago.Value:=edTotalPago.Value;
   dmdados.tbCReceberCompHist.Value:='Recebido com o cheque n�'+edcheque.Text+'valor'+edtotalpago.Text;
   dmdados.tbCReceberPago.Value:='Pago';
   dmdados.tbCReceber.Post;
   end;

IF (edTotalPago.Value < edValorPagar.Value) and (rbpagto.checked=true) then
BEGIN
{buscando valores para o novo cadastro}
dmdados.tbCReceber.GotoBookmark(pos);
  vdesc := dmdados.tbCReceberValorDesc.Value;
 vmulta := dmdados.tbCReceberValorMulta.Value;
 vjuros := dmdados.tbCReceberValorJuros.Value;
  pdesc := dmdados.tbCReceberPercDesc.Value;
 pmulta := dmdados.tbCReceberPercMulta.Value;
 pjuros := dmdados.tbCReceberPercJuros.Value;
  custo := dmdados.tbcRecebercodCcusto.Value;
   hist := dmdados.tbCReceberCodHist.Value;
tipodoc := dmdados.tbCReceberCodDoc.Value;
 codcli := dmdados.tbCReceberCodCli.Value;
 {gravar o pagamento parcial}
 if not (dmdados.tbCReceber.State=dsedit) then
   begin
   dmdados.tbCReceber.edit;
   dmdados.tbCReceberFormaPagto.Value:='CH';
   dmdados.tbCReceberValorPago.Value:=edTotalPago.Value;
   dmdados.tbCReceberPago.Value:='Pago';
   dmdados.tbCReceber.Post;
   end;
   {inserindo a diferen�a no contas a pagar}
   if not (dmdados.tbCReceber.State=dsInsert) then
   dmdados.tbCReceber.Append;
      dmdados.tbCReceberNumDoc.Value := edDoc.Text+'/1';
      dmdados.tbCReceberCodCli.Value := codcli;
      dmdados.tbCReceberCodDoc.Value := tipodoc;
   dmdados.tbCReceberCodCCusto.Value := custo;
     dmdados.tbCReceberCodHist.Value := hist;
    dmdados.tbCReceberDataEmis.Value := date;
    dmdados.tbCReceberDataVenc.Value := edprev.Date;
   dmdados.tbCReceberPercMulta.Value := pmulta;
   dmdados.tbCReceberPercJuros.Value := pjuros;
    dmdados.tbCReceberPercDesc.Value := pdesc;
       dmdados.tbCReceberValor.Value := edrestante.Value;
  dmdados.tbCReceberValorMulta.Value := vmulta;
   dmdados.tbCReceberValorDesc.Value := vdesc;
  dmdados.tbCReceberValorJuros.Value := vjuros;
        dmdados.tbCReceberPago.Value := 'Aberto';
    dmdados.tbCReceberCompHist.Value := 'Restante de pagamento';
   dmdados.tbCReceber.Post;
END;
{atualizar controle de cheques}
 dmdados.tbCheque.append;
 dmdados.tbChequeValor.Value:=edTotalPago.Value;
 dmdados.tbChequeConta.Value:=edconta.Text;
 dmdados.tbChequeVencimento.Value:=date;
 dmdados.tbCheque.Post;

 {Atualizar movimento de conta}
 dmdados.TbMovConta.Append;
 dmdados.TbMovContaConta.Value:=cbConta.Text;
 dmdados.TbMovContaDataMov.Value:=date;
 dmdados.tbMovContaDataReg.value:=date;
 dmdados.TbMovContaHoraReg.Value:=time;
 dmdados.TbMovContaValor.Value:=edtotalpago.Value;
 dmdados.TbMovContaTipoOper.Value:='E';
// dmdados.TbMovContaUserName.Value:=frmprincipal.username;
 dmdados.TbMovConta.Post;

 {atualizar conta corrente}
 if dmdados.TbCCorrente.Locate('Conta',cbConta.Text,[]) then
    begin
    dmdados.TbCCorrente.Edit;
    dmdados.TbCCorrenteSaldo.Value:=
        dmdados.TbCCorrenteSaldo.Value+edtotalpago.Value;
    dmdados.tbccorrenteUltMov.value:=date;
    dmdados.TbCCorrente.post;
    end;

{atualizar centro de custo}
decodedate(now,ano,mes,dia);
if dmdados.TbBalCusto.Locate('CodCcusto;Mes;Ano',VarArrayOf([custo,mes,ano]),[]) then
   begin
   dmdados.tbBalcusto.edit;
   dmdados.tbBalcustoReceitas.value:=
       dmdados.tbBalcustoReceitas.value+edtotalpago.Value;
   end
   else
    begin
    dmdados.tbBalCusto.Append;
    dmdados.tbBalCustoCodCcusto.Value:=Custo;
    dmdados.tbBalCustoMes.Value:=IntToStr(mes);
    dmdados.tbBalCustoAno.Value:=IntToStr(ano);
    dmdados.tbBalCustoReceitas.Value:=edtotalpago.Value;
    dmdados.tbBalCusto.Post;
end;
{fim}
//close;
end;

procedure TFrmConfReceb.rbpagtoClick(Sender: TObject);
begin
edprev.Enabled:=true;
end;

end.
