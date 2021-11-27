//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitRelBoletoReal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SpeedBar, StdCtrls, RxLookup, Mask, ToolEdit, RXSplit, fcButton,
  fcImgBtn, RXCtrls, ExtCtrls, jpeg, DCChoice, RxGrdCpt, fcImager;

type
  TFrmRelBoletoReal = class(TForm)
    Panel1: TPanel;
    RxLabel5: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    cmbClassif: TComboBox;
    EdtInicial: TDateEdit;
    EdtFinal: TDateEdit;
    edCliente: TRxLookupEdit;
    Edit1: TEdit;
    edCcusto: TRxLookupEdit;
    Edit2: TEdit;
    cmbDestino: TDCComboBox;
    Panel2: TPanel;
    RxLabel8: TRxLabel;
    Image1: TImage;
    Panel4: TPanel;
    btnImprimir: TfcImageBtn;
    btnSair: TfcImageBtn;
    Label1: TLabel;
    RxSplitter1: TRxSplitter;
    RxGradientCaption2: TRxGradientCaption;
    procedure BtnimprimirClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure cmbClassifChange(Sender: TObject);
    procedure edClienteExit(Sender: TObject);
    procedure edCcustoChange(Sender: TObject);
    procedure cmbDestinoChange(Sender: TObject);
    procedure DCComboBox1Change(Sender: TObject);
    procedure cmbDestinoCloseUp(Sender: TObject);
    procedure cmbDestinoExit(Sender: TObject);
    procedure EdtInicialExit(Sender: TObject);
    procedure EdtFinalExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelBoletoReal: TFrmRelBoletoReal;

implementation

uses Unitbolreal, unitDmDados, UnitPrincipal;

{$R *.dfm}

procedure TFrmRelBoletoReal.BtnimprimirClick(Sender: TObject);
begin
   Btnimprimir.Enabled:=false;
  QrBoleto1:=tQrBoleto1.create(application);
if cmbclassif.text='Por Cliente' then
begin
  dmdados.tbCReceber.Filtered:=false;
  dmdados.tbCReceber.Filter:='(codcli='''+edit1.Text+''')and '+
                             '(CodDoc='''+IntToStr(1)+''')and'+
                             '(Pago='''+'ABERTO'+''')and'+
                             '(datavenc>='''+edtinicial.Text+''')and'+
                             '(datavenc<='''+edtfinal.Text+''')';
   dmdados.tbCReceber.Filtered:=true;
end;

if cmbclassif.text='Por Per�odo' then
begin
  dmdados.tbCReceber.Filtered:=false;
  dmdados.tbCReceber.Filter:= '(CodDoc='''+IntToStr(1)+''')and'+
                              '(pago ='''+'ABERTO'+''')and'+
                              '(datavenc>='''+edtinicial.Text+''')and'+
                              '(datavenc<='''+edtfinal.Text+''')';
   dmdados.tbCReceber.Filtered:=true;
end;

if cmbclassif.text='Por Centro de Custo' then
begin
  dmdados.tbCReceber.Filtered:=false;
  dmdados.tbCReceber.Filter:='(codccusto='''+edit2.Text+''')and '+
                             '(CodDoc='''+IntToStr(1)+''')and'+
                             '(pago ='''+'ABERTO'+''')and'+
                             '(datavenc>='''+edtinicial.Text+''')and'+
                             '(datavenc<='''+edtfinal.Text+''')';
   dmdados.tbCReceber.Filtered:=true;
end;

if cmbdestino.Text='V�deo' then
begin
   if cmbclassif.text='Por Cliente' then
   begin
   QrBoleto1.qrHoje.Caption:=DateToStr(Date);
   QrBoleto1.rpBoleto1.preview;
   end;
   if cmbclassif.text='Por Per�odo' then
   begin
   QrBoleto1.qrHoje.Caption:=DateToStr(Date);
   QrBoleto1.rpBoleto1.preview;
   end;
   if cmbclassif.text='Por Centro de Custo' then
   begin
   QrBoleto1.qrHoje.Caption:=DateToStr(Date);
   QrBoleto1.rpBoleto1.preview;
   end;
end
else
   begin
         if cmbdestino.Text='Impressora' then
begin
   if cmbclassif.text='Por Cliente' then
   begin
   QrBoleto1.qrHoje.Caption:=DateToStr(Date);
   QrBoleto1.rpBoleto1.print;
   end;
   if cmbclassif.text='Por Per�odo' then
   begin
   QrBoleto1.qrHoje.Caption:=DateToStr(Date);
   QrBoleto1.rpBoleto1.print;
   end;
   if cmbclassif.text='Por Centro de Custo' then
   begin
   QrBoleto1.qrHoje.Caption:=DateToStr(Date);
   QrBoleto1.rpBoleto1.print;
   end;
    end;
dmdados.tbCReceber.Filtered:=false;
end;
end;

procedure TFrmRelBoletoReal.BtnSairClick(Sender: TObject);
begin
    close;
end;

procedure TFrmRelBoletoReal.cmbClassifChange(Sender: TObject);
begin
If cmbClassif.Text= 'Por Cliente' Then
   Begin
     EdtInicial.Enabled:= True;
     EdtFinal.Enabled:= True;
     Edccusto.Enabled:=False;
     Edcliente.Enabled:=true;
     Btnimprimir.Enabled:=true;
     cmbDestino.Enabled:=true;
    end;
If cmbClassif.Text= 'Por Per�odo' Then
   Begin
     EdtInicial.Enabled:= True;
     EdtFinal.Enabled:= True;
     Edcliente.Enabled:=False;
     Edccusto.Enabled:=False;
     Btnimprimir.Enabled:=true;
     cmbDestino.Enabled:=true;
  end;
If cmbClassif.Text= 'Por Centro de Custo' Then
   Begin
    EdtInicial.Enabled:= True;
    EdtFinal.Enabled:= True;
    Edcliente.Enabled:=False;
    Edccusto.Enabled:=true;
    Btnimprimir.Enabled:=true;
    cmbDestino.Enabled:=true;
   end;
end;

procedure TFrmRelBoletoReal.edClienteExit(Sender: TObject);
begin
    if dmdados.TbCliente.Locate('nome',edCliente.Text,[]) then
   edit1.Text:=dmdados.TbClientecodcli.AsString;
end;

procedure TFrmRelBoletoReal.edCcustoChange(Sender: TObject);
 begin
if dmdados.TbCcusto.Locate('Descricao',edCcusto.Text,[]) then
   edit2.Text:=dmdados.TbCcustoCodCcusto.AsString;
end;

procedure TFrmRelBoletoReal.cmbDestinochange(Sender: TObject);
begin

end;
{procedure TfrmRelboleto1.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;}
procedure TFrmRelBoletoReal.DCComboBox1Change(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
 If cmbDestino.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar o destino do relat�rio');
      cmbDestino.SetFocus;
      End
   Else
      Begin
      Flag:=True;
      For x:=0 to cmbDestino.Items.Count-1 Do
        If cmbDestino.Text=cmbDestino.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor inv�lido');
        cmbDestino.SetFocus;
        End
      else
        begin
        Panel4.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
end;

procedure TFrmRelBoletoReal.cmbDestinoCloseUp(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
 If cmbDestino.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar o destino do relat�rio');
      cmbDestino.SetFocus;
      End
   Else
      Begin
      Flag:=True;
      For x:=0 to cmbDestino.Items.Count-1 Do
        If cmbDestino.Text=cmbDestino.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor inv�lido');
        cmbDestino.SetFocus;
        End
      else
        begin
        Panel4.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
end;

procedure TFrmRelBoletoReal.cmbDestinoExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
 If cmbDestino.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar o destino do relat�rio');
      cmbDestino.SetFocus;
      End
   Else
      Begin
      Flag:=True;
      For x:=0 to cmbDestino.Items.Count-1 Do
        If cmbDestino.Text=cmbDestino.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor inv�lido');
        cmbDestino.SetFocus;
        End
      else
        begin
        Panel4.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
end;

procedure TFrmRelBoletoReal.EdtInicialExit(Sender: TObject);
begin
  if (EdtInicial.Text ='  /  /    ') then
  begin
    ShowMessage('Data Inicial Vazia');
    EdtInicial.SetFocus;
  end
  else
    try StrToDate(EdtInicial.Text)
     Except on EConvertError do
     begin
      ShowMessage('Data Inicial Inv�lida');
      EdtInicial.SetFocus;
     end;
     end;
end;


procedure TFrmRelBoletoReal.EdtFinalExit(Sender: TObject);
begin
  if (EdtFinal.Text ='  /  /    ') then
  begin
    ShowMessage('Data Final Vazia');
    EdtFinal.SetFocus;
  end
  else
    try StrToDate(EdtFinal.Text)
     Except on EConvertError do
     begin
      ShowMessage('Data Final Inv�lida');
      EdtFinal.SetFocus;
     end;
     end;
end;
procedure TFrmRelBoletoReal.FormShow(Sender: TObject);
begin
FrmPrincipal.StatusTeclas(True,'[F2] Imprimir [Esc] Cancelar ou Sair');
    CmbDestino.Enabled:=false;
end;

procedure TFrmRelBoletoReal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F2    : Btnimprimir.Click;
      VK_ESCAPE : if dmDados.vTabStt then BtnSair.Click;
    end;
end;

procedure TFrmRelBoletoReal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
end;

end.

