//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitRebConta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxGrdCpt, ExtCtrls, RXCtrls, jpeg, fcImager, fcButton, fcImgBtn,
  StdCtrls, Grids, DBGrids, RXDBCtrl, CurrEdit, Mask, ToolEdit, Menus,
  RxMenus;

type
  TFrmBaixaLoteCR = class(TForm)
    Panel1: TPanel;
    fcImager3: TfcImager;
    RxLabel4: TRxLabel;
    Image3: TImage;
    RxGradientCaption2: TRxGradientCaption;
    Panel3: TPanel;
    fcImager1: TfcImager;
    btnSelConta: TfcImageBtn;
    btnSair: TfcImageBtn;
    Panel2: TPanel;
    fcImager2: TfcImager;
    dbgridBaixa: TRxDBGrid;
    RxDBGrid1: TRxDBGrid;
    lbcliente: TRxLabel;
    RxLabel1: TRxLabel;
    Panel4: TPanel;
    lblimite: TRxLabel;
    edtSubTot: TCurrencyEdit;
    edtJuros: TCurrencyEdit;
    RxLabel2: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel6: TRxLabel;
    dbVlPg: TRxDBCalcEdit;
    RxLabel3: TRxLabel;
    edtDesc: TCurrencyEdit;
    RxLabel5: TRxLabel;
    edtTotal: TCurrencyEdit;
    dbDtReceb: TDBDateEdit;
    btnBaixa: TfcImageBtn;
    RxPopupMenu1: TRxPopupMenu;
    DefinirJurosMulta1: TMenuItem;
    Desconto1: TMenuItem;
    ZerarJurosMulta1: TMenuItem;
    ZerarDesconto1: TMenuItem;
    procedure btnSelContaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnBaixaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBaixaLoteCR: TFrmBaixaLoteCR;

implementation

uses unitDmDados, unitBaixaLoteCR, unitConfReceb;

{$R *.dfm}

procedure TFrmBaixaLoteCR.btnSelContaClick(Sender: TObject);
begin
FrmBaixaLoteCR:=TFrmBaixaLoteCR.create(application);
FrmBaixaLoteCR.show;
end;

procedure TFrmBaixaLoteCR.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmBaixaLoteCR.btnBaixaClick(Sender: TObject);
begin
FrmConfReceb:=TFrmConfReceb.create(application);
FrmConfReceb.show;
end;

end.
