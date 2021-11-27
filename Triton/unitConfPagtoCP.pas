//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitConfPagtoCP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcButton, fcImgBtn, StdCtrls, ExtCtrls, RackCtls, RXCtrls, SRColBtn, jpeg,
  Mask, ToolEdit, CurrEdit, DBCtrls, RxLookup, EnhEdit, db,variants,
  TFlatComboBoxUnit, SpeedBar, RXSplit;

type
  TFrmConfPgtoCP = class(TForm)
    Panel1: TPanel;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    Panel2: TPanel;
    Image2: TImage;
    Label2: TLabel;
    RxLabel6: TRxLabel;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    btnCheque: TSpeedItem;
    btnDinheiro: TSpeedItem;
    btnsair: TSpeedItem;
    edDoc: TEdit;
    lbNdoc: TRxLabel;
    RxSplitter1: TRxSplitter;
    lbvalorpagar: TRxLabel;
    edValorPagar: TCurrencyEdit;
    edTotalPago: TCurrencyEdit;
    lbtotalpago: TRxLabel;
    lbrestante: TRxLabel;
    edRestante: TCurrencyEdit;
    RxSplitter2: TRxSplitter;
    lbprevisao: TRxLabel;
    edPrev: TDateEdit;
    cbConta: TComboBox;
    RxLabel1: TRxLabel;
    RxSplitter3: TRxSplitter;
    edcheque: TEdit;
    lbNumCheque: TRxLabel;
    lbBanco: TRxLabel;
    cbBanco: TComboBox;
    edconta: TEdit;
    lbConta: TRxLabel;
    ComboBox1: TComboBox;
    RxLabel2: TRxLabel;
    rbdesc: TRadioButton;
    rdDesc: TRxLabel;
    rbpagto: TRadioButton;
    lbInfParc: TRxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edChequeExit(Sender: TObject);
    procedure edChequeEnter(Sender: TObject);
    procedure dblookCCEnter(Sender: TObject);
    procedure edcontaEnter(Sender: TObject);
    procedure edPrevEnter(Sender: TObject);
    procedure edPrevExit(Sender: TObject);
    procedure edPrevKeyPress(Sender: TObject; var Key: Char);
    procedure edBancoEnter(Sender: TObject);
    procedure edBancoExit(Sender: TObject);
    procedure btnChequeClick(Sender: TObject);
    procedure btnDinheiroClick(Sender: TObject);
    procedure btnsairClick(Sender: TObject);
    procedure edcontaExit(Sender: TObject);
    procedure rbpagtoClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfPgtoCP : TFrmConfPgtoCP;

implementation

uses UnitDmdados, UnitBaixaCPagar, UnitCPagar;

{$R *.DFM}

procedure TFrmConfPgtoCP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:= Cafree;
end;

procedure TFrmConfPgtoCP.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;


procedure TFrmConfPgtoCP.FormShow(Sender: TObject);
begin
edValorPagar.Value:=frmBaixaCpagar.resultado;
edTotalPago.Value:=dmdados.tbCpagarValorPago.value;
edrestante.Value:=edvalorpagar.Value-edTotalPago.Value;
edDoc.Text:=frmBaixaCpagar.DBENdocbaixa.Text;
cbconta.Items.Add(dmdados.TbCCorrenteDescricao.AsString);
cbbanco.Items.Add(dmdados.tbBancoNomeBanco.AsString);
//edprev.SetFocus;
end;

procedure TFrmConfPgtoCP.edChequeExit(Sender: TObject);
begin
if edcheque.Text= ' '  then
   begin
   ShowMessage('Necess�rio informar o N�MERO do cheque');
   edcheque.SetFocus;
   end
   else
   (Sender as TEdit).color:=clWindow;
end;

procedure TFrmConfPgtoCP.edChequeEnter(Sender: TObject);
begin
(Sender as TEdit).color:=$00d2e2ff;
end;


procedure TFrmConfPgtoCP.dblookCCEnter(Sender: TObject);
begin
dmdados.TbCCorrente.edit;
end;

procedure TFrmConfPgtoCP.edcontaEnter(Sender: TObject);
begin
(Sender as TEnhancedEdit).color:=$00d2e2ff;
end;

procedure TFrmConfPgtoCP.edPrevEnter(Sender: TObject);
begin
(Sender as TDateEdit).color:=$00d2e2ff;
end;

procedure TFrmConfPgtoCP.edPrevExit(Sender: TObject);
begin
(Sender as TDateEdit).color:=clWindow;
end;

procedure TFrmConfPgtoCP.edPrevKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;

end;

procedure TFrmConfPgtoCP.edBancoEnter(Sender: TObject);
begin
(Sender as TEnhancedEdit).color:=$00d2e2ff;
end;

procedure TFrmConfPgtoCP.edBancoExit(Sender: TObject);
begin
(Sender as TEnhancedEdit).color:=clWindow;
end;

procedure TFrmConfPgtoCP.btnChequeClick(Sender: TObject);
begin
dmdados.tbCPagarFormaPagto.Value:='CH';
lbnumcheque.visible:=true;
edcheque.visible:=true;
lbConta.Visible:=true;
edconta.Visible:=true;
lbBanco.Visible:=true;
cbBanco.visible:=true;
edcheque.SetFocus;
end;

procedure TFrmConfPgtoCP.btnDinheiroClick(Sender: TObject);
var
  VDesc,VMulta,VJuros : real;
  PDesc,PMulta,PJuros : real;
  hist,tipodoc,codfor : longint;
                custo : string[10];
          ano,mes,dia : word;
begin
{se houve desconto}
if (rbdesc.Checked = true) or (edrestante.Value=0)  then
 begin
 dmdados.tbCpagarFormaPagto.Value:='DH';
 dmdados.tbCpagarValorPago.Value:=edTotalPago.Value;
 dmdados.tbCpagarPago.Value:='Pago';
 dmdados.tbCpagar.Post;
 end;
 {}
 if (edTotalPago.Value < edValorPagar.Value) and (rbpagto.checked=true) then
   begin
   {buscando valores para o novo cadastro}
   dmdados.tbCpagar.GotoBookmark(pos);
    vdesc := dmdados.tbCpagarValorDesc.Value;
   vmulta := dmdados.tbCpagarValorMulta.Value;
   vjuros := dmdados.tbCpagarValorJuros.Value;
    pdesc := dmdados.tbCpagarPercDesc.Value;
   pmulta := dmdados.tbCpagarPercMulta.Value;
   pjuros := dmdados.tbCpagarPercJuros.Value;
    custo := dmdados.tbCpagarcodCcusto.Value;
     hist := dmdados.tbCpagarCodHist.Value;
  tipodoc := dmdados.tbCpagarCodDoc.Value;
   codfor := dmdados.tbCPagarCodFor.value;
   {gravar o pagamento parcial}
   if not (dmdados.tbCpagar.State=dsedit) then
    begin
    dmdados.tbCpagar.edit;
    dmdados.tbCpagarFormaPagto.Value:='DH';
    dmdados.tbCpagarValorPago.Value:=edTotalPago.Value;
    dmdados.tbCpagarPago.Value:='Pago';
    dmdados.tbCpagar.Post;
    end;
   {inserindo a diferen�a no contas a pagar}
   dmdados.tbCpagar.Append;
   dmdados.tbCpagarNumDoc.Value:=edDoc.Text;
   dmdados.tbCpagarCodDoc.Value:=tipodoc;
   dmdados.tbCpagarCodCCusto.Value:=custo;
   dmdados.tbCpagarCodHist.Value:=hist;
   dmdados.tbCpagarDataEmis.Value:=date;
   dmdados.tbCpagarDataVenc.Value:=edprev.Date;
   dmdados.tbCpagarPercMulta.Value:=pmulta;
   dmdados.tbCpagarPercJuros.Value:=pjuros;
   dmdados.tbCpagarPercDesc.Value:= pdesc;
   dmdados.tbCpagarValor.Value:=edrestante.Value;
   dmdados.tbCpagarValorMulta.Value:=vmulta;
   dmdados.tbCpagarValorDesc.Value:=vdesc;
   dmdados.tbCpagarValorJuros.Value:=vjuros;
   dmdados.tbCpagarPago.Value:='Aberto';
   dmdados.tbCpagarCompHist.Value:='Restante de pagamento';
   dmdados.tbCpagar.Post;
end;
{}
 {Atualizar movimento de conta}
 dmdados.TbMovConta.Append;
 dmdados.TbMovContaConta.Value:=cbConta.Text;
 dmdados.TbMovContaDataMov.Value:=date;
 dmdados.tbMovContaDataReg.value:=date;
 dmdados.TbMovContaHoraReg.Value:=time;
 dmdados.TbMovContaValor.Value:=edtotalpago.Value;
 dmdados.TbMovContaTipoOper.Value:='S';
 // dmdados.TbMovContaUserName.Value:=frmprincipal.username;
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
if dmdados.TbBalCusto.Locate('CodCcusto;Mes;Ano',VarArrayOf([Custo,mes,ano]),[]) then
   begin
   dmdados.tbBalcusto.edit;
   dmdados.tbBalcustoReceitas.value:=
       dmdados.tbBalCustoDespesas.value+edtotalpago.Value;
   end
    else
    begin
    dmdados.tbBalCusto.Append;
    dmdados.tbBalCustoCodCcusto.Value:=Custo;
    dmdados.tbBalCustoMes.Value:=IntToStr(mes);
    dmdados.tbBalCustoAno.Value:=IntToStr(ano);
    dmdados.tbBalCustoDespesas.Value:=edtotalpago.Value;
    dmdados.tbBalCusto.Post;
end;
end;

procedure TFrmConfPgtoCP.btnsairClick(Sender: TObject);
begin
close;
end;

procedure TFrmConfPgtoCP.edcontaExit(Sender: TObject);
var
  VDesc,VMulta,VJuros : real;
  PDesc,PMulta,PJuros : real;
  hist,tipodoc,codfor : longint;
  custo               : string[10];
  dia,mes,ano         : word;
begin
IF (rbdesc.Checked = true)or(edrestante.value=0) then
   begin
   dmdados.tbCpagarValorPago.Value:=edTotalPago.Value;
   dmdados.tbCpagarCompHist.Value:='Pago com o cheque n�'+edcheque.Text+'valor'+edtotalpago.Text;
   dmdados.tbCpagarPago.Value:='Pago';
   dmdados.tbCpagar.Post;
   end;
IF (edTotalPago.Value < edValorPagar.Value) and (rbpagto.checked=true) then
BEGIN
{buscando valores para o novo cadastro}
dmdados.tbCpagar.GotoBookmark(pos);
  vdesc := dmdados.tbCpagarValorDesc.Value;
 vmulta := dmdados.tbCpagarValorMulta.Value;
 vjuros := dmdados.tbCpagarValorJuros.Value;
  pdesc := dmdados.tbCpagarPercDesc.Value;
 pmulta := dmdados.tbCpagarPercMulta.Value;
 pjuros := dmdados.tbCpagarPercJuros.Value;
  custo := dmdados.tbCpagarcodCcusto.Value;
   hist := dmdados.tbCpagarCodHist.Value;
tipodoc := dmdados.tbCpagarCodDoc.Value;
 codfor := dmdados.tbCpagarCodFor.Value;
 {gravar o pagamento parcial}
 if not (dmdados.tbCpagar.State=dsedit) then
   begin
   dmdados.tbCpagar.edit;
   dmdados.tbCpagarFormaPagto.Value:='CH';
   dmdados.tbCpagarValorPago.Value:=edTotalPago.Value;
   dmdados.tbCpagarPago.Value:='Pago';
   dmdados.tbCpagar.Post;
   end;
   {inserindo a diferen�a no contas a pagar}
   if not (dmdados.tbCpagar.State=dsInsert) then
   begin
   dmdados.tbCpagar.Append;
   dmdados.tbCpagarNumDoc.Value := edDoc.Text+'/1';
   dmdados.tbCPagarCodFor.Value := codfor;
   dmdados.tbCpagarCodDoc.Value := tipodoc;
   dmdados.tbCpagarCodCCusto.Value := custo;
   dmdados.tbCpagarCodHist.Value := hist;
   dmdados.tbCpagarDataEmis.Value := date;
   dmdados.tbCpagarDataVenc.Value := edprev.Date;
   dmdados.tbCpagarPercMulta.Value := pmulta;
   dmdados.tbCpagarPercJuros.Value := pjuros;
   dmdados.tbCpagarPercDesc.Value := pdesc;
   dmdados.tbCpagarValor.Value := edrestante.Value;
   dmdados.tbCpagarValorMulta.Value := vmulta;
   dmdados.tbCpagarValorDesc.Value := vdesc;
   dmdados.tbCpagarValorJuros.Value := vjuros;
   dmdados.tbCpagarPago.Value := 'Aberto';
   dmdados.tbCpagarCompHist.Value := 'Restante de pagamento';
   dmdados.tbCpagar.Post;
   end;
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
 dmdados.TbMovContaTipoOper.Value:='S';
// dmdados.TbMovContaUserName.Value:=frmprincipal.username;
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
if dmdados.TbBalCusto.Locate('CodCcusto;Mes;Ano',VarArrayOf([custo,mes,ano]),[]) then
   begin
   dmdados.tbBalcusto.edit;
   dmdados.tbBalcustoReceitas.value:=
       dmdados.tbBalCustoDespesas.value+edtotalpago.Value;
   end
   else
    begin
    dmdados.tbBalCusto.Append;
    dmdados.tbBalCustoCodCcusto.Value:=Custo;
    dmdados.tbBalCustoMes.Value:=IntToStr(mes);
    dmdados.tbBalCustoAno.Value:=IntToStr(ano);
    dmdados.tbBalCustoDespesas.Value:=edtotalpago.Value;
    dmdados.tbBalCusto.Post;
end;
{fim}
end;

procedure TFrmConfPgtoCP.rbpagtoClick(Sender: TObject);
begin
edprev.Enabled:=true;
end;

end.
