//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitRelEmprestimo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, RXSplit, fcButton, fcImgBtn, RXCtrls,
  SpeedBar, jpeg, DBCtrls, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint, DCChoice;


type
  TFrmRelEmprestimo = class(TForm)
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
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
  FrmRelEmprestimo: TFrmRelEmprestimo;

implementation

uses UnitDMDados, UnitQREmprestimo, UnitPrincipal;

{$R *.dfm}

procedure TFrmRelEmprestimo.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmRelEmprestimo.cmbDestinoExit(Sender: TObject);
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

procedure TFrmRelEmprestimo.cmbClassifChange(Sender: TObject);
begin
If cmbClassif.Text= 'N�mero' Then
	dmdados.tbemprestimo.IndexFieldNames:= 'NumPatri'
  Else
	dmdados.tbemprestimo.IndexFieldNames:= 'CodCli';
end;

procedure TFrmRelEmprestimo.BtnimprimirClick(Sender: TObject);
begin
  Btnimprimir.Enabled:=False;
  QREmprestimo:= TQREmprestimo.Create(application);
  Begin
   dmdados.TbEmprestimo.Filtered:=false;
   dmdados.TbEmprestimo.Filter:='(Fechado <> '+'''S'''+')';
   dmdados.TbEmprestimo.Filtered:=true;
  End;
  If cmbDestino.Text= 'V�deo' Then
  	QREmprestimo.RPEmprestimo.Preview
  else
	  QREmprestimo.RPEmprestimo.Print;
  QREmprestimo.Free;
  dmdados.TbEmprestimo.Filtered:=false;
  cmbClassif.SetFocus;
end;

procedure TFrmRelEmprestimo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.TbEmprestimo.Close;
  dmdados.tbParametro.Close;
  Action:= Cafree;
end;

procedure TFrmRelEmprestimo.FormShow(Sender: TObject);
begin
     FrmPrincipal.StatusTeclas(True,'[F2] Imprimir [Esc] Cancelar ou Sair');
end;

procedure TFrmRelEmprestimo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmRelEmprestimo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F2    :  if btnimprimir.Enabled then Btnimprimir.Click;
      VK_ESCAPE : BtnSair.Click;
    end;
end;

procedure TFrmRelEmprestimo.cmbDestinoChange(Sender: TObject);
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

procedure TFrmRelEmprestimo.cmbDestinoCloseUp(Sender: TObject);
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

procedure TFrmRelEmprestimo.FormCreate(Sender: TObject);
begin
  dmdados.TbEmprestimo.Open;
  dmdados.tbParametro.Open;
end;

end.
