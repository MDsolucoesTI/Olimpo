//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Emiss�o Nota Fiscal Servi�o -  Montagem
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitEmitirNFServ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, SpeedBar, jpeg, ExtCtrls, StdCtrls, RackCtls, fcButton,db,
  fcImgBtn, RXSplit, Mask, DBCtrls, RXCtrls, ToolEdit, CurrEdit, RXDBCtrl,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDShapeHint,
  ELibFnc, RxGrdCpt, fcImager;

type
  TFrmEmitirNFServ = class(TForm)
    Panel1: TPanel;
    gridNF: TDBGrid;
    RxLabel2: TRxLabel;
    btnLocFunc: TfcImageBtn;
    RxLabel3: TRxLabel;
    dbNomeCli: TDBEdit;
    edtCodCli: TDBEdit;
    EvLibFunctions1: TEvLibFunctions;
    Panel2: TPanel;
    RxLabel1: TRxLabel;
    Image3: TImage;
    DtZera: TDateEdit;
    Panel3: TPanel;
    btnSair: TfcImageBtn;
    btnNFServ: TfcImageBtn;
    btnAnterior: TfcImageBtn;
    btnProximo: TfcImageBtn;
    btnUltimo: TfcImageBtn;
    btnPrimeiro: TfcImageBtn;
    Bevel1: TBevel;
    procedure btnLocFuncClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodCliExit(Sender: TObject);
    procedure btnNFServClick(Sender: TObject);
    procedure fcImageBtn5Click(Sender: TObject);
    procedure fcImageBtn2Click(Sender: TObject);
    procedure fcImageBtn3Click(Sender: TObject);
    procedure fcImageBtn4Click(Sender: TObject);
    procedure fcImageBtn1Click(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmitirNFServ: TfrmEmitirNFServ;
  NovoItem:Boolean;
  NumDet, N_NF : integer;
  PosReg : array[1..5] of integer;
  PosRegServ : array[6..10] of integer;
  ServExtra : array[1..20] of integer;

implementation

uses UnitDmDados, unitLocCliente, UnitNF, unitQRNF, UnitPrincipal,
  UnitQRNFServ, UnitNFServ;

{$R *.DFM}

procedure TFrmEmitirNFServ.btnLocFuncClick(Sender: TObject);
begin
  FrmLocCliente:=TFrmLocCliente.Create(Application);
  FrmLocCliente.Showmodal;
  dmdados.tbClinota.RecNo:=dmdados.tbCliente.RecNo;
  FrmLocCliente.Free;
end;

procedure TFrmEmitirNFServ.BtnPrimeiroClick(Sender: TObject);
begin
  DMDados.tbCliNota.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
end;

procedure TFrmEmitirNFServ.BtnAnteriorClick(Sender: TObject);
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

procedure TFrmEmitirNFServ.BtnProximoClick(Sender: TObject);
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

procedure TFrmEmitirNFServ.BtnUltimoClick(Sender: TObject);
begin
  DMDados.tbCliNota.Last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
end;

procedure TFrmEmitirNFServ.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TFrmEmitirNFServ.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;

end;

procedure TFrmEmitirNFServ.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  Action:=caFree;
end;

procedure TFrmEmitirNFServ.FormShow(Sender: TObject);
begin
FrmPrincipal.StatusTeclas(True,'[F2] Localizar Cliente [F3] Nota Fiscal [Esc] Cancelar ou Sair');
edtCodCli.SetFocus;
end;

procedure TFrmEmitirNFServ.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnSair.Click
                  else BtnSair.Click;
      VK_F2     : btnLocFunc.Click;
      VK_F3     : btnNFServ.Click;
    end;
end;

procedure TFrmEmitirNFServ.edtCodCliExit(Sender: TObject);
begin
gridNF.Enabled:=true;
btnnfServ.Enabled:=true;
end;

procedure TFrmEmitirNFServ.btnNFServClick(Sender: TObject);
var
  vDesc : array[1..10] of string[40];
  vUni : array[1..10] of string[3];
  vCProd : array[1..10] of string;
  vQuant : array[1..10] of real;
  vValor : array[1..10] of real;
  vFNum : array[1..2] of String;
  vFValor : array[1..2] of real;
  vCodMerc : array[1..10] of String[6];
  vFVenc : array[1..2] of TDateTime;
  c,c1,ver : integer;
  VerFlag : boolean;
begin
 gridNF.Enabled:=false;
 btnNFServ.Enabled:=false;
  with dmdados do
    begin
    if tbCServDetFechado.Value<>'S' then
      begin
      MessageBox(frmEmitirNFServ.Handle,'Contrato em aberto, n�o pode ser emitida Nota Fiscal','Emiss�o de Nota Fiscal',0);
      edtCodCli.SetFocus;
      end
    else
      begin
      //filtrando Contratos de servi�os
      tbNFCServServ.Filtered:=False;
      tbNFCServServ.Filter:='(NF <> '''+'S'+''')';
      tbNFCServServ.Filtered:=True;
      //Verificando se existe itens para emiss�o
      if tbNFCServServ.RecordCount = 0 then
        begin
        MessageBox(frmEmitirNFServ.Handle,'N�o existe mais itens para emiss�o','Emiss�o de Nota Fiscal',0);
        edtCodCli.SetFocus;
        end
      else
        begin
        //iniciando emiss�o
        qrNFServ:=TqrNFServ.Create(Application);
        //Zerando as variaveis
        for c:=1 to 20 do
          ExtraServ[c]:=0;
        for C:=6 to 10 do
          begin
          PosRegServ[c]:=0;
          vDesc[c]:='';
          //vUni[c]:='';
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
        //ligar venda e c�digo servi�o
        tbNFCodCServ.Value:=tbCServDetCodCServ.Value;
        //tbNFCodVen.Value:=tbContratoCodCServ.Value;
        //tbNFDataVen.Value:=tbContratoDataFim.Value;
        //Ligar o c�digo do Cliente
        tbNFCodCli.Value:=tbCServDetCodCli.Value;
        tbNF.Post;
        N_NF:=tbNFCodNF.Value;
        //Gerar liga��o entre NF e DetNF
        tbNFDet.Append;
        tbNFDet.Post;
        tbNF.Edit;
        tbNFDet.Edit;
        //pegando detalhes de contrato
        C:=5;
        c1:=0;
        VerFlag:=True;
        tbNFCServServ.First;
        while (not tbNFCServServ.Eof) and (C<10) do
          begin
          for ver:=6 to 10 do
            begin
            if vCProd[ver]=StrLeft(IntToStr(tbNFCServServCodServ.value),6) then
              begin
              VerFlag:=False;
              vQuant[Ver]:=vQuant[ver]+tbNFCServServQuantidade.Value;
              c1:=c1+1;
              //ExtraServ
              end;
            if VerFlag then
              begin
              C:=C+1;
              PosRegServ[c]:=dmDados.tbNFCServServ.RecNo;
              vCProd[C]:=StrLeft(IntToStr(tbNFCServServCodServ.value),6);
              vDesc[C]:=tbNFCServServlkServico.Value;
              vQuant[c]:=tbNFCServServQuantidade.Value;
              vValor[c]:=tbNFCServServVLPagar.Value;
              //vCodMerc[c]:=IntToStr(tbCServServCodServ.value);
              end;
            end;
          tbNFCServServ.Next;
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

      //habilita os elementos de impress�o
      if vQuant[1] > 0 then
        begin
        qrNFServ.qrCod6.enabled:=true;
        qrNFServ.qrMerc6.enabled:=true;
        qrNFServ.rU6.Enabled:=True;
        qrNFServ.rT6.Enabled:=True;
        qrNFServ.qrIcm6.Enabled:=True;
        end;
      if vQuant[2] > 0 then
        begin
        qrNFServ.qrCod7.enabled:=true;
        qrNFServ.qrMerc7.enabled:=true;
        qrNFServ.rU7.Enabled:=True;
        qrNFServ.rT7.Enabled:=True;
        qrNFServ.qrIcm7.Enabled:=True;
        end;
      if vQuant[3] > 0 then
        begin
        qrNFServ.qrCod8.enabled:=true;
        qrNFServ.qrMerc8.enabled:=true;
        qrNFServ.rU8.Enabled:=True;
        qrNFServ.rT8.Enabled:=True;
        qrNFServ.qrIcm8.Enabled:=True;
        end;
      if vQuant[4] > 0 then
        begin
        qrNFServ.qrCod9.enabled:=true;
        qrNFServ.qrMerc9.enabled:=true;
        qrNFServ.rU9.Enabled:=True;
        qrNFServ.rT9.Enabled:=True;
        qrNFServ.qrIcm9.Enabled:=True;
        end;
      if vQuant[5] > 0 then
        begin
        qrNFServ.qrCod10.enabled:=true;
        qrNFServ.qrMerc10.enabled:=true;
        qrNFServ.rU10.Enabled:=True;
        qrNFServ.rT10.Enabled:=True;
        qrNFServ.qrIcm10.Enabled:=True;
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

      tbNFNumPed.Value:=tbCServServCodCServ.Value;
      FrmNFServ:=TFrmNFServ.Create(Application);
      MatServ:='servi�o';//sinaliza p/NF servi�os
      FrmNFServ.ShowModal;
      edtCodCli.SetFocus;
     end;
     end;
    end;
end;

procedure TFrmEmitirNFServ.fcImageBtn5Click(Sender: TObject);
begin
  DMDados.tbCliNota.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
end;

procedure TFrmEmitirNFServ.fcImageBtn2Click(Sender: TObject);
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

procedure TFrmEmitirNFServ.fcImageBtn3Click(Sender: TObject);
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

procedure TFrmEmitirNFServ.fcImageBtn4Click(Sender: TObject);
begin
  DMDados.tbCliNota.Last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
end;

procedure TFrmEmitirNFServ.fcImageBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmEmitirNFServ.btnGravarClick(Sender: TObject);
var
 vDesc : array[1..10] of string[40];
//  vUni : array[1..10] of string[3];
  vCProd : array[1..10] of string;
  vQuant : array[1..10] of real;
  vValor : array[1..10] of real;
  vFNum : array[1..2] of String;
  vFValor : array[1..2] of real;
  vCodMerc : array[1..10] of String[6];
  vFVenc : array[1..2] of TDateTime;
  c,c1,ver : integer;
  VerFlag : boolean; 
begin
 gridNF.Enabled:=false;
 btnNFServ.Enabled:=false;
  with dmdados do
    begin
    if tbCServDetFechado.Value<>'S' then
      begin
      MessageBox(frmEmitirNFServ.Handle,'Contrato em aberto, n�o pode ser emitida Nota Fiscal','Emiss�o de Nota Fiscal',0);
      edtCodCli.SetFocus;
      end
    else
      begin
      //filtrando Contratos de servi�os
      tbNFCServServ.Filtered:=False;
      tbNFCServServ.Filter:='(NF <> '''+'S'+''')';
      tbNFCServServ.Filtered:=True;
      //Verificando se existe itens para emiss�o
      if tbNFCServServ.RecordCount = 0 then
        begin
        MessageBox(frmEmitirNFServ.Handle,'N�o existe mais itens para emiss�o','Emiss�o de Nota Fiscal',0);
        edtCodCli.SetFocus;
        end
      else
        begin
        //iniciando emiss�o
        qrNFServ:=TqrNFServ.Create(Application);
        //Zerando as variaveis
        for c:=1 to 20 do
          ExtraServ[c]:=0;
        for C:=6 to 10 do
          begin
          PosRegServ[c]:=0;
          vDesc[c]:='';
          //vUni[c]:='';
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
        //ligar venda e c�digo servi�o
        tbNFCodCServ.Value:=tbCServDetCodCServ.Value;
        //tbNFCodVen.Value:=tbContratoCodCServ.Value;
        //tbNFDataVen.Value:=tbContratoDataFim.Value;
        //Ligar o c�digo do Cliente
        tbNFCodCli.Value:=tbCServDetCodCli.Value;
        tbNF.Post;
        N_NF:=tbNFCodNF.Value;
        //Gerar liga��o entre NF e DetNF
        tbNFDet.Append;
        tbNFDet.Post;
        tbNF.Edit;
        tbNFDet.Edit;
        //pegando detalhes de contrato
        C:=5;
        c1:=0;
        VerFlag:=True;
        tbNFCServServ.First;
        while (not tbNFCServServ.Eof) and (C<10) do
          begin
          for ver:=6 to 10 do
            begin
            if vCProd[ver]=StrLeft(IntToStr(tbNFCServServCodServ.value),6) then
              begin
              VerFlag:=False;
              vQuant[Ver]:=vQuant[ver]+tbNFCServServQuantidade.Value;
              c1:=c1+1;
              //ExtraServ
              end;
            if VerFlag then
              begin
              C:=C+1;
              PosRegServ[c]:=dmDados.tbNFCServServ.RecNo;
              vCProd[C]:=StrLeft(IntToStr(tbNFCServServCodServ.value),6);
              vDesc[C]:=tbNFCServServlkServico.Value;
              vQuant[c]:=tbNFCServServQuantidade.Value;
              vValor[c]:=tbNFCServServVLPagar.Value;
              //vCodMerc[c]:=IntToStr(tbCServServCodServ.value);
              end;
            end;
          tbNFCServServ.Next;
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

      //habilita os elementos de impress�o
      if vQuant[1] > 0 then
        begin
        qrNFServ.qrCod6.enabled:=true;
        qrNFServ.qrMerc6.enabled:=true;
        qrNFServ.rU6.Enabled:=True;
        qrNFServ.rT6.Enabled:=True;
        qrNFServ.qrIcm6.Enabled:=True;
        end;
      if vQuant[2] > 0 then
        begin
        qrNFServ.qrCod7.enabled:=true;
        qrNFServ.qrMerc7.enabled:=true;
        qrNFServ.rU7.Enabled:=True;
        qrNFServ.rT7.Enabled:=True;
        qrNFServ.qrIcm7.Enabled:=True;
        end;
      if vQuant[3] > 0 then
        begin
        qrNFServ.qrCod8.enabled:=true;
        qrNFServ.qrMerc8.enabled:=true;
        qrNFServ.rU8.Enabled:=True;
        qrNFServ.rT8.Enabled:=True;
        qrNFServ.qrIcm8.Enabled:=True;
        end;
      if vQuant[4] > 0 then
        begin
        qrNFServ.qrCod9.enabled:=true;
        qrNFServ.qrMerc9.enabled:=true;
        qrNFServ.rU9.Enabled:=True;
        qrNFServ.rT9.Enabled:=True;
        qrNFServ.qrIcm9.Enabled:=True;
        end;
      if vQuant[5] > 0 then
        begin
        qrNFServ.qrCod10.enabled:=true;
        qrNFServ.qrMerc10.enabled:=true;
        qrNFServ.rU10.Enabled:=True;
        qrNFServ.rT10.Enabled:=True;
        qrNFServ.qrIcm10.Enabled:=True;
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

      tbNFNumPed.Value:=tbCServServCodCServ.Value;
      FrmNFServ:=TFrmNFServ.Create(Application);
      MatServ:='servi�o';//sinaliza p/NF servi�os
      FrmNFServ.ShowModal;
      edtCodCli.SetFocus;
     end;
     end;
    end; 

end;

end.
