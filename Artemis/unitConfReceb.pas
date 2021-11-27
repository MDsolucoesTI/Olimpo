//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitConfReceb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, RackCtls, fcButton, fcImgBtn, RXSplit, Grids,variants,
  DBGrids, Mask, DBCtrls, RXCtrls, SpeedBar, jpeg, SRColBtn, EnhEdit,
  CurrEdit, ToolEdit, db, RxLookup, ComCtrls, RxDBComb, EFocCol, EExtenso,
  RxGrdCpt, fcImager, LMDControl, LMDBaseControl, LMDBaseGraphicButton,
  LMDCustomShapeButton, LMDShapeButton, RXDBCtrl;

type
  TFrmConfReceb = class(TForm)
    cbPagto: TPanel;
    Panel3: TPanel;
    RxLabel4: TRxLabel;
    Image1: TImage;
    RxGradientCaption2: TRxGradientCaption;
    btnDinheiro: TLMDShapeButton;
    btnCheque: TLMDShapeButton;
    btnCartao: TLMDShapeButton;
    fcImager1: TfcImager;
    fcImager2: TfcImager;
    PanelDinh: TPanel;
    fcImager4: TfcImager;
    btnBanco: TLMDShapeButton;
    RxLabel2: TRxLabel;
    PanelCheq: TPanel;
    fcImager5: TfcImager;
    RxLabel7: TRxLabel;
    dbNum: TDBEdit;
    RxLabel16: TRxLabel;
    dbLookBanc: TDBLookupComboBox;
    RxLabel3: TRxLabel;
    dbNumCheq: TDBEdit;
    RxLabel5: TRxLabel;
    checkPre: TDBCheckBox;
    dbBomPara: TDBDateEdit;
    RxLabel6: TRxLabel;
    RxLabel8: TRxLabel;
    edtValor: TCurrencyEdit;
    PanelCartao: TPanel;
    fcImager6: TfcImager;
    RxLabel10: TRxLabel;
    RxLabel14: TRxLabel;
    dbLookupCartao: TDBLookupComboBox;
    CurrencyEdit1: TCurrencyEdit;
    RxLabel1: TRxLabel;
    edtTotal: TCurrencyEdit;
    RxLabel9: TRxLabel;
    Panel4: TPanel;
    fcImager3: TfcImager;
    btnSair: TfcImageBtn;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    PanelFrente: TPanel;
    fcImager7: TfcImager;
    Panel1: TPanel;
    fcImager8: TfcImager;
    RxLabel11: TRxLabel;
    lookCC: TRxLookupEdit;
    dbBanco: TDBEdit;
    RxLabel12: TRxLabel;
    RxLabel13: TRxLabel;
    edtVlReceb: TCurrencyEdit;
    procedure SRColorButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnsairClick(Sender: TObject);
    procedure btnChequeClick(Sender: TObject);
    procedure btnBancoClick(Sender: TObject);
    procedure btnDinheiroClick(Sender: TObject);
    procedure btnCartaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfReceb: TFrmConfReceb;

implementation

uses UnitDmdados, UnitBaixaCReceber,unitCreceber, UnitPrincipal;

{$R *.DFM}

procedure TFrmConfReceb.SRColorButton4Click(Sender: TObject);
begin
     Close;
end;

procedure TFrmConfReceb.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//frmPrincipal.statusteclas(False,'');
Action:= Cafree;
end;

procedure TFrmConfReceb.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    end;
end;

procedure TFrmConfReceb.btnsairClick(Sender: TObject);
begin
Close;
end;

procedure TFrmConfReceb.btnChequeClick(Sender: TObject);
begin
  PanelFrente.Visible:=False;
  PanelDinh.Visible:=False;
  PanelCheq.Visible:=True;
  PanelCartao.Visible:=False;
  //PanelDep.Visible:=False;
end;

procedure TFrmConfReceb.btnBancoClick(Sender: TObject);
begin
  PanelFrente.Visible:=False;
  PanelDinh.Visible:=False;
  PanelCheq.Visible:=False;
  PanelCartao.Visible:=False;
  //PanelDep.Visible:=True;
end;

procedure TFrmConfReceb.btnDinheiroClick(Sender: TObject);
begin
  PanelFrente.Visible:=False;
  PanelDinh.Visible:=True;
  PanelCheq.Visible:=False;
  PanelCartao.Visible:=False;
  //PanelDep.Visible:=False;

end;

procedure TFrmConfReceb.btnCartaoClick(Sender: TObject);
begin
  PanelFrente.Visible:=False;
  PanelDinh.Visible:=False;
  PanelCheq.Visible:=False;
  PanelCartao.Visible:=True;
  //PanelDep.Visible:=False;
end;

end.
