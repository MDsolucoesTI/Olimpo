//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitRelCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, RXSplit, fcButton, fcImgBtn, RXCtrls,
  SpeedBar, jpeg, DBCtrls, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint, DCChoice, RxGrdCpt, fcImager, EMsgDlg,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmRelCliente = class(TForm)
    RxGradientCaption1: TRxGradientCaption;
    MsgDlg: TEvMsgDlg;
    LMDBackPanel2: TLMDBackPanel;
    RxLabel2: TRxLabel;
    Image1: TImage;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel4: TRxLabel;
    cmbclassif: TDCComboBox;
    cmbDestino: TDCComboBox;
    RxLabel5: TRxLabel;
    Panel3: TLMDBackPanel;
    btnImprimir: TfcImageBtn;
    btnSair: TfcImageBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnimprimirClick(Sender: TObject);
    procedure cmbClassifChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cmbDestinoExit(Sender: TObject);
    procedure cmbdestinoCloseUp(Sender: TObject);
    procedure cmbDestinoChange(Sender: TObject);
    procedure cmbclassifCloseUp(Sender: TObject);
    procedure cmbclassifExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelCliente: TFrmRelCliente;

implementation

uses UnitQRCliente, unitDmDados, UnitPrincipal;


{$R *.DFM}

procedure TFrmRelCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmRelCliente.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TFrmRelCliente.BtnimprimirClick(Sender: TObject);
begin
  Btnimprimir.Enabled:=false;
  QRCliente:= TQRCliente.Create(application);
  If cmbDestino.Text= 'V�deo' Then
    QRCliente.Preview
  else
	  QRCliente.Print;
  QRCliente.Free;
end;

procedure TFrmRelCliente.cmbClassifChange(Sender: TObject);
begin
  If cmbClassif.Text= 'C�digo' Then
    begin
    dmdados.tbCliente.IndexFieldNames:= 'CodCli';
    cmbdestino.Enabled:=true;
    end
  Else
    begin
    dmdados.tbCliente.IndexFieldNames:= 'Nome';
    cmbdestino.Enabled:=true;
    end;
end;

procedure TFrmRelCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.tbCliente.Close;
  FrmPrincipal.StatusTeclas(False,'');
end;

procedure TFrmRelCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F2    : if btnimprimir.Enabled then btnimprimir.Click;
      VK_ESCAPE : BtnSair.Click;
    end;
end;

procedure TFrmRelCliente.FormShow(Sender: TObject);
begin
  dmDados.tbCliente.Open;
  FrmPrincipal.StatusTeclas(True,'[F2] Imprimir [Esc] Cancelar ou Sair');
end;


procedure TFrmRelCliente.cmbdestinoCloseUp(Sender: TObject);
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


procedure TFrmRelCliente.cmbdestinoExit(Sender: TObject);
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


procedure TFrmRelCliente.cmbDestinoChange(Sender: TObject);
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

procedure TFrmRelCliente.cmbclassifCloseUp(Sender: TObject);
begin
  If cmbClassif.Text= 'C�digo' Then
    dmdados.tbCliente.IndexFieldNames:= 'CodCli'
  Else
    dmdados.tbCliente.IndexFieldNames:= 'Nome';
  cmbdestino.Enabled:=true;
end;

procedure TFrmRelCliente.cmbclassifExit(Sender: TObject);
begin
  If cmbClassif.Text= 'C�digo' Then
    dmdados.tbCliente.IndexFieldNames:= 'CodCli'
  Else
    dmdados.tbCliente.IndexFieldNames:= 'Nome';
  cmbdestino.Enabled:=true;
end;

end.
