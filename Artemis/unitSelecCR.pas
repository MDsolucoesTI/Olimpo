//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitSelecCR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, RxMenus, RXSplit, CurrEdit, RXDBCtrl, DBCtrls, StdCtrls, Mask,variants,
  ToolEdit, Grids, DBGrids, RackCtls, RXCtrls, SRColBtn, ExtCtrls, SRGrad,
  jpeg, Buttons, SpeedBar, RxLookup,DBTables, fcButton, fcImgBtn, RxGrdCpt,
  fcImager, EMsgDlg, ELibFnc;

type
  TFrmSelecCR = class(TForm)
    Panel2: TPanel;
    RxLabel11: TRxLabel;
    dbgridBaixa: TRxDBGrid;
    cetotal: TCurrencyEdit;
    RxLabel1: TRxLabel;
    lookConta: TRxLookupEdit;
    Panel1: TPanel;
    RxLabel4: TRxLabel;
    Image3: TImage;
    Panel3: TPanel;
    btnBaixa: TfcImageBtn;
    btnSair: TfcImageBtn;
    RxGradientCaption2: TRxGradientCaption;
    Label2: TLabel;
    Label1: TLabel;
    Panel4: TPanel;
    RxLabel10: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    rbTodas: TRadioButton;
    rbDatas: TRadioButton;
    Panel5: TPanel;
    lbcliente: TRxLabel;
    btnLocCli: TfcImageBtn;
    DtVencIni: TDateEdit;
    dtVencFim: TDateEdit;
    MsgDlg: TEvMsgDlg;
    dbLookCli: TRxLookupEdit;
    dbConta: TDBEdit;
    dbCodCli: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnDinheiroClick(Sender: TObject);
    procedure btnsairClick(Sender: TObject);
    procedure lookContaExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure lookContaCloseUp(Sender: TObject);
    procedure dbgridBaixaCellClick(Column: TColumn);
    procedure btnBaixaClick(Sender: TObject);
    procedure DtVencIniExit(Sender: TObject);
    procedure dtVencFimExit(Sender: TObject);
    procedure btnLocCliClick(Sender: TObject);
    procedure dbLookCliExit(Sender: TObject);
    procedure dbLookCliCloseUp(Sender: TObject);
    procedure rbDatasClick(Sender: TObject);
    procedure rbTodasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelecCR: TFrmSelecCR;
  DoPrinc,FlagIni,FlagFim : boolean;

implementation

uses  unitDmDados, UnitPrincipal, UnitTipoPagto, unitLocCliente,
  UnitBaixaLoteCR;

{$R *.DFM}

procedure TFrmSelecCR.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.statusteclas(False,'');
  dmdados.tbCreceber.Filtered:=false;
  dmDados.tbCReceber.IndexName:='';
  dmDados.tbCRecSele.Close;
  dmDados.tbCReceber.Close;
  dmDados.tbHistorico.Close;
  dmDados.tbCCusto.Close;
  dmDados.tbTipoDoc.Close;
  dmDados.tbCliente.Close;
  dmDados.TbCCorrente.Close;
  Action:= Cafree;
end;

procedure TFrmSelecCR.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;


procedure TFrmSelecCR.btnDinheiroClick(Sender: TObject);
var
  custo : string[10];
  dia,mes,ano : word;
  anoCusto,mesCusto : string;
  PosReg:array[1..20] of integer;
  c,c1 : integer;
begin
  dmdados.tbCreceber.First;
  c:=0;
  While not dmdados.tbCreceber.Eof do
    begin
    if DBGridBaixa.SelectedRows.IndexOf(dmdados.tbCreceber.BookMark) >= 0 then
      begin
      c:=c+1;
      PosReg[c]:=dmDados.tbCreceber.RecNo;
      end;
    dmdados.tbCreceber.Next;
    end;
  for c1:=1 to c do
     begin
      dmdados.tbCreceber.RecNo:=PosReg[c1];
      cetotal.Value:=cetotal.value+dmdados.tbCreceberValor.Value;
      dmdados.tbCreceber.edit;
      dmdados.tbCreceberDataPaga.Value:=date;
      dmdados.tbCreceberPago.Value:='Pago';
      dmdados.tbCreceberCompHist.Value:=dmdados.tbCreceberCompHist.Value+'.'+'Recebi/o c/ baixa em lote.';
      dmdados.tbCreceberValorPago.Value:=dmdados.tbCreceberValor.Value;
      dmdados.tbCreceber.Post;

      {Atualizar movimento de conta}
      dmdados.TbMovConta.Append;
      dmdados.tbMovContaDosNumero.value:=dmdados.tbCreceberNumDoc.value;
      dmdados.TbMovContaConta.Value:=dbConta.Text;
      dmdados.TbMovContaDataMov.Value:=date;
      dmdados.tbMovContaDataReg.value:=date;
      dmdados.TbMovContaHoraReg.Value:=time;
      dmdados.TbMovContaValor.Value:=dmdados.tbCreceberValor.Value;
      dmdados.TbMovContaTipoOper.Value:='E';
      // dmdados.TbMovContaUserName.Value:=frmprincipal.username;
      dmdados.TbMovContaCodHist.Value:=dmdados.tbCreceberCodHist.Value;
      dmdados.TbMovContaComplHist.Value:='Recebto efetuado atrav�s de baixa em lote';
      dmdados.TbMovConta.Post;

      {atualizar conta corrente}
      if dmdados.TbCCorrente.Locate('Conta',lookConta.Text,[]) then
      begin
      dmdados.TbCCorrente.Edit;
      dmdados.TbCCorrenteSaldo.Value:=
      dmdados.TbCCorrenteSaldo.Value+dmdados.tbCreceberValor.Value;
      dmdados.tbccorrenteUltMov.value:=date;
      dmdados.TbCCorrente.post;
      end;

      {atualizar centro de custo}
      decodedate(now,ano,mes,dia);
      mesCusto:=IntToStr(mes);
      anoCusto:=intToStr(ano);
      if dmdados.TbBalCusto.Locate('CodCcusto;Mes;Ano',VarArrayOf([custo,mesCusto,anoCusto]),[]) then
        begin
        dmdados.tbBalcusto.edit;
        dmdados.tbBalcustoDespesas.value:=
        dmdados.tbBalCustoReceitas.value+dmdados.tbCreceberValor.Value;
        dmdados.tbBalCustoDespesas.Value:=0;
        dmdados.tbBalCusto.Post;
        end
      else
        begin
        dmdados.tbBalCusto.Append;
        dmdados.tbBalCustoCodCcusto.Value:=Custo;
        dmdados.tbBalCustoMes.Value:=IntToStr(mes);
        dmdados.tbBalCustoAno.Value:=IntToStr(ano);
        dmdados.tbBalCustoReceitas.Value:=dmdados.tbCreceberValor.Value;
        dmdados.tbBalCustoDespesas.Value:=0;
        dmdados.tbBalCusto.Post;
        end;
     end;
end;

procedure TFrmSelecCR.btnsairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmSelecCR.lookContaExit(Sender: TObject);
begin
  if lookConta.Text='' then
    begin
    MsgDlg.MsgWarning('Obrigat�rio informar a conta de registro');
    lookconta.SetFocus;
    btnBaixa.Enabled:=false;
    end
  else
    btnBaixa.Enabled:=true;
end;

procedure TFrmSelecCR.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : if dmDados.vTabStt then BtnSair.Click;
      VK_F2     : btnBaixa.Click;
end;
end;

procedure TFrmSelecCR.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[F2] Baixa Contas a Receber [Esc] Sair');
  dbgridBaixa.UnselectAll;
  dmDados.TbCCorrente.Open;
  dmDados.tbHistorico.Open;
  dmDados.tbCCusto.Open;
  dmDados.tbTipoDoc.Open;
  dmDados.tbCliente.Open;
  dmDados.tbCReceber.Open;
  dmDados.tbCRecSele.Open;
  if DoPrinc then
    begin
    dmDados.tbCRecSele.EmptyTable;
    dmDados.tbCReceber.IndexName:='iDataVenc';
    dmdados.tbCreceber.filtered:=false;
    dmdados.tbCreceber.Filter:='(Pago='''+'ABERTO'+''')';
    dmdados.tbCreceber.Filtered:=true;
    dmDados.CRecCli:=False;
    end;
  DoPrinc:=False;
end;

procedure TFrmSelecCR.lookContaCloseUp(Sender: TObject);
begin
  if lookConta.Text='' then
    begin
    MsgDlg.MsgWarning('Obrigat�rio informar a conta de registro');
    lookconta.SetFocus;
    btnBaixa.Enabled:=false;
    end
  else
    btnBaixa.Enabled:=true;
end;

procedure TFrmSelecCR.dbgridBaixaCellClick(Column: TColumn);
var
  i : Integer;
  Tabela: TTable;
begin
  cetotal.Value:=0;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbCReceber.DatabaseName;
  Tabela.TableName := dmDados.tbCReceber.TableName;
  Tabela.IndexName := dmdados.tbCReceber.IndexName;
  Tabela.FieldDefs := dmdados.tbCReceber.FieldDefs;
  Tabela.Open;
  if dbgridBaixa.SelectedRows.Count>0 then
    for i:=0 to dbgridBaixa.SelectedRows.Count-1 do
      begin
      Tabela.GotoBookmark(pointer(dbgridBaixa.SelectedRows.Items[i]));
      cetotal.Value:=cetotal.value+Tabela.FieldValues['Valor'];
      end;
end;

procedure TFrmSelecCR.btnBaixaClick(Sender: TObject);
var
  i,c,c1,r,r1 : Integer;
  Val,Qt,Spc : string;
  Tam : integer;
begin
  //Montagem da nova tabela com dados de recebimento selecionados
  if dbgridBaixa.SelectedRows.Count>0 then
    begin
    if dbgridBaixa.SelectedRows.Count=1 then
      dmDados.CRecCli:=True;
    c:=100 div dbgridBaixa.SelectedRows.Count;
    r:=100 mod dbgridBaixa.SelectedRows.Count;
    c1:=c div 3;
    r1:=c mod 3;
    with dmDados do
      begin
      //Abrir tabelas secund�rias
      tbVendas.Open;
      tbVisDetVen.Open;
      tbEstoque.Open;
      tbFunc.Open;
      //Utiliza o grid como controle dos dados
      for i:=0 to dbgridBaixa.SelectedRows.Count-1 do
        begin
        tbCReceber.GotoBookmark(pointer(dbgridBaixa.SelectedRows.Items[i]));
        tbCRecSele.Append;
        //inclus�o dos dados b�sicos
        tbCRecSeleCodRec.Value:=tbCReceberCodCRec.Value;
        tbCRecSeleNumDoc.Value:=tbCReceberNumDoc.Value;
        tbCRecSeleCliente.Value:=tbCReceberlkCliente.Value;
        tbCRecSeleDataVenc.Value:=tbCReceberDataVenc.Value;
        tbCRecSeleValor.Value:=tbCReceberValor.Value;
        tbCRecSeleMultaDia.Value:=tbCReceberMultaDia.Value;
        tbCRecSeleValorMulta.Value:=tbCReceberValorMulta.Value;
        tbCRecSelePercMulta.Value:=tbCReceberPercMulta.Value;
        tbCRecSeleDescDia.Value:=tbCReceberDescDia.Value;
        tbCRecSeleValorDesc.Value:=tbCReceberValorDesc.Value;
        tbCRecSelePercDesc.Value:=tbCReceberPercDesc.Value;
        tbCRecSeleJurosDia.Value:=tbCReceberJurosDia.Value;
        tbCRecSeleValorJuros.Value:=tbCReceberValorJuros.Value;
        tbCRecSelePercJuros.Value:=tbCReceberPercJuros.Value;
        //Localizar dados de Vendas
        if tbVendas.Locate('DataVen;CodVen',VarArrayOf([tbCReceberDataVen.Value,tbCReceberCodVen.Value]),[]) then
          begin
          tbCRecSeleDetalhe.Value:='Vendas do dia : '+DateToStr(tbVendasDataven.Value)+#13;
          tbCRecSeleDetalhe.Value:=tbCRecSeleDetalhe.Value+'Vendedor : '+tbVendaslknomefunc.Value+#13+#13;
          tbCRecSeleDetalhe.Value:=tbCRecSeleDetalhe.Value+'Valor Produto   Qtd.   Produto'+#13;
          tbVisDetVen.First;
          while not (tbVisDetVen.Eof) do
            begin
            Val:=FloatToStrF(tbVisDetVenPrecoUnit.Value,ffNumber,10,2);
            Tam:=length(Val);
            if Tam <= 4 then
              Spc:=StrSpace(14-Tam)
            else
              if Tam <=6 then
                Spc:=StrSpace(11-(Tam-4+1))
              else
                Spc:=StrSpace(11-((Tam-6)*2));
            tbCRecSeleDetalhe.Value:=tbCRecSeleDetalhe.Value+Spc+Val;
            tbCRecSeleDetalhe.Value:=tbCRecSeleDetalhe.Value+'   ';
            Qt:=FloatToStr(tbVisDetVenQuant.Value);
            Tam:=length(Qt);
            Spc:=StrSpace(4-Tam);
            tbCRecSeleDetalhe.Value:=tbCRecSeleDetalhe.Value+Spc+Qt;
            tbCRecSeleDetalhe.Value:=tbCRecSeleDetalhe.Value+'     ';
            tbCRecSeleDetalhe.Value:=tbCRecSeleDetalhe.Value+tbVisDetVenLKnome.Value+#13;
            tbVisDetVen.Next;
            end;
          end
        else
          begin
          tbCRecSeleDetalhe.Value:='Documento : '+tbCReceberLkTipoDoc.Value+#13;
          tbCRecSeleDetalhe.Value:=tbCRecSeleDetalhe.Value+'N� Documento : '+tbCReceberNumDoc.Value+#13;
          tbCRecSeleDetalhe.Value:=tbCRecSeleDetalhe.Value+'Cliente : '+tbCReceberlkCliente.Value+#13;
          end;
        tbCRecSele.Post;
        end;
      end;
    FrmSelecCR.Visible:=False;
    dmDados.tbCRecSele.Close;
    FrmBaixaLoteCR:=TFrmBaixaLoteCR.create(application);
    FrmBaixaLoteCR.ShowModal;
    dmDados.tbCRecSele.Open;
    end;
end;

procedure TFrmSelecCR.DtVencIniExit(Sender: TObject);
begin
  FlagIni:=True;
  if DtVencIni.Text= '  /  /    ' then
    Begin
    MsgDlg.MsgWarning('� obrigat�rio a DATA INICIAL');
    FlagIni:=False;
    DtVencIni.SetFocus;
    End
  else
    begin
    try
      StrToDate(DtVencIni.Text);
    except
      on EConvertError do
        begin
        MsgDlg.MsgError('Data Inv�lida');
        FlagIni:=False;
        DtVencIni.SetFocus;
        end;
    end;
    end;
end;

procedure TFrmSelecCR.dtVencFimExit(Sender: TObject);
begin
  FlagFim:=True;
  if dtVencFim.Text= '  /  /    ' then
    Begin
    MsgDlg.MsgWarning('� obrigat�rio a DATA INICIAL');
     FlagFim:=False;
    dtVencFim.SetFocus;
    End
  else
    begin
    try
      StrToDate(dtVencFim.Text);
    except
      on EConvertError do
        begin
        MsgDlg.MsgError('Data Inv�lida');
        FlagFim:=False;
        dtVencFim.SetFocus;
        end;
    end;
    end;
  if (Flagini) and (FlagFim) then
    begin
    dmdados.tbCreceber.filtered:=false;
    dmdados.tbCreceber.Filter:='(Pago='''+'ABERTO'+''') and '+
                               '(DataVenc >='''+DtVencIni.Text+''') and'+
                               '(DataVenc <='''+dtVencFim.Text+''')';
    dmdados.tbCreceber.Filtered:=true;
    dmDados.CRecCli:=False;
    end;
end;

procedure TFrmSelecCR.btnLocCliClick(Sender: TObject);
begin
  frmLocCliente:=tfrmLocCliente.Create(application);
  frmLocCliente.ShowModal;
  dbLookCli.Text:=frmLocCliente.Nome;
  frmlocCliente.Free;
end;

procedure TFrmSelecCR.dbLookCliExit(Sender: TObject);
begin
  if dbLookCli.Text<>'' then
    begin
    dmdados.tbCreceber.filtered:=false;
    if (Flagini) and (FlagFim) then
      dmdados.tbCreceber.Filter:='(Pago='''+'ABERTO'+''') and '+
                                 '(DataVenc >='''+DtVencIni.Text+''') and'+
                                 '(DataVenc <='''+dtVencFim.Text+''') and'+
                                 '(CodCli ='''+dbCodCli.Text+''')'
    else
      dmdados.tbCreceber.Filter:='(Pago ='''+'ABERTO'+''') and '+
                                 '(CodCli ='''+dbCodCli.Text+''')';
    dmDados.CRecCli:=True;
    dmdados.tbCreceber.Filtered:=true;
    end;
end;

procedure TFrmSelecCR.dbLookCliCloseUp(Sender: TObject);
begin
  if dbLookCli.Text<>'' then
    begin
    dmdados.tbCreceber.filtered:=false;
    if (Flagini) and (FlagFim) then
      dmdados.tbCreceber.Filter:='(Pago='''+'ABERTO'+''') and '+
                                 '(DataVenc >='''+DtVencIni.Text+''') and'+
                                 '(DataVenc <='''+dtVencFim.Text+''') and'+
                                 '(CodCli ='''+dbCodCli.Text+''')'
    else
      dmdados.tbCreceber.Filter:='(Pago ='''+'ABERTO'+''') and '+
                                 '(CodCli ='''+dbCodCli.Text+''')';
    dmDados.CRecCli:=True;
    dmdados.tbCreceber.Filtered:=true;
    end;
end;

procedure TFrmSelecCR.rbDatasClick(Sender: TObject);
begin
  DtVencIni.Enabled:=True;
  dtVencFim.Enabled:=True;
  DtVencIni.SetFocus;
end;

procedure TFrmSelecCR.rbTodasClick(Sender: TObject);
begin
  dmdados.tbCreceber.filtered:=false;
  dmdados.tbCreceber.Filter:='(Pago='''+'ABERTO'+''')';
  dmdados.tbCreceber.Filtered:=true;
  dmDados.CRecCli:=False;
end;

procedure TFrmSelecCR.FormCreate(Sender: TObject);
begin
  DoPrinc:=True;
end;

end.
