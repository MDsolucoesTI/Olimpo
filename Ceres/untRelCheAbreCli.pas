//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2002
// Sistema...........: Ceres - Controle de Cheques
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRelCheAbreCli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, RXSplit, fcButton, fcImgBtn, RXCtrls,
  SpeedBar, jpeg, DBCtrls, LMDCustomComponent, LMDCustomHint,qrexport,
  LMDCustomShapeHint, LMDShapeHint, RxLookup, RXDBCtrl, DCChoice, RxGrdCpt,
  TFlatSplitterUnit, fcImager, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TfrmRelCheAbreCli = class(TForm)
    RxGradientCaption1: TRxGradientCaption;
    LMDBackPanel2: TLMDBackPanel;
    fcImager4: TfcImager;
    RxLabel3: TRxLabel;
    Image1: TImage;
    Panel3: TLMDBackPanel;
    fcImager2: TfcImager;
    btnImprimir: TfcImageBtn;
    btnSair: TfcImageBtn;
    LMDBackPanel1: TLMDBackPanel;
    fcImager1: TfcImager;
    edCliente: TRxLookupEdit;
    RxLabel2: TRxLabel;
    dataInicial: TDateEdit;
    RxLabel1: TRxLabel;
    cmbClassif: TComboBox;
    RxLabel4: TRxLabel;
    Bevel1: TBevel;
    RxLabel7: TRxLabel;
    btLocCli: TfcImageBtn;
    dataFinal: TDateEdit;
    RxLabel6: TRxLabel;
    cmbDestino: TDCComboBox;
    RxLabel5: TRxLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnimprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cmbDestinoExit(Sender: TObject);
    procedure cmbDestinoCloseUp(Sender: TObject);
    procedure cmbClassifChange(Sender: TObject);
    procedure dataInicialExit(Sender: TObject);
    procedure dataFinalExit(Sender: TObject);
    procedure cmbDestinoChange(Sender: TObject);
    procedure btLocCliClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCheAbreCli: TfrmRelCheAbreCli;

implementation

uses unitDmDados, UnitPrincipal, untQRelCheAberto, unitLocCliente;


{$R *.DFM}

procedure TfrmRelCheAbreCli.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 Then
    begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    end;
end;

procedure TfrmRelCheAbreCli.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmRelCheAbreCli.BtnimprimirClick(Sender: TObject);
begin
  if (dataInicial.Text='  /  /    ') or (dataFinal.Text='  /  /    ') then
    ShowMessage('� necess�rio informar as'+#13+' datas INICIAL e FINAL do periodo')
  else
    begin
    Btnimprimir.Enabled:=False;
    qrRelCheAberto.tbCheque.filtered:=false;
    qrRelCheAberto.tbCheque.Filter:='(CodCli = '''+edCliente.Text+''') and '+
                                    '((Vencimento >='''+dataInicial.Text+''') and '+
                                    '(Vencimento <='''+dataFinal.Text+''')) and '+
                                    '((Status = '''+'ABERTO'+''') or'+
                                    '(Status = '''+'RENEGOCIADO'+'''))';
    qrRelCheAberto.tbCheque.Filtered:=true;
    qrRelCheAberto.qrlTitulo.Caption:='Relat�rio de Cheques Abertos por Cliente';
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

procedure TfrmRelCheAbreCli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.tbCliente.Close;
  qrRelCheAberto.Free;
  action:=cafree;
end;

procedure TfrmRelCheAbreCli.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F7     : if Btnimprimir.Enabled then Btnimprimir.Click;
      Vk_F10    : btLocCli.Click;
      VK_ESCAPE : BtnSair.Click;
    end;
end;

procedure TfrmRelCheAbreCli.FormShow(Sender: TObject);
begin
  dmDados.tbCliente.Open;
  FrmPrincipal.StatusTeclas(True,'[F7] Imprimir [F10] Localizar Cliente [Esc] Cancelar ou Sair');
  qrRelCheAberto:= TqrRelCheAberto.Create(application);
end;

procedure TfrmRelCheAbreCli.cmbDestinoExit(Sender: TObject);
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

procedure TfrmRelCheAbreCli.cmbDestinoCloseUp(Sender: TObject);
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

procedure TfrmRelCheAbreCli.cmbClassifChange(Sender: TObject);
begin
  if (cmbClassif.Text='Banco') then
    qrRelCheAberto.tbCheque.IndexName:='iNomeBanco';
  if (cmbClassif.Text='Emiss�o') then
    qrRelCheAberto.tbCheque.IndexName:='iDataVen';
  if (cmbClassif.Text='Vencimento') then
    qrRelCheAberto.tbCheque.IndexName:='iVencimento';
end;

procedure TfrmRelCheAbreCli.dataInicialExit(Sender: TObject);
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

procedure TfrmRelCheAbreCli.dataFinalExit(Sender: TObject);
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

procedure TfrmRelCheAbreCli.cmbDestinoChange(Sender: TObject);
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

procedure TfrmRelCheAbreCli.btLocCliClick(Sender: TObject);
begin
  frmLocCliente:=tfrmLocCliente.create(application);
  frmLocCliente.showmodal;
  edCliente.Text:=IntToStr(frmLocCliente.Resultado);
  frmloccliente.Free;
end;

end.
