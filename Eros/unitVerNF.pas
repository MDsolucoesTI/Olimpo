//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Visualizar Nota Fiscal
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitVerNF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, SpeedBar, jpeg, ExtCtrls, StdCtrls, RackCtls, fcButton,db,
  fcImgBtn, RXSplit, Mask, DBCtrls, RXCtrls, ToolEdit, CurrEdit, RXDBCtrl,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDShapeHint,
  ELibFnc;

type
  TfrmVerNF = class(TForm)
    Panel1: TPanel;
    RxSplitter1: TRxSplitter;
    Image1: TImage;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnPrimeiro: TSpeedItem;
    BtnAnterior: TSpeedItem;
    BtnProximo: TSpeedItem;
    BtnUltimo: TSpeedItem;
    BtnSair: TSpeedItem;
    gridNF: TDBGrid;
    Panel2: TPanel;
    btnNF: TSpeedItem;
    RxLabel2: TRxLabel;
    btnLocFunc: TfcImageBtn;
    RxLabel3: TRxLabel;
    dbNomeCli: TDBEdit;
    RxLabel4: TRxLabel;
    edtCodCli: TDBEdit;
    DtZera: TDateEdit;
    EvLibFunctions1: TEvLibFunctions;
    procedure btnLocFuncClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnNFClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridNFCellClick(Column: TColumn);
    procedure edtCodCliExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVerNF: TfrmVerNF;
  NovoItem:Boolean;
  NumDet, N_NF : integer;
  PosReg : array[1..10] of integer;

implementation

uses UnitDmDados, unitLocCliente, UnitNF, unitQRNF, UnitPrincipal,
  unitEmitirNF;

{$R *.DFM}

procedure TfrmVerNF.btnLocFuncClick(Sender: TObject);
begin
  FrmLocCliente:=TFrmLocCliente.Create(Application);
  FrmLocCliente.Showmodal;
  dmdados.tbClinota.RecNo:=dmdados.tbCliente.RecNo;
  FrmLocCliente.Free;
end;

procedure TfrmVerNF.BtnPrimeiroClick(Sender: TObject);
begin
  DMDados.tbCliNota.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
end;

procedure TfrmVerNF.BtnAnteriorClick(Sender: TObject);
begin
  DMDados.tbCliNota.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If DMDados.tbCliNota.Bof Then
    Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    End;
end;

procedure TfrmVerNF.BtnProximoClick(Sender: TObject);
begin
  DMDados.tbCliNota.Next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If DMDados.tbCliNota.Eof Then
    Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    End;
end;

procedure TfrmVerNF.BtnUltimoClick(Sender: TObject);
begin
  DMDados.tbCliNota.Last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
end;

procedure TfrmVerNF.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmVerNF.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;

end;

procedure TfrmVerNF.btnNFClick(Sender: TObject);
begin
{btnNF.enabled:=true;
//habilitando objetos conforme informa��es da tabela
//***qtde***
FrmInfNF:=TFrmInfNF.Create(Application);
if dmdados.tbVisDetNFQt1.Value=0 then
   begin
   frmInfNF.dbicm1.visible:=false;
   frmInfNF.dbQ1.visible:=false;
   end;
if dmdados.tbVisDetNFQt2.Value=0 then
   begin
   frmInfNF.dbicm2.visible:=false;
   frmInfNF.dbQ2.visible:=false;
   end;
if dmdados.tbVisDetNFQt3.Value=0 then
   begin
   frmInfNF.dbicm3.visible:=false;
   frmInfNF.dbQ3.visible:=false;
   end;
if dmdados.tbVisDetNFQt4.Value=0 then
   begin
   frmInfNF.dbicm4.visible:=false;
   frmInfNF.dbQ4.visible:=false;
   end;
if dmdados.tbVisDetNFQt5.Value=0 then
   begin
   frmInfNF.dbicm5.visible:=false;
   frmInfNF.dbQ5.visible:=false;
   end;
if dmdados.tbVisDetNFQt6.Value=0 then
   begin
   frmInfNF.dbQ6.visible:=false;
   frmInfNF.dbicm6.visible:=false;
   end;
if dmdados.tbVisDetNFQt7.Value=0 then
   begin
   frmInfNF.dbicm7.visible:=false;
   frmInfNF.dbQ7.visible:=false;
   end;
if dmdados.tbVisDetNFQt8.Value=0 then
   begin
   frmInfNF.dbicm8.visible:=false;
   frmInfNF.dbQ8.visible:=false;
   end;
if dmdados.tbVisDetNFQt9.Value=0 then
   begin
   frmInfNF.dbicm9.visible:=false;
   frmInfNF.dbQ9.visible:=false;
   end;

if dmdados.tbVisDetNFQt10.Value=0 then
   begin
   frmInfNF.dbicm10.visible:=false;
   frmInfNF.dbQ10.visible:=false;
   end;
//***pre�o***
if dmdados.tbVisDetNFPunit1.Value=0 then
   frmInfNF.dbvu1.visible:=false;
if dmdados.tbVisDetNFPunit2.Value=0 then
   frmInfNF.dbvu2.visible:=false;
if dmdados.tbVisDetNFPunit3.Value=0 then
   frmInfNF.dbvu3.visible:=false;
if dmdados.tbVisDetNFPunit4.Value=0 then
   frmInfNF.dbvu4.visible:=false;
if dmdados.tbVisDetNFPunit5.Value=0 then
   frmInfNF.dbvu5.visible:=false;
if dmdados.tbVisDetNFPunit6.Value=0 then
   frmInfNF.dbvu6.visible:=false;
if dmdados.tbVisDetNFPunit7.Value=0 then
   frmInfNF.dbvu7.visible:=false;
if dmdados.tbVisDetNFPunit8.Value=0 then
   frmInfNF.dbvu8.visible:=false;
if dmdados.tbVisDetNFPunit9.Value=0 then
   frmInfNF.dbvu9.visible:=false;
if dmdados.tbVisDetNFPunit10.Value=0 then
   frmInfNF.dbvu10.visible:=false;
//***Valor unit�rio***
if dmdados.tbVisDetNFvrTot1.Value=0 then
   frmInfNF.dbtot1.visible:=false;
if dmdados.tbVisDetNFvrTot2.Value=0 then
   frmInfNF.dbtot2.visible:=false;
if dmdados.tbVisDetNFvrTot3.Value=0 then
   frmInfNF.dbtot3.visible:=false;
if dmdados.tbVisDetNFvrTot4.Value=0 then
   frmInfNF.dbtot4.visible:=false;
if dmdados.tbVisDetNFvrTot5.Value=0 then
   frmInfNF.dbtot5.visible:=false;
if dmdados.tbVisDetNFvrTot6.Value=0 then
   frmInfNF.dbtot6.visible:=false;
if dmdados.tbVisDetNFvrTot7.Value=0 then
   frmInfNF.dbtot7.visible:=false;
if dmdados.tbVisDetNFvrTot8.Value=0 then
   frmInfNF.dbtot8.visible:=false;
if dmdados.tbVisDetNFvrTot9.Value=0 then
   frmInfNF.dbtot9.visible:=false;
if dmdados.tbVisDetNFvrTot10.Value=0 then
   frmInfNF.dbtot10.visible:=false;
//***icms




FrmInfNF.ShowModal;   }
end;

procedure TfrmVerNF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  Action:=caFree;
end;

procedure TfrmVerNF.FormShow(Sender: TObject);
begin
FrmPrincipal.StatusTeclas(True,'[F2] Localizar Cliente [F3] Nota Fiscal [Esc] Cancelar ou Sair');
edtCodCli.SetFocus;
end;

procedure TfrmVerNF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnSair.Click
                  else BtnSair.Click;
      VK_F2     : btnLocFunc.Click;
      VK_F3     : btnNF.Click;
    end;
end;

procedure TfrmVerNF.gridNFCellClick(Column: TColumn);
begin
btnNF.enabled:=true;
end;

procedure TfrmVerNF.edtCodCliExit(Sender: TObject);
begin
gridNF.Enabled:=true;
end;

end.
