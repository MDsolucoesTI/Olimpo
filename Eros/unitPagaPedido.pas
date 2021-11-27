//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Pagamento de Pedido
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitPagaPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxGIF, RackCtls, SpeedBar, fcButton, fcImgBtn, RXSplit,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, RXDBCtrl, RXCtrls, ExtCtrls,
  jpeg, DBTables, DB, EFocCol, TFlatSplitterUnit, RxGrdCpt, ToolEdit,
  CurrEdit, lmdstdcA, fcImager;

type
  TfrmPagaPedido = class(TForm)
    Panel1: TPanel;
    RxLabel15: TRxLabel;
    Panel2: TPanel;
    RxLabel2: TRxLabel;
    Image2: TImage;
    Panel3: TPanel;
    btnCancelar: TfcImageBtn;
    FlatSplitter1: TFlatSplitter;
    edtParcelas: TLMDSpinEdit;
    edtParc1: TCurrencyEdit;
    RxLabel1: TRxLabel;
    dtVencimento: TDateEdit;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    edtParc2: TCurrencyEdit;
    dtVenc1: TDateEdit;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    edtIntervalo: TLMDSpinEdit;
    dtVenc2: TDateEdit;
    RxLabel8: TRxLabel;
    edtParc3: TCurrencyEdit;
    dtVenc3: TDateEdit;
    RxLabel9: TRxLabel;
    edtParc4: TCurrencyEdit;
    dtVenc4: TDateEdit;
    RxLabel10: TRxLabel;
    edtParc5: TCurrencyEdit;
    dtVenc5: TDateEdit;
    RxLabel11: TRxLabel;
    edtParc6: TCurrencyEdit;
    dtVenc6: TDateEdit;
    RxLabel12: TRxLabel;
    edtParc7: TCurrencyEdit;
    dtVenc7: TDateEdit;
    RxLabel13: TRxLabel;
    edtParc8: TCurrencyEdit;
    dtVenc8: TDateEdit;
    RxLabel14: TRxLabel;
    edtParc9: TCurrencyEdit;
    dtVenc9: TDateEdit;
    RxLabel16: TRxLabel;
    edtParc10: TCurrencyEdit;
    dtVenc10: TDateEdit;
    RxLabel17: TRxLabel;
    edtParc11: TCurrencyEdit;
    dtVenc11: TDateEdit;
    RxLabel18: TRxLabel;
    edtParc12: TCurrencyEdit;
    dtVenc12: TDateEdit;
    btnGravar: TfcImageBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBGridMarcaEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtParcelasExit(Sender: TObject);
    function GeraData(iData:TdateTime;iDias:integer):TDateTime;
    procedure edtIntervaloExit(Sender: TObject);
    procedure edtParc1Exit(Sender: TObject);
    procedure edtParc2Exit(Sender: TObject);
    procedure edtParc3Exit(Sender: TObject);
    procedure edtParc4Exit(Sender: TObject);
    procedure edtParc5Exit(Sender: TObject);
    procedure edtParc6Exit(Sender: TObject);
    procedure edtParc7Exit(Sender: TObject);
    procedure edtParc8Exit(Sender: TObject);
    procedure edtParc9Exit(Sender: TObject);
    procedure edtParc10Exit(Sender: TObject);
    procedure edtParc11Exit(Sender: TObject);
    procedure edtParc12Exit(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure dtVencimentoExit(Sender: TObject);
  private
    { Private declarations }
    fVlCompra : real;
    fPagStt : char;
  public
    { Public declarations }
    Property VlCompra:real Read fVlCompra Write fVlCompra;
    Property PagStt:char Read fPagStt Write fPagStt;
  end;

var
  frmPagaPedido: TfrmPagaPedido;
  NovoItem: Boolean;
  VlParcela,VlResto : real;
  VlParc : array[1..12] of real;
  dtVenc : array[1..12] of TDateTime;
  RestParc : integer;
implementation

uses unitDmDados, unitPrincipal;

{$R *.dfm}

procedure TfrmPagaPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  Action:= Cafree;
end;

procedure TfrmPagaPedido.RxDBGridMarcaEnter(Sender: TObject);
begin
NovoItem:=False;
end;

procedure TfrmPagaPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmDados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_END    : btnGravar.Click;
      VK_ESCAPE : btnCancelar.Click;
    end;
end;

procedure TfrmPagaPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TfrmPagaPedido.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[End] Gravar e Sair [Esc] Cancelar e Sair');
end;

procedure TfrmPagaPedido.btnCancelarClick(Sender: TObject);
begin
  PagStt:='N';
  Close;
end;

procedure TfrmPagaPedido.edtParcelasExit(Sender: TObject);
begin
  if edtParcelas.Value=1 then
    begin
    edtParc1.Value:=VlCompra;
    VlParc[1]:=VlCompra;
    end
  else
    edtIntervalo.Enabled:=True;
end;

function TfrmPagaPedido.GeraData(iData:TdateTime;iDias:integer):TDateTime;
var
  vVenc,vDia,vMes,vAno:Word;
  iDia,iMes,iAno:string;
  x:integer;
begin
  decodedate(iData,vAno,vMes,vDia);
  vVenc:=vDia;
  if iDias >= 30 then
    begin
    For x:=1 to (iDias div 30) do
      begin
      vMes:=vMes+1;
      if vMes=13 Then
        Begin
        vAno:=vAno+1;
        vMes:=1;
        End;
      End;
    if ((vDia<=31)and(vDia>=29))and(vMes=2) then
      begin
      if (vAno mod 4)=0 then
        vDia:=29
      else
        vDia:=28;
      end;
    if (vDia=31)and((vMes=4)or(vMes=6)or(vMes=9)or(vMes=11)) then
      vDia:=30;
    if vDia < vVenc then
      if vMes <> 2 Then
        if (vMes=4)or(vMes=6)or(vMes=9)or(vMes=11) then
          if vVenc=31 Then
            vDia:=30
          else
            vDia:=vVenc
        else
          vDia:=vVenc;
    iDia:=IntToStr(vDia);
    iMes:=IntToStr(vMes);
    iAno:=IntToStr(vAno);
    GeraData:=StrToDate(iDia+'/'+iMes+'/'+iAno);
    end
  else
    GeraData:=iData+iDias;
end;

procedure TfrmPagaPedido.edtIntervaloExit(Sender: TObject);
var
  c : integer;
begin
  Height:=Height+((edtParcelas.Value-1)*30);
  top:=(Screen.Height-Height)Div 2;
  VlParcela:=VlCompra/edtParcelas.Value;
  VlResto:=VlCompra;
  case edtParcelas.Value of
    2:begin
      edtParc1.Enabled:=True;
      edtParc1.Value:=VlParcela;
      dtVenc1.Date:=dtVencimento.Date;
      edtParc2.Enabled:=True;
      edtParc2.Value:=VlParcela;
      dtVenc2.Date:=GeraData(dtVenc1.Date,edtIntervalo.Value);
      dtVenc[1]:=dtVenc1.Date;
      dtVenc[2]:=dtVenc2.Date;
      end;
    3:begin
      edtParc1.Enabled:=True;
      edtParc1.Value:=VlParcela;
      dtVenc1.Date:=dtVencimento.Date;
      edtParc2.Enabled:=True;
      edtParc2.Value:=VlParcela;
      dtVenc2.Date:=GeraData(dtVenc1.Date,edtIntervalo.Value);
      edtParc3.Enabled:=True;
      edtParc3.Value:=VlParcela;
      dtVenc3.Date:=GeraData(dtVenc2.Date,edtIntervalo.Value);
      dtVenc[1]:=dtVenc1.Date;
      dtVenc[2]:=dtVenc2.Date;
      dtVenc[3]:=dtVenc3.Date;
      end;
    4:begin
      edtParc1.Enabled:=True;
      edtParc1.Value:=VlParcela;
      dtVenc1.Date:=dtVencimento.Date;
      edtParc2.Enabled:=True;
      edtParc2.Value:=VlParcela;
      dtVenc2.Date:=GeraData(dtVenc1.Date,edtIntervalo.Value);
      edtParc3.Enabled:=True;
      edtParc3.Value:=VlParcela;
      dtVenc3.Date:=GeraData(dtVenc2.Date,edtIntervalo.Value);
      edtParc4.Enabled:=True;
      edtParc4.Value:=VlParcela;
      dtVenc4.Date:=GeraData(dtVenc3.Date,edtIntervalo.Value);
      dtVenc[1]:=dtVenc1.Date;
      dtVenc[2]:=dtVenc2.Date;
      dtVenc[3]:=dtVenc3.Date;
      dtVenc[4]:=dtVenc4.Date;
      end;
    5:begin
      edtParc1.Enabled:=True;
      edtParc1.Value:=VlParcela;
      dtVenc1.Date:=dtVencimento.Date;
      edtParc2.Enabled:=True;
      edtParc2.Value:=VlParcela;
      dtVenc2.Date:=GeraData(dtVenc1.Date,edtIntervalo.Value);
      edtParc3.Enabled:=True;
      edtParc3.Value:=VlParcela;
      dtVenc3.Date:=GeraData(dtVenc2.Date,edtIntervalo.Value);
      edtParc4.Enabled:=True;
      edtParc4.Value:=VlParcela;
      dtVenc4.Date:=GeraData(dtVenc3.Date,edtIntervalo.Value);
      edtParc5.Enabled:=True;
      edtParc5.Value:=VlParcela;
      dtVenc5.Date:=GeraData(dtVenc4.Date,edtIntervalo.Value);
      dtVenc[1]:=dtVenc1.Date;
      dtVenc[2]:=dtVenc2.Date;
      dtVenc[3]:=dtVenc3.Date;
      dtVenc[4]:=dtVenc4.Date;
      dtVenc[5]:=dtVenc5.Date;
      end;
    6:begin
      edtParc1.Enabled:=True;
      edtParc1.Value:=VlParcela;
      dtVenc1.Date:=dtVencimento.Date;
      edtParc2.Enabled:=True;
      edtParc2.Value:=VlParcela;
      dtVenc2.Date:=GeraData(dtVenc1.Date,edtIntervalo.Value);
      edtParc3.Enabled:=True;
      edtParc3.Value:=VlParcela;
      dtVenc3.Date:=GeraData(dtVenc2.Date,edtIntervalo.Value);
      edtParc4.Enabled:=True;
      edtParc4.Value:=VlParcela;
      dtVenc4.Date:=GeraData(dtVenc3.Date,edtIntervalo.Value);
      edtParc5.Enabled:=True;
      edtParc5.Value:=VlParcela;
      dtVenc5.Date:=GeraData(dtVenc4.Date,edtIntervalo.Value);
      edtParc6.Enabled:=True;
      edtParc6.Value:=VlParcela;
      dtVenc6.Date:=GeraData(dtVenc5.Date,edtIntervalo.Value);
      dtVenc[1]:=dtVenc1.Date;
      dtVenc[2]:=dtVenc2.Date;
      dtVenc[3]:=dtVenc3.Date;
      dtVenc[4]:=dtVenc4.Date;
      dtVenc[5]:=dtVenc5.Date;
      dtVenc[6]:=dtVenc6.Date;
      end;
    7:begin
      edtParc1.Enabled:=True;
      edtParc1.Value:=VlParcela;
      dtVenc1.Date:=dtVencimento.Date;
      edtParc2.Enabled:=True;
      edtParc2.Value:=VlParcela;
      dtVenc2.Date:=GeraData(dtVenc1.Date,edtIntervalo.Value);
      edtParc3.Enabled:=True;
      edtParc3.Value:=VlParcela;
      dtVenc3.Date:=GeraData(dtVenc2.Date,edtIntervalo.Value);
      edtParc4.Enabled:=True;
      edtParc4.Value:=VlParcela;
      dtVenc4.Date:=GeraData(dtVenc3.Date,edtIntervalo.Value);
      edtParc5.Enabled:=True;
      edtParc5.Value:=VlParcela;
      dtVenc5.Date:=GeraData(dtVenc4.Date,edtIntervalo.Value);
      edtParc6.Enabled:=True;
      edtParc6.Value:=VlParcela;
      dtVenc6.Date:=GeraData(dtVenc5.Date,edtIntervalo.Value);
      edtParc7.Enabled:=True;
      edtParc7.Value:=VlParcela;
      dtVenc7.Date:=GeraData(dtVenc6.Date,edtIntervalo.Value);
      dtVenc[1]:=dtVenc1.Date;
      dtVenc[2]:=dtVenc2.Date;
      dtVenc[3]:=dtVenc3.Date;
      dtVenc[4]:=dtVenc4.Date;
      dtVenc[5]:=dtVenc5.Date;
      dtVenc[6]:=dtVenc6.Date;
      dtVenc[7]:=dtVenc7.Date;
      end;
    8:begin
      edtParc1.Enabled:=True;
      edtParc1.Value:=VlParcela;
      dtVenc1.Date:=dtVencimento.Date;
      edtParc2.Enabled:=True;
      edtParc2.Value:=VlParcela;
      dtVenc2.Date:=GeraData(dtVenc1.Date,edtIntervalo.Value);
      edtParc3.Enabled:=True;
      edtParc3.Value:=VlParcela;
      dtVenc3.Date:=GeraData(dtVenc2.Date,edtIntervalo.Value);
      edtParc4.Enabled:=True;
      edtParc4.Value:=VlParcela;
      dtVenc4.Date:=GeraData(dtVenc3.Date,edtIntervalo.Value);
      edtParc5.Enabled:=True;
      edtParc5.Value:=VlParcela;
      dtVenc5.Date:=GeraData(dtVenc4.Date,edtIntervalo.Value);
      edtParc6.Enabled:=True;
      edtParc6.Value:=VlParcela;
      dtVenc6.Date:=GeraData(dtVenc5.Date,edtIntervalo.Value);
      edtParc7.Enabled:=True;
      edtParc7.Value:=VlParcela;
      dtVenc7.Date:=GeraData(dtVenc6.Date,edtIntervalo.Value);
      edtParc8.Enabled:=True;
      edtParc8.Value:=VlParcela;
      dtVenc8.Date:=GeraData(dtVenc7.Date,edtIntervalo.Value);
      dtVenc[1]:=dtVenc1.Date;
      dtVenc[2]:=dtVenc2.Date;
      dtVenc[3]:=dtVenc3.Date;
      dtVenc[4]:=dtVenc4.Date;
      dtVenc[5]:=dtVenc5.Date;
      dtVenc[6]:=dtVenc6.Date;
      dtVenc[7]:=dtVenc7.Date;
      dtVenc[8]:=dtVenc8.Date;
      end;
    9:begin
      edtParc1.Enabled:=True;
      edtParc1.Value:=VlParcela;
      dtVenc1.Date:=dtVencimento.Date;
      edtParc2.Enabled:=True;
      edtParc2.Value:=VlParcela;
      dtVenc2.Date:=GeraData(dtVenc1.Date,edtIntervalo.Value);
      edtParc3.Enabled:=True;
      edtParc3.Value:=VlParcela;
      dtVenc3.Date:=GeraData(dtVenc2.Date,edtIntervalo.Value);
      edtParc4.Enabled:=True;
      edtParc4.Value:=VlParcela;
      dtVenc4.Date:=GeraData(dtVenc3.Date,edtIntervalo.Value);
      edtParc5.Enabled:=True;
      edtParc5.Value:=VlParcela;
      dtVenc5.Date:=GeraData(dtVenc4.Date,edtIntervalo.Value);
      edtParc6.Enabled:=True;
      edtParc6.Value:=VlParcela;
      dtVenc6.Date:=GeraData(dtVenc5.Date,edtIntervalo.Value);
      edtParc7.Enabled:=True;
      edtParc7.Value:=VlParcela;
      dtVenc7.Date:=GeraData(dtVenc6.Date,edtIntervalo.Value);
      edtParc8.Enabled:=True;
      edtParc8.Value:=VlParcela;
      dtVenc8.Date:=GeraData(dtVenc7.Date,edtIntervalo.Value);
      edtParc9.Enabled:=True;
      edtParc9.Value:=VlParcela;
      dtVenc9.Date:=GeraData(dtVenc8.Date,edtIntervalo.Value);
      dtVenc[1]:=dtVenc1.Date;
      dtVenc[2]:=dtVenc2.Date;
      dtVenc[3]:=dtVenc3.Date;
      dtVenc[4]:=dtVenc4.Date;
      dtVenc[5]:=dtVenc5.Date;
      dtVenc[6]:=dtVenc6.Date;
      dtVenc[7]:=dtVenc7.Date;
      dtVenc[8]:=dtVenc8.Date;
      dtVenc[9]:=dtVenc9.Date;
      end;
    10:begin
      edtParc1.Enabled:=True;
      edtParc1.Value:=VlParcela;
      dtVenc1.Date:=dtVencimento.Date;
      edtParc2.Enabled:=True;
      edtParc2.Value:=VlParcela;
      dtVenc2.Date:=GeraData(dtVenc1.Date,edtIntervalo.Value);
      edtParc3.Enabled:=True;
      edtParc3.Value:=VlParcela;
      dtVenc3.Date:=GeraData(dtVenc2.Date,edtIntervalo.Value);
      edtParc4.Enabled:=True;
      edtParc4.Value:=VlParcela;
      dtVenc4.Date:=GeraData(dtVenc3.Date,edtIntervalo.Value);
      edtParc5.Enabled:=True;
      edtParc5.Value:=VlParcela;
      dtVenc5.Date:=GeraData(dtVenc4.Date,edtIntervalo.Value);
      edtParc6.Enabled:=True;
      edtParc6.Value:=VlParcela;
      dtVenc6.Date:=GeraData(dtVenc5.Date,edtIntervalo.Value);
      edtParc7.Enabled:=True;
      edtParc7.Value:=VlParcela;
      dtVenc7.Date:=GeraData(dtVenc6.Date,edtIntervalo.Value);
      edtParc8.Enabled:=True;
      edtParc8.Value:=VlParcela;
      dtVenc8.Date:=GeraData(dtVenc7.Date,edtIntervalo.Value);
      edtParc9.Enabled:=True;
      edtParc9.Value:=VlParcela;
      dtVenc9.Date:=GeraData(dtVenc8.Date,edtIntervalo.Value);
      edtParc10.Enabled:=True;
      edtParc10.Value:=VlParcela;
      dtVenc10.Date:=GeraData(dtVenc9.Date,edtIntervalo.Value);
      dtVenc[1]:=dtVenc1.Date;
      dtVenc[2]:=dtVenc2.Date;
      dtVenc[3]:=dtVenc3.Date;
      dtVenc[4]:=dtVenc4.Date;
      dtVenc[5]:=dtVenc5.Date;
      dtVenc[6]:=dtVenc6.Date;
      dtVenc[7]:=dtVenc7.Date;
      dtVenc[8]:=dtVenc8.Date;
      dtVenc[9]:=dtVenc9.Date;
      dtVenc[10]:=dtVenc10.Date;
      end;
    11:begin
      edtParc1.Enabled:=True;
      edtParc1.Value:=VlParcela;
      dtVenc1.Date:=dtVencimento.Date;
      edtParc2.Enabled:=True;
      edtParc2.Value:=VlParcela;
      dtVenc2.Date:=GeraData(dtVenc1.Date,edtIntervalo.Value);
      edtParc3.Enabled:=True;
      edtParc3.Value:=VlParcela;
      dtVenc3.Date:=GeraData(dtVenc2.Date,edtIntervalo.Value);
      edtParc4.Enabled:=True;
      edtParc4.Value:=VlParcela;
      dtVenc4.Date:=GeraData(dtVenc3.Date,edtIntervalo.Value);
      edtParc5.Enabled:=True;
      edtParc5.Value:=VlParcela;
      dtVenc5.Date:=GeraData(dtVenc4.Date,edtIntervalo.Value);
      edtParc6.Enabled:=True;
      edtParc6.Value:=VlParcela;
      dtVenc6.Date:=GeraData(dtVenc5.Date,edtIntervalo.Value);
      edtParc7.Enabled:=True;
      edtParc7.Value:=VlParcela;
      dtVenc7.Date:=GeraData(dtVenc6.Date,edtIntervalo.Value);
      edtParc8.Enabled:=True;
      edtParc8.Value:=VlParcela;
      dtVenc8.Date:=GeraData(dtVenc7.Date,edtIntervalo.Value);
      edtParc9.Enabled:=True;
      edtParc9.Value:=VlParcela;
      dtVenc9.Date:=GeraData(dtVenc8.Date,edtIntervalo.Value);
      edtParc10.Enabled:=True;
      edtParc10.Value:=VlParcela;
      dtVenc10.Date:=GeraData(dtVenc9.Date,edtIntervalo.Value);
      edtParc11.Enabled:=True;
      edtParc11.Value:=VlParcela;
      dtVenc11.Date:=GeraData(dtVenc10.Date,edtIntervalo.Value);
      dtVenc[1]:=dtVenc1.Date;
      dtVenc[2]:=dtVenc2.Date;
      dtVenc[3]:=dtVenc3.Date;
      dtVenc[4]:=dtVenc4.Date;
      dtVenc[5]:=dtVenc5.Date;
      dtVenc[6]:=dtVenc6.Date;
      dtVenc[7]:=dtVenc7.Date;
      dtVenc[8]:=dtVenc8.Date;
      dtVenc[9]:=dtVenc9.Date;
      dtVenc[10]:=dtVenc10.Date;
      dtVenc[11]:=dtVenc11.Date;
      end;
    12:begin
      edtParc1.Enabled:=True;
      edtParc1.Value:=VlParcela;
      dtVenc1.Date:=dtVencimento.Date;
      edtParc2.Enabled:=True;
      edtParc2.Value:=VlParcela;
      dtVenc2.Date:=GeraData(dtVenc1.Date,edtIntervalo.Value);
      edtParc3.Enabled:=True;
      edtParc3.Value:=VlParcela;
      dtVenc3.Date:=GeraData(dtVenc2.Date,edtIntervalo.Value);
      edtParc4.Enabled:=True;
      edtParc4.Value:=VlParcela;
      dtVenc4.Date:=GeraData(dtVenc3.Date,edtIntervalo.Value);
      edtParc5.Enabled:=True;
      edtParc5.Value:=VlParcela;
      dtVenc5.Date:=GeraData(dtVenc4.Date,edtIntervalo.Value);
      edtParc6.Enabled:=True;
      edtParc6.Value:=VlParcela;
      dtVenc6.Date:=GeraData(dtVenc5.Date,edtIntervalo.Value);
      edtParc7.Enabled:=True;
      edtParc7.Value:=VlParcela;
      dtVenc7.Date:=GeraData(dtVenc6.Date,edtIntervalo.Value);
      edtParc8.Enabled:=True;
      edtParc8.Value:=VlParcela;
      dtVenc8.Date:=GeraData(dtVenc7.Date,edtIntervalo.Value);
      edtParc9.Enabled:=True;
      edtParc9.Value:=VlParcela;
      dtVenc9.Date:=GeraData(dtVenc8.Date,edtIntervalo.Value);
      edtParc10.Enabled:=True;
      edtParc10.Value:=VlParcela;
      dtVenc10.Date:=GeraData(dtVenc9.Date,edtIntervalo.Value);
      edtParc11.Enabled:=True;
      edtParc11.Value:=VlParcela;
      dtVenc11.Date:=GeraData(dtVenc10.Date,edtIntervalo.Value);
      edtParc12.Enabled:=True;
      edtParc12.Value:=VlParcela;
      dtVenc12.Date:=GeraData(dtVenc11.Date,edtIntervalo.Value);
      dtVenc[1]:=dtVenc1.Date;
      dtVenc[2]:=dtVenc2.Date;
      dtVenc[3]:=dtVenc3.Date;
      dtVenc[4]:=dtVenc4.Date;
      dtVenc[5]:=dtVenc5.Date;
      dtVenc[6]:=dtVenc6.Date;
      dtVenc[7]:=dtVenc7.Date;
      dtVenc[8]:=dtVenc8.Date;
      dtVenc[9]:=dtVenc9.Date;
      dtVenc[10]:=dtVenc10.Date;
      dtVenc[11]:=dtVenc11.Date;
      dtVenc[12]:=dtVenc12.Date;
      end;
  end;
  for c:=1 to edtParcelas.Value do
    VlParc[c]:=VlParcela;
  edtParcelas.Enabled:=False;
  dtVencimento.Enabled:=False;
  edtIntervalo.Enabled:=False;
  edtParc1.SetFocus;
end;

procedure TfrmPagaPedido.edtParc1Exit(Sender: TObject);
var
  c : integer;
begin
  if edtParcelas.Value=1 then
    begin
    ShowMessage('N�o existe mais parcelas'+#13+'A Parcela Atual deve ter o valor restante');
    edtParc1.Value:=VlResto;
    VlParc[1]:=VlResto;
    end
  else
    begin
    VlResto:=VlResto-edtParc1.Value;
    VlParcela:=VlResto/(edtParcelas.Value-1);
    case edtParcelas.Value of
      2:begin
        edtParc2.Value:=VlResto;
        end;
      3:begin
        edtParc2.Value:=VlParcela;
        edtParc3.Value:=VlParcela;
        end;
      4:begin
        edtParc2.Value:=VlParcela;
        edtParc3.Value:=VlParcela;
        edtParc4.Value:=VlParcela;
        end;
      5:begin
        edtParc2.Value:=VlParcela;
        edtParc3.Value:=VlParcela;
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        end;
      6:begin
        edtParc2.Value:=VlParcela;
        edtParc3.Value:=VlParcela;
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        end;
      7:begin
        edtParc2.Value:=VlParcela;
        edtParc3.Value:=VlParcela;
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        end;
      8:begin
        edtParc2.Value:=VlParcela;
        edtParc3.Value:=VlParcela;
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        end;
      9:begin
        edtParc2.Value:=VlParcela;
        edtParc3.Value:=VlParcela;
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        end;
      10:begin
        edtParc2.Value:=VlParcela;
        edtParc3.Value:=VlParcela;
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        end;
      11:begin
        edtParc2.Value:=VlParcela;
        edtParc3.Value:=VlParcela;
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        edtParc11.Value:=VlParcela;
        end;
      12:begin
        edtParc2.Value:=VlParcela;
        edtParc3.Value:=VlParcela;
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        edtParc11.Value:=VlParcela;
        edtParc12.Value:=VlParcela;
        end;
    end;
    VlParc[1]:=edtParc1.Value;
    for c:=2 to edtParcelas.Value do
      VlParc[c]:=VlParcela;
    edtParc2.SetFocus;
  end;
end;

procedure TfrmPagaPedido.edtParc2Exit(Sender: TObject);
var
  c : integer;
begin
  if edtParcelas.Value=2 then
    begin
    ShowMessage('N�o existe mais parcelas'+#13+'A Parcela Atual deve ter o valor restante');
    edtParc2.Value:=VlResto;
    VlParc[2]:=VlResto;
    end
  else
    begin
    VlResto:=VlResto-edtParc2.Value;
    VlParcela:=VlResto/(edtParcelas.Value-2);
    case edtParcelas.Value of
      3:begin
        edtParc3.Value:=VlParcela;
        end;
      4:begin
        edtParc3.Value:=VlParcela;
        edtParc4.Value:=VlParcela;
        end;
      5:begin
        edtParc3.Value:=VlParcela;
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        end;
      6:begin
        edtParc3.Value:=VlParcela;
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        end;
      7:begin
        edtParc3.Value:=VlParcela;
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        end;
      8:begin
        edtParc3.Value:=VlParcela;
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        end;
      9:begin
        edtParc3.Value:=VlParcela;
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        end;
      10:begin
        edtParc3.Value:=VlParcela;
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        end;
      11:begin
        edtParc3.Value:=VlParcela;
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        edtParc11.Value:=VlParcela;
        end;
      12:begin
        edtParc3.Value:=VlParcela;
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        edtParc11.Value:=VlParcela;
        edtParc12.Value:=VlParcela;
        end;
    end;
    VlParc[2]:=edtParc2.Value;
    for c:=3 to edtParcelas.Value do
      VlParc[c]:=VlParcela;
    edtParc3.SetFocus;
  end;
end;

procedure TfrmPagaPedido.edtParc3Exit(Sender: TObject);
var
  c : integer;
begin
  if edtParcelas.Value=3 then
    begin
    ShowMessage('N�o existe mais parcelas'+#13+'A Parcela Atual deve ter o valor restante');
    edtParc3.Value:=VlResto;
    VlParc[3]:=VlResto;
    end
  else
    begin
    VlResto:=VlResto-edtParc3.Value;
    VlParcela:=VlResto/(edtParcelas.Value-3);
    case edtParcelas.Value of
      4:begin
        edtParc4.Value:=VlParcela;
        end;
      5:begin
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        end;
      6:begin
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        end;
      7:begin
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        end;
      8:begin
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        end;
      9:begin
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        end;
      10:begin
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        end;
      11:begin
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        edtParc11.Value:=VlParcela;
        end;
      12:begin
        edtParc4.Value:=VlParcela;
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        edtParc11.Value:=VlParcela;
        edtParc12.Value:=VlParcela;
        end;
    end;
    VlParc[3]:=edtParc3.Value;
    for c:=4 to edtParcelas.Value do
      VlParc[c]:=VlParcela;
    edtParc4.SetFocus;
  end;
end;

procedure TfrmPagaPedido.edtParc4Exit(Sender: TObject);
var
  c : integer;
begin
  if edtParcelas.Value=4 then
    begin
    ShowMessage('N�o existe mais parcelas'+#13+'A Parcela Atual deve ter o valor restante');
    edtParc4.Value:=VlResto;
    VlParc[4]:=VlResto;
    end
  else
    begin
    VlResto:=VlResto-edtParc4.Value;
    VlParcela:=VlResto/(edtParcelas.Value-4);
    case edtParcelas.Value of
      5:begin
        edtParc5.Value:=VlParcela;
        end;
      6:begin
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        end;
      7:begin
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        end;
      8:begin
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        end;
      9:begin
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        end;
      10:begin
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        end;
      11:begin
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        edtParc11.Value:=VlParcela;
        end;
      12:begin
        edtParc5.Value:=VlParcela;
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        edtParc11.Value:=VlParcela;
        edtParc12.Value:=VlParcela;
        end;
    end;
    VlParc[4]:=edtParc4.Value;
    for c:=5 to edtParcelas.Value do
      VlParc[c]:=VlParcela;
    edtParc5.SetFocus;
  end;
end;

procedure TfrmPagaPedido.edtParc5Exit(Sender: TObject);
var
  c : integer;
begin
  if edtParcelas.Value=5 then
    begin
    ShowMessage('N�o existe mais parcelas'+#13+'A Parcela Atual deve ter o valor restante');
    edtParc5.Value:=VlResto;
    VlParc[5]:=VlResto;
    end
  else
    begin
    VlResto:=VlResto-edtParc5.Value;
    VlParcela:=VlResto/(edtParcelas.Value-5);
    case edtParcelas.Value of
      6:begin
        edtParc6.Value:=VlParcela;
        end;
      7:begin
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        end;
      8:begin
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        end;
      9:begin
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        end;
      10:begin
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        end;
      11:begin
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        edtParc11.Value:=VlParcela;
        end;
      12:begin
        edtParc6.Value:=VlParcela;
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        edtParc11.Value:=VlParcela;
        edtParc12.Value:=VlParcela;
        end;
    end;
    VlParc[5]:=edtParc5.Value;
    for c:=6 to edtParcelas.Value do
      VlParc[c]:=VlParcela;
    edtParc6.SetFocus;
  end;
end;

procedure TfrmPagaPedido.edtParc6Exit(Sender: TObject);
var
  c : integer;
begin
  if edtParcelas.Value=6 then
    begin
    ShowMessage('N�o existe mais parcelas'+#13+'A Parcela Atual deve ter o valor restante');
    edtParc7.Value:=VlResto;
    VlParc[6]:=VlResto;
    end
  else
    begin
    VlResto:=VlResto-edtParc6.Value;
    VlParcela:=VlResto/(edtParcelas.Value-6);
    case edtParcelas.Value of
      7:begin
        edtParc7.Value:=VlParcela;
        end;
      8:begin
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        end;
      9:begin
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        end;
      10:begin
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        end;
      11:begin
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        edtParc11.Value:=VlParcela;
        end;
      12:begin
        edtParc7.Value:=VlParcela;
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        edtParc11.Value:=VlParcela;
        edtParc12.Value:=VlParcela;
        end;
    end;
    VlParc[6]:=edtParc6.Value;
    for c:=7 to edtParcelas.Value do
      VlParc[c]:=VlParcela;
    edtParc7.SetFocus;
  end;
end;

procedure TfrmPagaPedido.edtParc7Exit(Sender: TObject);
var
  c : integer;
begin
  if edtParcelas.Value=7 then
    begin
    ShowMessage('N�o existe mais parcelas'+#13+'A Parcela Atual deve ter o valor restante');
    edtParc7.Value:=VlResto;
    VlParc[8]:=VlResto;
    end
  else
    begin
    VlResto:=VlResto-edtParc7.Value;
    VlParcela:=VlResto/(edtParcelas.Value-7);
    case edtParcelas.Value of
      8:begin
        edtParc8.Value:=VlParcela;
        end;
      9:begin
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        end;
      10:begin
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        end;
      11:begin
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        edtParc11.Value:=VlParcela;
        end;
      12:begin
        edtParc8.Value:=VlParcela;
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        edtParc11.Value:=VlParcela;
        edtParc12.Value:=VlParcela;
        end;
    end;
    VlParc[7]:=edtParc7.Value;
    for c:=8 to edtParcelas.Value do
      VlParc[c]:=VlParcela;
    edtParc8.SetFocus;
  end;
end;

procedure TfrmPagaPedido.edtParc8Exit(Sender: TObject);
var
  c : integer;
begin
  if edtParcelas.Value=8 then
    begin
    ShowMessage('N�o existe mais parcelas'+#13+'A Parcela Atual deve ter o valor restante');
    edtParc8.Value:=VlResto;
    VlParc[8]:=VlResto;
    end
  else
    begin
    VlResto:=VlResto-edtParc8.Value;
    VlParcela:=VlResto/(edtParcelas.Value-8);
    case edtParcelas.Value of
      9:begin
        edtParc9.Value:=VlParcela;
        end;
      10:begin
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        end;
      11:begin
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        edtParc11.Value:=VlParcela;
        end;
      12:begin
        edtParc9.Value:=VlParcela;
        edtParc10.Value:=VlParcela;
        edtParc11.Value:=VlParcela;
        edtParc12.Value:=VlParcela;
        end;
    end;
    VlParc[8]:=edtParc8.Value;
    for c:=9 to edtParcelas.Value do
      VlParc[c]:=VlParcela;
    edtParc9.SetFocus;
  end;
end;

procedure TfrmPagaPedido.edtParc9Exit(Sender: TObject);
var
  c : integer;
begin
  if edtParcelas.Value=9 then
    begin
    ShowMessage('N�o existe mais parcelas'+#13+'A Parcela Atual deve ter o valor restante');
    edtParc9.Value:=VlResto;
    VlParc[9]:=VlResto;
    end
  else
    begin
    VlResto:=VlResto-edtParc9.Value;
    VlParcela:=VlResto/(edtParcelas.Value-9);
    case edtParcelas.Value of
      10:begin
        edtParc10.Value:=VlParcela;
        end;
      11:begin
        edtParc10.Value:=VlParcela;
        edtParc11.Value:=VlParcela;
        end;
      12:begin
        edtParc10.Value:=VlParcela;
        edtParc11.Value:=VlParcela;
        edtParc12.Value:=VlParcela;
        end;
    end;
    VlParc[9]:=edtParc9.Value;
    for c:=10 to edtParcelas.Value do
      VlParc[c]:=VlParcela;
    edtParc10.SetFocus;
  end;
end;

procedure TfrmPagaPedido.edtParc10Exit(Sender: TObject);
var
  c : integer;
begin
  if edtParcelas.Value=10 then
    begin
    ShowMessage('N�o existe mais parcelas'+#13+'A Parcela Atual deve ter o valor restante');
    edtParc10.Value:=VlResto;
    VlParc[10]:=VlResto;
    end
  else
    begin
    VlResto:=VlResto-edtParc10.Value;
    VlParcela:=VlResto/(edtParcelas.Value-10);
    case edtParcelas.Value of
      11:begin
        edtParc11.Value:=VlParcela;
        end;
      12:begin
        edtParc11.Value:=VlParcela;
        edtParc12.Value:=VlParcela;
        end;
    end;
    VlParc[10]:=edtParc10.Value;
    for c:=11 to edtParcelas.Value do
      VlParc[c]:=VlParcela;
    edtParc11.SetFocus;
  end;
end;

procedure TfrmPagaPedido.edtParc11Exit(Sender: TObject);
begin
  if edtParcelas.Value=11 then
    begin
    ShowMessage('N�o existe mais parcelas'+#13+'A Parcela Atual deve ter o valor restante');
    edtParc11.Value:=VlResto;
    VlParc[11]:=VlResto;
    end
  else
    begin
    VlResto:=VlResto-edtParc11.Value;
    VlParcela:=VlResto/(edtParcelas.Value-11);
    case edtParcelas.Value of
      12:begin
        edtParc12.Value:=VlParcela;
        end;
    end;
    VlParc[12]:=VlParcela;
    edtParc12.SetFocus;
  end;
end;

procedure TfrmPagaPedido.edtParc12Exit(Sender: TObject);
begin
  if edtParcelas.Value=12 then
    begin
    ShowMessage('N�o existe mais parcelas'+#13+'A Parcela Atual deve ter o valor restante');
    edtParc12.Value:=VlResto;
    VlParc[12]:=VlResto;
    end;
end;

procedure TfrmPagaPedido.btnGravarClick(Sender: TObject);
var
  c : integer;
begin
  PagStt:='S';
  dmdados.tbCompras.Post;
  //Atualizando estoque
  dmdados.tbDetCompras.Filtered:=false;
  dmdados.tbDetCompras.Filter:='(CodComp='''+dmdados.tbComprasCodComp.AsString+''')';
  dmdados.tbDetCompras.Filtered:=true;
  dmdados.tbDetCompras.First;
  While not dmdados.tbDetCompras.Eof do
    begin
    if dmdados.tbEstoque.Locate('CodMerc',dmdados.tbDetComprasCodMerc.Value,[]) then
      begin
      dmdados.tbEstoque.edit;
      dmdados.tbEstoqueUltimaCompra.Value:=date;
      dmdados.tbEstoqueQuantidade.Value:=dmdados.tbEstoqueQuantidade.Value+
                                         dmdados.tbdetComprasQuant.Value;
      dmdados.tbEstoquePrecoCompra.Value:=dmdados.tbDetComprasPrecoUnit.Value;
      dmdados.tbEstoque.Post;
      end;
    dmdados.tbDetCompras.Next;
    end;
  //Lan�ar pedido no contas a pagar
  for c:=1 to edtParcelas.Value do
    begin
    dmdados.tbCPagar.Append;
    dmdados.tbCPagarNumDoc.Value:=dmdados.tbComprasCodComp.AsString;
    dmdados.tbCPagarDataEmis.Value:=date;
    dmdados.tbCPagarCodFor.Value:=dmdados.tbComprasCodFor.Value;
    dmdados.tbCPagarCodComp.Value:=dmdados.tbComprasCodComp.Value;
    dmdados.tbCPagarCompHist.Value:='Pedido do dia '+
                                     DateToStr(dmdados.tbComprasDataComp.Value)+
                                     ' �s '+TimeToStr(dmdados.tbComprasHoraComp.Value);
    dmdados.tbCPagarDataVenc.Value:=dtVenc[c];
    dmdados.tbCPagarValor.Value:=VlParc[c];
    dmdados.tbCPagarPago.Value:='ABERTO';
    dmdados.tbCPagar.Post;
    end;
  dmdados.tbDetCompras.Filtered:=false;
  Close;
end;

procedure TfrmPagaPedido.dtVencimentoExit(Sender: TObject);
begin
  if edtParcelas.Value=1 then
    begin
    dtVenc1.Date:=dtVencimento.Date;
    dtVenc[1]:=dtVenc1.Date;
    Panel3.SetFocus;
    end;
end;

end.
