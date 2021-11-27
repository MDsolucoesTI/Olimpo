//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
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
  LMDCustomParentPanel, LMDBackPanel, EMsgDlg, ECripto,dbTables;

type
  TFrmFechCaixa = class(TForm)
    RxGradientCaption1: TRxGradientCaption;
    LMDBackPanel2: TLMDBackPanel;
    RxLabel4: TRxLabel;
    Image1: TImage;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    dbUsuario: TDBEdit;
    BtnLocFunc: TfcImageBtn;
    RxLabel3: TRxLabel;
    Bevel4: TBevel;
    RxLabel5: TRxLabel;
    RxLabel9: TRxLabel;
    RxLabel14: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel8: TRxLabel;
    RxLabel10: TRxLabel;
    RxLabel11: TRxLabel;
    RxLabel12: TRxLabel;
    RxLabel15: TRxLabel;
    RxLabel17: TRxLabel;
    RxLabel18: TRxLabel;
    dbTotPra: TDBText;
    Bevel3: TBevel;
    dbCartEnt: TDBText;
    dbChePra: TDBText;
    dbTotVis: TDBText;
    Bevel2: TBevel;
    dnCheVis: TDBText;
    dbDinEnt: TDBText;
    dbTotAbre: TDBText;
    Bevel1: TBevel;
    dbCheAbre: TDBText;
    dbDinAbre: TDBText;
    LMDBackPanel3: TLMDBackPanel;
    btnFechCx: TfcImageBtn;
    btnSair: TfcImageBtn;
    RxLabel13: TRxLabel;
    RxLabel19: TRxLabel;
    dbPagam: TDBText;
    RxLabel22: TRxLabel;
    dbVales: TDBText;
    RxLabel23: TRxLabel;
    dbSaiDiv: TDBText;
    Bevel5: TBevel;
    RxLabel24: TRxLabel;
    dbTotSai: TDBText;
    RxLabel25: TRxLabel;
    RxLabel16: TRxLabel;
    dbDinFecha: TDBText;
    RxLabel20: TRxLabel;
    dbCheFecha: TDBText;
    RxLabel21: TRxLabel;
    DBText1: TDBText;
    RxLabel26: TRxLabel;
    dbCartFecha: TDBText;
    Bevel6: TBevel;
    RxLabel27: TRxLabel;
    dbTotFecha: TDBText;
    MsgDlg: TEvMsgDlg;
    dbCodUsu: TEdit;
    dbSenha: TEdit;
    evCripto: TEvCriptografa;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnFechCxClick(Sender: TObject);
    procedure dbCodUsuExit(Sender: TObject);
    procedure BtnLocFuncClick(Sender: TObject);
    procedure dbSenhaExit(Sender: TObject);
    procedure dbSenhaEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFechCaixa: TFrmFechCaixa;
  Pos : Integer;

implementation

uses unitDmDados;

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
  dmDados.tbFunc.Close;
end;

procedure TFrmFechCaixa.FormShow(Sender: TObject);
begin
  dmDados.tbCaixa.Open;
  dmDados.tbFunc.Open;
  dmDados.tbCaixa.Filtered:=False;
  dmDados.tbCaixa.Filter:='(Status = '''+'A'+''')';
  dmDados.tbCaixa.Filtered:=True;
end;

procedure TFrmFechCaixa.btnFechCxClick(Sender: TObject);
begin
  dmDados.tbCaixa.Edit;
  dmDados.tbCaixaStatus.Value:='F';
  dmDados.tbCaixa.Post;
  Close;
end;

procedure TFrmFechCaixa.dbCodUsuExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbCaixa.DatabaseName;
  Tabela.TableName := dmDados.tbCaixa.TableName;
  Tabela.IndexName := dmdados.tbCaixa.IndexName;
  Tabela.Open;
  if not Tabela.Locate('CodFunc',dbCodUsu.Text,[]) then
    begin
    MsgDlg.MsgInformation('N�o existe caixa ABERTO para este funcion�rio');
    dbCodUsu.Clear;
    dbCodUsu.SetFocus;
    end
  else
    Pos:=Tabela.RecNo;
end;

procedure TFrmFechCaixa.BtnLocFuncClick(Sender: TObject);
begin
  {FrmLocFunc:=TFrmLocFunc.Create(Application);
  FrmLocFunc.Showmodal;
  dmdados.tbFuncEstoCodFunc.Value:=frmLocFunc.Resultado;
  FrmLocFunc.Free;}
end;

procedure TFrmFechCaixa.dbSenhaExit(Sender: TObject);
begin
  if dmDados.tbSenha.Locate('CodFunc',dbCodUsu.Text,[]) then
    if EvCripto.CriptoBinToText(dmDados.tbSenhaSenha.AsString) = dbSenha.Text then
      begin
      dmDados.tbCaixa.RecNo:=Pos;
      btnFechCx.Enabled:=True;
      end
    else
      begin
      MsgDlg.MsgError('A senha informada n�o � v�lida.');
      dbSenha.Clear;
      dbSenha.SetFocus;
      end
  else
    begin
    MsgDlg.MsgError('Funcion�rio n�o tem CADASTRO DE USU�RIO.');
    dbCodUsu.Enabled:=True;
    dbCodUsu.Clear;
    dbCodUsu.SetFocus;
    end;
end;

procedure TFrmFechCaixa.dbSenhaEnter(Sender: TObject);
begin
  dbCodUsu.Enabled:=False;
end;

end.
