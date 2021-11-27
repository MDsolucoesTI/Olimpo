//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Emiss�o Relat�rio Pedidos
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitRelPedidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, DBCtrls, fcButton, fcImgBtn, RXSplit, RXCtrls,
  SpeedBar, jpeg, ToolEdit, DCChoice, RxLookup, RxGrdCpt, fcImager, EMsgDlg,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TfrmRelPedidos = class(TForm)
    MsgDlg: TEvMsgDlg;
    RxLabel7: TRxLabel;
    Image1: TImage;
    RxLabel4: TRxLabel;
    cmbclassif: TDCComboBox;
    EdtInicial: TDateEdit;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    edcodcli: TEdit;
    EdtFinal: TDateEdit;
    RxLabel6: TRxLabel;
    edcliente: TRxLookupEdit;
    cmbdestino: TDCComboBox;
    RxLabel5: TRxLabel;
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
    procedure edclienteExit(Sender: TObject);
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
  frmRelPedidos: TfrmRelPedidos;

implementation

uses unitQrPedidos, unitQrComissao,
  unitQrPedidosFunc, unitQRVendas, unitQrVendasCli, unitQrCompra,
  UnitPrincipal, unitDmDados;

{$R *.DFM}

procedure TfrmRelPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmDados.tbCliente.Close;
  dmDados.tbVisDetVen.Close;
  dmDados.tbVendas.Close;
  FrmPrincipal.StatusTeclas(False,'');
end;

procedure TfrmRelPedidos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TfrmRelPedidos.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmRelPedidos.BtnimprimirClick(Sender: TObject);
begin
  Btnimprimir.Enabled:=false;
  //criar os qr(s)
  QrVenda  := TQRVenda.Create(application);
  QrVendaCli  := TQRVendaCli.Create(application);
  QrComissao := TQRComissao.Create(application);
  //QrEtiqueta:=TQrEtiqueta.Create(application);
  {Filtros diversos}
  If cmbClassif.Text= 'Vendas' Then
    Begin
    dmdados.tbVendas.Filtered:=false;
    dmdados.tbVendas.Filter:='(DataVen >= '''+edtInicial.text+''')and'+
                             '(DataVen <= '''+edtFinal.Text+''')';
    dmdados.tbVendas.Filtered:=true;
    End;
  If cmbClassif.Text= 'Vendas Por Cliente' Then
    Begin
    dmdados.tbvendas.Filtered:=false;
    dmdados.tbvendas.filter:='(CodCli='''+edcodcli.Text+''')';
    dmdados.tbvendas.Filtered:=true;
    End;
  If cmbClassif.Text= 'Comiss�o' Then
    Begin
    QrComissao.tbVendas.Filtered:=false;
    QrComissao.tbVendas.Filter:= '(DataVen >= '''+edtInicial.text+''')and'+
                                 '(DataVen <= '''+edtFinal.Text+''')';
    QrComissao.tbVendas.Filtered:= True;
    End;
  {Visualizar/imprimir}
  IF cmbDestino.Text= 'V�deo' Then
    BEGIN
    if cmbClassif.text= 'Vendas' then
       QrVenda.rpVenda.Preview;
    if cmbClassif.Text= 'Vendas Por Cliente' then
       QrVendaCli.rpVendaCli.preview;
    if cmbClassif.text= 'Comiss�o' then
       QrComissao.qrpComissao.Preview;
    {If cmbClassif.Text= 'Etiquetas' Then
       QrEtiqueta.QuickRep1.Preview;}
    END
  else
    begin
    if cmbClassif.text= 'Vendas' then
       QrVenda.rpVenda.Print;
    if cmbClassif.Text= 'Vendas Por Cliente' then
       QrVendaCli.rpVendaCli.print;
    if cmbClassif.text= 'Comiss�o' then
       QrComissao.qrpComissao.Print;
    {If cmbClassif.Text= 'Etiquetas' Then
       QrEtiqueta.QuickRep1.Print;}
    end;
  QRVenda.rpVenda.Free;
  QrVendaCli.rpVendaCli.free;
  QrComissao.qrpComissao.free;
  //QrEtiqueta.QuickRep1.Free;
  dmdados.tbCliente.Filtered:=false;
  //dmdados.tbRotaVendas.Filtered:=false;
  dmdados.tbVendas.Filtered:=false;
  qrcomissao.tbVendas.Filtered:=false;
end;

procedure TfrmRelPedidos.cmbClassifExit(Sender: TObject);
begin
  if cmbclassif.text='Vendas' then
    begin
    edcliente.Enabled:=false;
    edtinicial.Enabled:=true;
    edtfinal.Enabled:=true;
    cmbdestino.Enabled:=true;
    end;
  if cmbclassif.text='Comiss�o' then
    begin
    edcliente.Enabled:=false;
    edtinicial.Enabled:=true;
    edtfinal.Enabled:=true;
    cmbdestino.Enabled:=true;
    end;
{if cmbclassif.text='Vendas Por Cliente' then
   begin
    edcliente.Enabled:=true;
    edtinicial.Enabled:=false;
    edtfinal.Enabled:=false;
    cmbdestino.Enabled:=true;
   end;
if cmbclassif.text='Compras' then
 begin
     edcliente.Enabled:=false;
     edtinicial.Enabled:=true;
     edtfinal.Enabled:=true;
     cmbdestino.Enabled:=true;
 end;}
  if cmbclassif.Text='Vendas por Cliente'then
    edcodcli.Enabled:=true;
end;

procedure TfrmRelPedidos.FormShow(Sender: TObject);
begin
  dmDados.tbCliente.Open;
  dmDados.tbVendas.Open;
  dmDados.tbVisDetVen.Open;
  FrmPrincipal.StatusTeclas(True,'[F2] Imprimir [Esc] Cancelar ou Sair');
  cmbclassif.setfocus;
end;

procedure TfrmRelPedidos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F2    : Btnimprimir.Click;
      VK_ESCAPE : if dmDados.vTabStt then BtnSair.Click;
    end;
end;

procedure TfrmRelPedidos.cmbDestinoExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
 If cmbDestino.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio informar o destino do relat�rio');
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
        MsgDlg.MsgError('Valor inv�lido');
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

procedure TfrmRelPedidos.cmbDestinoCloseUp(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
 If cmbDestino.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio informar o destino do relat�rio');
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
        MsgDlg.MsgError('Valor inv�lido');
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

procedure TfrmRelPedidos.cmbdestinoChange(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
 If cmbDestino.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio informar o destino do relat�rio');
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
        MsgDlg.MsgError('Valor inv�lido');
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

procedure TfrmRelPedidos.edclienteExit(Sender: TObject);
begin
  if dmdados.tbCliente.Locate('Nome',edcliente.Text,[]) then
    edcodcli.Text:=dmdados.tbclientecodcli.AsString;
end;

procedure TfrmRelPedidos.cmbClassifChange(Sender: TObject);
begin
  if cmbclassif.text='Vendas' then
    begin
    edcliente.Enabled:=false;
    edtinicial.Enabled:=true;
    edtfinal.Enabled:=true;
    cmbdestino.Enabled:=true;
    end;
  if cmbclassif.text='Comiss�o' then
    begin
    edcliente.Enabled:=false;
    edtinicial.Enabled:=true;
    edtfinal.Enabled:=true;
    cmbdestino.Enabled:=true;
    end;
  if cmbclassif.text='Vendas Por Cliente' then
    begin
    edcliente.Enabled:=true;
    edtinicial.Enabled:=false;
    edtfinal.Enabled:=false;
    cmbdestino.Enabled:=true;
    end;
end;

procedure TfrmRelPedidos.cmbclassifCloseUp(Sender: TObject);
begin
  if cmbclassif.text='Vendas' then
    begin
    edcliente.Enabled:=false;
    edtinicial.Enabled:=true;
    edtfinal.Enabled:=true;
    cmbdestino.Enabled:=true;
    end;
  if cmbclassif.text='Comiss�o' then
    begin
    edcliente.Enabled:=false;
    edtinicial.Enabled:=true;
    edtfinal.Enabled:=true;
    cmbdestino.Enabled:=true;
    end;
  if cmbclassif.text='Vendas Por Cliente' then
    begin
    edcliente.Enabled:=true;
    edtinicial.Enabled:=false;
    edtfinal.Enabled:=false;
    cmbdestino.Enabled:=true;
    end;
 {if cmbclassif.text='Compras' then
   begin
     edcliente.Enabled:=false;
     edtinicial.Enabled:=true;
     edtfinal.Enabled:=true;
     cmbdestino.Enabled:=true;
   end;}
end;

procedure TfrmRelPedidos.EdtInicialExit(Sender: TObject);
begin
  If (EdtInicial.text = '  /  /    ') then
    begin
    MsgDlg.MsgWarning('DATA INICIAL n�o foi preenchida');
    EdtInicial.SetFocus;
    end
  else
    begin
    try StrToDate(EdtInicial.text)
    except on EConvertError do
      begin
      MsgDlg.MsgError('DATA INICIAL inv�lida');
      EdtInicial.SetFocus;
      end;
    end;
    end;
end;

procedure TfrmRelPedidos.EdtFinalExit(Sender: TObject);
begin
  If (EdtFinal.text = '  /  /    ') then
    begin
    MsgDlg.MsgWarning('DATA FINAL n�o foi preenchida');
    EdtFinal.SetFocus;
    end
  else
    begin
    try StrToDate(EdtFinal.text)
    except on EConvertError do
      begin
      MsgDlg.MsgError('DATA FINAL inv�lida');
      EdtFinal.SetFocus;
      end;
    end;
    end;
end;

end.
