//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 17-01-2001
// Ultima modifica��o: 04-07-2005
// M�dulo............: Relat�rio de Estoque - Tela
// Sistema...........: Pegasus - Controle de Estoque
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitRelEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, RXSplit, fcButton, fcImgBtn, RXCtrls,
  SpeedBar, jpeg, EFocCol, DCChoice, RxGrdCpt, fcImager, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmRelEstoque = class(TForm)
    RxLabel2: TRxLabel;
    Image2: TImage;
    RxLabel4: TRxLabel;
    cmbclassif: TDCComboBox;
    cmbdestino: TDCComboBox;
    RxLabel5: TRxLabel;
    btnImprimir: TfcImageBtn;
    btnSair: TfcImageBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure cmbClassifExit(Sender: TObject);
    procedure BtnimprimirClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure cmbDestinoExit(Sender: TObject);
    procedure cmbdestinoCloseUp(Sender: TObject);
    procedure cmbdestinoChange(Sender: TObject);
    procedure cmbclassifChange(Sender: TObject);
    procedure cmbclassifCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelEstoque: TFrmRelEstoque;

implementation

uses unitPrincipal, unitDmDados, UnitQREstoque;

{$R *.dfm}

procedure TFrmRelEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  Action:= Cafree;
end;

procedure TFrmRelEstoque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F2 : if Btnimprimir.Enabled then Btnimprimir.Click;
      VK_ESCAPE : BtnSair.Click;

    end;
end;

procedure TFrmRelEstoque.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmRelEstoque.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[F2] Imprimir [Esc] Cancelar e Sair');
  cmbclassif.setfocus;
end;

procedure TFrmRelEstoque.cmbClassifExit(Sender: TObject);
{Var
  x:integer;
  Flag:Boolean; }
begin
{ If cmbClassif.Text= '' then
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
        btnImprimir.Enabled:=true;
        End;
      end;}
      cmbdestino.Enabled:=true;
end;

procedure TFrmRelEstoque.BtnimprimirClick(Sender: TObject);
begin
  cmbdestino.Enabled:=false;
  btnimprimir.Enabled:=false;
  QREstoque:=tQREstoque.create(application);
  Dmdados.tbRelEsto.IndexName:= 'iDescricao';
  dmdados.tbRelEsto.Filtered:= False;
  if (cmbClassif.Text='Abaixo do M�nimo') Then
    dmdados.tbRelEsto.Filtered:= true;
  if (cmbClassif.Text='Acima do M�ximo') then
    dmdados.tbRelEsto.Filtered:= true;

  If cmbDestino.Text= 'V�deo' Then
	  QREstoque.Preview
  else
	  QREstoque.Print;
  QREstoque.Free;
  dmdados.tbRelEsto.IndexName:= '';
  dmdados.tbRelEsto.Filtered:= False;
end;

procedure TFrmRelEstoque.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelEstoque.cmbDestinoExit(Sender: TObject);
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
        Panel3.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
end;

procedure TFrmRelEstoque.cmbdestinoCloseUp(Sender: TObject);
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
        Panel3.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
end;

procedure TFrmRelEstoque.cmbdestinoChange(Sender: TObject);
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
        Panel3.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;

end;

procedure TFrmRelEstoque.cmbclassifChange(Sender: TObject);
begin
cmbdestino.Enabled:=true
end;

procedure TFrmRelEstoque.cmbclassifCloseUp(Sender: TObject);
begin
cmbdestino.Enabled:=true;
end;

end.
