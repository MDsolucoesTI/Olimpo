/////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Fechamento de Caixa
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitFechCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, DBCtrls, fcButton, fcImgBtn,
  RxGrdCpt, ExtCtrls, RXCtrls, RXDBCtrl, Buttons, jpeg, fcImager,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel, EMsgDlg, ECripto,dbTables,
  JvComponent, JvTransBtn, fcLabel, EGrad, JvLabel, JvToolEdit, JvEnterTab;

type
  TFrmFechCaixa = class(TForm)
    Bevel4: TBevel;
    dbTotPra: TDBText;
    Bevel3: TBevel;
    dbChePra: TDBText;
    dbTotVis: TDBText;
    Bevel2: TBevel;
    dnCheVis: TDBText;
    dbDinEnt: TDBText;
    dbTotAbre: TDBText;
    Bevel1: TBevel;
    dbDinAbre: TDBText;
    dbPagam: TDBText;
    dbVales: TDBText;
    dbSaiDiv: TDBText;
    Bevel5: TBevel;
    dbTotSai: TDBText;
    dbDinFecha: TDBText;
    dbCheFecha: TDBText;
    Bevel6: TBevel;
    dbTotFecha: TDBText;
    evCripto: TEvCriptografa;
    fcLabel1: TfcLabel;
    btnSair: TJvTransparentButton;
    MsgDlg: TEvMsgDlg;
    dbTicket: TDBText;
    dbContraVale: TDBText;
    JvLabel3: TJvLabel;
    JvLabel5: TJvLabel;
    JvLabel6: TJvLabel;
    JvLabel7: TJvLabel;
    JvLabel8: TJvLabel;
    JvLabel9: TJvLabel;
    JvLabel11: TJvLabel;
    JvLabel12: TJvLabel;
    JvLabel14: TJvLabel;
    JvLabel15: TJvLabel;
    JvLabel17: TJvLabel;
    JvLabel18: TJvLabel;
    JvLabel19: TJvLabel;
    JvLabel13: TJvLabel;
    JvLabel20: TJvLabel;
    JvLabel21: TJvLabel;
    JvLabel22: TJvLabel;
    JvLabel23: TJvLabel;
    JvLabel24: TJvLabel;
    JvLabel25: TJvLabel;
    JvLabel26: TJvLabel;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    dbSaiContra: TDBText;
    JvLabel4: TJvLabel;
    dbEntVale: TDBText;
    JvLabel10: TJvLabel;
    dbEntCVale: TDBText;
    JvLabel16: TJvLabel;
    dbReforco: TDBText;
    JvLabel27: TJvLabel;
    dbDifere: TDBText;
    edtData: TJvDateEdit;
    btnImprimir: TJvTransparentButton;
    LMDBackPanel2: TPanel;
    Panel3: TPanel;
    LMDBackPanel1: TPanel;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtDataExit(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFechCaixa: TFrmFechCaixa;
  Pos : Integer;

implementation

uses unitDmDados, UnitLocFunc, untRelFechaCaixa;

{$R *.dfm}

procedure TFrmFechCaixa.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmFechCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.tbCaixa.Filtered:=False;
  dmDados.tbCaixa.Close;
  Action := caFree;
end;

procedure TFrmFechCaixa.FormShow(Sender: TObject);
begin
  dmDados.tbCaixa.Open;
  dmDados.tbCaixa.Filtered := False                   ;
  dmDados.tbCaixa.Filter   := '(Status = '''+'F'+''')';
  dmDados.tbCaixa.Filtered := True                    ;
  dmDados.tbCaixa.Last;
end;

procedure TFrmFechCaixa.edtDataExit(Sender: TObject);
begin
  dmDados.tbCaixa.First;
  if not(dmdados.tbCaixa.Locate('DataMov',edtData.Text,[])) Then
    begin
    MsgDlg.MsgInformation('N�o existe Caixa nesta DATA!!!');
    edtData.SetFocus;
    end;
end;

procedure TFrmFechCaixa.btnImprimirClick(Sender: TObject);
begin
  dmDados.tbCaixa.Filtered := False                                ;
  dmDados.tbCaixa.Filter   := '(DataMov = '''+ edtData.Text + ''')';
  dmDados.tbCaixa.Filtered := True                                 ;
  qrFechaCaixa.Preview;
  dmDados.tbCaixa.Filtered := False                                ;
  dmDados.tbCaixa.Filter   := '(Status = '''+'F'+''')'             ;
  dmDados.tbCaixa.Filtered := True                                 ;
end;

end.
