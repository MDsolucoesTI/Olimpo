/////////////////////////////////////////////////////////////////////////
// Cria��o...........: 17-01-2001
// Ultima modifica��o: 04-07-2005
// M�dulo............: Relat�rio de Compras (Fornecedores) - Tela
// Sistema...........: Pegasus - Controle de Estoque
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitRelCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EFocCol, SpeedBar, StdCtrls, RXSplit, fcButton, fcImgBtn,dbtables,
  RXCtrls, ExtCtrls, jpeg, Mask, ToolEdit, RXDBCtrl, RxLookup, DCChoice,
  Grids, DBGrids, Buttons,db, RxGrdCpt, fcImager, fcLabel, JvLabel;

type
  TFrmRelCompPer = class(TForm)
    Panel3: TPanel;
    edData1: TDateEdit;
    edData2: TDateEdit;
    lforn: TRxLookupEdit;
    cmbdestino: TDCComboBox;
    cmbclassif: TDCComboBox;
    Panel2: TPanel;
    Panel1: TPanel;
    btnImprimir: TfcImageBtn;
    btnSair: TfcImageBtn;
    fcLabel2: TfcLabel;
    JvLabel10: TJvLabel;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    Edit1: TEdit;
    procedure BtnimprimirClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbDestinoExit(Sender: TObject);
    procedure edData1Exit(Sender: TObject);
    procedure edData2Exit(Sender: TObject);
    procedure cmbDestinoCloseUp(Sender: TObject);
    procedure lfornchange(Sender: TObject);
    procedure cmbClassifChange(Sender: TObject);
    procedure cmbdestinoChange(Sender: TObject);
    procedure cmbclassifExit(Sender: TObject);
    procedure cmbclassifCloseUp(Sender: TObject);
    procedure lfornExit(Sender: TObject);
    procedure fcImageBtn1Click(Sender: TObject);
    procedure fcImageBtn2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelCompPer: TFrmRelCompPer;

implementation

uses unitQrCompra, UnitPrincipal, unitDmDados,UnitLocProd;

{$R *.dfm}

procedure TFrmRelCompPer.BtnimprimirClick(Sender: TObject);
begin
  cmbdestino.Enabled:=false;
  btnImprimir.Enabled:=false;
  QrCompra:=tQrCompra.create(application);
  if cmbclassif.text='Fornecedor' then
    begin
    dmdados.tbCompras.Filtered:=false;
    dmdados.tbCompras.Filter:='(codfor= '''+ edit1.Text +''') and '+
                              '(DataComp >= '''+edData1.Text+''')and'+
                              '(DataComp <= '''+edData2.Text+''') ';
    dmdados.tbCompras.Filtered:=true;
    end
  else
  if cmbclassif.text='Por Per�odo' then
    begin
    dmdados.tbCompras.Filtered:=false;
    dmdados.tbCompras.Filter:='(datacomp >='''+edData1.Text+''')and'+
                              '(datacomp<='''+edData2.Text+''')';
    dmdados.tbCompras.Filtered:=true;
    end;
  if cmbDestino.Text='V�deo' then
    QrCompra.rpCompra.preview
  else
    QrCompra.rpCompra.print;
  dmdados.tbcompras.Filtered:= false;
  qrcompra.Free;
end;


procedure TFrmRelCompPer.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmRelCompPer.FormShow(Sender: TObject);
begin
  dmDados.HabilitaTeclado:=True;
  FrmPrincipal.StatusTeclas(True,'[F2] Imprimir [Esc] Cancelar ou Sair');
  dmDados.tbFornecedor.Open;
  dmDados.tbCompras.Open;
  cmbclassif.SetFocus;
end;

procedure TFrmRelCompPer.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F2    : if Btnimprimir.Enabled then  btnimprimir.Click;
      VK_ESCAPE : if dmDados.vTabStt then BtnSair.Click;
    end;
end;

procedure TFrmRelCompPer.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    end;
end;

procedure TFrmRelCompPer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.tbCompras.Close;
  dmDados.tbFornecedor.Close;
  action:=caFree;
end;

procedure TFrmRelCompPer.cmbDestinoExit(Sender: TObject);
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

procedure TFrmRelCompPer.edData1Exit(Sender: TObject);
begin
{try
  StrToDate(edData1.Text);
  except
    on EConvertError do
    begin
    ShowMessage ('Data Inv�lida');
    edData1.SetFocus;
    end;
end;   }
end;

procedure TFrmRelCompPer.edData2Exit(Sender: TObject);
begin
{try
  StrToDate(edData2.Text);
  except
    on EConvertError do
    begin
    ShowMessage ('Data Inv�lida');
    end;
  end;}
end;
procedure TFrmRelCompPer.cmbDestinoCloseUp(Sender: TObject);
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

procedure TFrmRelCompPer.lfornExit(Sender: TObject);
begin
  edit1.Text:=dmdados.tbFornecedorCodFor.AsString;
end;



procedure TFrmRelCompPer.lfornchange(Sender: TObject);
begin

if dmdados.Tbcompras.Locate('nome',edit1.Text,[]) then
   edit1.Text:=dmdados.tbFornecedorCodFor.AsString;
end;


procedure TFrmRelCompPer.cmbClassifChange(Sender: TObject);
begin
If cmbClassif.Text= 'Fornecedor' Then
   Begin
     edData1.Enabled:= True;
     edData2.Enabled:= True;
     lforn.Enabled:=true;
     cmbdestino.Enabled:=true;
     lforn.SetFocus;
  end
else
If cmbClassif.Text= 'Por Per�odo' Then
   Begin
    edData1.Enabled:= True;
    edData2.Enabled:= True;
    lforn.Enabled:=False;
    edit1.Enabled:=false;
    cmbdestino.Enabled:=true;
   end;
end;

procedure TFrmRelCompPer.cmbdestinoChange(Sender: TObject);
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

procedure TFrmRelCompPer.cmbclassifExit(Sender: TObject);
begin
If cmbClassif.Text= 'Fornecedor' Then
   Begin
     edData1.Enabled:= True;
     edData2.Enabled:= True;
     lforn.Enabled:=true;
     cmbdestino.Enabled:=true;
  end
else
If cmbClassif.Text= 'Por Per�odo' Then
   Begin
    edData1.Enabled:= True;
    edData2.Enabled:= True;
    lforn.Enabled:=False;
    edit1.Enabled:=false;
    cmbdestino.Enabled:=true;
   end;
end;

procedure TFrmRelCompPer.cmbclassifCloseUp(Sender: TObject);
begin
If cmbClassif.Text= 'Fornecedor' Then
   Begin
     edData1.Enabled:= True;
     edData2.Enabled:= True;
     lforn.Enabled:=true;
     cmbdestino.Enabled:=true;
     lforn.SetFocus;
  end
else
If cmbClassif.Text= 'Por Per�odo' Then
   Begin
    edData1.Enabled:= True;
    edData2.Enabled:= True;
    lforn.Enabled:=False;
    edit1.Enabled:=false;
    cmbdestino.Enabled:=true;
    end;
end;

procedure TFrmRelCompPer.fcImageBtn1Click(Sender: TObject);
var
    //DtInicio,DtFinal,DtPerda:TDateTime;
    //Dia,Mes,Ano:word;
    edfinal:tdatetime;
begin
cmbdestino.Enabled:=false;
btnImprimir.Enabled:=false;
QrCompra:=tQrCompra.create(application);
if cmbclassif.text='Fornecedor' then
  begin
  dmdados.tbCompras.Filtered:=false;
  dmdados.tbCompras.Filter:='(codfor= '''+edit1.text+''') and '+
                            '(DataComp >= '''+edData1.Text+''')and'+
                            '(DataComp <= '''+edData2.Text+''') ';
  dmdados.tbCompras.Filtered:=true;
  //QrCompra.lblfor.Visible:=True;
  //QrCompra.dbfor.Visible:=True;
  end
else
if cmbclassif.text='Por Per�odo' then
begin
  dmdados.tbCompras.Filtered:=false;
  dmdados.tbCompras.Filter:='(datacomp >='''+edData1.Text+''')and'+
                            '(datacomp<='''+edData2.Text+''')';
   dmdados.tbCompras.Filtered:=true;
   //QrCompra.lblfor.Visible:=False;
   //QrCompra.dbfor.Visible:=False;
end;
 { with qrcompra do
    begin
    qrData1.caption:=DateToStr(edfinal);
    qrData2.caption:=DateToStr(edfinal);
    end;}
  
if cmbDestino.Text='V�deo' then
   QrCompra.rpCompra.preview
else
   QrCompra.rpCompra.print;
   dmdados.tbcompras.Filtered:= false;
   qrcompra.Free;
end;

procedure TFrmRelCompPer.fcImageBtn2Click(Sender: TObject);
begin
  Close;
end;

end.

