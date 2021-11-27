//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Localiza��o de Vendas
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitLocVenda;

interface
                            
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, fcButton, fcImgBtn, RXSplit, Grids, DBGrids, RackCtls,
  ExtCtrls, RXCtrls, jpeg,Db,dbUtils, RXDBCtrl, LMDCustomComponent,
  LMDCustomHint, LMDCustomShapeHint, LMDShapeHint, RxGrdCpt, fcImager,
  EMsgDlg, Mask, ToolEdit,Variants;

type
  TFrmLocVenda = class(TForm)
    Panel1: TPanel;
    RxLabel3: TRxLabel;
    RxLabel1: TRxLabel;
    Panel2: TPanel;
    RxLabel4: TRxLabel;
    Image3: TImage;
    MsgDlg: TEvMsgDlg;
    edtDataVenda: TDateEdit;
    edtCodigo: TEdit;
    Panel3: TPanel;
    fclLocVenda: TfcImageBtn;
    fclSair: TfcImageBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure fclSairClick(Sender: TObject);
    procedure fclLocVendaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

  public
    { Public declarations }
  end;

var
  FrmLocVenda: TFrmLocVenda;
  habilitaTeclado : boolean=true;

implementation

uses UnitDmDados, unitPrincipal;

{$R *.DFM}

procedure TFrmLocVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;


procedure TFrmLocVenda.fclSairClick(Sender: TObject);
begin
  Close;
end;


procedure TFrmLocVenda.fclLocVendaClick(Sender: TObject);
begin
  If not dmdados.tbVendas.locate('DataVen;CodVen',VarArrayOf([edtDataVenda.Text,edtCodigo.Text]),[]) Then
    begin
    MsgDlg.MsgInformation('N�o foi encontrado a VENDA informada');
    edtCodigo.SetFocus;
    end
  else
    Close;
end;

procedure TFrmLocVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    fclSair.Click;
  if Key=VK_F10 then
    fclLocVenda.Click;
end;

procedure TFrmLocVenda.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[F10] Localizar [ESC] Sai');
end;

procedure TFrmLocVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.StatusTeclas(False,'');
  Action:=caFree;
end;

end.
