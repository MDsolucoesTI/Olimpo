//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitSelecCP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, RxMenus, RXSplit, CurrEdit, RXDBCtrl, DBCtrls, StdCtrls, Mask,variants,
  ToolEdit, Grids, DBGrids, RackCtls, RXCtrls, SRColBtn, ExtCtrls, SRGrad,
  jpeg, Buttons, SpeedBar, RxLookup,DBTables, fcButton, fcImgBtn, RxGrdCpt,
  fcImager;

type
  TFrmSelecCP = class(TForm)
    Panel2: TPanel;
    RxLabel11: TRxLabel;
    cetotal: TCurrencyEdit;
    RxLabel1: TRxLabel;
    lookConta: TRxLookupEdit;
    Edit1: TEdit;
    Panel1: TPanel;
    RxLabel4: TRxLabel;
    Image1: TImage;
    Panel3: TPanel;
    btnBaixa: TfcImageBtn;
    btnSair: TfcImageBtn;
    RxGradientCaption2: TRxGradientCaption;
    Panel4: TPanel;
    RadioButton1: TRadioButton;
    RxLabel10: TRxLabel;
    Panel5: TPanel;
    lbcliente: TRxLabel;
    dblookFor: TRxDBLookupCombo;
    btnlocfor: TfcImageBtn;
    RxLabel2: TRxLabel;
    RadioButton2: TRadioButton;
    dbDtReceb: TDBDateEdit;
    DBDateEdit1: TDBDateEdit;
    RxLabel3: TRxLabel;
    Label2: TLabel;
    Label1: TLabel;
    dbgridBaixa: TRxDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnBaixaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDinheiroClick(Sender: TObject);
    procedure btnsairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure lookContaExit(Sender: TObject);
    procedure lookContaCloseUp(Sender: TObject);
    procedure dbgridBaixaCellClick(Column: TColumn);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelecCP: TFrmSelecCP;

implementation

uses  unitDmDados, UnitPrincipal, UnitTipoPagto;

{$R *.DFM}

procedure TFrmSelecCP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
frmPrincipal.statusteclas(False,'');
dmdados.tbCPagar.Filtered:=false;
Action:= Cafree;
end;

procedure TFrmSelecCP.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;


procedure TFrmSelecCP.btnBaixaClick(Sender: TObject);
{var
  custo               : string[10];
  dia,mes,ano         : word;
  anoCusto,mesCusto : string;
  PosReg:array[1..20] of integer;
  c,c1 : integer; }
begin
  FrmTipoPgto:=TFrmTipoPgto.create(application);
  FrmTipoPgto.show;

{ dmdados.tbCPagar.First;
  c:=0;
  While not dmdados.tbCPagar.Eof do
    begin
    if DBGridBaixa.SelectedRows.IndexOf(dmdados.tbCPagar.BookMark) >= 0 then
      begin
      c:=c+1;
      PosReg[c]:=dmDados.tbCPagar.RecNo;
      end;
    dmdados.tbCPagar.Next;
    end;
  for c1:=1 to c do
     begin
      dmdados.tbCPagar.RecNo:=PosReg[c1];
      cetotal.Value:=cetotal.value+dmdados.tbCPagarValor.Value;
      dmdados.tbCPagar.edit;
      dmdados.tbCPagarDataPaga.Value:=date;
      dmdados.tbCPagarFormaPagto.Value:='DH';
      dmdados.tbCPagarPago.Value:='Pago';
      dmdados.tbCPagarCompHist.Value:=dmdados.tbCPagarCompHist.Value+'.'+'Recebi/o c/ baixa em lote.';
      dmdados.tbCPagarValorPago.Value:=dmdados.tbCPagarValor.Value;
      dmdados.tbCPagar.Post;

      {Atualizar movimento de conta
      dmdados.TbMovConta.Append;
      dmdados.tbMovContaDosNumero.value:=dmdados.tbCPagarNumDoc.value;
      dmdados.TbMovContaConta.Value:=edit1.Text;
      dmdados.TbMovContaDataMov.Value:=date;
      dmdados.tbMovContaDataReg.value:=date;
      dmdados.TbMovContaHoraReg.Value:=time;
      dmdados.TbMovContaValor.Value:=dmdados.tbCPagarValor.Value;
      dmdados.TbMovContaTipoOper.Value:='S';
      // dmdados.TbMovContaUserName.Value:=frmprincipal.username;
      dmdados.TbMovContaCodHist.Value:=dmdados.tbCPagarCodHist.Value;
      dmdados.TbMovContaComplHist.Value:='Recebto efetuado atrav�s de baixa em lote';
      dmdados.TbMovConta.Post;

      {atualizar conta corrente
      if dmdados.TbCCorrente.Locate('Conta',lookConta.Text,[]) then
      begin
      dmdados.TbCCorrente.Edit;
      dmdados.TbCCorrenteSaldo.Value:=
      dmdados.TbCCorrenteSaldo.Value+dmdados.tbCPagarValor.Value;
      dmdados.tbccorrenteUltMov.value:=date;
      dmdados.TbCCorrente.post;
      end;

      {atualizar centro de custo
      decodedate(now,ano,mes,dia);
      mesCusto:=IntToStr(mes);
      anoCusto:=intToStr(ano);
      if dmdados.TbBalCusto.Locate('CodCcusto;Mes;Ano',VarArrayOf([custo,mesCusto,anoCusto]),[]) then
        begin
        dmdados.tbBalcusto.edit;
        dmdados.tbBalcustoDespesas.value:=
        dmdados.tbBalCustoReceitas.value+dmdados.tbCPagarValor.Value;
        dmdados.tbBalCustoDespesas.Value:=0;
        dmdados.tbBalCusto.Post;
        end
      else
        begin
        dmdados.tbBalCusto.Append;
        dmdados.tbBalCustoCodCcusto.Value:=Custo;
        dmdados.tbBalCustoMes.Value:=IntToStr(mes);
        dmdados.tbBalCustoAno.Value:=IntToStr(ano);
        dmdados.tbBalCustoReceitas.Value:=dmdados.tbCPagarValor.Value;
        dmdados.tbBalCustoDespesas.Value:=0;
        dmdados.tbBalCusto.Post;
        end;
     end; }
  end;

procedure TFrmSelecCP.FormCreate(Sender: TObject);
begin
dmdados.tbCpagar.filtered:=false;
dmdados.tbCPagar.Filter:='(Pago='''+'ABERTO'+''')';
dmdados.tbCPagar.Filtered:=true;
end;



procedure TFrmSelecCP.btnDinheiroClick(Sender: TObject);
var
  custo               : string[10];
  dia,mes,ano         : word;
  anoCusto,mesCusto : string;
  PosReg:array[1..20] of integer;
  c,c1 : integer;

begin

  dmdados.tbCPagar.First;
  c:=0;
  While not dmdados.tbCpagar.Eof do
    begin
    if DBGridBaixa.SelectedRows.IndexOf(dmdados.tbCPagar.BookMark) >= 0 then
      begin
      c:=c+1;
      PosReg[c]:=dmDados.tbCPagar.RecNo;
      end;
    dmdados.tbCPagar.Next;
    end;
  for c1:=1 to c do
     begin
      dmdados.tbCPagar.RecNo:=PosReg[c1];
      cetotal.Value:=cetotal.value+dmdados.tbCPagarValor.Value;
      dmdados.tbCPagar.edit;
      dmdados.tbCPagarDataPaga.Value:=date;
      dmdados.tbCPagarPago.Value:='Pago';
      dmdados.tbCPagarCompHist.Value:=dmdados.tbCPagarCompHist.Value+'.'+'Pag/o c/ baixa em lote.';
      dmdados.tbCPagarValorPago.Value:=dmdados.tbCPagarValor.Value;
      dmdados.tbCPagar.Post;

      {Atualizar movimento de conta}
      dmdados.TbMovConta.Append;
      dmdados.tbMovContaDosNumero.value:=dmdados.tbCPagarNumDoc.value;
      dmdados.TbMovContaConta.Value:=edit1.Text;
      dmdados.TbMovContaDataMov.Value:=date;
      dmdados.tbMovContaDataReg.value:=date;
      dmdados.TbMovContaHoraReg.Value:=time;
      dmdados.TbMovContaValor.Value:=dmdados.tbCPagarValor.Value;
      dmdados.TbMovContaTipoOper.Value:='S';
      // dmdados.TbMovContaUserName.Value:=frmprincipal.username;
      dmdados.TbMovContaCodHist.Value:=dmdados.tbCPagarCodHist.Value;
      dmdados.TbMovContaComplHist.Value:='Pagto efetuado atrav�s de baixa em lote';
      dmdados.TbMovConta.Post;

      {atualizar conta corrente}
      if dmdados.TbCCorrente.Locate('Conta',lookConta.Text,[]) then
      begin
      dmdados.TbCCorrente.Edit;
      dmdados.TbCCorrenteSaldo.Value:=
      dmdados.TbCCorrenteSaldo.Value-dmdados.tbCPagarValor.Value;
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
        dmdados.tbBalCustoDespesas.value+dmdados.tbCPagarValor.Value;
        dmdados.tbBalCustoReceitas.Value:=0;
        dmdados.tbBalCusto.Post;
        end
      else
        begin
        dmdados.tbBalCusto.Append;
        dmdados.tbBalCustoCodCcusto.Value:=Custo;
        dmdados.tbBalCustoMes.Value:=IntToStr(mes);
        dmdados.tbBalCustoAno.Value:=IntToStr(ano);
        dmdados.tbBalCustoDespesas.Value:=dmdados.tbCPagarValor.Value;
        dmdados.tbBalCustoReceitas.Value:=0;
        dmdados.tbBalCusto.Post;
        end;
     end;
end;


procedure TFrmSelecCP.btnsairClick(Sender: TObject);
begin
close;
end;

procedure TFrmSelecCP.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : if dmDados.vTabStt then BtnSair.Click;
      VK_F2     : btnBaixa.Click;
end;
end;

procedure TFrmSelecCP.FormShow(Sender: TObject);
begin
FrmPrincipal.StatusTeclas(True,'[F2] Baixa Contas a Pagar [Esc] Sair');
end;

procedure TFrmSelecCP.lookContaExit(Sender: TObject);
begin
if lookConta.Text='' then
   begin
   ShowMessage('Obrigat�rio informar a conta de registro');
   lookconta.SetFocus;
   btnBaixa.Enabled:=false;
   end
else
   begin
   if dmdados.TbCCorrente.Locate('Descricao',lookConta.Text,[]) then
      edit1.Text:=dmdados.TbCCorrenteConta.Value;
   btnBaixa.Enabled:=true;
   end;
end;

procedure TFrmSelecCP.lookContaCloseUp(Sender: TObject);
begin
if lookConta.Text='' then
   begin
   ShowMessage('Obrigat�rio informar a conta de registro');
   lookconta.SetFocus;
   btnBaixa.Enabled:=false;
   end
else
   begin
   if dmdados.TbCCorrente.Locate('Descricao',lookConta.Text,[]) then
      edit1.Text:=dmdados.TbCCorrenteConta.Value;
   btnBaixa.Enabled:=true;
   end;
end;

procedure TFrmSelecCP.dbgridBaixaCellClick(Column: TColumn);
var
  i : Integer;
  Tabela: TTable;
begin
  cetotal.Value:=0;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbcPagar.DatabaseName;
  Tabela.TableName := dmDados.tbcPagar.TableName;
  Tabela.IndexName := dmdados.tbcPagar.IndexName;
  Tabela.FieldDefs := dmdados.tbcPagar.FieldDefs;
  Tabela.Open;
  if dbgridBaixa.SelectedRows.Count>0 then
    for i:=0 to dbgridBaixa.SelectedRows.Count-1 do
      begin
      Tabela.GotoBookmark(pointer(dbgridBaixa.SelectedRows.Items[i]));
      cetotal.Value:=cetotal.value+Tabela.FieldValues['Valor'];
      end;
end;

end.
