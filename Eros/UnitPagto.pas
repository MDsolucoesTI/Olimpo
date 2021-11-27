//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Registro do Tipo de Pagamento
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDControl, LMDBaseControl, LMDBaseGraphicControl, LMDBaseShape,
  LMDShapeControl, StdCtrls, LMDBaseEdit, LMDCustomMemo, LMDMemo, Grids,
  BaseGrid, AdvGrid, EMsgDlg, fcLabel, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel, ImgList, Menus,
  RxMenus, JvToolEdit, JvCurrEdit, JvDBCtrl, Mask, ToolEdit, CurrEdit,
  RXCtrls, RXDBCtrl, JvComponent, JvTransBtn;

type
  TFrmPagto = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    fcLabel2: TfcLabel;
    MsgDlg: TEvMsgDlg;
    LMDBackPanel1: TLMDBackPanel;
    EvMsgDlg1: TEvMsgDlg;
    StringPagto: TAdvStringGrid;
    MemoObs: TLMDMemo;
    Label2: TLabel;
    Label1: TLabel;
    LMDShapeControl1: TLMDShapeControl;
    popGrid: TRxPopupMenu;
    SelecionarContas1: TMenuItem;
    RetirarContas1: TMenuItem;
    N1: TMenuItem;
    DefinirJurosMulta1: TMenuItem;
    Desconto1: TMenuItem;
    ZerarJurosMulta1: TMenuItem;
    ZerarDesconto1: TMenuItem;
    imgPopGrid: TImageList;
    edtSubTot: TCurrencyEdit;
    edtDesc: TCurrencyEdit;
    edtJuros: TCurrencyEdit;
    edtTotal: TCurrencyEdit;
    dbVlPg: TJvDBCalcEdit;
    dbDtPgto: TDBDateEdit;
    RxLabel3: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    btnSelPagto: TJvTransparentButton;
    btnReceb: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    RxLabel7: TRxLabel;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSelPagtoClick(Sender: TObject);
    procedure btnRecebClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPagto: TFrmPagto;

implementation

uses UnitSelCP, UnitDetConta;

{$R *.dfm}

procedure TFrmPagto.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPagto.FormShow(Sender: TObject);
begin
    StringPagto.Cells[0,0]:='N.� Doc';
    StringPagto.Cells[1,0]:='Descri��o';
    StringPagto.Cells[2,0]:='Vcto.';
    StringPagto.Cells[3,0]:='Atraso';
    StringPagto.Cells[4,0]:='Desconto';
    StringPagto.Cells[5,0]:='Juros+Multa';
    StringPagto.Cells[6,0]:='Valor (R$)';
end;

procedure TFrmPagto.btnSelPagtoClick(Sender: TObject);
begin
    FrmSelCP:=TFrmSelCP.Create(application);
    FrmSelCP.Show;
end;

procedure TFrmPagto.btnRecebClick(Sender: TObject);
begin
  if dbVlPg.Value < edtTotal.Value then
    FrmDetConta:=TFrmDetConta.Create(application);
    FrmDetConta.Showmodal;
  if dbVlPg.Value >= edtTotal.Value then
    //FrmTipoPagto:=TFrmTipoPagto.Create(application);
    //FrmTipoPagto.Showmodal;
end;

end.
