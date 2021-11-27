//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCReceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SpeedBar, jpeg, ExtCtrls, fcButton, fcImgBtn, ToolWin, ComCtrls, RXCtrls,
  RXSplit, StdCtrls, DBCtrls, Mask, ToolEdit, RXDBCtrl, CurrEdit, SRColBtn,
  TFlatCheckBoxUnit, Spin, RackCtls;

type
  TFrmCReceber = class(TForm)
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnPrimeiro: TSpeedItem;
    BtnAnterior: TSpeedItem;
    BtnProximo: TSpeedItem;
    BtnUltimo: TSpeedItem;
    BtnNovo: TSpeedItem;
    BtnGravar: TSpeedItem;
    BtnCancelar: TSpeedItem;
    BtnAlterar: TSpeedItem;
    BtnDeletar: TSpeedItem;
    BtnLocalizar: TSpeedItem;
    BtnSair: TSpeedItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    RxLabel10: TRxLabel;
    RxLabel8: TRxLabel;
    DBDateEditDPg: TDBDateEdit;
    RxDBCalcEditVlPago: TRxDBCalcEdit;
    DBEditSituacao: TDBEdit;
    ImageBaixa: TfcImageBtn;
    ImageRestaurar: TfcImageBtn;
    Panel5: TPanel;
    fcImageBtn4: TfcImageBtn;
    CheckDesc: TCheckBox;
    Panel6: TPanel;
    RxLabel11: TRxLabel;
    RxLabel12: TRxLabel;
    RxLabel14: TRxLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    DBDateEditDiaDesc: TDBDateEdit;
    DBEValorDesc: TDBEdit;
    DBEPerc: TDBEdit;
    CheckMulta: TCheckBox;
    Panel7: TPanel;
    RxLabel13: TRxLabel;
    RxLabel15: TRxLabel;
    RxLabel16: TRxLabel;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    DBDateEditDiaMulta: TDBDateEdit;
    DBEValorMulta: TDBEdit;
    DBEPercMulta: TDBEdit;
    CheckJuros: TCheckBox;
    Panel8: TPanel;
    RxLabel17: TRxLabel;
    RxLabel18: TRxLabel;
    RxLabel19: TRxLabel;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    DBDateEditDiaJuros: TDBDateEdit;
    DBEValorJuros: TDBEdit;
    DBEPercJuros: TDBEdit;
    ScrewPanel1: TScrewPanel;
    Label1: TLabel;
    Image1: TImage;
    Image2: TImage;
    Label2: TLabel;
    Panel3: TPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel20: TRxLabel;
    RxLabel21: TRxLabel;
    DBEndoc: TDBEdit;
    DBComboTipoDoc: TDBComboBox;
    DBComboCliente: TDBComboBox;
    ImageLocCliente: TfcImageBtn;
    DBDateEditEmis: TDBDateEdit;
    DBDateEditVenc: TDBDateEdit;
    RxDBCalcEditValor: TRxDBCalcEdit;
    DBComboCCusto: TDBComboBox;
    ImageLocCCusto: TfcImageBtn;
    DBLookupHist: TDBLookupComboBox;
    fcImageBtn1: TfcImageBtn;
    DBEdit1: TDBEdit;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBEndocEnter(Sender: TObject);
    procedure DBEndocExit(Sender: TObject);
    procedure DBComboTipoDocEnter(Sender: TObject);
    procedure DBComboTipoDocExit(Sender: TObject);
    procedure DBComboClienteExit(Sender: TObject);
    procedure DBComboClienteEnter(Sender: TObject);
    procedure DBComboCCustoEnter(Sender: TObject);
    procedure DBComboCCustoExit(Sender: TObject);
    procedure DBMemoHistExit(Sender: TObject);
    procedure DBMemoHistEnter(Sender: TObject);
    procedure DBDateEditEmisEnter(Sender: TObject);
    procedure DBDateEditEmisExit(Sender: TObject);
    procedure RxDBCalcEditValorEnter(Sender: TObject);
    procedure RxDBCalcEditValorExit(Sender: TObject);
    procedure DBDateEditVencEnter(Sender: TObject);
    procedure DBDateEditVencExit(Sender: TObject);
    procedure DBDateEditDPgEnter(Sender: TObject);
    procedure DBDateEditDPgExit(Sender: TObject);
    procedure DBEditBaixaEnter(Sender: TObject);
    procedure DBEditBaixaExit(Sender: TObject);
    procedure RxDBCalcEditVlPagoEnter(Sender: TObject);
    procedure RxDBCalcEditVlPagoExit(Sender: TObject);
    procedure DBDateEditDiaDescEnter(Sender: TObject);
    procedure DBDateEditDiaDescExit(Sender: TObject);
    procedure DBEValorDescEnter(Sender: TObject);
    procedure DBEValorDescExit(Sender: TObject);
    procedure DBEPercEnter(Sender: TObject);
    procedure DBEPercExit(Sender: TObject);
    procedure DBDateEditDiaMultaEnter(Sender: TObject);
    procedure DBDateEditDiaMultaExit(Sender: TObject);
    procedure DBEValorMultaEnter(Sender: TObject);
    procedure DBEValorMultaExit(Sender: TObject);
    procedure DBDateEditDiaJurosEnter(Sender: TObject);
    procedure DBDateEditDiaJurosExit(Sender: TObject);
    procedure DBEValorJurosEnter(Sender: TObject);
    procedure DBEValorJurosExit(Sender: TObject);
    procedure DBEPercJurosEnter(Sender: TObject);
    procedure DBEPercJurosExit(Sender: TObject);
    procedure ImageBaixaClick(Sender: TObject);
    procedure DBLookupHistEnter(Sender: TObject);
    procedure DBLookupHistExit(Sender: TObject);
    procedure DBEPercMultaEnter(Sender: TObject);
    procedure DBEPercMultaExit(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure DBComboQtdParcEnter(Sender: TObject);
    procedure DBComboQtdParcExit(Sender: TObject);
    procedure DBComboBox1Enter(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure SpinEdit1Enter(Sender: TObject);
    procedure SpinEdit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCReceber: TFrmCReceber;

implementation

uses UnitBaixaCReber, UnitLocCReceber, UnitDmdados;

{$R *.DFM}

procedure TFrmCReceber.BtnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmCReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:= Cafree;
end;

procedure TFrmCReceber.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmCReceber.DBEndocEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clTEAL;
end;

procedure TFrmCReceber.DBEndocExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clwindow;
end;

procedure TFrmCReceber.DBComboTipoDocEnter(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clTEAL;
end;

procedure TFrmCReceber.DBComboTipoDocExit(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clWindow;
end;

procedure TFrmCReceber.DBComboClienteExit(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clWindow;
end;

procedure TFrmCReceber.DBComboClienteEnter(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clTEAL;
end;

procedure TFrmCReceber.DBComboCCustoEnter(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clTEAL;
end;

procedure TFrmCReceber.DBComboCCustoExit(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clWindow;
end;

procedure TFrmCReceber.DBMemoHistExit(Sender: TObject);
begin
(Sender as TDbMemo).Color:=clWindow;
end;

procedure TFrmCReceber.DBMemoHistEnter(Sender: TObject);
begin
(Sender as TDbMemo).Color:=clTEAL;
end;

procedure TFrmCReceber.DBDateEditEmisEnter(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=clTEAL;
end;

procedure TFrmCReceber.DBDateEditEmisExit(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=clWindow;
end;

procedure TFrmCReceber.RxDBCalcEditValorEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).Color:=clTEAL;
end;

procedure TFrmCReceber.RxDBCalcEditValorExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).Color:=clWindow;
end;

procedure TFrmCReceber.DBDateEditVencEnter(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=clTEAL;
end;

procedure TFrmCReceber.DBDateEditVencExit(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=clWindow;
end;

procedure TFrmCReceber.DBDateEditDPgEnter(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=clTEAL;
end;

procedure TFrmCReceber.DBDateEditDPgExit(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=clWindow;
end;

procedure TFrmCReceber.DBEditBaixaEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clTEAL;
end;

procedure TFrmCReceber.DBEditBaixaExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCReceber.RxDBCalcEditVlPagoEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).Color:=clTEAL;
end;

procedure TFrmCReceber.RxDBCalcEditVlPagoExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).Color:=clWindow;
end;

procedure TFrmCReceber.DBDateEditDiaDescEnter(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=clTEAL;
end;

procedure TFrmCReceber.DBDateEditDiaDescExit(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=clWindow;
end;

procedure TFrmCReceber.DBEValorDescEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clTEAL;
end;

procedure TFrmCReceber.DBEValorDescExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCReceber.DBEPercEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clTEAL;
end;

procedure TFrmCReceber.DBEPercExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCReceber.DBDateEditDiaMultaEnter(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=clTEAL;
end;

procedure TFrmCReceber.DBDateEditDiaMultaExit(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=clWindow;
end;

procedure TFrmCReceber.DBEValorMultaEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clTEAL;
end;

procedure TFrmCReceber.DBEValorMultaExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCReceber.DBDateEditDiaJurosEnter(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=clTEAL;
end;

procedure TFrmCReceber.DBDateEditDiaJurosExit(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=clWindow;
end;

procedure TFrmCReceber.DBEValorJurosEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clTEAL;
end;

procedure TFrmCReceber.DBEValorJurosExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCReceber.DBEPercJurosEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clTEAL;
end;

procedure TFrmCReceber.DBEPercJurosExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCReceber.ImageBaixaClick(Sender: TObject);
begin
FrmBaixaCReceber:=TFrmBaixaCReceber.Create(Application);
FrmBaixaCReceber.ShowModal;
end;

procedure TFrmCReceber.DBLookupHistEnter(Sender: TObject);
begin
(Sender as TDbLookupComboBox).Color:=clTEAL;
end;

procedure TFrmCReceber.DBLookupHistExit(Sender: TObject);
begin
(Sender as TDbLookupComboBox).Color:=clWindow;
end;

procedure TFrmCReceber.DBEPercMultaEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clTEAL;
end;

procedure TFrmCReceber.DBEPercMultaExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clwindow;
end;

procedure TFrmCReceber.BtnLocalizarClick(Sender: TObject);
begin
FrmLocCreceber:=TFrmLocCReceber.Create(Application);
FrmLocCReceber.ShowModal;
end;

procedure TFrmCReceber.DBComboQtdParcEnter(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clTEAL;
end;

procedure TFrmCReceber.DBComboQtdParcExit(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clWindow;
end;

procedure TFrmCReceber.DBComboBox1Enter(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clTEAL;
end;

procedure TFrmCReceber.DBComboBox1Exit(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clWindow;
end;

procedure TFrmCReceber.SpinEdit1Enter(Sender: TObject);
begin
(Sender as TSpinEdit).Color:=clTeal;
end;

procedure TFrmCReceber.SpinEdit1Exit(Sender: TObject);
begin
(Sender as TSpinEdit).Color:=clWindow;
end;

end.
