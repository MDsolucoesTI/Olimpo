//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitRelCpagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, RXSplit, fcButton, fcImgBtn,
  RXCtrls, SpeedBar, jpeg, RxLookup, DCChoice, RxGrdCpt, fcImager;

type
  TfrmRelCpagar = class(TForm)
    Panel1: TPanel;
    RxLabel5: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    cmbClassif: TComboBox;
    EdtInicial: TDateEdit;
    EdtFinal: TDateEdit;
    edImposto: TRxLookupEdit;
    RxLabel6: TRxLabel;
    Edit1: TEdit;
    DCComboDestino: TDCComboBox;
    Panel2: TPanel;
    RxLabel8: TRxLabel;
    Image1: TImage;
    Panel4: TPanel;
    btnImprimir: TfcImageBtn;
    btnSair: TfcImageBtn;
    RxGradientCaption2: TRxGradientCaption;
    procedure BtnimprimirClick(Sender: TObject);
    procedure edImpostoExit(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure cmbClassifChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbClassifExit(Sender: TObject);
    procedure EdtInicialExit(Sender: TObject);
    procedure EdtFinalExit(Sender: TObject);
    procedure DCComboDestinoChange(Sender: TObject);
    procedure DCComboDestinoCloseUp(Sender: TObject);
    procedure DCComboDestinoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCpagar: TfrmRelCpagar;

implementation

uses unitQrCpagar, unitQrImposto, unitDmDados, UnitQRCReceber,
  UnitPrincipal;

{$R *.dfm}

procedure TfrmRelCpagar.BtnimprimirClick(Sender: TObject);
begin
Btnimprimir.Enabled:=false;
DCComboDestino.Enabled:=false;
{EdtInicial.Enabled:=false;
EdtFinal.Enabled:=false;
edImposto.Enabled:=false;}

QRCPagar:= TQRCPagar.Create(application);
QrImposto:=TQrImposto.create(application);
If cmbClassif.Text= 'Atrasadas' Then
	Begin
  dmdados.tbCPagar.Filtered:=false;
	dmdados.tbCPagar.Filter:= '(DataVenc < '''+DateToStr(date)+''')and'+
                            '(Pago='''+'ABERTO'+''')';
  dmdados.tbCPagar.Filtered:=true;
  QRCPagar.QRLabel2.Caption:='Contas a Pagar Atrasadas';
  End else
If cmbClassif.Text= 'A Pagar' Then
	Begin
  dmdados.tbCPagar.Filtered:=false;
	dmdados.tbCPagar.Filter:='(Pago='''+'ABERTO'+''')';
  dmdados.tbCPagar.Filtered:=true;
  QRCPagar.QRLabel2.Caption:='Contas a Pagar ';
  End else
If cmbClassif.Text= 'Pagas' Then
	Begin
  dmdados.tbCPagar.Filtered:=false;
  dmdados.tbCPagar.Filter:= '(Pago='''+'Pago'+''')';
  dmdados.tbCPagar.Filtered:=true;
  QRCPagar.QRLabel2.Caption:='Contas Pagas';
  End else
If cmbClassif.Text= 'Pagas por Per�odo' Then
	Begin
  dmdados.tbCPagar.Filtered:=false;
  dmdados.tbCPagar.Filter:= '(Pago='''+'Pago'+''')and'+
   													'(DataPaga>='''+EdtInicial.Text+''')And'+
                            '(DataPaga<='''+EdtFinal.Text+''')';
  dmdados.tbCPagar.Filtered:=true;
  QRCPagar.QRLabel2.Caption:='Contas Pagas por Per�odo';
  End else
If cmbClassif.Text= 'A Pagar por Per�odo' Then
	Begin
  dmdados.tbCPagar.Filtered:=false;
  dmdados.tbCPagar.Filter:= '(Pago='''+'ABERTO'+''')and'+
   													'(DataVenc>='''+EdtInicial.Text+''')And'+
                            '(DataVenc<='''+EdtFinal.Text+''')';
  dmdados.tbCPagar.Filtered:=true;
  QRCpagar.QRLabel2.Caption:='Contas a Pagar por Per�odo';
  End else
if cmbClassif.Text='Imposto' then
   begin
   dmdados.tbCPagar.Filtered:=false;
   dmdados.tbCPagar.Filter:= '((DataVenc >= '''+EdtInicial.Text+''')And'+
                             '(DataVenc <= '''+EdtFinal.Text+'''))and'+
                             '(Pago = '''+'ABERTO'+''')and'+
                             '((CodHist = '''+IntToStr(3)+''')or'+
                             '(CodHist = '''+IntToStr(4)+''')or'+
                             '(CodHist = '''+IntToStr(5)+''')or'+
                             '(CodHist = '''+IntToStr(6)+''')or'+
                             '(CodHist = '''+IntToStr(7)+'''))';
   dmdados.tbCPagar.Filtered:=true;
   end else
if cmbClassif.Text='Imposto espec�fico' then
   begin
   dmdados.tbCPagar.Filtered:=false;
   dmdados.tbCPagar.Filter:='(CodHist='''+edit1.Text+''')and'+
                            '(Pago='''+'ABERTO'+''')and'+
                            '(DataVenc>='''+EdtInicial.Text+''')And'+
                            '(DataVenc<='''+EdtFinal.Text+''')';
   dmdados.tbCPagar.Filtered:=true;
   end;

If DCComboDestino.Text= 'V�deo' Then
  QRCPagar.rpCpagar.Preview
else
	QRCPagar.rpCpagar.Print;
QRCPagar.Free;
QrImposto.Free;
end;

procedure TfrmRelCpagar.edImpostoExit(Sender: TObject);
begin
if edimposto.Text='' then
   begin
   ShowMessage('Obrigat�rio informar o HIST�RICO');
   edimposto.SetFocus;
   end
else
   begin
   If Not(dmDados.TbHistorico.Locate('Descricao',edimposto.Text,[])) Then
        Begin
        Showmessage('Hist�rico n�o Cadastrado');
        edimposto.Clear;
        edimposto.setfocus;
        End
   else
       edit1.Text:=dmdados.tbHistoricoCodHist.AsString;
end;
end;

procedure TfrmRelCpagar.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmRelCpagar.cmbClassifChange(Sender: TObject);
begin
if (cmbClassif.Text='A Pagar')or
   (cmbClassif.Text='Pagas')or
   (cmbClassif.Text='Atrasadas') then
    begin
    edtInicial.Enabled:=false;
    edtfinal.Enabled:=false;
    edImposto.Enabled:=false;
    Btnimprimir.Enabled:=true;
    DCComboDestino.Enabled:=true;
    end;
if (cmbClassif.Text='Pagas por Per�odo')or
   (cmbClassif.Text='A Pagar por Per�odo') or
   (cmbClassif.text='Imposto')then
    begin
    edtInicial.Enabled:=true;
    edtfinal.Enabled:=true;
    edImposto.Enabled:=false;
    Btnimprimir.Enabled:=true;
    DCComboDestino.Enabled:=true;
    end;
if (cmbClassif.Text='Imposto espec�fico')then
    begin
    edImposto.Enabled:=true;
    edtInicial.Enabled:=True;
    edtfinal.Enabled:=True;
    Btnimprimir.Enabled:=true;
     DCComboDestino.Enabled:=true;
    end;
end;

procedure TfrmRelCpagar.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[F2] Imprimir [Esc] Cancelar ou Sair');
    DCComboDestino.Enabled:=false;
end;

procedure TfrmRelCpagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F2    : Btnimprimir.Click;
      VK_ESCAPE : if dmDados.vTabStt then BtnSair.Click;
    end;
end;

procedure TfrmRelCpagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
end;

procedure TfrmRelCpagar.cmbClassifExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
 If cmbClassif.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar a classifica��o do relat�rio');
      cmbClassif.SetFocus;
      End
   Else
      Begin
      Flag:=True;
      For x:=0 to cmbClassif.Items.Count-1 Do
        If cmbClassif.Text=cmbClassif.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor inv�lido');
        cmbClassif.SetFocus;
        End;
      end;
end;

procedure TfrmRelCpagar.EdtInicialExit(Sender: TObject);
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

procedure TfrmRelCpagar.EdtFinalExit(Sender: TObject);
var flag:boolean;
begin
flag:=true;
if edtFinal.Text= '  /  /    ' then
   Begin
   ShowMessage('� obrigat�rio a DATA FINAL');
   edtFinal.SetFocus;
   flag:=false;
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
     flag:=false;
     end;
   end;
   end;
if flag then
  DCComboDestino.Enabled:=true;
end;

procedure TfrmRelCpagar.DCComboDestinoChange(Sender: TObject);
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

procedure TfrmRelCpagar.DCComboDestinoCloseUp(Sender: TObject);
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

procedure TfrmRelCpagar.DCComboDestinoExit(Sender: TObject);
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

end.
