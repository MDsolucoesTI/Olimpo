//////////////////////////////////////////////////////////////////////////
// Criacao...........: 05/2002
// Sistema...........: Ciclope - Controle de Funcionarios
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
  LMDCustomShapeHint, LMDShapeHint;

type
  TFrmRelCliente = class(TForm)
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    Btnimprimir: TSpeedItem;
    BtnSair: TSpeedItem;
    Panel1: TPanel;
    RxLabel3: TRxLabel;
    Label1: TLabel;
    RxLabel5: TRxLabel;
    fclGravar: TfcImageBtn;
    RxSplitter1: TRxSplitter;
    RxSplitter2: TRxSplitter;
    cmbDestino: TComboBox;
    Panel2: TPanel;
    RxLabel4: TRxLabel;
    cmbClassif: TComboBox;
    Image2: TImage;
    Label2: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure dbInicioEnter(Sender: TObject);
    procedure dbInicioExit(Sender: TObject);
    procedure dbFinalEnter(Sender: TObject);
    procedure dbFinalExit(Sender: TObject);
    procedure BtnimprimirClick(Sender: TObject);
    procedure cmbClassifChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cmbDestinoExit(Sender: TObject);
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

procedure TFrmRelCliente.dbInicioEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmRelCliente.dbInicioExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmRelCliente.dbFinalEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmRelCliente.dbFinalExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmRelCliente.BtnimprimirClick(Sender: TObject);
begin
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
	dmdados.tbCliente.IndexFieldNames:= 'CodCli'
Else
	dmdados.tbCliente.IndexFieldNames:= 'Nome';
end;

procedure TFrmRelCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
end;

procedure TFrmRelCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F2    : if btnimprimir.enabled then Btnimprimir.Click;
      VK_ESCAPE : BtnSair.Click;
    end;
end;

procedure TFrmRelCliente.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[F2] Imprimir [Esc] Cancelar ou Sair');
end;

procedure TFrmRelCliente.cmbDestinoExit(Sender: TObject);
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

end.
