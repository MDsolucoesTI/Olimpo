//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2002
// Sistema...........: Ceres - Controle de Cheques
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRelCheDevCli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, RXSplit, fcButton, fcImgBtn, RXCtrls,
  SpeedBar, jpeg, DBCtrls, LMDCustomComponent, LMDCustomHint,qrexport,
  LMDCustomShapeHint, LMDShapeHint, RxLookup, RXDBCtrl, DCChoice, RxGrdCpt,
  TFlatSplitterUnit, fcImager, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TfrmRelCheDevCli = class(TForm)
    RxGradientCaption1: TRxGradientCaption;
    LMDBackPanel2: TLMDBackPanel;
    fcImager4: TfcImager;
    RxLabel8: TRxLabel;
    Image2: TImage;
    LMDBackPanel1: TLMDBackPanel;
    fcImager3: TfcImager;
    RxLabel3: TRxLabel;
    Bevel1: TBevel;
    RxLabel4: TRxLabel;
    cmbClassif: TComboBox;
    RxLabel1: TRxLabel;
    edCliente: TRxLookupEdit;
    RxLabel2: TRxLabel;
    dataInicial: TDateEdit;
    RxLabel5: TRxLabel;
    cmbDestino: TDCComboBox;
    dataFinal: TDateEdit;
    RxLabel6: TRxLabel;
    btLocCli: TfcImageBtn;
    Panel3: TLMDBackPanel;
    fcImager2: TfcImager;
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
  frmRelCheDevCli: TfrmRelCheDevCli;

implementation

uses unitDmDados, UnitPrincipal, untQRelCheAberto, unitLocCliente;


{$R *.DFM}

procedure TfrmRelCheDevCli.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 Then
    begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    end;
end;

procedure TfrmRelCheDevCli.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmRelCheDevCli.BtnimprimirClick(Sender: TObject);
begin
  if (dataInicial.Text='  /  /    ') or (dataFinal.Text='  /  /    ') then
    ShowMessage('� necess�rio informar as'+#13+' datas INICIAL e FINAL do periodo')
  else
    begin
    Btnimprimir.Enabled:=False;
    qrRelCheAberto.tbCheque.filtered:=false;
    qrRelCheAberto.tbCheque.Filter:='(CodCli = '''+edCliente.Text+''') and '+
                                    '(Vencimento >='''+dataInicial.Text+''') and '+
                                    '(Vencimento <='''+dataFinal.Text+''') and '+
                                    '(Status = '''+'DEVOLVIDO'+''')';
    qrRelCheAberto.tbCheque.Filtered:=true;
    qrRelCheAberto.qrlTitulo.Caption:='Relat�rio de Cheques Devolvidos por Cliente';
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

procedure TfrmRelCheDevCli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  qrRelCheAberto.Free;
  dmDados.tbCliente.Close;
  action:=cafree;
end;

procedure TfrmRelCheDevCli.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F7     : if Btnimprimir.Enabled then Btnimprimir.Click;
      VK_F10    : btLocCli.Click;
      VK_ESCAPE : BtnSair.Click;
    end;
end;

procedure TfrmRelCheDevCli.FormShow(Sender: TObject);
begin
  dmDados.tbCliente.Open;
  FrmPrincipal.StatusTeclas(True,'[F7] Imprimir [F10] Localizar Cliente [Esc] Cancelar ou Sair');
  qrRelCheAberto:= TqrRelCheAberto.Create(application);
end;

procedure TfrmRelCheDevCli.cmbDestinoExit(Sender: TObject);
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

procedure TfrmRelCheDevCli.cmbDestinoCloseUp(Sender: TObject);
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

procedure TfrmRelCheDevCli.cmbClassifChange(Sender: TObject);
begin
  if (cmbClassif.Text='Banco') then
    qrRelCheAberto.tbCheque.IndexName:='iNomeBanco';
  if (cmbClassif.Text='Data de Emiss�o') then
    qrRelCheAberto.tbCheque.IndexName:='iDataVen';
  if (cmbClassif.Text='Data de Vencimento') then
    qrRelCheAberto.tbCheque.IndexName:='iVencimento';
end;

procedure TfrmRelCheDevCli.dataInicialExit(Sender: TObject);
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

procedure TfrmRelCheDevCli.dataFinalExit(Sender: TObject);
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

procedure TfrmRelCheDevCli.cmbDestinoChange(Sender: TObject);
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

procedure TfrmRelCheDevCli.btLocCliClick(Sender: TObject);
begin
  frmLocCliente:=tfrmLocCliente.create(application);
  frmLocCliente.showmodal;
  edCliente.Text:=IntToStr(frmLocCliente.Resultado);
  frmloccliente.Free;
end;

end.
