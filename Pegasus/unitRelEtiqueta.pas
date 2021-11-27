///////////////////////////////////////////////////////////////////////////////
// Cria��o...........: 18-01-2001
// Ultima modifica��o: 04-07-2005
// M�dulo............: Relat�rio de Etiquetas das Mercadorias/Produtos - Tela
// Sistema...........: Pegasus - Controle de Estoque
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
///////////////////////////////////////////////////////////////////////////////

unit unitRelEtiqueta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RXSplit, RXCtrls, StdCtrls, jpeg, SpeedBar, Mask,
  ToolEdit, EFocCol, DCChoice, fcButton, fcImgBtn, RxGrdCpt, fcImager,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TfrmRelEtiqueta = class(TForm)
    RxLabel3: TRxLabel;
    Image2: TImage;
    RxLabel2: TRxLabel;
    EdtInicial: TDateEdit;
    EdtFinal: TDateEdit;
    RxLabel1: TRxLabel;
    cmbdestino: TDCComboBox;
    btnImprimir: TfcImageBtn;
    btnSair: TfcImageBtn;
    RxLabel5: TRxLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure BtnimprimirClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtInicialExit(Sender: TObject);
    procedure EdtFinalExit(Sender: TObject);
    procedure cmbDestinoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cmbDestinoCloseUp(Sender: TObject);
    procedure cmbDestinoChange(Sender: TObject);
    procedure EdtInicialChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelEtiqueta: TfrmRelEtiqueta;

implementation

uses unitQrEtiqueta, unitDmDados, UnitPrincipal;

{$R *.dfm}

procedure TfrmRelEtiqueta.BtnimprimirClick(Sender: TObject);
var
codCli : integer;
begin
  cmbdestino.Enabled:=false;
  btnImprimir.Enabled:=false;
  dmdados.tbEtiqueta.Filtered:=false;
  QrEtiqueta:=tQrEtiqueta.create(application);
  dmdados.tbEtiqueta.Filter:='(DataVen >= '''+edtInicial.text+''')and'+
                             '(DataVen <= '''+edtFinal.Text+''')';
  dmdados.tbEtiqueta.Filtered:=true;
  dmdados.tbEtiqueta.first;
  if cmbDestino.Text='V�deo' then
    begin
    QrEtiqueta.QuickRep1.Preview;
    end
  else
    begin
    QrEtiqueta.QuickRep1.Print;
    end;
  dmdados.tbDetVendas.Filtered:=false;
end;

procedure TfrmRelEtiqueta.BtnSairClick(Sender: TObject);
begin
{dmdados.tbDetVendas.Filtered:=false;  }
  close;
end;

procedure TfrmRelEtiqueta.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TfrmRelEtiqueta.EdtInicialExit(Sender: TObject);
begin
try
  StrToDate(edTInicial.Text);
  except
    on EConvertError do
    begin
    ShowMessage ('Data Inv�lida');
    edtInicial.SetFocus;
    end;
end;
end;

procedure TfrmRelEtiqueta.EdtFinalExit(Sender: TObject);
begin
try
  StrToDate(edtFinal.Text);
  except
    on EConvertError do
    begin
    ShowMessage ('Data Inv�lida');
    end;
end;
end;

procedure TfrmRelEtiqueta.cmbDestinoExit(Sender: TObject);
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
        Panel3.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
end;

procedure TfrmRelEtiqueta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FrmPrincipal.StatusTeclas(False,'');
action:=caFree;
end;

procedure TfrmRelEtiqueta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F2    : if Btnimprimir.Enabled then Btnimprimir.Click;
      VK_ESCAPE : if dmDados.vTabStt then BtnSair.Click;
    end;
end;

procedure TfrmRelEtiqueta.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[F2] Imprimir [Esc] Cancelar ou Sair');
end;

procedure TfrmRelEtiqueta.cmbDestinoCloseUp(Sender: TObject);
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
        Panel3.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
       btnImprimir.Enabled:=true;
end;

procedure TfrmRelEtiqueta.cmbDestinoChange(Sender: TObject);
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
        Panel3.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
end;

procedure TfrmRelEtiqueta.EdtInicialChange(Sender: TObject);
begin
 cmbdestino.Enabled:=true;
end;

end.
