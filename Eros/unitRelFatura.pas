//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Emiss�o Relat�rio Faturamento
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitRelFatura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, DBCtrls, fcButton, fcImgBtn, RXSplit, RXCtrls,
  SpeedBar, jpeg, ToolEdit, DCChoice, RxLookup, RxGrdCpt, fcImager,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TfrmRelFatura = class(TForm)
    RxLabel3: TRxLabel;
    Image2: TImage;
    RxLabel4: TRxLabel;
    cmbclassif: TDCComboBox;
    RxLabel2: TRxLabel;
    EdtInicial: TDateEdit;
    EdtFinal: TDateEdit;
    RxLabel1: TRxLabel;
    RxLabel5: TRxLabel;
    cmbdestino: TDCComboBox;
    btnImprimir: TfcImageBtn;
    btnSair: TfcImageBtn;
    LMDBackPanel2: TPanel;
    Panel3: TPanel;
    LMDBackPanel1: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnimprimirClick(Sender: TObject);
    procedure cmbClassifExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbDestinoExit(Sender: TObject);
    procedure cmbDestinoCloseUp(Sender: TObject);
    procedure cmbdestinoChange(Sender: TObject);
    procedure cmbClassifChange(Sender: TObject);
    procedure cmbclassifCloseUp(Sender: TObject);
    procedure EdtInicialExit(Sender: TObject);
    procedure EdtFinalExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFatura: TfrmRelFatura;

implementation

uses UnitPrincipal, unitDmDados, unitQrFatura;

{$R *.DFM}

procedure TfrmRelFatura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmDados.tbFaturamento.Close;
  FrmPrincipal.StatusTeclas(False,'');
end;

procedure TfrmRelFatura.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TfrmRelFatura.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmRelFatura.BtnimprimirClick(Sender: TObject);
begin
  Btnimprimir.Enabled:=false;
  //criar os qr(s)
  QrFatura:=TQrFatura.Create(application);
  {Filtros diversos}
  if cmbClassif.Text= 'Do Dia' then
    begin
    dmdados.tbFaturamento.Filtered:=false;
    dmdados.tbFaturamento.Filter:='(DataVen >= '''+DateToStr(Date)+''')and'+
                                  '(DataVen <= '''+DateToStr(Date)+''')';
    dmdados.tbFaturamento.Filtered:=true;
    end;
  if cmbClassif.Text= 'Per�odo' then
    begin
    dmdados.tbFaturamento.Filtered:=false;
    dmdados.tbFaturamento.Filter:='(DataVen >= '''+edtInicial.text+''')and'+
                                  '(DataVen <= '''+edtFinal.Text+''')';
    dmdados.tbFaturamento.Filtered:=true;
    end;
  if cmbDestino.Text= 'V�deo' then
    QrFatura.rpFatura.Preview
  else
    QrFatura.rpFatura.Print;
  QRFatura.rpFatura.Free;
  dmdados.tbFaturamento.Filtered:=false;
end;

procedure TfrmRelFatura.cmbClassifExit(Sender: TObject);
begin
 if cmbclassif.text='Do Dia' then
  begin
    edtinicial.Enabled:=False;
    edtfinal.Enabled:=False;
    cmbdestino.Enabled:=true;
  end;
 if cmbclassif.text='Per�odo' then
  begin
    edtinicial.Enabled:=true;
    edtfinal.Enabled:=true;
    cmbdestino.Enabled:=true;
  end;
end;

procedure TfrmRelFatura.FormShow(Sender: TObject);
begin
  dmDados.tbFaturamento.Open;
  FrmPrincipal.StatusTeclas(True,'[F2] Imprimir [Esc] Cancelar ou Sair');
  cmbclassif.setfocus;
end;

procedure TfrmRelFatura.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F2    : Btnimprimir.Click;
      VK_ESCAPE : if dmDados.vTabStt then BtnSair.Click;
    end;
end;

procedure TfrmRelFatura.cmbDestinoExit(Sender: TObject);
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
        cmbdestino.Enabled:=false;
        end;
      end;
end;

procedure TfrmRelFatura.cmbDestinoCloseUp(Sender: TObject);
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

procedure TfrmRelFatura.cmbdestinoChange(Sender: TObject);
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
        cmbdestino.Enabled:=false
        end;
      end;
end;

procedure TfrmRelFatura.cmbClassifChange(Sender: TObject);
begin
 if cmbclassif.text='Do Dia' then
  begin
    edtinicial.Enabled:=False;
    edtfinal.Enabled:=False;
    cmbdestino.Enabled:=true;
  end;
 if cmbclassif.text='Per�odo' then
  begin
    edtinicial.Enabled:=true;
    edtfinal.Enabled:=true;
    cmbdestino.Enabled:=true;
  end;
end;

procedure TfrmRelFatura.cmbclassifCloseUp(Sender: TObject);
begin
 if cmbclassif.text='Do Dia' then
  begin
    edtinicial.Enabled:=False;
    edtfinal.Enabled:=False;
    cmbdestino.Enabled:=true;
  end;
 if cmbclassif.text='Per�odo' then
  begin
    edtinicial.Enabled:=true;
    edtfinal.Enabled:=true;
    cmbdestino.Enabled:=true;
  end;
end;

procedure TfrmRelFatura.EdtInicialExit(Sender: TObject);
begin
  If (EdtInicial.text = '  /  /    ') then
    begin
    ShowMessage('DATA INICIAL n�o foi preenchida');
    EdtInicial.SetFocus;
    end
  else
    begin
    try StrToDate(EdtInicial.text)
    except on EConvertError do
      begin
      ShowMessage('DATA INICIAL inv�lida');
      EdtInicial.SetFocus;
      end;
    end;
    end;
end;

procedure TfrmRelFatura.EdtFinalExit(Sender: TObject);
begin
  If (EdtFinal.text = '  /  /    ') then
    begin
    ShowMessage('DATA FINAL n�o foi preenchida');
    EdtFinal.SetFocus;
    end
  else
    begin
    try StrToDate(EdtFinal.text)
    except on EConvertError do
      begin
      ShowMessage('DATA FINAL inv�lida');
      EdtFinal.SetFocus;
      end;
    end;
    end;
end;

end.
