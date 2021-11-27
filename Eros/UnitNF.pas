//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Prepara emiss�o de Nota Fiscal
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitNF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, jpeg, ExtCtrls, RXCtrls, RackCtls,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDButtonPanel, LMDControl,
  LMDBaseControl, LMDBaseGraphicButton, LMDCustomShapeButton,
  LMDShapeButton, LMDBaseGraphicControl, LMDBaseShape, LMDShapeControl,
  ToolEdit, CurrEdit, RXDBCtrl, JLPSay, EMsgDlg;

type
  TFrmNF = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    LMDShapeControl1: TLMDShapeControl;
    RxLabel3: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel2: TRxLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    RxLabel6: TRxLabel;
    RxLabel9: TRxLabel;
    LMDShapeControl2: TLMDShapeControl;
    RxLabel7: TRxLabel;
    LMDShapeControl3: TLMDShapeControl;
    RxLabel13: TRxLabel;
    RxLabel4: TRxLabel;
    LMDShapeControl4: TLMDShapeControl;
    RxLabel10: TRxLabel;
    LMDShapeControl5: TLMDShapeControl;
    RxLabel11: TRxLabel;
    LMDShapeControl6: TLMDShapeControl;
    RxLabel12: TRxLabel;
    RxLabel16: TRxLabel;
    RxLabel17: TRxLabel;
    LMDShapeControl8: TLMDShapeControl;
    RxLabel18: TRxLabel;
    LMDShapeControl7: TLMDShapeControl;
    RxLabel19: TRxLabel;
    RxLabel20: TRxLabel;
    LMDShapeControl9: TLMDShapeControl;
    RxLabel21: TRxLabel;
    LMDShapeControl10: TLMDShapeControl;
    RxLabel22: TRxLabel;
    RxLabel23: TRxLabel;
    RxLabel24: TRxLabel;
    LMDShapeControl11: TLMDShapeControl;
    dbVlicms: TRxDBCalcEdit;
    LMDShapeControl12: TLMDShapeControl;
    RxLabel25: TRxLabel;
    RxLabel26: TRxLabel;
    LMDShapeControl13: TLMDShapeControl;
    LMDShapeControl14: TLMDShapeControl;
    LMDShapeControl15: TLMDShapeControl;
    LMDShapeControl16: TLMDShapeControl;
    dbVlSeg: TRxDBCalcEdit;
    dbOutDesp: TRxDBCalcEdit;
    RxLabel27: TRxLabel;
    RxLabel28: TRxLabel;
    dbVlTotalNota: TRxDBCalcEdit;
    dbNatOp: TDBEdit;
    dbCF: TDBEdit;
    dbInscEst: TDBEdit;
    dbBCalcicmsSubst: TRxDBCalcEdit;
    dbVlicmsSubst: TRxDBCalcEdit;
    dbVlTotalipi: TRxDBCalcEdit;
    dbVlTotalProd: TRxDBCalcEdit;
    RxLabel29: TRxLabel;
    LMDShapeControl17: TLMDShapeControl;
    RxLabel30: TRxLabel;
    RxLabel34: TRxLabel;
    LMDShapeControl18: TLMDShapeControl;
    LMDShapeControl21: TLMDShapeControl;
    LMDShapeControl22: TLMDShapeControl;
    RxLabel35: TRxLabel;
    dbfret: TDBEdit;
    RxLabel31: TRxLabel;
    RxLabel32: TRxLabel;
    RxLabel33: TRxLabel;
    LMDShapeControl19: TLMDShapeControl;
    LMDShapeControl20: TLMDShapeControl;
    RxLabel36: TRxLabel;
    RxLabel37: TRxLabel;
    dbNome: TDBEdit;
    dbPlaca: TDBEdit;
    dbUF: TDBEdit;
    dbcnpj: TDBEdit;
    LMDShapeControl23: TLMDShapeControl;
    LMDShapeControl24: TLMDShapeControl;
    LMDShapeControl25: TLMDShapeControl;
    dbEnd: TDBEdit;
    RxLabel38: TRxLabel;
    dbQtd: TDBEdit;
    RxLabel39: TRxLabel;
    LMDShapeControl26: TLMDShapeControl;
    LMDShapeControl27: TLMDShapeControl;
    RxLabel40: TRxLabel;
    dbEspecie: TDBEdit;
    dbMarca: TDBEdit;
    LMDShapeControl28: TLMDShapeControl;
    dbUfend: TDBEdit;
    RxLabel41: TRxLabel;
    LMDShapeControl29: TLMDShapeControl;
    RxLabel42: TRxLabel;
    LMDShapeControl31: TLMDShapeControl;
    RxLabel44: TRxLabel;
    RxLabel43: TRxLabel;
    dbMunic: TDBEdit;
    dbInscEstend: TDBEdit;
    LMDShapeControl30: TLMDShapeControl;
    RxLabel45: TRxLabel;
    RxLabel46: TRxLabel;
    dbPesoLiq: TDBEdit;
    dbPesoBruto: TDBEdit;
    dbNum: TDBEdit;
    RxLabel47: TRxLabel;
    LMDShapeControl34: TLMDShapeControl;
    RxLabel51: TRxLabel;
    LMDShapeControl35: TLMDShapeControl;
    RxLabel52: TRxLabel;
    LMDShapeControl36: TLMDShapeControl;
    RxLabel53: TRxLabel;
    LMDShapeControl37: TLMDShapeControl;
    MemoObs: TDBMemo;
    dbVendedor: TDBEdit;
    dbSPed: TDBEdit;
    dbNumPed: TDBEdit;
    btnSair: TLMDShapeButton;
    btnGravar: TLMDShapeButton;
    btnCancelar: TLMDShapeButton;
    btnImprimir: TLMDShapeButton;
    DBText1: TDBText;
    PrintDialog1: TPrintDialog;
    RxLabel1: TRxLabel;
    dbDtEmis: TDBDateEdit;
    RxLabel48: TRxLabel;
    dbDtSaiEntr: TDBDateEdit;
    RxLabel49: TRxLabel;
    dbHora: TDBEdit;
    dbValorfrete: TRxDBCalcEdit;
    dbBaseCalculoIcms: TRxDBCalcEdit;
    MsgDlg: TEvMsgDlg;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    RxLabel8: TRxLabel;
    DBText6: TDBText;
    DBText7: TDBText;
    RxLabel14: TRxLabel;
    DBText8: TDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbDtEmisExit(Sender: TObject);
    procedure dbDtSaiEntrExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmNF: TFrmNF;

implementation

uses UnitDescProd, unitDmDados, unitQRNF, unitEmitirNF;

{$R *.dfm}

procedure TFrmNF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmdados.tbDetvenCli.Filtered:=false;
  dmdados.tbCReceber.Filtered:=False;
  dmdados.tbNF.Filtered:=False;
  dmdados.tbVenCli.Refresh;
  dmdados.tbDetvenCli.Refresh;
  dmdados.tbCReceber.Refresh;
  dmdados.tbNF.Refresh;
  Action:= Cafree;
end;

procedure TFrmNF.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmNF.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmNF.btnCancelarClick(Sender: TObject);
begin
  dmDados.tbNFDet.Post;
  dmdados.tbNF.Post;
  dmDados.tbNFDet.Delete;
  dmDados.tbNF.Delete;
  qrNF.Free;
  Close;
end;

procedure TFrmNF.btnGravarClick(Sender: TObject);
var
  x:integer;
begin
  dmDados.tbNFVlTotalProd.Value:=dmDados.tbNFLkTotalProd.Value;
  dmDados.tbNFVlTotNF.Value:=dmdados.tbNFLkVlTotalNota.Value;
  dmDados.tbNFVlIPI.Value:=dmdados.tbNFLkVlIpi.Value;
  dmDados.tbNFDet.Post;
  dmdados.tbNF.Post;
  dmdados.tbDetvenCli.First;
  for x:=1 to NumDet do
    begin
    dmdados.tbDetVenCli.RecNo:=PosReg[x];
    dmdados.tbDetvenCli.Edit;
    dmdados.tbDetvenCliNF.Value:='S';
    dmdados.tbDetvenCli.Post;
    dmdados.tbDetvenCli.Next;
    end;
  {lan�ar imposto ICMS no contas a pagar}
  dmdados.tbCPagar.Append;
  dmdados.tbCPagarDataEmis.Value:=date;
  dmdados.tbCPagarDataVenc.Value:=date;
  dmdados.tbCPagarNumDoc.Value:='Venda n�'+dmdados.tbNFCodVen.AsString;
  dmdados.tbCPagarCodHist.AsString:='3';
  dmdados.tbCPagarCompHist.Value:='Imposto sobre a venda do dia'+' '+DateToStr(date);
  dmdados.tbCPagarValor.Value:=dmdados.tbNFVlICMS.Value;
  dmdados.tbCpagarPago.value:='ABERTO';
  dmdados.tbcpagar.Post;
  {//lan�ar imposto IPI no contas a pagar}
  dmdados.tbCPagar.Append;
  dmdados.tbCPagarDataEmis.Value:=date;
  dmdados.tbCPagarDataVenc.Value:=date;
  dmdados.tbCPagarNumDoc.Value:='Venda n�'+dmdados.tbNFCodVen.AsString;
  dmdados.tbCPagarCodHist.AsString:='4';
  dmdados.tbCPagarCompHist.Value:='Imposto sobre a venda do dia'+' '+DateToStr(date);
  dmdados.tbCPagarValor.Value:=dmdados.tbNFVlIPI.Value;
  dmdados.tbCpagarPago.value:='ABERTO';
  dmdados.tbcpagar.Post;
  dmdados.tbDetvenCli.Filtered:=False;
  btnGravar.Enabled:=False;
  btnCancelar.Enabled:=False;
  btnImprimir.Enabled:=true;
end;

procedure TFrmNF.btnImprimirClick(Sender: TObject);
begin
 dmDados.tbNF.Filtered:=False;
 dmDados.tbNF.Filter:='(CodNF = '''+IntToStr(N_NF)+''')';
 dmDados.tbNF.Filtered:=True;
  If dmDados.tbNFEntrada.Value = true then
     qrNF.qrEntrada.Caption := 'X'
  else
     qrNF.qrEntrada.Caption:='';

  If dmDados.tbNFSaida.Value = true then
     qrNF.qrSaida.Caption := 'X'
  else
     qrNF.qrSaida.Caption:='';

  QrNF.PrinterSetup;
  qrNF.Print;
  qrNF.Free;
  Close;
end;

procedure TFrmNF.FormShow(Sender: TObject);
begin
   if dmdados.tbICMS.Locate('Estado',dmdados.tbNFCliUf.Value,[]) then
  Begin
   vIcms:=dmdados.tbICMSICMS.Value;
   {if dbdesc1.Text='' then
      dmdados.tbNFDetICMS1.value:=intToStr(0)
   else}
   dmdados.tbNFDetICMS1.value:=floattostr(vIcms);
   {if dbdesc2.Text='' then
      dmdados.tbNFDetICMS2.value:=intToStr(0)
   else}
   dmdados.tbNFDetICMS2.value:=floattostr(vIcms);
    {if dbdesc3.Text='' then
      dmdados.tbNFDetICMS3.value:=intToStr(0)
   else}
   dmdados.tbNFDetICMS3.value:=floattostr(vIcms);
    {if dbdesc4.Text='' then
      dmdados.tbNFDetICMS4.value:=intToStr(0)
   else}
   dmdados.tbNFDetICMS4.value:=floattostr(vIcms);
    {if dbdesc5.Text='' then
      dmdados.tbNFDetICMS5.value:=intToStr(0)
   else}
   dmdados.tbNFDetICMS5.value:=floattostr(vIcms);
    {if dbdesc6.Text='' then
      dmdados.tbNFDetICMS6.value:=intToStr(0)
   else}
   dmdados.tbNFDetICMS6.value:=floattostr(vIcms);
    {if dbdesc7.Text='' then
      dmdados.tbNFDetICMS7.value:=intToStr(0)
   else}
   dmdados.tbNFDetICMS7.value:=floattostr(vIcms);
    {if dbdesc8.Text='' then
      dmdados.tbNFDetICMS8.value:=intToStr(0)
   else}
   dmdados.tbNFDetICMS8.value:=floattostr(vIcms);
    {if dbdesc9.Text='' then
      dmdados.tbNFDetICMS9.value:=intToStr(0)
   else}
   dmdados.tbNFDetICMS9.value:=floattostr(vIcms);
    {if dbdesc0.Text='' then
      dmdados.tbNFDetICMS10.value:=intToStr(0)
   else}
     dmdados.tbNFDetICMS10.value:=floattostr(vIcms);

dmdados.tbNFBCalcICMS.Value:=dmdados.tbNFlkVlTotalNota.Value;
dmdados.tbNFVlICMS.Value:=(dmdados.tbNFBCalcICMS.Value*(vIcms/100));
end;
end;

procedure TFrmNF.dbDtEmisExit(Sender: TObject);
begin
  If (dbDtEmis.text = '  /  /    ') then
    begin
    MsgDlg.MsgWarning('DATA DE EMISS�O n�o foi preenchida');
    dbDtEmis.SetFocus;
    end
  else
    begin
    try StrToDate(dbDtEmis.text)
    except on EConvertError do
      begin
      MsgDlg.MsgError('DATA DE EMISS�O inv�lida');
      dbDtEmis.SetFocus;
      end;
    end;
    end;
end;
procedure TFrmNF.dbDtSaiEntrExit(Sender: TObject);
begin
  If (dbDtSaiEntr.text = '  /  /    ') then
    begin
    MsgDlg.MsgWarning('DATA DE EMISS�O n�o foi preenchida');
    dbDtSaiEntr.SetFocus;
    end
  else
    begin
    try StrToDate(dbDtSaiEntr.text)
    except on EConvertError do
      begin
      MsgDlg.MsgError('DATA DE EMISS�O inv�lida');
      dbDtSaiEntr.SetFocus;
      end;
    end;
    end;
end;

end.
