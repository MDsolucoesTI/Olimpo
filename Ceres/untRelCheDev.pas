//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2002
// Sistema...........: Ceres - Controle de Cheques
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRelCheDev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, RXSplit, fcButton, fcImgBtn, RXCtrls,
  SpeedBar, jpeg, DBCtrls, LMDCustomComponent, LMDCustomHint,qrexport,
  LMDCustomShapeHint, LMDShapeHint, RxLookup, RXDBCtrl, DCChoice, RxGrdCpt,
  fcImager, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TfrmRelCheDev = class(TForm)
    RxGradientCaption1: TRxGradientCaption;
    LMDBackPanel2: TLMDBackPanel;
    fcImager3: TfcImager;
    RxLabel3: TRxLabel;
    Image1: TImage;
    LMDBackPanel1: TLMDBackPanel;
    fcImager4: TfcImager;
    RxLabel4: TRxLabel;
    cmbClassif: TComboBox;
    RxLabel2: TRxLabel;
    dataInicial: TDateEdit;
    RxLabel6: TRxLabel;
    dataFinal: TDateEdit;
    cmbDestino: TDCComboBox;
    RxLabel5: TRxLabel;
    Panel3: TLMDBackPanel;
    fcImager1: TfcImager;
    btnImprimir: TfcImageBtn;
    btnSair: TfcImageBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnimprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cmbDestinoExit(Sender: TObject);
    procedure cmbDestinoCloseUp(Sender: TObject);
    procedure dataInicialExit(Sender: TObject);
    procedure dataFinalExit(Sender: TObject);
    procedure cmbDestinoChange(Sender: TObject);
    procedure cmbClassifChange(Sender: TObject);
    procedure fcImageBtn1Click(Sender: TObject);
    procedure fcImageBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCheDev: TfrmRelCheDev;

implementation

uses unitDmDados,UnitPrincipal, untQRelCheAberto;


{$R *.DFM}

procedure TfrmRelCheDev.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TfrmRelCheDev.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmRelCheDev.BtnimprimirClick(Sender: TObject);
begin
  if (dataInicial.Text='  /  /    ') or (dataFinal.Text='  /  /    ') then
    ShowMessage('� necess�rio informar as'+#13+' datas INICIAL e FINAL do periodo')
  else
    begin
    Btnimprimir.Enabled:=False;
    qrRelCheAberto.tbCheque.filtered:=false;
    qrRelCheAberto.tbCheque.Filter:='(Vencimento >='''+dataInicial.Text+''') and '+
                                    '(Vencimento <='''+dataFinal.Text+''') and '+
                                    '(Status = '''+'DEVOLVIDO'+''')';
    qrRelCheAberto.tbCheque.Filtered:=true;
    qrRelCheAberto.qrlTitulo.Caption:='Relat�rio de Cheques Devolvidos';
    qrRelCheAberto.qrDataInicial.Caption:=dataInicial.Text;
    qrRelCheAberto.qrDataFinal.Caption:=dataFinal.Text;
    if cmbDestino.Text= 'V�deo' Then
      qrRelCheAberto.Preview
    else
      qrRelCheAberto.Print;
    qrRelCheAberto.tbCheque.Filtered:=false;
    cmbClassif.SetFocus;
    end;
end;

procedure TfrmRelCheDev.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  qrRelCheAberto.Free;
  action:=cafree;
end;

procedure TfrmRelCheDev.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F7     : if Btnimprimir.Enabled then Btnimprimir.Click;
      VK_ESCAPE : BtnSair.Click;
    end;
end;

procedure TfrmRelCheDev.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[F7] Imprimir [Esc] Cancelar ou Sair');
  qrRelCheAberto:= TqrRelCheAberto.Create(application);
end;

procedure TfrmRelCheDev.cmbDestinoExit(Sender: TObject);
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

procedure TfrmRelCheDev.cmbDestinoCloseUp(Sender: TObject);
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

procedure TfrmRelCheDev.dataInicialExit(Sender: TObject);
begin
If dataInicial.Text= '  /  /    ' then
   Begin
   ShowMessage('� obrigat�rio a DATA INICIAL');
   dataInicial.SetFocus;
   End
else
   begin
   try
     StrToDate(dataInicial.Text);
     except
     on EConvertError do
     begin
     ShowMessage ('Data Inv�lida');
     dataInicial.SetFocus;
     end;
   end;
   end;
end;

procedure TfrmRelCheDev.dataFinalExit(Sender: TObject);
begin
  If dataFinal.Text= '  /  /    ' then
    Begin
    ShowMessage('� obrigat�rio a DATA FINAL');
    dataFinal.SetFocus;
    End
  else
    begin
    try
      StrToDate(dataFinal.Text);
    except
      on EConvertError do
        begin
        ShowMessage ('Data Inv�lida');
        dataFinal.SetFocus;
        end;
    end;
    end;
end;

procedure TfrmRelCheDev.cmbDestinoChange(Sender: TObject);
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

procedure TfrmRelCheDev.cmbClassifChange(Sender: TObject);
begin
  if (cmbClassif.Text='Banco') then
    qrRelCheAberto.tbCheque.IndexName:='iNomeBanco';
  if (cmbClassif.Text='Cliente') then
    qrRelCheAberto.tbCheque.IndexName:='iCodCli';
  if (cmbClassif.Text='Data de Emiss�o') then
    qrRelCheAberto.tbCheque.IndexName:='iDataVen';
  if (cmbClassif.Text='Data de Vencimento') then
    qrRelCheAberto.tbCheque.IndexName:='iVencimento';
end;

procedure TfrmRelCheDev.fcImageBtn1Click(Sender: TObject);
begin
  if (dataInicial.Text='  /  /    ') or (dataFinal.Text='  /  /    ') then
    ShowMessage('� necess�rio informar as'+#13+' datas INICIAL e FINAL do periodo')
  else
    begin
    Btnimprimir.Enabled:=False;
    qrRelCheAberto.tbCheque.filtered:=false;
    qrRelCheAberto.tbCheque.Filter:='(Vencimento >='''+dataInicial.Text+''') and '+
                                    '(Vencimento <='''+dataFinal.Text+''') and '+
                                    '(Status = '''+'DEVOLVIDO'+''')';
    qrRelCheAberto.tbCheque.Filtered:=true;
    qrRelCheAberto.qrlTitulo.Caption:='Relat�rio de Cheques Devolvidos';
    qrRelCheAberto.qrDataInicial.Caption:=dataInicial.Text;
    qrRelCheAberto.qrDataFinal.Caption:=dataFinal.Text;
    if cmbDestino.Text= 'V�deo' Then
      qrRelCheAberto.Preview
    else
      qrRelCheAberto.Print;
    qrRelCheAberto.tbCheque.Filtered:=false;
    cmbClassif.SetFocus;
    end;
end;

procedure TfrmRelCheDev.fcImageBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
