//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitCreceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SpeedBar, jpeg, ExtCtrls, fcButton, fcImgBtn, ToolWin, ComCtrls, RXCtrls,
  RXSplit, StdCtrls, DBCtrls, Mask, ToolEdit, RXDBCtrl, CurrEdit, SRColBtn,
  TFlatCheckBoxUnit, Spin, RackCtls, RxLookup, TFlatHintUnit,db,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDShapeHint;

type
  TFrmCReceber = class(TForm)
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnPrimeiro: TSpeedItem;
    BtnAnterior: TSpeedItem;
    BtnProximo: TSpeedItem;
    BtnUltimo: TSpeedItem;
    BtnNovo: TSpeedItem;
    BtnGravar: TSpeedItem;
    BtnCancelar: TSpeedItem;
    BtnAlterar: TSpeedItem;
    BtnDeletar: TSpeedItem;
    BtnLocalizar: TSpeedItem;
    BtnSair: TSpeedItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    fcImageBtn4: TfcImageBtn;
    Panel6: TPanel;
    RxLabel11: TRxLabel;
    RxLabel12: TRxLabel;
    lbdiadesc: TRxLabel;
    rbPercDesc: TRadioButton;
    rbValorDesc: TRadioButton;
    dbdiadesc: TDBDateEdit;
    dbevalordesc: TDBEdit;
    dbeperc: TDBEdit;
    Panel7: TPanel;
    RxLabel13: TRxLabel;
    RxLabel15: TRxLabel;
    lbdiamulta: TRxLabel;
    rbPercMulta: TRadioButton;
    rbValorMulta: TRadioButton;
    dbdiamulta: TDBDateEdit;
    dbevalormulta: TDBEdit;
    dbepercmulta: TDBEdit;
    Panel8: TPanel;
    RxLabel17: TRxLabel;
    RxLabel18: TRxLabel;
    lbdiajuros: TRxLabel;
    rbPercJuros: TRadioButton;
    rbValorJuros: TRadioButton;
    dbdiajuros: TDBDateEdit;
    dbevalorjuros: TDBEdit;
    dbepercjuros: TDBEdit;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    Image2: TImage;
    Label2: TLabel;
    Panel3: TPanel;
    lbdoc: TRxLabel;
    lbtipodocimento: TRxLabel;
    lbcliente: TRxLabel;
    lbhist: TRxLabel;
    lbemissao: TRxLabel;
    lbvenc: TRxLabel;
    lbvalor: TRxLabel;
    lbcentrocusto: TRxLabel;
    lbcompl: TRxLabel;
    dbeNumDoc: TDBEdit;
    btloccli: TfcImageBtn;
    dbemissao: TDBDateEdit;
    dbvenc: TDBDateEdit;
    dbvalor: TRxDBCalcEdit;
    btlocCusto: TfcImageBtn;
    btlocdoc: TfcImageBtn;
    dbcomplhist: TDBEdit;
    dblookTipo: TRxDBLookupCombo;
    dblookCli: TRxDBLookupCombo;
    dblookcusto: TRxDBLookupCombo;
    dblookhist: TRxDBLookupCombo;
    btLocHist: TfcImageBtn;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel3: TRxLabel;
    Panel4: TPanel;
    lbvalorpago: TRxLabel;
    lbdatapagto: TRxLabel;
    dbdatapagto: TDBDateEdit;
    dbvalorpago: TRxDBCalcEdit;
    DBEditSituacao: TDBEdit;
    ImageBaixa: TfcImageBtn;
    ImageRestaurar: TfcImageBtn;
    RxLabel4: TRxLabel;
    LMDShapeHint1: TLMDShapeHint;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbeNumDocEnter(Sender: TObject);
    procedure dbeNumDocExit(Sender: TObject);
    procedure DBComboTipoDocEnter(Sender: TObject);
    procedure DBComboTipoDocExit(Sender: TObject);
    procedure DBComboClienteExit(Sender: TObject);
    procedure DBComboClienteEnter(Sender: TObject);
    procedure DBComboCCustoEnter(Sender: TObject);
    procedure DBComboCCustoExit(Sender: TObject);
    procedure DBMemoHistExit(Sender: TObject);
    procedure DBMemoHistEnter(Sender: TObject);
    procedure dbemissaoEnter(Sender: TObject);
    procedure dbemissaoExit(Sender: TObject);
    procedure dbvalorEnter(Sender: TObject);
    procedure dbvalorExit(Sender: TObject);
    procedure dbvencEnter(Sender: TObject);
    procedure dbvencExit(Sender: TObject);
    procedure dbdatapagtoEnter(Sender: TObject);
    procedure dbdatapagtoExit(Sender: TObject);
    procedure DBEditBaixaEnter(Sender: TObject);
    procedure DBEditBaixaExit(Sender: TObject);
    procedure dbvalorpagoEnter(Sender: TObject);
    procedure dbvalorpagoExit(Sender: TObject);
    procedure dbdiadescEnter(Sender: TObject);
    procedure dbdiadescExit(Sender: TObject);
    procedure dbevalordescEnter(Sender: TObject);
    procedure dbevalordescExit(Sender: TObject);
    procedure dbepercEnter(Sender: TObject);
    procedure dbepercExit(Sender: TObject);
    procedure dbdiamultaEnter(Sender: TObject);
    procedure dbdiamultaExit(Sender: TObject);
    procedure dbevalormultaEnter(Sender: TObject);
    procedure dbevalormultaExit(Sender: TObject);
    procedure dbdiajurosEnter(Sender: TObject);
    procedure dbdiajurosExit(Sender: TObject);
    procedure dbevalorjurosEnter(Sender: TObject);
    procedure dbevalorjurosExit(Sender: TObject);
    procedure dbepercjurosEnter(Sender: TObject);
    procedure dbepercjurosExit(Sender: TObject);
    procedure ImageBaixaClick(Sender: TObject);
    procedure DBLookupHistEnter(Sender: TObject);
    procedure DBLookupHistExit(Sender: TObject);
    procedure dbepercmultaEnter(Sender: TObject);
    procedure dbepercmultaExit(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure DBComboQtdParcEnter(Sender: TObject);
    procedure DBComboQtdParcExit(Sender: TObject);
    procedure DBComboBox1Enter(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure SpinEdit1Enter(Sender: TObject);
    procedure SpinEdit1Exit(Sender: TObject);
    procedure dblookTipoEnter(Sender: TObject);
    procedure dblookCliEnter(Sender: TObject);
    procedure dblookcustoEnter(Sender: TObject);
    procedure dblookhistEnter(Sender: TObject);
    procedure dbcomplhistEnter(Sender: TObject);
    procedure dblookTipoExit(Sender: TObject);
    procedure dblookCliExit(Sender: TObject);
    procedure dblookcustoExit(Sender: TObject);
    procedure dblookhistExit(Sender: TObject);
    procedure dbcomplhistExit(Sender: TObject);
    procedure btlocdocClick(Sender: TObject);
    procedure btloccliClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure rbValorDescClick(Sender: TObject);
    procedure rbPercDescClick(Sender: TObject);
    procedure rbValorMultaClick(Sender: TObject);
    procedure rbValorJurosClick(Sender: TObject);
    procedure rbPercJurosClick(Sender: TObject);
    procedure btlocCustoClick(Sender: TObject);
    procedure btLocHistClick(Sender: TObject);
    procedure rbPercMultaClick(Sender: TObject);
    procedure ImageRestaurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCReceber: TFrmCReceber;

implementation

uses UnitLocCReceber, UnitDmdados, UnitLocFornec,
  UnitLocTipoDoc, UnitLocCliente, UnitLocCCusto, UnitLocHistorico,
  unitPrincipal, unitBaixaCreceber, unitQrCrec;

{$R *.DFM}

procedure TFrmCReceber.BtnSairClick(Sender: TObject);
begin
Close;
end;

procedure TFrmCReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
frmPrincipal.statusteclas(False,'');
Action:= Cafree;
end;

procedure TFrmCReceber.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmCReceber.dbeNumDocEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=$00d2e2ff;
end;

procedure TFrmCReceber.dbeNumDocExit(Sender: TObject);
begin
if dbeNumDoc.Text='' then
   begin
   ShowMessage('Necess�rio informar o N�mero do Documento');
   dbeNumDoc.SetFocus;
   end
   else
   (Sender as TDbEdit).Color:=clwindow;
end;

procedure TFrmCReceber.DBComboTipoDocEnter(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=$00d2e2ff;
end;

procedure TFrmCReceber.DBComboTipoDocExit(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clWindow;
end;

procedure TFrmCReceber.DBComboClienteExit(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clWindow;
end;

procedure TFrmCReceber.DBComboClienteEnter(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clTEAL;
end;

procedure TFrmCReceber.DBComboCCustoEnter(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clTEAL;
end;

procedure TFrmCReceber.DBComboCCustoExit(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clWindow;
end;

procedure TFrmCReceber.DBMemoHistExit(Sender: TObject);
begin
(Sender as TDbMemo).Color:=clWindow;
end;

procedure TFrmCReceber.DBMemoHistEnter(Sender: TObject);
begin
(Sender as TDbMemo).Color:=clTEAL;
end;

procedure TFrmCReceber.dbemissaoEnter(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=$00d2e2ff;
end;

procedure TFrmCReceber.dbemissaoExit(Sender: TObject);
begin
If dbemissao.Text= '  /  /    ' then
      Begin
      ShowMessage('� obrigat�rio a Data de Emiss�o');
      dbEmissao.SetFocus;
      End
    Else
      (Sender as TDBDateEdit).color:=clWindow;
end;

procedure TFrmCReceber.dbvalorEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).Color:=$00d2e2ff;
end;

procedure TFrmCReceber.dbvalorExit(Sender: TObject);
begin
If dbvalor.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Valor do documento');
      dbvalor.SetFocus;
      End
    Else
      (Sender as TRxDBCalcEdit).color:=clWindow;end;

procedure TFrmCReceber.dbvencEnter(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=$00d2e2ff;
end;

procedure TFrmCReceber.dbvencExit(Sender: TObject);
VAR
 diasDesc : LongInt;
 diasMulta : LongInt;
 diasJuros : LongInt;

begin
if dbVenc.text = '  /  /    ' then
 begin
 ShowMessage('Obrigat�rio a Data de Vencimento');
 dbvenc.SetFocus;
 end
 else
 diasmulta:=dmdados.TbParametroMultaDia.Value;
 diasdesc:=dmdados.TbParametroDescDia.Value;
 diasJuros:=dmdados.TbParametroJurosDia.Value;
 dmdados.tbCReceberDescDia.Value:=(dmdados.tbCReceberDataVenc.Value-diasdesc);
 dmdados.tbCReceberMultaDia.Value:=dmdados.tbCReceberDataVenc.Value+diasmulta;
 dmdados.tbCReceberJurosDia.Value:=dmdados.tbCReceberDataVenc.Value + diasJuros;
 (Sender as TDbDateEdit).Color:=clWindow;
end;

procedure TFrmCReceber.dbdatapagtoEnter(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=$00d2e2ff;
end;

procedure TFrmCReceber.dbdatapagtoExit(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=clWindow;
end;

procedure TFrmCReceber.DBEditBaixaEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clTEAL;
end;

procedure TFrmCReceber.DBEditBaixaExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCReceber.dbvalorpagoEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).Color:=$00d2e2ff;
end;

procedure TFrmCReceber.dbvalorpagoExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).Color:=clWindow;
end;

procedure TFrmCReceber.dbdiadescEnter(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=$00d2e2ff;
end;

procedure TFrmCReceber.dbdiadescExit(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=clWindow;
end;

procedure TFrmCReceber.dbevalordescEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=$00d2e2ff;
end;

procedure TFrmCReceber.dbevalordescExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCReceber.dbepercEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=$00d2e2ff;
end;

procedure TFrmCReceber.dbepercExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCReceber.dbdiamultaEnter(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=$00d2e2ff;
end;

procedure TFrmCReceber.dbdiamultaExit(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=clWindow;
end;

procedure TFrmCReceber.dbevalormultaEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=$00d2e2ff;
end;

procedure TFrmCReceber.dbevalormultaExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCReceber.dbdiajurosEnter(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=$00d2e2ff;
end;

procedure TFrmCReceber.dbdiajurosExit(Sender: TObject);
begin
(Sender as TDbDateEdit).Color:=clWindow;
end;

procedure TFrmCReceber.dbevalorjurosEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=$00d2e2ff;
end;

procedure TFrmCReceber.dbevalorjurosExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCReceber.dbepercjurosEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=$00d2e2ff;
end;

procedure TFrmCReceber.dbepercjurosExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCReceber.ImageBaixaClick(Sender: TObject);
begin
FrmBaixaCReceber:=TFrmBaixaCReceber.Create(Application);
FrmBaixaCReceber.ShowModal;
end;

procedure TFrmCReceber.DBLookupHistEnter(Sender: TObject);
begin
(Sender as TDbLookupComboBox).Color:=clTEAL;
end;

procedure TFrmCReceber.DBLookupHistExit(Sender: TObject);
begin
(Sender as TDbLookupComboBox).Color:=clWindow;
end;

procedure TFrmCReceber.dbepercmultaEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=$00d2e2ff;
end;

procedure TFrmCReceber.dbepercmultaExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clwindow;
end;

procedure TFrmCReceber.BtnLocalizarClick(Sender: TObject);
begin
FrmLocCreceber:=TFrmLocCReceber.Create(Application);
FrmLocCReceber.ShowModal;
FrmLocCReceber.Free;
end;

procedure TFrmCReceber.DBComboQtdParcEnter(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clTEAL;
end;

procedure TFrmCReceber.DBComboQtdParcExit(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clWindow;
end;

procedure TFrmCReceber.DBComboBox1Enter(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clTEAL;
end;

procedure TFrmCReceber.DBComboBox1Exit(Sender: TObject);
begin
(Sender as TDbComboBox).Color:=clWindow;
end;

procedure TFrmCReceber.SpinEdit1Enter(Sender: TObject);
begin
(Sender as TSpinEdit).Color:=clTeal;
end;

procedure TFrmCReceber.SpinEdit1Exit(Sender: TObject);
begin
(Sender as TSpinEdit).Color:=clWindow;
end;

procedure TFrmCReceber.dblookTipoEnter(Sender: TObject);
begin
(Sender as TRxDbLookupCombo).color:=$00d2e2ff;
end;

procedure TFrmCReceber.dblookCliEnter(Sender: TObject);
begin
(Sender as TRxDbLookupCombo).color:=$00d2e2ff;
end;

procedure TFrmCReceber.dblookcustoEnter(Sender: TObject);
begin
(Sender as TRxDbLookupCombo).color:=$00d2e2ff;
end;

procedure TFrmCReceber.dblookhistEnter(Sender: TObject);
begin
(Sender as TRxDbLookupCombo).color:=$00d2e2ff;
end;

procedure TFrmCReceber.dbcomplhistEnter(Sender: TObject);
begin
(Sender as TDbEdit).color:=$00d2e2ff;
end;

procedure TFrmCReceber.dblookTipoExit(Sender: TObject);
begin
(Sender as TRxDbLookupCombo).color:=clWindow;
end;

procedure TFrmCReceber.dblookCliExit(Sender: TObject);
begin
  (Sender as TRxDbLookupCombo).color:=clWindow;
end;

procedure TFrmCReceber.dblookcustoExit(Sender: TObject);
begin
(Sender as TRxDbLookupCombo).color:=clWindow;
end;

procedure TFrmCReceber.dblookhistExit(Sender: TObject);
begin
(Sender as TRxDbLookupCombo).color:=clWindow;
end;

procedure TFrmCReceber.dbcomplhistExit(Sender: TObject);
begin
(Sender as TDbedit).color:=clWindow;
end;

procedure TFrmCReceber.btlocdocClick(Sender: TObject);
begin
if (dmdados.tbCReceber.State=dsedit)or(dmdados.tbCReceber.State=dsInsert) then
begin
frmLocTipoDoc:=tfrmLocTipoDoc.create(application);
frmLocTipoDoc.showmodal;
dmdados.tbCReceberCodDoc.value:=frmlocTipoDoc.resultado;
frmLocTipoDoc.Free;
end;
end;

procedure TFrmCReceber.btloccliClick(Sender: TObject);
begin
if (dmdados.tbCReceber.State=dsedit)or(dmdados.tbCReceber.State=dsInsert) then
begin
frmLocClientes:=tfrmLocClientes.Create(application);
frmLocClientes.ShowModal;
dmdados.tbCReceberCodCli.Value:=frmlocclientes.Resultado;
frmlocclientes.Free;
end;
end;

procedure TFrmCReceber.BtnPrimeiroClick(Sender: TObject);
begin
dmdados.tbCReceber.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;

end;

procedure TFrmCReceber.BtnAnteriorClick(Sender: TObject);
begin
dmdados.tbCreceber.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
If dmdados.TbCreceber.bof Then
 Begin
  btnPrimeiro.Enabled:=False;
  btnAnterior.Enabled:=False;
  End;

end;

procedure TFrmCReceber.BtnProximoClick(Sender: TObject);
begin
dmdados.tbCReceber.next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
If dmdados.tbCReceber.Eof Then
 Begin
 btnProximo.Enabled:=False;
 btnUltimo.Enabled:=False;
 end;

end;

procedure TFrmCReceber.BtnUltimoClick(Sender: TObject);
begin
dmdados.tbCReceber.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;

end;

procedure TFrmCReceber.BtnNovoClick(Sender: TObject);
begin
dmdados.tbCReceber.Append;
{habilitando os bot�es}
BtnGravar.Enabled := true;
BtnCancelar.Enabled:=true;
BtnNovo.Enabled:=False;
BtnPrimeiro.Enabled:=False;
BtnAnterior.Enabled:=False;
BtnProximo.Enabled:=False;
BtnUltimo.Enabled:=False;
BtnAlterar.Enabled:=False;
BtnDeletar.Enabled:=False;
{habilitando os componentes}
dbeNumDoc.Enabled:=true;
DblookTipo.Enabled:= True;
dblookcli.Enabled:=True;
dblookcusto.Enabled:=true;
dblookhist.Enabled:=true;
dbComplHist.Enabled:=True;
dbEmissao.Enabled:=True;
dbVenc.Enabled:=true;
dbvalor.Enabled:=True;
DBDiaDesc.Enabled:=true;
dbDiaMulta.Enabled:=true;
dbDiajuros.Enabled:=true;
{desativar radio group}
rbValorDesc.Checked:=false;
rbPercDesc.Checked:=false;
rbValorMulta.Checked:=false;
rbPercMulta.Checked:=false;
rbValorJuros.Checked:=false;
rbPercJuros.Checked:=false;


dbeNumDoc.SetFocus;

end;

procedure TFrmCReceber.BtnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  If dbeNumDoc.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'N�Doc';
    Gravar:=False;
    Vazio:=True;
    end;
  If dbEmissao.Text= '  /  /    ' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Emissao';
    Gravar:=False;
    Vazio:=True;
    End;
  If dbVenc.Text= '  /  /    ' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Vencimento';
    Gravar:=False;
    Vazio:=True;
    End;
  If dbValor.Text= '' then
    Begin
    If dbvalor.value=0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Valor(R$)';
    Gravar:=False;
    Vazio:=True;
    End;
  If Gravar Then
    Begin
    dmdados.tbCReceberPago.Value:='Aberto';
    dmdados.tbCReceber.Post;
    BtnGravar.enabled := False;
    BtnCancelar.Enabled := False;
    BtnNovo.Enabled:=True;
    BtnPrimeiro.Enabled:=True;
    BtnAnterior.Enabled:=True;
    BtnProximo.Enabled:=True;
    BtnUltimo.Enabled:=True;
    BtnAlterar.Enabled:=True;
    Btndeletar.Enabled:=True;
    {desabilitando os componentes}
    DblookTipo.Enabled:= false;
    dblookcli.Enabled:=false;
    dblookcusto.Enabled:=false;
    dblookhist.Enabled:=false;
    dbComplHist.Enabled:=false;
    dbEmissao.Enabled:=false;
    dbVenc.Enabled:=false;
    dbvalor.Enabled:=false;
    DBDiaDesc.Enabled:=false;
    dbDiaMulta.Enabled:=false;
    dbDiajuros.Enabled:=false;
    dbenumdoc.Enabled:=false;
    ShowMessage('Dados gravados com sucesso');
    End
  Else
    Begin
    If Vazio Then
      begin
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      DbeNumDoc.SetFocus;
      end;
    end;
end;

procedure TFrmCReceber.BtnCancelarClick(Sender: TObject);
begin
dmdados.tbCReceber.cancel;
BtnGravar.enabled := false;
BtnCancelar.Enabled := false;
BtnNovo.Enabled:=True;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
Btnproximo.Enabled:=True;
BtnUltimo.Enabled:=True;
BtnAlterar.Enabled:=True;
BtnDeletar.Enabled:=True;
{desabilitando os objetos}
DblookTipo.Enabled:= false;
dblookcli.Enabled:=false;
dblookcusto.Enabled:=false;
dblookhist.Enabled:=false;
dbComplHist.Enabled:=false;
dbEmissao.Enabled:=false;
dbVenc.Enabled:=false;
dbvalor.Enabled:=false;
DBDiaDesc.Enabled:=false;
dbDiaMulta.Enabled:=false;
dbDiajuros.Enabled:=false;
speedbar1.SetFocus;
end;

procedure TFrmCReceber.BtnAlterarClick(Sender: TObject);
begin
if dmdados.tbCReceber.RecordCount=0 then
begin
ShowMessage('Tabela sem registro');
end
 else
 begin
 dmdados.tbCReceber.Edit;
 BtnCancelar.enabled:= true;
 BtnGravar.Enabled:= true;
 BtnNovo.Enabled:=False;
 BtnPrimeiro.Enabled:=False;
 BtnAnterior.Enabled:=False;
 BtnProximo.Enabled:=False;
 BtnUltimo.Enabled:=False;
 BtnAlterar.Enabled:=False;
 Btndeletar.Enabled:=False;
 {habilitando os objetos}
 DblookTipo.Enabled:= True;
 dblookcli.Enabled:=True;
 dblookcusto.Enabled:=true;
 dblookhist.Enabled:=true;
 dbComplHist.Enabled:=True;
 dbEmissao.Enabled:=True;
 dbVenc.Enabled:=true;
 dbvalor.Enabled:=True;
 DBDiaDesc.Enabled:=true;
 dbDiaMulta.Enabled:=true;
 dbDiajuros.Enabled:=true;
 dblooktipo.SetFocus;
 end;
end;

procedure TFrmCReceber.BtnDeletarClick(Sender: TObject);
begin
if dmdados.tbCReceber.RecordCount=0 then
   begin
   ShowMessage('Tabela sem registro');
   end
   else
   If application.MessageBox('Tem certeza que deseja exluir esse registro?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
   begin
    dmdados.tbCReceber.Delete;
   end
   else
   dmdados.tbCReceber.Cancel;

end;

procedure TFrmCReceber.rbValorDescClick(Sender: TObject);
var
  vl : real;
begin
vl:=dmdados.TbParametroValorDesc.Value;
dmdados.tbCReceberValorDesc.Value:=vl;
dbevalordesc.Enabled:=true;
dbeperc.Enabled:=false;
dbevalordesc.SetFocus;

end;

procedure TFrmCReceber.rbPercDescClick(Sender: TObject);
var
  prc : Real;
begin
prc:=dmdados.TbParametroPercDesc.Value;
dmdados.tbCReceberPercDesc.Value:=prc;
dbeperc.Enabled:=true;
dbevalordesc.Enabled:=false;
dbeperc.SetFocus;

end;

procedure TFrmCReceber.rbValorMultaClick(Sender: TObject);
var
  vl : real;
begin
vl:=dmdados.TbParametroValorMulta.Value;
dmdados.tbCReceberValorMulta.Value:=vl;
dbepercmulta.Enabled:=false;
dbevalormulta.Enabled:=true;
dbevalormulta.SetFocus;

end;

procedure TFrmCReceber.rbValorJurosClick(Sender: TObject);
var
  vl : real;
begin
vl:=dmdados.TbParametroValorJuros.Value;
dmdados.tbCReceberValorJuros.Value:=vl;
dbevalorjuros.Enabled:=true;
dbepercjuros.Enabled:=false;
dbevalorjuros.SetFocus;
end;

procedure TFrmCReceber.rbPercJurosClick(Sender: TObject);
var
  prc : Real;
begin
prc:=dmdados.TbParametroPercJuros.Value;
dmdados.tbCreceberPercJuros.Value:=prc;
dbepercjuros.Enabled:=true;
dbevalorjuros.Enabled:=false;
dbepercjuros.SetFocus;

end;

procedure TFrmCReceber.btlocCustoClick(Sender: TObject);
begin
if (dmdados.tbCReceber.State=dsedit)or(dmdados.tbCReceber.State=dsInsert) then
begin
frmLocCcusto:=tfrmLocCcusto.create(application);
frmLocCcusto.showmodal;
dmdados.tbCReceberCodCCusto.Value:=frmLocCcusto.resultado;
frmLocCcusto.free;
end;
end;

procedure TFrmCReceber.btLocHistClick(Sender: TObject);
begin
if (dmdados.tbCReceber.State=dsedit)or(dmdados.tbCReceber.State=dsInsert) then
begin
frmLocHistorico:=tfrmLocHistorico.create(application);
frmLocHistorico.showmodal;
dmdados.tbCReceberCodHist.Value:=frmLocHistorico.resultado;
frmLocHistorico.free;
end;
end;

procedure TFrmCReceber.rbPercMultaClick(Sender: TObject);
var
  prc : Real;

begin
prc:=dmdados.TbParametroPercMulta.Value;
dmdados.tbCReceberPercMulta.Value:=prc;
dbevalormulta.Enabled:=false;
dbepercmulta.Enabled:=true;
dbepercmulta.SetFocus;

end;

procedure TFrmCReceber.ImageRestaurarClick(Sender: TObject);
begin
QrReciboCrec:=tQrReciboCrec.create(application);
QrReciboCrec.rec.preview;
end;

procedure TFrmCReceber.FormShow(Sender: TObject);
begin
//FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [F9] Localizar [F2] Loc.Documento [F3] Loc.Cliente [F4] Loc.Centro Custo [F5] Loc.Hist�rico [F6] Baixa [F7] Restaurar [Esc] Cancelar ou Sair');
end;

procedure TFrmCReceber.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_Home   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_Delete : if (dmDados.vTabStt) then BtnDeletar.Click;
      VK_End    : if not(dmDados.vTabStt) then btnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
      VK_F2     : btLocDoc.Click;
      VK_F3     : btlocCli.Click;
      VK_F4     : btLocCusto.Click;
      VK_f5     : btlocHist.Click;
      VK_F6     : imageBaixa.Click;
      VK_F7     : imageRestaurar.Click;
      VK_F9     : btnlocalizar.Click;
    end;}

end;

end.
