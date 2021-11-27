//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitRelSeg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, RXSplit, fcButton, fcImgBtn, RXCtrls,
  SpeedBar, jpeg, DBCtrls, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint, DCChoice;


type
  TFrmRelSeg = class(TForm)
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
    cmbClassif: TComboBox;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    Btnimprimir: TSpeedItem;
    BtnSair: TSpeedItem;
    cmbDestino: TDCComboBox;
    procedure BtnSairClick(Sender: TObject);
    procedure cmbDestinoExit(Sender: TObject);
    procedure cmbClassifChange(Sender: TObject);
    procedure BtnimprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbDestinoChange(Sender: TObject);
    procedure cmbDestinoCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelSeg: TFrmRelSeg;

implementation

uses UnitDMDados, UnitQRSeg, UnitPrincipal;

{$R *.dfm}

procedure TFrmRelSeg.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmRelSeg.cmbDestinoExit(Sender: TObject);
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

procedure TFrmRelSeg.cmbClassifChange(Sender: TObject);
begin
  If cmbClassif.Text= 'Nome' Then
	  dmdados.tbSeguradora.IndexFieldNames:= 'Nome'
  else
	  dmdados.tbSeguradora.IndexFieldNames:= '';
end;

procedure TFrmRelSeg.BtnimprimirClick(Sender: TObject);
begin
  Btnimprimir.Enabled:=False;
  QRSeguradora:= TQRSeguradora.Create(application);
  If cmbDestino.Text= 'V�deo' Then
	  QRSeguradora.RPSeg.Preview
  else
	  QRSeguradora.RPSeg.Print;
  QRSeguradora.Free;
  cmbClassif.SetFocus;
end;

procedure TFrmRelSeg.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[F2] Imprimir [Esc] Cancelar ou Sair');
end;

procedure TFrmRelSeg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.tbParametro.Close;
  dmdados.TbSeguradora.Close;
  Action:= Cafree;
end;

procedure TFrmRelSeg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmRelSeg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F2    :  if btnimprimir.Enabled then Btnimprimir.Click;
      VK_ESCAPE : BtnSair.Click;
    end;
end;

procedure TFrmRelSeg.cmbDestinoChange(Sender: TObject);
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

procedure TFrmRelSeg.cmbDestinoCloseUp(Sender: TObject);
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

procedure TFrmRelSeg.FormCreate(Sender: TObject);
begin
  dmdados.tbParametro.Open;
  dmdados.TbSeguradora.Open;
end;

end.
