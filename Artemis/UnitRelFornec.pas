//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitRelFornec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, RXSplit, fcButton, fcImgBtn, RXCtrls,
  SpeedBar, jpeg, DBCtrls, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint, EFocCol, DCChoice, RxGrdCpt, fcImager,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmRelFornec = class(TForm)
    RxGradientCaption1: TRxGradientCaption;
    LMDBackPanel2: TLMDBackPanel;
    RxLabel2: TRxLabel;
    Image2: TImage;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel4: TRxLabel;
    cmbclassif: TDCComboBox;
    cmbDestino: TDCComboBox;
    RxLabel5: TRxLabel;
    Panel3: TLMDBackPanel;
    btnImprimir: TfcImageBtn;
    btnSair: TfcImageBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnimprimirClick(Sender: TObject);
    procedure cmbClassifChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cmbClassifExit(Sender: TObject);
    procedure cmbDestinoChange(Sender: TObject);
    procedure cmbDestinoCloseUp(Sender: TObject);
    procedure cmbDestinoExit(Sender: TObject);
    procedure cmbclassifCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelFornec: TFrmRelFornec;

implementation

uses UnitQRFornec, unitDmDados, UnitPrincipal;

{$R *.DFM}

procedure TFrmRelFornec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  action:=cafree;
end;

procedure TFrmRelFornec.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmRelFornec.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TFrmRelFornec.BtnimprimirClick(Sender: TObject);
begin
 cmbdestino.Enabled:=false;
 btnimprimir.Enabled:=false;
QRFornec:= TQRFornec.Create(application);
If cmbDestino.Text= 'V�deo' Then
   QRFornec.Preview
else
	 QRFornec.Print;
QRFornec.Free;
end;

procedure TFrmRelFornec.cmbClassifChange(Sender: TObject);
begin
If cmbClassif.Text= 'C�digo' Then
  begin
	  dmdados.tbFornecedor.IndexFieldNames:= 'CodFor';
    cmbdestino.Enabled:=true;
  end
Else
	dmdados.tbFornecedor.IndexFieldNames:= 'Nome';
  cmbdestino.Enabled:=true;
end;

procedure TFrmRelFornec.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F2    : if Btnimprimir.Enabled then Btnimprimir.Click;
      VK_ESCAPE : if dmDados.vTabStt then BtnSair.Click;
    end;
end;

procedure TFrmRelFornec.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[F2] Imprimir [Esc] Cancelar e Sair');
end;

procedure TFrmRelFornec.cmbClassifExit(Sender: TObject);
begin
 If cmbClassif.Text= 'C�digo' Then
  begin
	  dmdados.tbFornecedor.IndexFieldNames:= 'CodFor';
    cmbdestino.Enabled:=true;
  end
Else
	dmdados.tbFornecedor.IndexFieldNames:= 'Nome';
  cmbdestino.Enabled:=true;
end;

procedure TFrmRelFornec.cmbDestinoChange(Sender: TObject);
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
        {btnimprimir.Enabled:=false  }
      end;


end;

procedure TFrmRelFornec.cmbDestinoCloseUp(Sender: TObject);
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
        {btnImprimir.Enabled:=false;  }
      end;
end;


procedure TFrmRelFornec.cmbDestinoExit(Sender: TObject);
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
        {btnImprimir.Enabled:=false;}
      end;

end;

procedure TFrmRelFornec.cmbclassifCloseUp(Sender: TObject);
begin
If cmbClassif.Text= 'C�digo' Then
 begin
	dmdados.tbFornecedor.IndexFieldNames:= 'CodFor';
  cmbdestino.Enabled:=true;
end
  Else
	dmdados.tbFornecedor.IndexFieldNames:= 'Nome';
  cmbdestino.Enabled:=true;
end;


end.
