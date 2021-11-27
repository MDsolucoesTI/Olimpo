//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unContraServ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, SpeedBar, jpeg, Menus, RxMenus, Grids, DBGrids, RXCtrls,db,
  StdCtrls, Mask, DBCtrls, RackCtls, RXSplit, ToolEdit, CurrEdit, RXDBCtrl,
  RxDBComb, fcButton, fcImgBtn, RxLookup;

type
  TfrmContraServ = class(TForm)
    spBarBotoes: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnPrimeiro: TSpeedItem;
    BtnAnterior: TSpeedItem;
    BtnProximo: TSpeedItem;
    BtnUltimo: TSpeedItem;
    BtnNovo: TSpeedItem;
    BtnGravar: TSpeedItem;
    BtnCancelar: TSpeedItem;
    BtnIncluir: TSpeedItem;
    BtnPServicos: TSpeedItem;
    BtnLocalizar: TSpeedItem;
    BtnSair: TSpeedItem;
    pnCentro: TPanel;
    dbecodcli: TDBEdit;
    rxLbcodCli: TRxLabel;
    rxLbcodigo: TRxLabel;
    rxLbValor: TRxLabel;
    dbecodigo: TDBEdit;
    rxLbinicio: TRxLabel;
    imgTop: TImage;
    lbTop: TLabel;
    dbevalor: TRxDBCalcEdit;
    rxLbtermino: TRxLabel;
    RxSplitter1: TRxSplitter;
    dbeCliente: TDBEdit;
    rxLbCliente: TRxLabel;
    btLocCli: TfcImageBtn;
    spnTop: TScrewPanel;
    img: TImage;
    RxLabel1: TRxLabel;
    dbeCodServ: TDBEdit;
    RxLabel2: TRxLabel;
    dbeServ: TDBEdit;
    btLocServ: TfcImageBtn;
    RxSplitter5: TRxSplitter;
    RxLabel15: TRxLabel;
    dbeInicial: TDBDateEdit;
    dbefinal: TDBDateEdit;
    DBGrid1: TDBGrid;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    dbequant: TDBEdit;
    dbevalorunit: TRxDBCalcEdit;
    dbeDataCad: TDBDateEdit;
    RxLabel6: TRxLabel;
    dbedatacad1: TDBDateEdit;
    BtnFechado: TSpeedItem;
    procedure CadastrodeServios1Click(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnPServicosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btLocCliClick(Sender: TObject);
    procedure dbeCodServExit(Sender: TObject);
    procedure btLocServClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbecodcliExit(Sender: TObject);
    procedure dbequantExit(Sender: TObject);
    procedure dbevalorunitExit(Sender: TObject);
    procedure BtnFechadoClick(Sender: TObject);
    procedure dbefinalExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContraServ: TfrmContraServ;
  NovoItem,Cancel,Centro:Boolean;
  CodigoServico,CodigoCliente:Integer;

implementation

uses UnitDmdados, unServicos, unitLocCliente,UnitLocServ, unitPrincipal;


{$R *.DFM}

procedure TfrmContraServ.CadastrodeServios1Click(Sender: TObject);
begin
frmCadServicos.show;
end;

procedure TfrmContraServ.BtnSairClick(Sender: TObject);
begin
close;
end;


procedure TfrmContraServ.BtnPrimeiroClick(Sender: TObject);
begin
dmdados.tbContrato.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmContraServ.BtnAnteriorClick(Sender: TObject);
begin
dmdados.tbContrato.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
If dmdados.TbContrato.Bof Then
 Begin
  btnPrimeiro.Enabled:=False;
  btnAnterior.Enabled:=False;
end;
end;

procedure TfrmContraServ.BtnProximoClick(Sender: TObject);
begin
dmdados.tbContrato.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
If dmdados.tbContrato.Eof Then
 Begin
 btnProximo.Enabled:=False;
 btnUltimo.Enabled:=False;
 end;
end;

procedure TfrmContraServ.BtnUltimoClick(Sender: TObject);
begin
dmdados.tbContrato.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmContraServ.BtnNovoClick(Sender: TObject);
begin
NovoItem:=true;
dmDados.vTabStt:=False;
dmdados.tbContrato.Append;
BtnGravar.Enabled := true;
BtnCancelar.Enabled:=true;
BtnNovo.Enabled:=False;
BtnPrimeiro.Enabled:=False;
BtnAnterior.Enabled:=False;
BtnProximo.Enabled:=False;
BtnUltimo.Enabled:=False;
BtnIncluir.Enabled:=False;
BtnPServicos.Enabled:=False;
BtnFechado.Enabled:=false;
BtnLocalizar.Enabled:=False;
 {habilitar os objetos}
dbeCodCli.Enabled:=true;
dbeCliente.Enabled:=true;
dbeInicial.Enabled:=true;
dbefinal.Enabled:=true;
dbedatacad.Enabled:=true;
dbevalor.Enabled:=true;
{Desabilitar cadastro de servi�o}
dbecodserv.Enabled:=false;
dbeserv.Enabled:=false;
dbequant.Enabled:=false;
dbevalorunit.Enabled:=false;
DBGrid1.Enabled:=false;
btLocServ.Enabled:=false;
dbecodcli.SetFocus;
end;

procedure TfrmContraServ.BtnGravarClick(Sender: TObject);
var
  Campos:String;
  Vazio,Gravar:Boolean;
begin
    campos:='';
    vazio:=false;
    gravar:=true;
    If dbeCodcli.Text= '' then
     begin
      If Length(Campos)>0 Then
      Campos:=Campos+', ';
      Campos:=Campos+'C�digo do Cliente';
      Gravar:=False;
      Vazio:=True;
     end;
    If dbeInicial.Text= '  /  /    ' then
     Begin
      If Length(Campos)>0 Then
      Campos:=Campos+', ';
      Campos:=Campos+'Data do In�cial do Contrato';
      Gravar:=False;
      Vazio:=True;
     End;
    If dbefinal.Text= '  /  /    ' then
     Begin
      If Length(Campos)>0 Then
      Campos:=Campos+', ';
      Campos:=Campos+'Data do Final do Contrato';
      Gravar:=False;
      Vazio:=True;
     End;
    If Gravar Then
     Begin
      dmdados.tbContrato.Post;
      dmDados.vTabStt:=True;
      BtnGravar.enabled:= False;
      BtnCancelar.Enabled:= False;
      BtnNovo.Enabled:=True;
      BtnPrimeiro.Enabled:=True;
      BtnAnterior.Enabled:=True;
      BtnProximo.Enabled:=True;
      BtnUltimo.Enabled:=True;
      BtnIncluir.Enabled:=True;
      BtnPServicos.Enabled:=True;
      BtnFechado.Enabled:=false;
      BtnLocalizar.Enabled:=True;
      showmessage('Dados gravados com sucesso!');
      {Desabilitar os objetos}
      dbecodcli.Enabled:=false;
      dbeCliente.Enabled:=false;
      dbecodigo.Enabled:=false;
      dbedatacad.Enabled:=false;
      dbeInicial.Enabled:=false;
      dbefinal.Enabled:=false;
      dbevalor.Enabled:=false;
      {Habilitar cadastro de servi�o}
      dbecodserv.Enabled:=true;
      dbeserv.Enabled:=true;
      dbequant.Enabled:=true;
      dbevalorunit.Enabled:=true;
      DBGrid1.Enabled:=true;
      btLocServ.Enabled:=true;
      dmdados.tbCServServ.Append;
      dbecodserv.SetFocus;
    end
    Else
      Begin
      If Vazio Then
      begin
        ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      end;
    end;
end;

procedure TfrmContraServ.BtnCancelarClick(Sender: TObject);
begin
dmdados.tbContrato.Cancel;
novoItem:=False;
dmDados.vTabStt:=True;
//habilitando bot�es
BtnGravar.enabled := false;
BtnCancelar.Enabled := false;
BtnNovo.Enabled:=True;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
Btnproximo.Enabled:=True;
BtnUltimo.Enabled:=True;
BtnIncluir.Enabled:=True;
BtnPServicos.Enabled:=False;
BtnFechado.Enabled:=true;
BtnLocalizar.Enabled:=True;
//desabilitando componentes
dbecodigo.Enabled:=false;
dbeCodCli.Enabled:=false;
dbeCliente.Enabled:=false;
dbeInicial.Enabled:=false;
dbefinal.Enabled:=false;
dbevalor.Enabled:=false;
dbedatacad.Enabled:=false;
//Desabilitar cadastro de servi�o
dbecodserv.Enabled:=False;
dbeserv.Enabled:=false;
dbequant.Enabled:=false;
dbevalorunit.Enabled:=false;
DBGrid1.Enabled:=false;
btLocServ.Enabled:=false;
end;

procedure TfrmContraServ.BtnIncluirClick(Sender: TObject);
begin
novoitem:=true;
if DMDados.tbContratoFechado.Value<>'S' then
 begin
  dmDados.vTabStt:=false;
  dmdados.tbCServServ.Append;
  //desabilitando e habilitando os bot�es
  BtnCancelar.enabled:= false;
  BtnGravar.Enabled:=false;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  BtnPServicos.Enabled:=true;
  BtnIncluir.Enabled:=false;
  BtnLocalizar.Enabled:=False;
  BtnFechado.Enabled:=false;
  //desabilitando cadastro de contrato de servi�os
  dbeCodCli.Enabled:=false;
  dbeCliente.Enabled:=false;
  dbeInicial.Enabled:=false;
  dbefinal.Enabled:=false;
  dbedatacad.Enabled:=false;
  dbevalor.Enabled:=false;
  //Habilitar cadastro de servi�o
  dbeCodServ.Enabled:=true;
  dbeserv.Enabled:=true;
  dbequant.Enabled:=true;
  dbevalorunit.Enabled:=true;
  DBGrid1.Enabled:=true;
  btLocServ.Enabled:=true;
  dbeCodServ.SetFocus;
 end
else
 begin
  showmessage('Contrato de Servi�o FECHADO!');
  spBarBotoes.SetFocus;
 end;
end;



procedure TfrmContraServ.BtnPServicosClick(Sender: TObject);
begin
  dmdados.tbCServServ.Cancel;
  NovoItem:=False;
  dmDados.vTabStt:=True;
  //desabilitando cadastro de servi�os
  dbeCodServ.Enabled:=false;
  dbeserv.Enabled:=false;
  dbequant.Enabled:=false;
  dbevalorunit.Enabled:=false;
  //Desabilitando bot�es
  DBGrid1.Enabled:=false;
  btLocServ.Enabled:=false;
  //Habilitando bot�es
  BtnIncluir.Enabled:=true;
  BtnFechado.Enabled:=true;
  BtnNovo.Enabled:=true;
  BtnLocalizar.Enabled:=true;
  BtnPrimeiro.Enabled:=true;
  BtnAnterior.Enabled:=true;
  BtnProximo.Enabled:=true;
  BtnUltimo.Enabled:=true;
  spBarBotoes.SetFocus;
end;


procedure TfrmContraServ.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TfrmContraServ.BtnLocalizarClick(Sender: TObject);
begin
frmLocCliente:=TfrmLocCliente.create(application);
frmLocCliente.show;
end;

procedure TfrmContraServ.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  DMDados.tbContrato.Close;
  DMDados.tbCServServ.Close;
  DMDados.tbPesContra.Close;
  Action:= Cafree;
end;

procedure TfrmContraServ.btLocCliClick(Sender: TObject);
begin
if (dmdados.tbContrato.State=dsEdit)or(dmdados.tbContrato.State=dsInsert) then
 begin
  frmlocCliente:=TfrmlocCliente.create(application);
  frmlocCliente.showmodal;
  dmdados.tbContratoCodCli.Value:=frmLocCliente.Resultado;
  frmLocCliente.Free;
  dbeInicial.SetFocus;
 end;
end;

procedure TfrmContraServ.dbeCodServExit(Sender: TObject);
begin
  if novoItem then
     begin
      //localizar o servi�o
      if dbeCodServ.Text='' then
        begin
        ShowMessage('Necess�rio informar o C�DIGO DO SERVI�O');
        dbeCodServ.SetFocus;
        end
      else
        if not (dmdados.tbServicos.Locate('CodServ',dbeCodServ.text,[])) then
          begin
          showmessage('C�DIGO DO SERVI�O n�o cadastrado!');
          dbeCodServ.SetFocus;
          End
        Else
          Begin
          dmdados.tbCServServCodServ.value:=codigoservico;
          dmdados.tbCServServCodServ.Value:=dmdados.tbServicosCodServ.value;
          end;
      end;
end;


procedure TfrmContraServ.btLocServClick(Sender: TObject);
begin
if (dmdados.tbCServServ.State=dsEdit)or(dmdados.tbCServServ.State=dsInsert) then
 begin
   FrmLocServ:=TFrmLocServ.create(application);
   FrmLocServ.showmodal;
   dmdados.tbCServServCodServ.value:=FrmLocServ.Resultado;
   FrmLocServ.Free;
   dbeCodServ.SetFocus;
   dbequant.SetFocus;
 end;
end;

procedure TfrmContraServ.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [F9] Localizar [Esc] Cancelar ou Sair');
  dmDados.vTabStt:=True;
end;

procedure TfrmContraServ.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_Home   : if (dmDados.vTabStt) then BtnIncluir.Click;
      VK_Delete : if (dmDados.vTabStt) then BtnPServicos.Click;
      VK_End    : if not(dmDados.vTabStt) then BtnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
      VK_F9     : btnLocalizar.Click;
    end;
end;

procedure TfrmContraServ.dbecodcliExit(Sender: TObject);
begin
 if novoItem then
      begin
      //localizar o cliente
      if dbecodcli.Text='' then
        begin
        ShowMessage('Necess�rio informar o C�DIGO DO CLIENTE');
        dbecodcli.SetFocus;
        end
      else
        if not (dmdados.tbCliente.Locate('CodCli',dbecodcli.text,[])) then
          begin
          showmessage('C�DIGO DO CLIENTE n�o cadastrado!');
          dbecodcli.SetFocus;
          End
      else
       begin
        if (dmdados.tbpesContra.Locate('CodCli',dbecodcli.Text,[]))then
         begin
           showmessage('CLIENTE j� possui Contrato em ABERTO!');
           dbecodcli.SetFocus;
          end;
      end;
      end;
end;

procedure TfrmContraServ.dbequantExit(Sender: TObject);
begin
 If NovoItem Then
   If dbequant.Text= '' then
      Begin
       ShowMessage('� obrigat�rio a QUANTIDADE');
       dbequant.SetFocus;
      End
   else
       dbevalorunit.SetFocus;
end;

procedure TfrmContraServ.dbevalorunitExit(Sender: TObject);
begin
If NovoItem Then
   If dbevalorunit.Text= '' then
      Begin
       ShowMessage('� obrigat�rio a VALOR UNITARIO');
       dbevalorunit.SetFocus;
      End
   else
      begin
      dmdados.tbCServServ.Post;
      dmdados.tbcontrato.edit;
      dmdados.tbContratoVlPaga.Value:=((dmdados.tbCServServQuantidade.value*dmdados.tbCServServVLPagar.Value));
      dbevalor.Value:=dmdados.tbContratoVlPaga.Value;
      DMDados.tbContrato.Post;
      dmdados.tbCServServ.Append;
      dbeCodServ.SetFocus;
      end;
  end;
procedure TfrmContraServ.BtnFechadoClick(Sender: TObject);
var fechado:string;
begin
       Fechado:='S';
       ShowMessage('FECHAMENTO do Contrato de Servi�o');
       dmdados.tbContrato.Edit;
       DMDados.tbContratoFechado.Value:='S';
       DMDados.tbContrato.Post;
       BtnPrimeiro.Enabled:=true;
       BtnAnterior.Enabled:=true;
       BtnProximo.Enabled:=true;
       BtnUltimo.Enabled:=true;
       spBarBotoes.SetFocus;


end;

procedure TfrmContraServ.dbefinalExit(Sender: TObject);
begin
 spBarBotoes.SetFocus;
end;

procedure TfrmContraServ.FormCreate(Sender: TObject);
begin
  DMDados.tbContrato.Open;
  DMDados.tbCServServ.Open;
  DMDados.tbPesContra.Open;
end;

end.
