//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitRelContrato;

interface

uses
 Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, RXSplit, fcButton, fcImgBtn, RXCtrls,
  SpeedBar, jpeg, DBCtrls, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint;

type
  TFrmRelContrato = class(TForm)
    Image2: TImage;
    Label2: TLabel;
    Panel1: TPanel;
    RxLabel3: TRxLabel;
    Label1: TLabel;
    RxLabel5: TRxLabel;
    RxLabel4: TRxLabel;
    fclGravar: TfcImageBtn;
    RxSplitter1: TRxSplitter;
    RxSplitter2: TRxSplitter;
    cmbDestino: TComboBox;
    cmbClassif: TComboBox;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    Btnimprimir: TSpeedItem;
    BtnSair: TSpeedItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbClassifChange(Sender: TObject);
    procedure cmbDestinoExit(Sender: TObject);
    procedure BtnimprimirClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelContrato: TFrmRelContrato;

implementation

uses unitDmDados, UnitQRContrato, unitPrincipal;

{$R *.dfm}

procedure TFrmRelContrato.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[F2] Imprimir [Esc] Cancelar ou Sair');
end;

procedure TFrmRelContrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
end;

procedure TFrmRelContrato.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmRelContrato.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F2    : if btnimprimir.enabled then Btnimprimir.Click;
      VK_ESCAPE : BtnSair.Click;
    end;
end;

procedure TFrmRelContrato.cmbClassifChange(Sender: TObject);
begin
If cmbClassif.Text= 'C�digo Cliente' Then
	dmdados.tbContrato.IndexFieldNames:= 'CodCli'
Else
	dmdados.tbContrato.IndexFieldNames:= 'CodServ';
end;

procedure TFrmRelContrato.cmbDestinoExit(Sender: TObject);
var
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
        cmbDestino.clear;
        cmbDestino.SetFocus;
        End
      else
        begin
        speedbar1.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
end;

procedure TFrmRelContrato.BtnimprimirClick(Sender: TObject);
begin
QRContrato:= TQRContrato.Create(application);
If cmbDestino.Text= 'V�deo' Then
	QRContrato.Preview
else
	QRContrato.Print;
QRContrato.Free;
end;

procedure TFrmRelContrato.BtnSairClick(Sender: TObject);
begin
  close;
  
end;

end.
