//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Emiss�o Relat�rio Funcion�rio
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitRelFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, RXSplit, fcButton, fcImgBtn, RXCtrls,
  SpeedBar, jpeg, DBCtrls, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint, DCChoice, RxGrdCpt, fcImager, EMsgDlg,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmRelFunc = class(TForm)
    MsgDlg: TEvMsgDlg;
    Image1: TImage;
    RxLabel2: TRxLabel;
    RxLabel4: TRxLabel;
    cmbclassif: TDCComboBox;
    cmbdestino: TDCComboBox;
    RxLabel5: TRxLabel;
    btnImprimir: TfcImageBtn;
    btnSair: TfcImageBtn;
    LMDBackPanel2: TPanel;
    Panel3: TPanel;
    LMDBackPanel1: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnimprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbDestinoExit(Sender: TObject);
    procedure cmbDestinoCloseUp(Sender: TObject);
    procedure cmbClassifChange(Sender: TObject);
    procedure cmbDestinoChange(Sender: TObject);
    procedure cmbclassifCloseUp(Sender: TObject);
    procedure cmbclassifExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelFunc: TFrmRelFunc;

implementation

uses UnitQRFunc, UnitPrincipal, unitDmDados;

{$R *.DFM}

procedure TFrmRelFunc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.tbFunc.Close;
	Action:= Cafree;
end;

procedure TFrmRelFunc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmRelFunc.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TFrmRelFunc.BtnimprimirClick(Sender: TObject);
begin
  Btnimprimir.Enabled:=false;
  QRFunc:= TQRFunc.Create(application);
  If cmbDestino.Text= 'V�deo' Then
	  QRFunc.Preview
  else
	  QRFunc.Print;
  QRFunc.Free;
end;

procedure TFrmRelFunc.FormShow(Sender: TObject);
begin
  dmDados.tbFunc.Open;
  FrmPrincipal.StatusTeclas(True,'[F2] Imprimir [Esc] Cancelar ou Sair');
end;

procedure TFrmRelFunc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F2    : if btnimprimir.Enabled then btnimprimir.Click;
      VK_ESCAPE : BtnSair.Click;
    end;
end;

procedure TFrmRelFunc.cmbDestinoExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If cmbDestino.Text= '' then
    Begin
    MsgDlg.MsgWarning('� obrigat�rio informar o destino do relat�rio');
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
      MsgDlg.MsgError('Valor inv�lido');
      cmbDestino.clear;
      cmbDestino.SetFocus;
      End
    else
      begin
      Panel3.SetFocus;
      btnImprimir.Enabled:=true;
      cmbdestino.Enabled:=false;
      end;
    end;
end;

procedure TFrmRelFunc.cmbDestinoCloseUp(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If cmbDestino.Text= '' then
    Begin
    MsgDlg.MsgWarning('� obrigat�rio informar o destino do relat�rio');
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
      MsgDlg.MsgError('Valor inv�lido');
      cmbDestino.clear;
      cmbDestino.SetFocus;
      End
    else
      begin
      Panel3.SetFocus;
      btnImprimir.Enabled:=true;
      end;
    end;
end;

procedure TFrmRelFunc.cmbClassifChange(Sender: TObject);
begin
  If cmbClassif.Text= 'C�digo' Then
	  dmdados.tbFunc.IndexFieldNames:= 'Codfunc'
  Else
	  dmdados.tbFunc.IndexFieldNames:= 'Nome';
  cmbdestino.Enabled:=true;
end;

procedure TFrmRelFunc.cmbDestinoChange(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If cmbDestino.Text= '' then
    Begin
    MsgDlg.MsgWarning('� obrigat�rio informar o destino do relat�rio');
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
      MsgDlg.MsgError('Valor inv�lido');
      cmbDestino.clear;
      cmbDestino.SetFocus;
      End
    else
      begin
      Panel3.SetFocus;
      btnImprimir.Enabled:=true;
      cmbdestino.Enabled:=false;
      end;
    end;
end;

procedure TFrmRelFunc.cmbclassifCloseUp(Sender: TObject);
begin
  If cmbClassif.Text= 'C�digo' Then
	  dmdados.tbFunc.IndexFieldNames:= 'Codfunc'
  Else
	  dmdados.tbFunc.IndexFieldNames:= 'Nome';
  cmbdestino.Enabled:=true;
end;

procedure TFrmRelFunc.cmbclassifExit(Sender: TObject);
begin
  If cmbClassif.Text= 'C�digo' Then
	  dmdados.tbFunc.IndexFieldNames:= 'Codfunc'
  Else
	  dmdados.tbFunc.IndexFieldNames:= 'Nome';
  cmbdestino.Enabled:=true;
end;

end.
