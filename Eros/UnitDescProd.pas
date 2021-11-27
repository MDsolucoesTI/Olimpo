//////////////////////////////////////////////////////////////////////////
// Criação...........: 02/2001
// Ultima modificação: 08/2004
// Módulo............: Emissão de Nota Fiscal - Dados
// Sistema...........: Eros - Controle de Vendas
// Integração........: Olimpo - Automação Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

{Nota Fiscal}
unit UnitDescProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, StdCtrls, DBCtrls, Mask, ToolEdit, CurrEdit,
  RXDBCtrl, LMDBaseGraphicButton, LMDCustomShapeButton, LMDShapeButton,
  LMDControl, LMDBaseControl, LMDBaseGraphicControl, LMDBaseShape,
  LMDShapeControl, RXCtrls, ExtCtrls, Grids, DBGrids;

type
  TFrmDescProd = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    LMDShapeControl17: TLMDShapeControl;
    RxLabel30: TRxLabel;
    LMDShapeControl22: TLMDShapeControl;
    RxLabel35: TRxLabel;
    LMDShapeControl23: TLMDShapeControl;
    LMDShapeControl24: TLMDShapeControl;
    LMDShapeControl25: TLMDShapeControl;
    RxLabel38: TRxLabel;
    LMDShapeControl27: TLMDShapeControl;
    LMDShapeControl28: TLMDShapeControl;
    RxLabel41: TRxLabel;
    LMDShapeControl29: TLMDShapeControl;
    RxLabel43: TRxLabel;
    LMDShapeControl30: TLMDShapeControl;
    RxLabel45: TRxLabel;
    RxLabel47: TRxLabel;
    LMDShapeControl34: TLMDShapeControl;
    RxLabel51: TRxLabel;
    LMDShapeControl37: TLMDShapeControl;
    dbNome: TDBEdit;
    dbEnd: TDBEdit;
    dbUfend: TDBEdit;
    btlocdoc: TfcImageBtn;
    LMDShapeControl2: TLMDShapeControl;
    RxLabel7: TRxLabel;
    RxLabel1: TRxLabel;
    dbDtEmis: TDBDateEdit;
    RxLabel2: TRxLabel;
    dbDtSaiEntr: TDBDateEdit;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    LMDShapeControl3: TLMDShapeControl;
    RxLabel6: TRxLabel;
    dbHora: TDBEdit;
    dbInsEst: TDBEdit;
    dbUF: TDBEdit;
    dbBairro: TDBEdit;
    dbFone: TDBEdit;
    dbMunic: TDBEdit;
    RxLabel8: TRxLabel;
    dbEndCobr: TDBEdit;
    LMDShapeControl1: TLMDShapeControl;
    RxLabel9: TRxLabel;
    RxLabel10: TRxLabel;
    RxLabel11: TRxLabel;
    LMDShapeControl4: TLMDShapeControl;
    LMDShapeControl5: TLMDShapeControl;
    LMDShapeControl6: TLMDShapeControl;
    RxLabel12: TRxLabel;
    RxLabel13: TRxLabel;
    RxLabel14: TRxLabel;
    LMDShapeControl7: TLMDShapeControl;
    LMDShapeControl8: TLMDShapeControl;
    LMDShapeControl9: TLMDShapeControl;
    RxLabel15: TRxLabel;
    RxLabel16: TRxLabel;
    RxLabel17: TRxLabel;
    LMDShapeControl11: TLMDShapeControl;
    LMDShapeControl12: TLMDShapeControl;
    dbNumFat2: TDBEdit;
    dbNumFat: TDBEdit;
    dbVenc3: TDBDateEdit;
    dbVenc2: TDBDateEdit;
    dbVenc1: TDBDateEdit;
    LMDShapeControl10: TLMDShapeControl;
    dbInsccnpj: TDBEdit;
    RxLabel5: TRxLabel;
    RxLabel18: TRxLabel;
    RxLabel19: TRxLabel;
    RxLabel20: TRxLabel;
    RxLabel21: TRxLabel;
    RxLabel22: TRxLabel;
    RxLabel23: TRxLabel;
    RxLabel24: TRxLabel;
    RxLabel25: TRxLabel;
    RxLabel26: TRxLabel;
    RxLabel27: TRxLabel;
    RxLabel28: TRxLabel;
    LMDShapeControl13: TLMDShapeControl;
    RxLabel29: TRxLabel;
    RxLabel31: TRxLabel;
    RxLabel32: TRxLabel;
    RxLabel33: TRxLabel;
    RxLabel34: TRxLabel;
    RxLabel36: TRxLabel;
    LMDShapeControl14: TLMDShapeControl;
    LMDShapeControl15: TLMDShapeControl;
    LMDShapeControl16: TLMDShapeControl;
    LMDShapeControl18: TLMDShapeControl;
    LMDShapeControl19: TLMDShapeControl;
    LMDShapeControl20: TLMDShapeControl;
    LMDShapeControl21: TLMDShapeControl;
    LMDShapeControl26: TLMDShapeControl;
    LMDShapeControl31: TLMDShapeControl;
    LMDShapeControl32: TLMDShapeControl;
    btnSair: TLMDShapeButton;
    LMDShapeControl33: TLMDShapeControl;
    LMDShapeControl35: TLMDShapeControl;
    LMDShapeControl36: TLMDShapeControl;
    LMDShapeControl38: TLMDShapeControl;
    LMDShapeControl39: TLMDShapeControl;
    LMDShapeControl40: TLMDShapeControl;
    LMDShapeControl41: TLMDShapeControl;
    LMDShapeControl42: TLMDShapeControl;
    LMDShapeControl43: TLMDShapeControl;
    LMDShapeControl44: TLMDShapeControl;
    LMDShapeControl45: TLMDShapeControl;
    dbcod1: TDBEdit;
    dbcod2: TDBEdit;
    dbcod3: TDBEdit;
    dbcod4: TDBEdit;
    dbcod5: TDBEdit;
    dbcod6: TDBEdit;
    dbcod7: TDBEdit;
    dbcod8: TDBEdit;
    dbcod9: TDBEdit;
    dbcod0: TDBEdit;
    dbdesc1: TDBEdit;
    dbdesc2: TDBEdit;
    dbdesc3: TDBEdit;
    dbdesc4: TDBEdit;
    dbdesc5: TDBEdit;
    dbdesc6: TDBEdit;
    dbdesc7: TDBEdit;
    dbdesc8: TDBEdit;
    dbdesc9: TDBEdit;
    dbdesc0: TDBEdit;
    dbcl1: TDBEdit;
    dbcl2: TDBEdit;
    dbcl3: TDBEdit;
    dbcl4: TDBEdit;
    dbcl5: TDBEdit;
    dbcl6: TDBEdit;
    dbcl7: TDBEdit;
    dbcl8: TDBEdit;
    dbcl9: TDBEdit;
    dbcl0: TDBEdit;
    dbsit1: TDBEdit;
    dbsit2: TDBEdit;
    dbsit3: TDBEdit;
    dbsit4: TDBEdit;
    dbsit6: TDBEdit;
    dbsit7: TDBEdit;
    dbsit8: TDBEdit;
    dbsit9: TDBEdit;
    dbsit0: TDBEdit;
    dbuni1: TDBEdit;
    dbuni2: TDBEdit;
    dbuni3: TDBEdit;
    dbuni4: TDBEdit;
    dbuni5: TDBEdit;
    dbuni6: TDBEdit;
    dbuni7: TDBEdit;
    dbuni8: TDBEdit;
    dbuni9: TDBEdit;
    dbuni0: TDBEdit;
    dbqt1: TDBEdit;
    dbqt2: TDBEdit;
    dbqt3: TDBEdit;
    dbqt4: TDBEdit;
    dbqt5: TDBEdit;
    dbqt6: TDBEdit;
    dbqt7: TDBEdit;
    dbqt8: TDBEdit;
    dbqt9: TDBEdit;
    dbqt0: TDBEdit;
    dbicms1: TDBEdit;
    dbicms2: TDBEdit;
    dbicms3: TDBEdit;
    dbicms4: TDBEdit;
    dbicms5: TDBEdit;
    dbicms6: TDBEdit;
    dbicms7: TDBEdit;
    dbicms8: TDBEdit;
    dbicms9: TDBEdit;
    dbicms0: TDBEdit;
    dbipi1: TDBEdit;
    dbipi2: TDBEdit;
    dbipi3: TDBEdit;
    dbipi4: TDBEdit;
    dbipi5: TDBEdit;
    dbipi6: TDBEdit;
    dbipi7: TDBEdit;
    dbipi8: TDBEdit;
    dbipi9: TDBEdit;
    dbipi0: TDBEdit;
    dbValor1: TRxDBCalcEdit;
    dbValor2: TRxDBCalcEdit;
    dbNum3: TDBEdit;
    dbValor3: TRxDBCalcEdit;
    dbvuni1: TRxDBCalcEdit;
    dbvuni2: TRxDBCalcEdit;
    dbvuni3: TRxDBCalcEdit;
    dbvuni4: TRxDBCalcEdit;
    dbvuni5: TRxDBCalcEdit;
    dbvuni6: TRxDBCalcEdit;
    dbvuni7: TRxDBCalcEdit;
    dbvuni8: TRxDBCalcEdit;
    dbvuni9: TRxDBCalcEdit;
    dbvuni0: TRxDBCalcEdit;
    dbvto1: TRxDBCalcEdit;
    dbvt2: TRxDBCalcEdit;
    dbvt3: TRxDBCalcEdit;
    dbvt4: TRxDBCalcEdit;
    dbvt5: TRxDBCalcEdit;
    dbvt6: TRxDBCalcEdit;
    dbvt7: TRxDBCalcEdit;
    dbvt8: TRxDBCalcEdit;
    dbvt9: TRxDBCalcEdit;
    dbv0: TRxDBCalcEdit;
    dbvipi1: TRxDBCalcEdit;
    dbvipi2: TRxDBCalcEdit;
    dbvipi3: TRxDBCalcEdit;
    dbvipi4: TRxDBCalcEdit;
    dbvipi5: TRxDBCalcEdit;
    dbvipi6: TRxDBCalcEdit;
    dbvipi7: TRxDBCalcEdit;
    dbvipi8: TRxDBCalcEdit;
    dbvipi9: TRxDBCalcEdit;
    dbvipi0: TRxDBCalcEdit;
    LMDShapeControl46: TLMDShapeControl;
    RxLabel37: TRxLabel;
    dbsit5: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure LMDShapeButton4Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btlocdocClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDescProd: TFrmDescProd;
  vIcms : real;

implementation

uses unitDmDados, unitLocCliente, DB;

{$R *.dfm}

procedure TFrmDescProd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.tbClinota.Close;
  dmDados.tbNFCli.Close;
  dmDados.tbNFDet.Close;
  Action:= Cafree;
end;

procedure TFrmDescProd.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmDescProd.LMDShapeButton4Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmDescProd.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmDescProd.btlocdocClick(Sender: TObject);
begin
  FrmLocCliente:= TFrmLocCliente.Create(application);
  FrmLocCliente.ShowModal;
  dmDados.tbNFCodCli.Value:=frmLocCliente.Resultado;
  FrmLocCliente.Free;
end;
procedure TFrmDescProd.FormShow(Sender: TObject);
begin
  dmDados.tbClinota.Open;
  dmDados.tbNFCli.Open;
  dmDados.tbNFDet.Open;
end;

end.
