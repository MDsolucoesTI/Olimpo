//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
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
  LMDCustomShapeHint, LMDShapeHint, DCChoice;

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
    Panel2: TPanel;
    RxLabel4: TRxLabel;
    cmbClassif: TComboBox;
    Image2: TImage;
    Label2: TLabel;
    cmbDestino: TDCComboBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnimprimirClick(Sender: TObject);
    procedure cmbClassifChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cmbDestinoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbDestinoCloseUp(Sender: TObject);
    procedure cmbDestinoChange(Sender: TObject);
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
  Btnimprimir.Enabled:=False;
  QRCliente:= TQRCliente.Create(application);
  If cmbDestino.Text= 'V�deo' Then
	  QRCliente.Preview
  else
	  QRCliente.Print;
  QRCliente.Free;
  cmbClassif.SetFocus;
end;

procedure TFrmRelCliente.cmbClassifChange(Sender: TObject);
begin
If cmbClassif.Text= 'Nome' Then
	dmdados.tbCliente.IndexFieldNames:= 'Nome'
  else
  dmdados.tbCliente.IndexFieldNames:='';
end;

procedure TFrmRelCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.tbCliente.Close;
  dmdados.tbParametro.Close;
  Action:= Cafree;
end;

procedure TFrmRelCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F2    :  if btnimprimir.Enabled then Btnimprimir.Click;
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
        cmbDestino.SetFocus;
        End
      else
        begin
        speedbar1.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
end;

procedure TFrmRelCliente.FormCreate(Sender: TObject);
begin
  dmdados.tbCliente.Open;
  dmdados.tbParametro.Open;
end;

procedure TFrmRelCliente.cmbDestinoCloseUp(Sender: TObject);
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
        speedbar1.SetFocus;
        btnImprimir.Enabled:=true;
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
        speedbar1.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
end;

end.
