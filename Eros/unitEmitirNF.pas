//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Emiss�o Nota Fiscal - Montagem
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitEmitirNF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, SpeedBar, jpeg, ExtCtrls, StdCtrls, RackCtls, fcButton,db,
  fcImgBtn, RXSplit, Mask, DBCtrls, RXCtrls, ToolEdit, CurrEdit, RXDBCtrl,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDShapeHint,
  ELibFnc, RxGrdCpt, fcImager, EMsgDlg, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TfrmEmitirNF = class(TForm)
    EvLibFunctions1: TEvLibFunctions;
    MsgDlg: TEvMsgDlg;
    RxLabel1: TRxLabel;
    Image3: TImage;
    DtZera: TDateEdit;
    RxLabel2: TRxLabel;
    edtCodCli: TDBEdit;
    RxLabel3: TRxLabel;
    dbNomeCli: TDBEdit;
    btnLocFunc: TfcImageBtn;
    Bevel1: TBevel;
    gridNF: TDBGrid;
    btnPrimeiro: TfcImageBtn;
    btnAnterior: TfcImageBtn;
    btnProximo: TfcImageBtn;
    btnUltimo: TfcImageBtn;
    btnNF: TfcImageBtn;
    btnNFVen: TfcImageBtn;
    btnSair: TfcImageBtn;
    LMDBackPanel2: TPanel;
    LMDBackPanel3: TPanel;
    LMDBackPanel11: TPanel;
    procedure btnLocFuncClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnNFClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodCliExit(Sender: TObject);
    procedure btnNFVenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmitirNF: TfrmEmitirNF;
  NovoItem:Boolean;
  NumDet, N_NF : integer;
  PosReg : array[1..10] of integer;
  PosRegServ : array[1..5] of integer;

implementation

uses UnitDmDados, unitLocCliente, UnitNF, unitQRNF, UnitPrincipal;
  //UnitQRNFServ, UnitNFServ;

{$R *.DFM}

procedure TfrmEmitirNF.btnLocFuncClick(Sender: TObject);
begin
  FrmLocCliente:=TFrmLocCliente.Create(Application);
  FrmLocCliente.Showmodal;
  dmdados.tbClinota.RecNo:=dmdados.tbCliente.RecNo;
  FrmLocCliente.Free;
end;

procedure TfrmEmitirNF.BtnPrimeiroClick(Sender: TObject);
begin
  DMDados.tbCliNota.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
end;

procedure TfrmEmitirNF.BtnAnteriorClick(Sender: TObject);
begin
  DMDados.tbCliNota.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If DMDados.tbCliNota.Bof Then
    Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
   End;
end;

procedure TfrmEmitirNF.BtnProximoClick(Sender: TObject);
begin
  DMDados.tbCliNota.Next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If DMDados.tbCliNota.Eof Then
    Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
   End;
end;

procedure TfrmEmitirNF.BtnUltimoClick(Sender: TObject);
begin
  DMDados.tbCliNota.Last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
end;

procedure TfrmEmitirNF.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmEmitirNF.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TfrmEmitirNF.btnNFClick(Sender: TObject);
var
  vDesc : array[1..10] of string[40];
  vUni : array[1..10] of string[3];
  vCProd : array[1..10] of string;
  vQuant : array[1..10] of real;
  vValor : array[1..10] of real;
  vFNum : array[1..3] of String;
  vFValor : array[1..3] of real;
  vCodMerc : array[1..10] of String[6];
  vFVenc : array[1..3] of TDateTime;
  c : integer;
begin
  gridNF.Enabled:=false;
  btnNf.Enabled:=false;
  with dmdados do
    begin
    //filtrando detalhes de venda
    tbDetvenCli.Filtered:=False;
    tbDetvenCli.Filter:='(NF <> '''+'S'+''')';
    tbDetvenCli.Filtered:=True;
    //Verificando se existe itens para emiss�o
    if tbDetvenCli.RecordCount = 0 then
      begin
      MsgDlg.MsgInformation('N�o existe mais itens para emiss�o');
      edtCodCli.SetFocus;
      end
    else
      begin
      //iniciando emiss�o
      qrNF:=TqrNF.Create(Application);
      //Zerando as variaveis
      for C:=1 to 10 do
        begin
        vDesc[c]:='';
        vUni[c]:='';
        vCProd[c]:='';
        vQuant[c]:=0;
        vValor[c]:=0;
        end;
      for c:=1 to 3 do
        begin
        vfNum[c]:='';
        vFValor[c]:=0;
        vFVenc[c]:=DtZera.Date;
        end;
      //Criando c�digo de controle da NF
      tbNF.Append;
      //ligar cliente e c�digo venda
      tbNFCodVen.Value:=tbVenCliCodVen.Value;
      tbNFDataVen.Value:=tbVenCliDataven.Value;
      tbNFCodCli.Value:=tbClinotaCodCli.Value;
      tbNF.Post;
      N_NF:=tbNFCodNF.Value;
      tbNFDet.Append;
      tbNFDet.Post;
      tbNF.Edit;
      tbNFDet.Edit;
      //pegando detalhes de venda
      C:=0;
      tbDetvenCli.First;
      while (not tbDetvenCli.Eof) and (C<10) do
        begin
        C:=C+1;
        PosReg[c]:=dmDados.tbDetVenCli.RecNo;
        vCProd[C]:=StrLeft(tbDetvenCliCodMerc.value,6);
        vDesc[C]:=tbDetvenClilkDescr.Value;
        vUni[c]:=tbDetvenClilkUnidade.Value;
        vQuant[c]:=tbDetvenCliQuant.Value;
        vValor[c]:=tbDetvenCliPrecoUnit.Value;
        vCodMerc[c]:=tbDetVenCliCodMerc.value;
        tbDetvenCli.Next;
        end;
      NumDet:=C; //numero de detalhes utilizados
      //transferindo para Det NF
      tbNFDetCodM1.Value:=vCodMerc[1];
      tbNFDetCodM2.Value:=vCodMerc[2];
      tbNFDetCodM3.Value:=vCodMerc[3];
      tbNFDetCodM4.Value:=vCodMerc[4];
      tbNFDetCodM5.Value:=vCodMerc[5];
      tbNFDetCodM6.Value:=vCodMerc[6];
      tbNFDetCodM7.Value:=vCodMerc[7];
      tbNFDetCodM8.Value:=vCodMerc[8];
      tbNFDetCodM9.Value:=vCodMerc[9];
      tbNFDetCodM10.Value:=vCodMerc[10];
      tbNFDetDMerc1.Value:=vDesc[1];
      tbNFDetDMerc2.Value:=vDesc[2];
      tbNFDetDMerc3.Value:=vDesc[3];
      tbNFDetDMerc4.Value:=vDesc[4];
      tbNFDetDMerc5.Value:=vDesc[5];
      tbNFDetDMerc6.Value:=vDesc[6];
      tbNFDetDMerc7.Value:=vDesc[7];
      tbNFDetDMerc8.Value:=vDesc[8];
      tbNFDetDMerc9.Value:=vDesc[9];
      tbNFDetDMerc10.Value:=vDesc[10];
      tbNFDetUnid1.Value:=vUni[1];
      tbNFDetUnid2.Value:=vUni[2];
      tbNFDetUnid3.Value:=vUni[3];
      tbNFDetUnid4.Value:=vUni[4];
      tbNFDetUnid5.Value:=vUni[5];
      tbNFDetUnid6.Value:=vUni[6];
      tbNFDetUnid7.Value:=vUni[7];
      tbNFDetUnid8.Value:=vUni[8];
      tbNFDetUnid9.Value:=vUni[9];
      tbNFDetUnid10.Value:=vUni[10];
      tbNFDetQt1.Value:=vQuant[1];
      tbNFDetQt2.Value:=vQuant[2];
      tbNFDetQt3.Value:=vQuant[3];
      tbNFDetQt4.Value:=vQuant[4];
      tbNFDetQt5.Value:=vQuant[5];
      tbNFDetQt6.Value:=vQuant[6];
      tbNFDetQt7.Value:=vQuant[7];
      tbNFDetQt8.Value:=vQuant[8];
      tbNFDetQt9.Value:=vQuant[9];
      tbNFDetQt10.Value:=vQuant[10];
      tbNFDetPUnit1.Value:=vValor[1];
      tbNFDetPUnit2.Value:=vValor[2];
      tbNFDetPUnit3.Value:=vValor[3];
      tbNFDetPUnit4.Value:=vValor[4];
      tbNFDetPUnit5.Value:=vValor[5];
      tbNFDetPUnit6.Value:=vValor[6];
      tbNFDetPUnit7.Value:=vValor[7];
      tbNFDetPUnit8.Value:=vValor[8];
      tbNFDetPUnit9.Value:=vValor[9];
      tbNFDetPUnit10.Value:=vValor[10];
      //habilitta os elementos de impress�o
      if vQuant[1] > 0 then
        begin
        qrNF.qrCod1.enabled:=true;
        qrNF.qrMerc1.enabled:=true;
        qrNF.qrUnid1.Enabled:=true;
        qrNF.rQt1.Enabled:=True;
        qrNF.rU1.Enabled:=True;
        qrNF.rT1.Enabled:=True;
        qrNF.qrIcm1.Enabled:=True;
        end;
      if vQuant[2] > 0 then
        begin
        qrNF.qrCod2.enabled:=true;
        qrNF.qrMerc2.enabled:=true;
        qrNF.qrUnid2.Enabled:=true;
        qrNF.rQt2.Enabled:=True;
        qrNF.rU2.Enabled:=True;
        qrNF.rT2.Enabled:=True;
        qrNF.qrIcm2.Enabled:=True;
        end;
      if vQuant[3] > 0 then
        begin
        qrNF.qrCod3.enabled:=true;
        qrNF.qrMerc3.enabled:=true;
        qrNF.qrUnid3.Enabled:=true;
        qrNF.rQt3.Enabled:=True;
        qrNF.rU3.Enabled:=True;
        qrNF.rT3.Enabled:=True;
        qrNF.qrIcm3.Enabled:=True;
        end;
      if vQuant[4] > 0 then
        begin
        qrNF.qrCod4.enabled:=true;
        qrNF.qrMerc4.enabled:=true;
        qrNF.qrUnid4.Enabled:=true;
        qrNF.rQt4.Enabled:=True;
        qrNF.rU4.Enabled:=True;
        qrNF.rT4.Enabled:=True;
        qrNF.qrIcm4.Enabled:=True;
        end;
      if vQuant[5] > 0 then
        begin
        qrNF.qrCod5.enabled:=true;
        qrNF.qrMerc5.enabled:=true;
        qrNF.qrUnid5.Enabled:=true;
        qrNF.rQt5.Enabled:=True;
        qrNF.rU5.Enabled:=True;
        qrNF.rT5.Enabled:=True;
        qrNF.qrIcm5.Enabled:=True;
        end;
      if vQuant[6] > 0 then
        begin
        qrNF.qrCod6.enabled:=true;
        qrNF.qrMerc6.enabled:=true;
        qrNF.qrUnid6.Enabled:=true;
        qrNF.rQt6.Enabled:=True;
        qrNF.rU6.Enabled:=True;
        qrNF.rT6.Enabled:=True;
        qrNF.qrIcm6.Enabled:=True;
        end;
      if vQuant[7] > 0 then
        begin
        qrNF.qrCod7.enabled:=true;
        qrNF.qrMerc7.enabled:=true;
        qrNF.qrUnid7.Enabled:=true;
        qrNF.rQt7.Enabled:=True;
        qrNF.rU7.Enabled:=True;
        qrNF.rT7.Enabled:=True;
        qrNF.qrIcm7.Enabled:=True;
        end;
      if vQuant[8] > 0 then
        begin
        qrNF.qrCod8.enabled:=true;
        qrNF.qrMerc8.enabled:=true;
        qrNF.qrUnid8.Enabled:=true;
        qrNF.rQt8.Enabled:=True;
        qrNF.rU8.Enabled:=True;
        qrNF.rT8.Enabled:=True;
        qrNF.qrIcm8.Enabled:=True;
        end;
      if vQuant[9] > 0 then
        begin
        qrNF.qrCod9.enabled:=true;
        qrNF.qrMerc9.enabled:=true;
        qrNF.qrUnid9.Enabled:=true;
        qrNF.rQt9.Enabled:=True;
        qrNF.rU9.Enabled:=True;
        qrNF.rT9.Enabled:=True;
        qrNF.qrIcm9.Enabled:=True;
        end;
      if vQuant[10] > 0 then
        begin
        qrNF.qrCod10.enabled:=true;
        qrNF.qrMerc10.enabled:=true;
        qrNF.qrUnid10.Enabled:=true;
        qrNF.rQt10.Enabled:=True;
        qrNF.rU10.Enabled:=True;
        qrNF.rT10.Enabled:=True;
        qrNF.qrIcm10.Enabled:=True;
        end;
      //pegando dados de recebimento
      c:=0;
      tbCReceber.Filtered:=False;
      tbCReceber.Filter:='(DataVen ='''+DatetoStr(tbVenCliDataven.Value)+''') and '+
                         '(CodVen = '''+IntToStr(tbVenCliCodVen.Value)+''')';
      tbcReceber.Filtered:=True;
      tbCReceber.First;
      if (tbCReceber.RecordCount > 0) and
         (tbCReceber.RecordCount <=3) then
        while not tbCReceber.Eof do
          begin
          c:=c+1;
          vFNum[c]:=tbCReceberNumDoc.Value;
          vFValor[c]:=tbCReceberValor.Value;
          vFVenc[c]:=tbCReceberDataVenc.Value;
          tbCReceber.Next;
          end;
      if tbCReceber.RecordCount > 3 then
        for c:=1 to 3 do
          begin
          vFNum[c]:=tbCReceberNumDoc.Value;
          vFValor[c]:=tbCReceberValor.Value;
          vFVenc[c]:=tbCReceberDataVenc.Value;
          tbCReceber.Next;
          end;
      //Transf. para dados fatura
      tbNFDetNufa1.Value:=vFNum[1];
      tbNFDetNufa2.Value:=vFNum[2];
      tbNFDetNufa3.Value:=vFNum[3];
      tbNFDetValor1.Value:=vFValor[1];
      tbNFDetValor2.Value:=vFValor[2];
      tbNFDetValor3.Value:=vFValor[3];
      tbNFDetVenc1.Value:=vFVenc[1];
      tbNFDetVenc2.Value:=vFVenc[2];
      tbNFDetVenc3.Value:=vFVenc[3];
      //Transferindo outros detalhes
      tbNFVende.Value:=tbVenClilkNomeFunc.Value;
      tbNFNumPed.Value:=tbVenCliCodVen.Value;
      FrmNF:=TFrmNF.Create(Application);
      FrmNF.ShowModal;
      edtCodCli.SetFocus;
     end;
    end;
end;

procedure TfrmEmitirNF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.tbVenCli.Close;
  dmDados.tbClinota.Close;
  dmDados.tbNF.Close;
  dmDados.tbNFDet.Close;
  FrmPrincipal.StatusTeclas(False,'');
  Action:=caFree;
end;

procedure TfrmEmitirNF.FormShow(Sender: TObject);
begin
  dmDados.tbVenCli.Open;
  dmDados.tbClinota.Open;
  dmDados.tbNF.Open;
  dmDados.tbNFDet.Open;
  FrmPrincipal.StatusTeclas(True,'[F2] Localizar Cliente [F3] Nota Fiscal [Esc] Cancelar ou Sair');
  edtCodCli.SetFocus;
end;

procedure TfrmEmitirNF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnSair.Click
                  else BtnSair.Click;
      VK_F2     : btnLocFunc.Click;
      VK_F3     : btnNF.Click;
    end;
end;

procedure TfrmEmitirNF.edtCodCliExit(Sender: TObject);
begin
  gridNF.Enabled:=true;
  btnnf.Enabled:=true;
  btnNFVen.Enabled:=true;
end;

procedure TfrmEmitirNF.btnNFVenClick(Sender: TObject);
{var
  vDesc : array[1..5] of string[40];
  vUni : array[1..5] of string[3];
  vCProd : array[1..5] of string;
  vQuant : array[1..5] of real;
  vValor : array[1..5] of real;
  vFNum : array[1..2] of String;
  vFValor : array[1..2] of real;
  vCodMerc : array[1..5] of String[6];
  vFVenc : array[1..2] of TDateTime;
  c : integer; }
begin
{ gridNF.Enabled:=false;
 btnNFVen.Enabled:=false;
  with dmdados do
    begin
    //filtrando detalhes de venda
    tbDetvenCli.Filtered:=False;
    tbDetvenCli.Filter:='(NF <> '''+'S'+''')';
    tbDetvenCli.Filtered:=True;
    //Verificando se existe itens para emiss�o
    if tbDetvenCli.RecordCount = 0 then
      begin
      MessageBox(frmEmitirNF.Handle,'N�o existe mais itens para emiss�o','Emiss�o de Nota Fiscal',0);
      edtCodCli.SetFocus;
      end
    else
      begin
      //iniciando emiss�o
      qrNFServ:=TqrNFServ.Create(Application);
      //Zerando as variaveis
      for C:=1 to 5 do
        begin
        vDesc[c]:='';
        vUni[c]:='';
        vCProd[c]:='';
        vQuant[c]:=0;
        vValor[c]:=0;
        end;
      for c:=1 to 2 do
        begin
        vfNum[c]:='';
        vFValor[c]:=0;
        vFVenc[c]:=DtZera.Date;
        end;
      //Criando c�digo de controle da NF
      tbNF.Append;
      //ligar cliente e c�digo venda
      tbNFCodVen.Value:=tbVenCliCodVen.Value;
      tbNFDataVen.Value:=tbVenCliDataven.Value;
      tbNFCodCli.Value:=tbClinotaCodCli.Value;
      tbNF.Post;
      N_NF:=tbNFCodNF.Value;
      tbNFDet.Append;
      tbNFDet.Post;
      tbNF.Edit;
      tbNFDet.Edit;
      //pegando detalhes de venda
      C:=0;
      tbDetvenCli.First;
      while (not tbDetvenCli.Eof) and (C<5) do
        begin
        C:=C+1;
        PosReg[c]:=dmDados.tbDetVenCli.RecNo;
        vCProd[C]:=StrLeft(tbDetvenCliCodMerc.value,6);
        vDesc[C]:=tbDetvenClilkDescr.Value;
        vUni[c]:=tbDetvenClilkUnidade.Value;
        vQuant[c]:=tbDetvenCliQuant.Value;
        vValor[c]:=tbDetvenCliPrecoUnit.Value;
        vCodMerc[c]:=tbDetVenCliCodMerc.value;
        tbDetvenCli.Next;
        end;
      NumDet:=C; //numero de detalhes utilizados
      //transferindo para Det NF
      tbNFDetCodM1.Value:=vCodMerc[1];
      tbNFDetCodM2.Value:=vCodMerc[2];
      tbNFDetCodM3.Value:=vCodMerc[3];
      tbNFDetCodM4.Value:=vCodMerc[4];
      tbNFDetCodM5.Value:=vCodMerc[5];
      tbNFDetDMerc1.Value:=vDesc[1];
      tbNFDetDMerc2.Value:=vDesc[2];
      tbNFDetDMerc3.Value:=vDesc[3];
      tbNFDetDMerc4.Value:=vDesc[4];
      tbNFDetDMerc5.Value:=vDesc[5];
      tbNFDetUnid1.Value:=vUni[1];
      tbNFDetUnid2.Value:=vUni[2];
      tbNFDetUnid3.Value:=vUni[3];
      tbNFDetUnid4.Value:=vUni[4];
      tbNFDetUnid5.Value:=vUni[5];
      tbNFDetQt1.Value:=vQuant[1];
      tbNFDetQt2.Value:=vQuant[2];
      tbNFDetQt3.Value:=vQuant[3];
      tbNFDetQt4.Value:=vQuant[4];
      tbNFDetQt5.Value:=vQuant[5];
      tbNFDetPUnit1.Value:=vValor[1];
      tbNFDetPUnit2.Value:=vValor[2];
      tbNFDetPUnit3.Value:=vValor[3];
      tbNFDetPUnit4.Value:=vValor[4];
      tbNFDetPUnit5.Value:=vValor[5];
      //habilitta os elementos de impress�o
      if vQuant[1] > 0 then
        begin
        qrNFServ.qrCod1.enabled:=true;
        qrNFServ.qrMerc1.enabled:=true;
        qrNFServ.qrUnid1.Enabled:=true;
        qrNFServ.rQt1.Enabled:=True;
        qrNFServ.rU1.Enabled:=True;
        qrNFServ.rT1.Enabled:=True;
        qrNFServ.qrIcm1.Enabled:=True;
        end;
      if vQuant[2] > 0 then
        begin
        qrNFServ.qrCod2.enabled:=true;
        qrNFServ.qrMerc2.enabled:=true;
        qrNFServ.qrUnid2.Enabled:=true;
        qrNFServ.rQt2.Enabled:=True;
        qrNFServ.rU2.Enabled:=True;
        qrNFServ.rT2.Enabled:=True;
        qrNFServ.qrIcm2.Enabled:=True;
        end;
      if vQuant[3] > 0 then
        begin
        qrNFServ.qrCod3.enabled:=true;
        qrNFServ.qrMerc3.enabled:=true;
        qrNFServ.qrUnid3.Enabled:=true;
        qrNFServ.rQt3.Enabled:=True;
        qrNFServ.rU3.Enabled:=True;
        qrNFServ.rT3.Enabled:=True;
        qrNFServ.qrIcm3.Enabled:=True;
        end;
      if vQuant[4] > 0 then
        begin
        qrNFServ.qrCod4.enabled:=true;
        qrNFServ.qrMerc4.enabled:=true;
        qrNFServ.qrUnid4.Enabled:=true;
        qrNFServ.rQt4.Enabled:=True;
        qrNFServ.rU4.Enabled:=True;
        qrNFServ.rT4.Enabled:=True;
        qrNFServ.qrIcm4.Enabled:=True;
        end;
      if vQuant[5] > 0 then
        begin
        qrNFServ.qrCod5.enabled:=true;
        qrNFServ.qrMerc5.enabled:=true;
        qrNFServ.qrUnid5.Enabled:=true;
        qrNFServ.rQt5.Enabled:=True;
        qrNFServ.rU5.Enabled:=True;
        qrNFServ.rT5.Enabled:=True;
        qrNFServ.qrIcm5.Enabled:=True;
        end;

      //pegando dados de recebimento
      c:=0;
      tbCReceber.Filtered:=False;
      tbCReceber.Filter:='(DataVen ='''+DatetoStr(tbVenCliDataven.Value)+''') and '+
                         '(CodVen = '''+IntToStr(tbVenCliCodVen.Value)+''')';
      tbcReceber.Filtered:=True;
      tbCReceber.First;
      if (tbCReceber.RecordCount > 0) and
         (tbCReceber.RecordCount <=2) then
        while not tbCReceber.Eof do
          begin
          c:=c+1;
          vFNum[c]:=tbCReceberNumDoc.Value;
          vFValor[c]:=tbCReceberValor.Value;
          vFVenc[c]:=tbCReceberDataVenc.Value;
          tbCReceber.Next;
          end;
      if tbCReceber.RecordCount > 2 then
        for c:=1 to 2 do
          begin
          vFNum[c]:=tbCReceberNumDoc.Value;
          vFValor[c]:=tbCReceberValor.Value;
          vFVenc[c]:=tbCReceberDataVenc.Value;
          tbCReceber.Next;
          end;
      //Transf. para dados fatura
      tbNFDetNufa1.Value:=vFNum[1];
      tbNFDetNufa2.Value:=vFNum[2];
      tbNFDetValor1.Value:=vFValor[1];
      tbNFDetValor2.Value:=vFValor[2];
      tbNFDetVenc1.Value:=vFVenc[1];
      tbNFDetVenc2.Value:=vFVenc[2];
      //Transferindo outros detalhes
      tbNFVende.Value:=tbVenClilkNomeFunc.Value;
      tbNFNumPed.Value:=tbVenCliCodVen.Value;
      FrmNFServ:=TFrmNFServ.Create(Application);
      MatServ:='material';//sinaliza p/NF materiais
      FrmNFServ.ShowModal;
      edtCodCli.SetFocus;
     end;
    end; }
end;

end.
