//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Cadastro e Manuten��o de Planos de Pagamento
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCancelCR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, fcButton, fcImgBtn, JvLookup, StdCtrls, Mask, ToolEdit,
  RXDBCtrl, LMDCustomGroupBox, LMDCustomButtonGroup, LMDCustomRadioGroup,
  LMDRadioGroup, Grids, BaseGrid, AdvGrid, JvComponent, JvTransBtn,
  JvLabel, LMDControl, LMDBaseControl, LMDBaseGraphicControl, LMDBaseShape,
  LMDShapeControl, fcLabel, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel,
  LMDCustomComponent, lmdcont;

type
  TFrmCancelCR = class(TForm)
    LMDBitmapList1: TLMDBitmapList;
    LMDBackPanel2: TLMDBackPanel;
    fcLabel1: TfcLabel;
    LMDBackPanel1: TLMDBackPanel;
    LMDShapeControl1: TLMDShapeControl;
    JvLabel10: TJvLabel;
    JvLabel1: TJvLabel;
    btnConfirmar: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    StringCancelCR: TAdvStringGrid;
    RadioGrup: TLMDRadioGroup;
    dbDtFin: TDBDateEdit;
    dbDtIn: TDBDateEdit;
    cmblkCliente: TJvDBLookupCombo;
    btnLocCli: TfcImageBtn;
    EvMsgDlg1: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCancelCR: TFrmCancelCR;

implementation

{$R *.dfm}

procedure TFrmCancelCR.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCancelCR.FormShow(Sender: TObject);
begin
  StringCancelCR.Cells[0,0]:='N.� Doc';
  StringCancelCR.Cells[1,0]:='Data';
  StringCancelCR.Cells[2,0]:='Descri��o';
  StringCancelCR.Cells[3,0]:='Data Pagto';
  StringCancelCR.Cells[4,0]:='Total Receb.';
  StringCancelCR.Cells[5,0]:='Cancelar?';
end;

end.
