//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitBalFin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, StdCtrls, Mask, ToolEdit, RxLookup,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDShapeHint,
  jpeg, ExtCtrls, RackCtls, RXCtrls, RXSplit, SpeedBar, DCChoice, RxGrdCpt,
  fcImager, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel, JvComponent, JvTransBtn, JvLabel,
  fcLabel;

type
  TFrmBalFin = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    LMDBackPanel1: TLMDBackPanel;
    DCComboDestino: TDCComboBox;
    Panel3: TLMDBackPanel;
    fcLabel1: TfcLabel;
    JvLabel2: TJvLabel;
    btnSair: TJvTransparentButton;
    btnConfirmar: TJvTransparentButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DCComboDestinoChange(Sender: TObject);
    procedure DCComboDestinoCloseUp(Sender: TObject);
    procedure DCComboDestinoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBalFin: TFrmBalFin;
  NovoItem : boolean;

implementation

uses unitDmDados, unitQRBalFin, UnitPrincipal;

{$R *.dfm}

procedure TFrmBalFin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmBalFin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.statusteclas(False,'');
  Action:=caFree;
end;

procedure TFrmBalFin.btnConfirmarClick(Sender: TObject);
var
  SaldoConta : array[1..11] of Real;
  MostraSaldo,NumConta : array[1..11] of String[15];
  TotDisponivel,TotPrevista,TotReceita,TotDespesa,TotPend: Real;
  LucroMes,LucroReal, LucroPoss,TotPerda,TotFut : Real;
  ValReceberMes,CheReceberMes,ValPagarMes,ValFuncio : Real;
  ValReceberFut,CheRecebeFut,ValPagarFut : Real;
  ValPenPagar,ValPerdaRec,ValPerdaChe : Real;
  ValInad, ValPenReceber,ValPenCheque : Real;
  C : integer;
  DtInicio,DtFinal,DtPerda:TDateTime;
  Dia,Mes,Ano:word;
begin
   btnConfirmar.Enabled:=false;
  // DCComboDestino.Enabled:=false;
  //Criar formul�rio do relat�rio
  qrBalFin:=TqrBalFin.Create(Application);
  //Gerando datas limites
  DtPerda:=Now-180;
  DecodeDate(Now,Ano,Mes,Dia);
  if Dia <>  1 then
    dtInicio:=StrToDate('01'+'/'+IntToStr(Mes)+'/'+IntToStr(Ano));
  if Mes = 2 then
    If (Ano Mod 4) = 0 then
      Dia:=29
    else
      Dia:=28;
  if (Mes=4)or(Mes=6)or(Mes=9)or(Mes=11) then
    Dia:=30;
  if (Mes=1)or(Mes=3)or(Mes=5)or(Mes=7)or(Mes=8)or(Mes=12) then
    Dia:=31;
  DtFinal:=StrToDate(IntToStr(Dia)+'/'+IntToStr(Mes)+'/'+IntToStr(Ano));
  //Zerandoas vari�veis
  for c:=1 to 11 do
    begin
    SaldoConta[C]:=0;
    NumConta[C]:='';
    MostraSaldo[C]:='';
    end;
  ValReceberMes:=0;
  CheReceberMes:=0;
  ValPagarMes:=0;
  ValReceberFut:=0;
  CheRecebeFut:=0;
  ValPagarFut:=0;
  ValFuncio:=0;
  ValInad:=0;
  valPenReceber:=0;
  ValPenCheque:=0;
  ValPenPagar:=0;
  ValPerdaChe:=0;
  ValPerdaRec:=0;
  TotDisponivel:=0;
  TotPrevista:=0;
  TotReceita:=0;
  TotDespesa:=0;
  TotPend:=0;
  TotPerda:=0;
  TotFut:=0;
  //Pegando saldo das contas
  C:=1;
  dmdados.TbCCorrente.First;
  while not dmdados.TbCCorrente.Eof do
    begin
    SaldoConta[C]:=dmdados.TbCCorrenteSaldo.Value;
    NumConta[C]:=dmdados.TbCCorrenteConta.Value;
    dmdados.TbCCorrente.Next;
    C:=C+1;
    end;
  //Calculando o dispon�vel
  for C:=1 to 11 do
    TotDisponivel:=TotDisponivel+SaldoConta[C];
  //Pegando valores a Receber
  dmdados.tbCReceber.Filtered:=False;
  dmdados.tbCReceber.Filter:='(DataVenc >= '''+DateToStr(Now)+''') and '+
                             '(DataVenc <= '''+DateToStr(DtFinal)+''') and '+
                             '(Pago = '''+'ABERTO'+''')';
  dmdados.tbCReceber.Filtered:=True;
  dmdados.tbCReceber.First;
  while not dmdados.tbCReceber.Eof do
    begin
    ValReceberMes:=ValReceberMes+dmdados.tbCReceberValor.Value;
    dmdados.tbCReceber.Next;
    end;
  //Pegando Cheques a Receber
  dmdados.tbCheque.Filtered:=False;
  dmdados.tbCheque.Filter:='(Vencimento >= '''+DateToStr(Now)+''') and '+
                           '(Vencimento <= '''+DateToStr(DtFinal)+''') and '+
                           '(Status = '''+'ABERTO'+''')';
  dmdados.tbCheque.Filtered:=True;
  dmdados.tbCheque.First;
  while not dmdados.tbCheque.Eof do
    begin
    CheReceberMes:=CheReceberMes+dmdados.tbChequeValor.Value;
    dmdados.tbCheque.Next;
    end;
  //Prevfis�o de inadinplentes
  ValInad:=(ValReceberMes+CheReceberMes)*(6/100);
  //Totalizando Receitas
  TotPrevista:=ValReceberMes+CheReceberMes-ValInad;
  TotReceita:=TotPrevista+TotDisponivel;
  //Pegando valores a pagar
  dmdados.tbCPagar.Filtered:=False;
  dmdados.tbCPagar.Filter:='(DataVenc >= '''+DateToStr(Now)+''') and '+
                           '(DataVenc <= '''+DateToStr(DtFinal)+''') and '+
                           '(Pago = '''+'ABERTO'+''')';
  dmdados.tbCPagar.Filtered:=True;
  dmdados.tbCPagar.First;
  while not dmdados.tbCPagar.Eof do
    begin
    ValPagarMes:=ValPagarMes+dmdados.tbCPagarValor.Value;
    dmdados.tbCPagar.Next;
    end;
  //Pegando valores dos funcion�rios
  dmdados.tbFunc.First;
  while not dmdados.tbFunc.Eof do
    begin
    ValFuncio:=ValFuncio+dmdados.tbFuncCusto.Value;
    dmdados.tbFunc.Next;
    end;
  //Totalizando despesas
  TotDespesa:=ValPagarMes+ValFuncio;
  //Lucro/prejuizo do mes previsto
  LucroMes:=TotReceita-TotDespesa;
  //Pegando valores a pagar pendentes
  dmdados.tbCPagar.Filtered:=False;
  dmdados.tbCPagar.Filter:='(DataVenc < '''+DateToStr(Now)+''') and '+
                           '(Pago = '''+'ABERTO'+''')';
  dmdados.tbCPagar.Filtered:=True;
  dmdados.tbCPagar.First;
  while not dmdados.tbCPagar.Eof do
    begin
    ValPenPagar:=ValPenPagar+dmdados.tbCPagarValor.Value;
    dmdados.tbCPagar.Next;
    end;
  //Lucro/prejuizo real
  LucroReal:=LucroMes-ValPenPagar;
  //Pegando valores a receber pendentes
  dmdados.tbCReceber.Filtered:=False;
  dmdados.tbCReceber.Filter:='(DataVenc < '''+DateToStr(Now)+''') and '+
                             '(DataVenc >= '''+DateToStr(DtPerda)+''') and '+
                             '(Pago = '''+'ABERTO'+''')';
  dmdados.tbCReceber.Filtered:=True;
  dmdados.tbCReceber.First;
  while not dmdados.tbCReceber.Eof do
    begin
    ValPenReceber:=ValPenReceber+dmdados.tbCReceberValor.Value;
    dmdados.tbCReceber.Next;
    end;
  //Pegando cheques pendentes a receber
  dmdados.tbCheque.Filtered:=False;
  dmdados.tbCheque.Filter:='(Vencimento < '''+DateToStr(Now)+''') and '+
                           '(Vencimento >= '''+DateToStr(DtPerda)+''') and '+
                           '(Status = '''+'ABERTO'+''')';
  dmdados.tbCheque.Filtered:=True;
  dmdados.tbCheque.First;
  while not dmdados.tbCheque.Eof do
    begin
    ValPenCheque:=ValPenCheque+dmdados.tbChequeValor.Value;
    dmdados.tbCheque.Next;
    end;
  //Total de valores pendentes
  TotPend:=ValPenReceber+ValPenCheque;
  //Lucro/Prejuizo poss�vel
  LucroPoss:=LucroReal+TotPend;
  //Gerando valores perdidos a receber
  dmdados.tbCReceber.Filtered:=False;
  dmdados.tbCReceber.Filter:='(DataVenc < '''+DateToStr(DtPerda)+''') and '+
                             '(Pago = '''+'ABERTO'+''')';
  dmdados.tbCReceber.Filtered:=True;
  dmdados.tbCReceber.First;
  while not dmdados.tbCReceber.Eof do
    begin
    ValPerdaRec:=ValPerdaRec+dmdados.tbCReceberValor.Value;
    dmdados.tbCReceber.Next;
    end;
  //Gerando valores perdidos cheque
  dmdados.tbCheque.Filtered:=False;
  dmdados.tbCheque.Filter:='(Vencimento < '''+DateToStr(DtPerda)+''') and '+
                           '(Status = '''+'ABERTO'+''')';
  dmdados.tbCheque.Filtered:=True;
  dmdados.tbCheque.First;
  while not dmdados.tbCheque.Eof do
    begin
    ValPerdaChe:=ValPerdaChe+dmdados.tbChequeValor.Value;
    dmdados.tbCheque.Next;
    end;
  //total de valores perdidos
  TotPerda:=ValPerdaRec+ValPerdaChe;
  //Gerando valores futuros de cheques a receber
  dmdados.tbCheque.Filtered:=False;
  dmdados.tbCheque.Filter:='(Vencimento > '''+DateToStr(DtFinal)+''') and '+
                           '(Status = '''+'ABERTO'+''')';
  dmdados.tbCheque.Filtered:=True;
  dmdados.tbCheque.First;
  while not dmdados.tbCheque.Eof do
    begin
    CheRecebeFut:=CheRecebeFut+dmdados.tbChequeValor.Value;
    dmdados.tbCheque.Next;
    end;
  //Gerando Valores receber futuros
  dmdados.tbCReceber.Filtered:=False;
  dmdados.tbCReceber.Filter:='(DataVenc > '''+DateToStr(DtFinal)+''') and '+
                             '(Pago = '''+'ABERTO'+''')';
  dmdados.tbCReceber.Filtered:=True;
  dmdados.tbCReceber.First;
  while not dmdados.tbCReceber.Eof do
    begin
    ValReceberFut:=ValReceberFut+dmdados.tbCReceberValor.Value;
    dmdados.tbCReceber.Next;
    end;
  //Total de recebimentos futuros
  TotFut:=ValReceberFut+CheRecebeFut;
  //gerando valores a pagar futuros
  dmdados.tbCPagar.Filtered:=False;
  dmdados.tbCPagar.Filter:='(DataVenc > '''+DateToStr(DtFinal)+''') and '+
                           '(Pago = '''+'ABERTO'+''')';
  dmdados.tbCPagar.Filtered:=True;
  dmdados.tbCPagar.First;
  while not dmdados.tbCPagar.Eof do
    begin
    ValPagarFut:=ValPagarFut+dmdados.tbCPagarValor.Value;
    dmdados.tbCPagar.Next;
    end;
  //desabilitando os filtros utilizados
  dmdados.tbCPagar.Filtered:=False;
  dmdados.tbCReceber.Filtered:=False;
  dmdados.tbCheque.Filtered:=False;
  //Preparando saldos para o relat�rio
  for C:=1 to dmdados.TbCCorrente.RecordCount do
    MostraSaldo[C]:=FloatToStrf(SaldoConta[C],ffCurrency,10,2);
  //Transferisndo os dados para o relat�rio
  with qrBalFin do
    begin
    qrData1.caption:=DateToStr(dtInicio);
    qrData2.caption:=DateToStr(dtFinal);
    qrData3.Caption:=DateToStr(Now);
    vrCaixa.Caption:=MostraSaldo[1];
    vrConta2.Caption:=MostraSaldo[2];
    vrConta3.Caption:=MostraSaldo[3];
    vrConta4.Caption:=MostraSaldo[4];
    vrConta5.Caption:=MostraSaldo[5];
    vrConta6.Caption:=MostraSaldo[6];
    vrConta7.Caption:=MostraSaldo[7];
    vrConta8.Caption:=MostraSaldo[8];
    vrConta9.Caption:=MostraSaldo[9];
    vrConta10.Caption:=MostraSaldo[10];
    vrConta11.Caption:=MostraSaldo[11];
    NumConta2.Caption:=NumConta[2];
    NumConta3.Caption:=NumConta[3];
    NumConta4.Caption:=NumConta[4];
    NumConta5.Caption:=NumConta[5];
    NumConta6.Caption:=NumConta[6];
    NumConta7.Caption:=NumConta[7];
    NumConta8.Caption:=NumConta[8];
    NumConta9.Caption:=NumConta[9];
    NumConta10.Caption:=NumConta[10];
    NumConta11.Caption:=NumConta[11];
    qrTotDisponivel.Caption:=FloatToStrf(TotDisponivel,ffCurrency,10,2);
    qrValReceberMes.Caption:=FloatToStrf(ValReceberMes,ffCurrency,10,2);
    qrCheReceberMes.Caption:=FloatToStrf(CheReceberMes,ffCurrency,10,2);
    qrValInad.Caption:=FloatToStrf(ValInad,ffCurrency,10,2);
    qrTotPrevista.Caption:=FloatToStrf(TotPrevista,ffCurrency,10,2);
    qrTotReceita.Caption:=FloatToStrf(TotReceita,ffCurrency,10,2);
    qrValReceberFut.Caption:=FloatToStrf(ValReceberFut,ffCurrency,10,2);
    qrCheRecebeFut.Caption:=FloatToStrf(CheRecebeFut,ffCurrency,10,2);
    qrTotFut.Caption:=FloatToStrf(TotFut,ffCurrency,10,2);
    qrValPagarMes.Caption:=FloatToStrf(ValPagarMes,ffCurrency,10,2);
    qrValFuncio.Caption:=FloatToStrf(ValFuncio,ffCurrency,10,2);
    qrTotDespesa.Caption:=FloatToStrf(TotDespesa,ffCurrency,10,2);
    qrLucroMes.Caption:=FloatToStrf(LucroMes,ffCurrency,10,2);
    qrValPenPagar.Caption:=FloatToStrf(ValPenPagar,ffCurrency,10,2);
    qrLucroReal.Caption:=FloatToStrf(LucroReal,ffCurrency,10,2);
    qrValPenReceber.Caption:=FloatToStrf(ValPenReceber,ffCurrency,10,2);
    qrValPenCheque.Caption:=FloatToStrf(ValPenCheque,ffCurrency,10,2);
    qrTotPend.Caption:=FloatToStrf(TotPend,ffCurrency,10,2);
    qrLucroPoss.Caption:=FloatToStrf(LucroPoss,ffCurrency,10,2);
    qrValPagarFut.Caption:=FloatToStrf(ValPagarFut,ffCurrency,10,2);
    qrValPerdaRec.Caption:=FloatToStrf(ValPerdaRec,ffCurrency,10,2);
    qrValPerdaChe.Caption:=FloatToStrf(ValPerdaChe,ffCurrency,10,2);
    qrTotPerda.Caption:=FloatToStrf(TotPerda,ffCurrency,10,2);
    end;
    if DCComboDestino.Text='V�deo' then
      qrBalFin.Preview
    else
      qrBalFin.Print;
      QrBalFin.Free;
      //Close;
end;

procedure TFrmBalFin.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmBalFin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : if dmDados.vTabStt then BtnSair.Click;
      Vk_F2     : btnConfirmar.Click;
end;
end;

procedure TFrmBalFin.FormShow(Sender: TObject);
begin
FrmPrincipal.StatusTeclas(True,'[F2] Imprimir [Esc] Cancelar ou Sair');
end;


procedure TFrmBalFin.DCComboDestinoChange(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
 If DCComboDestino.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar o destino do relat�rio');
      DCComboDestino.SetFocus;
      End
   Else
      Begin
      Flag:=True;
      For x:=0 to DCComboDestino.Items.Count-1 Do
        If DCComboDestino.Text=DCComboDestino.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor inv�lido');
        DCComboDestino.clear;
        DCComboDestino.SetFocus;
        End
      else
        begin
        Panel3.SetFocus;
        btnConfirmar.Enabled:=true;
        end;
      end;
end;

procedure TFrmBalFin.DCComboDestinoCloseUp(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
 If DCComboDestino.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar o destino do relat�rio');
      DCComboDestino.SetFocus;
      End
   Else
      Begin
      Flag:=True;
      For x:=0 to DCComboDestino.Items.Count-1 Do
        If DCComboDestino.Text=DCComboDestino.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor inv�lido');
        DCComboDestino.clear;
        DCComboDestino.SetFocus;
        End
      else
        begin
        Panel3.SetFocus;
        btnConfirmar.Enabled:=true;
        end;
      end;
end;

procedure TFrmBalFin.DCComboDestinoExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
 If DCComboDestino.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar o destino do relat�rio');
      DCComboDestino.SetFocus;
      End
   Else
      Begin
      Flag:=True;
      For x:=0 to DCComboDestino.Items.Count-1 Do
        If DCComboDestino.Text=DCComboDestino.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor inv�lido');
        DCComboDestino.clear;
        DCComboDestino.SetFocus;
        End
      else
        begin
        Panel3.SetFocus;
        btnConfirmar.Enabled:=true;
        end;
      end;
end;

end.
