//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitRelMovConta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SpeedBar, StdCtrls, Mask, ToolEdit, RXSplit, fcButton, fcImgBtn,
  RXCtrls, ExtCtrls, jpeg, RxLookup, DCChoice, RxGrdCpt, fcImager;

type
  TfrmRelMovConta = class(TForm)
    Panel1: TPanel;
    RxLabel5: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    EdtInicial: TDateEdit;
    EdtFinal: TDateEdit;
    edConta: TRxLookupEdit;
    RxLabel4: TRxLabel;
    Edit1: TEdit;
    DCComboDestino: TDCComboBox;
    Panel2: TPanel;
    RxLabel8: TRxLabel;
    Image1: TImage;
    Panel4: TPanel;
    btnImprimir: TfcImageBtn;
    btnSair: TfcImageBtn;
    RxGradientCaption2: TRxGradientCaption;
    procedure EdtInicialExit(Sender: TObject);
    procedure EdtFinalExit(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure edContaExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DCComboDestinoChange(Sender: TObject);
    procedure DCComboDestinoCloseUp(Sender: TObject);
    procedure DCComboDestinoExit(Sender: TObject);
    procedure edContaCloseUp(Sender: TObject);
    procedure EdtInicialChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelMovConta: TfrmRelMovConta;

implementation

uses uitQrSaExtratos, unitDmDados, UnitPrincipal;

{$R *.dfm}


procedure TfrmRelMovConta.EdtInicialExit(Sender: TObject);
begin
If edtInicial.Text= '  /  /    ' then
   Begin
   ShowMessage('� obrigat�rio a DATA INICIAL');
   edtInicial.SetFocus;
   End
else
   begin
   try
     StrToDate(edtInicial.Text);
     except
     on EConvertError do
     begin
     ShowMessage ('Data Inv�lida');
     edtInicial.SetFocus;
     end;
   end;
   end;
end;

procedure TfrmRelMovConta.EdtFinalExit(Sender: TObject);
begin
If edtFinal.Text= '  /  /    ' then
   Begin
   ShowMessage('� obrigat�rio a DATA FINAL');
   edtFinal.SetFocus;
   End
else
   begin
   try
     StrToDate(edtFinal.Text);
     except
     on EConvertError do
     begin
     ShowMessage ('Data Inv�lida');
     edtFinal.SetFocus;
     end;
   end;
   end;
end;

procedure TfrmRelMovConta.btnIMprimirClick(Sender : TObject);
var flag:boolean;
begin
 Btnimprimir.Enabled:=false;
 DCComboDestino.Enabled:=false;
 flag:=true;
 If edtInicial.Text= '  /  /    ' then
   Begin
    ShowMessage('� obrigat�rio a DATA INICIAL');
    edtInicial.SetFocus;
    flag:=false;
   End;
 If EdtFinal.Text= '  /  /    ' then
   Begin
    ShowMessage('� obrigat�rio a DATA FINAL');
    edtInicial.SetFocus;
    flag:=false;
   End;
  If (edConta.Text = '') then
   begin
   ShowMessage('� obrigat�rio escolher a CONTA');
   edConta.Enabled:=true;
   edConta.SetFocus;
   flag:=false;
   end;
 if flag then
 begin
 QrSaExtrato:=tQrSaExtrato.create(application);
 dmdados.tbMovConta.Filter:='(DataMov >='''+edtInicial.Text+''')and'+
                           '(DataMov <='''+edtFinal.Text+''')and'+
                           '(Conta = '''+edit1.Text+''')';
 dmdados.TbMovConta.Filtered:=true;

 If DCComboDestino.Text= 'V�deo' Then
 Begin
  QRSaExtrato.rpSaExtrato.Preview;
 end
 else
 begin
  QRSaExtrato.rpSaExtrato.Print;
 end;
 QRSaExtrato.Free;
 end;
end;

procedure TfrmRelMovConta.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TfrmRelMovConta.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[F2] Imprimir [Esc] Cancelar ou Sair');
  edtInicial.SetFocus;
  DCComboDestino.Enabled:=false;
end;

procedure TfrmRelMovConta.BtnSairClick(Sender: TObject);
begin
close;
end;

procedure TfrmRelMovConta.edContaExit(Sender: TObject);
begin
if dmdados.TbCCorrente.Locate('Descricao',edConta.Text,[]) then
   begin
   edit1.Text:=dmdados.TbCCorrenteConta.Value;
   DCComboDestino.Enabled:=true;
  end;
end;

procedure TfrmRelMovConta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F2    : Btnimprimir.Click;
      VK_ESCAPE : if dmDados.vTabStt then BtnSair.Click;
    end;

end;

procedure TfrmRelMovConta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
end;


procedure TfrmRelMovConta.DCComboDestinoChange(Sender: TObject);
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
        Panel4.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
end;


procedure TfrmRelMovConta.DCComboDestinoCloseUp(Sender: TObject);
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
        Panel4.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
end;


procedure TfrmRelMovConta.DCComboDestinoExit(Sender: TObject);
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
        Panel4.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
end;


procedure TfrmRelMovConta.edContaCloseUp(Sender: TObject);
begin
if dmdados.TbCCorrente.Locate('Descricao',edConta.Text,[]) then
   begin
   edit1.Text:=dmdados.TbCCorrenteConta.Value;
   DCComboDestino.Enabled:=true;
  end;
end;

procedure TfrmRelMovConta.EdtInicialChange(Sender: TObject);
begin
  Btnimprimir.Enabled:=true;
  DCComboDestino.Enabled:=true;
end;

end.
