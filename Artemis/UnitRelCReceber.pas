//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitRelCReceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, RXSplit, fcButton, fcImgBtn, RXCtrls,
  SpeedBar, jpeg, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  LMDShapeHint, DCChoice, RxGrdCpt, fcImager;

type
  TFrmRelCReceber = class(TForm)
    Panel1: TPanel;
    RxLabel5: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    cmbClassif: TComboBox;
    EdtInicial: TDateEdit;
    EdtFinal: TDateEdit;
    DCComboDestino: TDCComboBox;
    Panel4: TPanel;
    btnImprimir: TfcImageBtn;
    btnSair: TfcImageBtn;
    RxGradientCaption2: TRxGradientCaption;
    Panel2: TPanel;
    RxLabel8: TRxLabel;
    Image1: TImage;
    procedure BtnSairClick(Sender: TObject);
    procedure cmbClassifChange(Sender: TObject);
    procedure BtnimprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
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
  FrmRelCReceber: TFrmRelCReceber;

implementation

uses unitDmDados, UnitQRCReceber, UnitPrincipal;

{$R *.DFM}

procedure TFrmRelCReceber.BtnSairClick(Sender: TObject);
begin
dmdados.tbCReceber.Filtered:=false;
Close;
end;

procedure TFrmRelCReceber.cmbClassifChange(Sender: TObject);
begin
If cmbClassif.Text= 'Recebidas por Per�odo' Then
	Begin
  	EdtInicial.Enabled:=True;
    EdtFinal.Enabled:=true;
    Btnimprimir.Enabled:=true;
    DCComboDestino.Enabled:=true;
  end;
If cmbClassif.Text= 'A Receber por Per�odo' Then
 	Begin
  	EdtInicial.Enabled:= True;
    EdtFinal.Enabled:= True;
    Btnimprimir.Enabled:=true;
    DCComboDestino.Enabled:=true;
  end;
  If cmbClassif.Text= 'A Receber' Then
	Begin
  	EdtInicial.Enabled:= false;
    EdtFinal.Enabled:= false;
    Btnimprimir.Enabled:=true;
    DCComboDestino.Enabled:=true;
  end;
  If cmbClassif.Text= 'Atrasadas' Then
	Begin
  	EdtInicial.Enabled:=false;
    EdtFinal.Enabled:=false;
    Btnimprimir.Enabled:=true;
    DCComboDestino.Enabled:=true;
  end;
  If cmbClassif.Text= 'Recebidas' Then
	Begin
  	EdtInicial.Enabled:=false;
    EdtFinal.Enabled:=false;
    Btnimprimir.Enabled:=true;
    DCComboDestino.Enabled:=true;
  end;
end;

procedure TFrmRelCReceber.BtnimprimirClick(Sender: TObject);
begin
Btnimprimir.Enabled:=false;
DCComboDestino.Enabled:=false;
QRCReceber:= TQRCReceber.Create(application);
dmdados.tbCReceber.Filtered:=false;
If cmbClassif.Text= 'Atrasadas' Then
	Begin
	dmdados.tbCReceber.Filter:= '(DataVenc < '''+DateToStr(now)+''') and'+
                              '(Pago='''+'ABERTO'+''')';
  QRCReceber.QRLabel2.Caption:='Contas a Receber Atrasadas';
  End;
If cmbClassif.Text= 'A Receber' Then
	Begin
  dmdados.tbCReceber.Filter:= '(Pago='''+'ABERTO'+''')';
  QRCReceber.QRLabel2.Caption:='Contas a Receber';
  QrCreceber.QRDBText5.DataField:='Valor';
  End;
If cmbClassif.Text= 'Recebidas' Then
	Begin
  dmdados.tbCReceber.Filter:= '(Pago='''+'Pago'+''')';
  QRCReceber.QRLabel2.Caption:='Contas Recebidas';
  End;
If cmbClassif.Text= 'Recebidas por Per�odo' Then
	Begin
  dmdados.tbCReceber.Filter:= '(Pago='''+'Pago'+''') and '+
   														'(DataPaga>='''+EdtInicial.Text+''')And'+
                              '(DataPaga<='''+EdtFinal.Text+''')';
  QRCReceber.QRLabel2.Caption:='Contas Recebidas por Per�odo';
  End;
If cmbClassif.Text= 'A Receber por Per�odo' Then
	Begin
  dmdados.tbCReceber.Filter:= '(Pago='''+'ABERTO'+''') and '+
   														'(DataVenc>='''+EdtInicial.Text+''')And'+
                              '(DataVenc<='''+EdtFinal.Text+''')';
  QRCReceber.QRLabel2.Caption:='Contas a Receber por Per�odo';
  QrCreceber.QRDBText5.DataField:='Valor';
  End;
dmdados.tbCReceber.Filtered:= True;

If DCComboDestino.Text= 'V�deo' Then
   	 QRCReceber.Preview
else
     QRCReceber.Print;
QRCReceber.Free;
end;

procedure TFrmRelCReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
end;

procedure TFrmRelCReceber.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmRelCReceber.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F2    : Btnimprimir.Click;
      VK_ESCAPE : if dmDados.vTabStt Then BtnSair.Click;
    end;
end;

procedure TFrmRelCReceber.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[F2] Imprimir [Esc] Cancelar ou Sair');
    DCComboDestino.Enabled:=false;
end;

procedure TFrmRelCReceber.cmbClassifExit(Sender: TObject);
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
        cmbClassif.Clear;
        cmbClassif.SetFocus;
        End;
      end;
end;

procedure TFrmRelCReceber.EdtInicialExit(Sender: TObject);
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

procedure TFrmRelCReceber.EdtFinalExit(Sender: TObject);
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

procedure TFrmRelCReceber.DCComboDestinoChange(Sender: TObject);
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

procedure TFrmRelCReceber.DCComboDestinoCloseUp(Sender: TObject);
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

procedure TFrmRelCReceber.DCComboDestinoExit(Sender: TObject);
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
