//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitBaixaLoteCP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, RxMenus, RxGrdCpt, ToolEdit, RXDBCtrl, CurrEdit,
  StdCtrls, Mask, Grids, DBGrids, RXCtrls, fcButton, fcImgBtn, ExtCtrls,
  jpeg, fcImager, DBCtrls, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel, LMDBaseEdit,
  LMDCustomMemo, LMDMemo, EMsgDlg, fcLabel, JvPanel, JvTransparentPanel,
  JvLabel, LMDControl, LMDBaseControl, LMDBaseGraphicControl, LMDBaseShape,
  LMDShapeControl, JvComponent, JvTransBtn;

type
  TFrmBaixaLoteCP = class(TForm)
    RxPopupMenu1: TRxPopupMenu;
    DefinirJurosMulta1: TMenuItem;
    Desconto1: TMenuItem;
    ZerarJurosMulta1: TMenuItem;
    ZerarDesconto1: TMenuItem;
    LMDBackPanel2: TLMDBackPanel;
    LMDBackPanel1: TLMDBackPanel;
    dbgridBaixaCP: TRxDBGrid;
    LMDBackPanel3: TLMDBackPanel;
    fcLabel1: TfcLabel;
    MsgDlg: TEvMsgDlg;
    dbObs: TLMDMemo;
    LMDShapeControl1: TLMDShapeControl;
    JvLabel1: TJvLabel;
    dbDtReceb: TDBDateEdit;
    edtSubTot: TCurrencyEdit;
    edtJuros: TCurrencyEdit;
    edtDesc: TCurrencyEdit;
    edtTotal: TCurrencyEdit;
    dbVlPg: TRxDBCalcEdit;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    JvLabel6: TJvLabel;
    btnSelConta: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    btnBaixa: TJvTransparentButton;
    JvLabel7: TJvLabel;
    JvLabel8: TJvLabel;
    procedure btnSelContaClick(Sender: TObject);
    procedure btnBaixaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBaixaLoteCP: TFrmBaixaLoteCP;

implementation

uses UnitTipoReceb, UnitSelecCP, UnitTipoPagto;

{$R *.dfm}

procedure TFrmBaixaLoteCP.btnSelContaClick(Sender: TObject);
begin
  FrmSelecCP:=TFrmSelecCP.create(application);
  FrmSelecCP.show;
end;

procedure TFrmBaixaLoteCP.btnBaixaClick(Sender: TObject);
begin
  FrmTipoPgto:=TFrmTipoPgto.create(application);
  FrmTipoPgto.show;
end;

procedure TFrmBaixaLoteCP.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
