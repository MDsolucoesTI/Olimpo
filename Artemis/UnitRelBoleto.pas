//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitRelBoleto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SpeedBar, jpeg, StdCtrls, Mask, ToolEdit, RXSplit, fcButton,
  fcImgBtn, RXCtrls, ExtCtrls, RxLookup, DCChoice, RxGrdCpt, fcImager;

type
  TFrmRelBoleto = class(TForm)
    Panel1: TPanel;
    RxLabel5: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    fclGravar: TfcImageBtn;
    cmbClassif: TComboBox;
    EdtInicial: TDateEdit;
    EdtFinal: TDateEdit;
    edCliente: TRxLookupEdit;
    Edit1: TEdit;
    RxLabel6: TRxLabel;
    edCcusto: TRxLookupEdit;
    RxLabel7: TRxLabel;
    Edit2: TEdit;
    cmbDestino: TDCComboBox;
    Panel2: TPanel;
    RxLabel8: TRxLabel;
    Image1: TImage;
    Panel4: TPanel;
    btnImprimir: TfcImageBtn;
    btnSair: TfcImageBtn;
    Label1: TLabel;
    RxSplitter1: TRxSplitter;
    RxGradientCaption2: TRxGradientCaption;
    fcImager1: TfcImager;
    fcImager2: TfcImager;
    fcImager3: TfcImager;
    procedure BtnimprimirClick(Sender: TObject);
    procedure edClienteExit(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure cmbDestinoExit(Sender: TObject);
    procedure edCcustoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cmbClassifChange(Sender: TObject);
    procedure cmbDestinoChange(Sender: TObject);
    procedure cmbDestinoCloseUp(Sender: TObject);
    procedure DCComboExit(Sender: TObject);
    procedure EdtInicialExit(Sender: TObject);
    procedure EdtFinalExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelBoleto: TFrmRelBoleto;

implementation

uses unitDmDados, Unitbolbbv, DB, UnitPrincipal;

{$R *.dfm}

procedure TFrmRelBoleto.BtnimprimirClick(Sender: TObject);
begin
  Btnimprimir.Enabled:=false;
  cmbDestino.Enabled:=false;
  QrBoleto:=tQrBoleto.create(application);
  if cmbclassif.text='Por Cliente' then
    begin
    dmdados.tbCReceber.Filtered:=false;
    dmdados.tbCReceber.Filter:='(pago<>'''+'Pago'+ ''')and'+
                               '(codcli='''+edit1.Text+''')and '+
                               '(CodDoc='''+IntToStr(1)+''')and'+
                               '(datavenc>='''+edtinicial.Text+''')and'+
                               '(datavenc<='''+edtfinal.Text+''')';
    dmdados.tbCReceber.Filtered:=true;
    end;
    
  if cmbclassif.text='Por Per�odo' then
    begin
    dmdados.tbCReceber.Filtered:=false;
    dmdados.tbCReceber.Filter:='(pago<>'''+'Pago'+ ''')and'+
                               '(datavenc>='''+edtinicial.Text+''')and'+
                               '(CodDoc='''+IntToStr(1)+''')and'+
                               '(datavenc<='''+edtfinal.Text+''')';
    dmdados.tbCReceber.Filtered:=true;
    end;

  if cmbclassif.text='Por Centro de Custo' then
    begin
    dmdados.tbCReceber.Filtered:=false;
    dmdados.tbCReceber.Filter:='(pago<>'''+'Pago'+ ''')and'+
                               '(codccusto='''+edit2.Text+''')and '+
                               '(CodDoc='''+IntToStr(1)+''')and'+
                               '(datavenc>='''+edtinicial.Text+''')and'+
                               '(datavenc<='''+edtfinal.Text+''')';
    dmdados.tbCReceber.Filtered:=true;
    end;
  if (dmdados.tbCReceber.RecordCount=0) then
     ShowMessage ('N�o existem boletos a serem impressos')
  else
    begin
    if cmbdestino.Text='V�deo' then
      begin
      QrBoleto.qrHoje.Caption:=DateToStr(Date);
      QrBoleto.rpBoleto.preview;
      end
    else
      begin
      QrBoleto.qrHoje.Caption:=DateToStr(Date);
      QrBoleto.rpBoleto.print;
      end;
    end;
  dmdados.tbCReceber.Filtered:=false;
  cmbClassif.SetFocus;
end;

procedure TFrmRelBoleto.edClienteExit(Sender: TObject);
begin
if dmdados.TbCliente.Locate('nome',edCliente.Text,[]) then
   edit1.Text:=dmdados.TbClientecodcli.AsString;
end;

procedure TFrmRelBoleto.BtnSairClick(Sender: TObject);
begin
 close;
end;

procedure TFrmRelBoleto.cmbDestinoExit(Sender: TObject);
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
        Panel4.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
end;

procedure TFrmRelBoleto.edCcustoExit(Sender: TObject);
begin
if dmdados.TbCcusto.Locate('Descricao',edCcusto.Text,[]) then
   edit2.Text:=dmdados.TbCcustoCodCcusto.AsString;
end;

procedure TFrmRelBoleto.FormKeyPress(Sender: TObject; var Key: Char);
begin

If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmRelBoleto.cmbClassifChange(Sender: TObject);
begin
If cmbClassif.Text= 'Por Cliente' Then
   Begin
     EdtInicial.Enabled:= True;
     EdtFinal.Enabled:= True;
     Edccusto.Enabled:=False;
     Edcliente.Enabled:=true;
     cmbDestino.Enabled:=true;
     Btnimprimir.Enabled:=true;
    end;
If cmbClassif.Text= 'Por Per�odo' Then
   Begin
     EdtInicial.Enabled:= True;
     EdtFinal.Enabled:= True;
     Edcliente.Enabled:=False;
     Edccusto.Enabled:=False;
     cmbDestino.Enabled:=true;
     Btnimprimir.Enabled:=true;
  end;
If cmbClassif.Text= 'Por Centro de Custo' Then
   Begin
   EdtInicial.Enabled:= True;
   EdtFinal.Enabled:= True;
   Edcliente.Enabled:=False;
   Edccusto.Enabled:=true;
   cmbDestino.Enabled:=true;
   Btnimprimir.Enabled:=true;
   end;
end;
procedure TFrmRelBoleto.cmbDestinoChange(Sender: TObject);
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
        Panel4.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
  end;


procedure TFrmRelBoleto.cmbDestinoCloseUp(Sender: TObject);
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
        Panel4.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
end;

procedure TFrmRelBoleto.DCComboExit(Sender: TObject);
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
        Panel4.SetFocus;
        btnImprimir.Enabled:=true;
        end;
      end;
  end;

procedure TFrmRelBoleto.EdtInicialExit(Sender: TObject);
begin
  if (EdtInicial.Text ='  /  /    ') then
  begin
    ShowMessage('Data Inicial Vazia');
    EdtInicial.SetFocus;
  end
  else
    try StrToDate(EdtInicial.Text)
     Except on EConvertError do
     begin
      ShowMessage('Data Inicial Inv�lida');
      EdtInicial.SetFocus;
     end;
     end;
end;

procedure TFrmRelBoleto.EdtFinalExit(Sender: TObject);
begin
  if (EdtFinal.Text ='  /  /    ') then
  begin
    ShowMessage('Data Final Vazia');
    EdtFinal.SetFocus;
  end
  else
    try StrToDate(EdtFinal.Text)
     Except on EConvertError do
     begin
      ShowMessage('Data Final Inv�lida');
      EdtFinal.SetFocus;
     end;
     end;
end;

procedure TFrmRelBoleto.FormShow(Sender: TObject);
begin
FrmPrincipal.StatusTeclas(True,'[F2] Imprimir [Esc] Cancelar ou Sair');
    CmbDestino.Enabled:=false;
end;

procedure TFrmRelBoleto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F2    : Btnimprimir.Click;
      VK_ESCAPE : if dmDados.vTabStt then BtnSair.Click;
    end;
end;

procedure TFrmRelBoleto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
end;

end.
