//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2002
// Sistema...........: Ceres - Controle de Cheques
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitRenCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolEdit, RXDBCtrl, SpeedBar, jpeg, ExtCtrls, StdCtrls, RackCtls, Mask,
  DBCtrls, RXCtrls, fcButton, fcImgBtn, CurrEdit, RXSplit, EnhEdit, Grids,
  DBGrids, RxLookup, DB, DBTables, RxGrdCpt, TFlatSplitterUnit, fcImager,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmRengCheque = class(TForm)
    RxGradientCaption1: TRxGradientCaption;
    LMDBackPanel2: TLMDBackPanel;
    fcImager4: TfcImager;
    RxLabel1: TRxLabel;
    Image1: TImage;
    LMDBackPanel1: TLMDBackPanel;
    fcImager1: TfcImager;
    lbcodcusto: TRxLabel;
    edcodigo: TEdit;
    lbcusto: TRxLabel;
    ednome: TEdit;
    RxLabel2: TRxLabel;
    edBanco: TRxLookupEdit;
    Edit1: TEdit;
    RxLabel4: TRxLabel;
    edcheque: TEdit;
    btLocCli: TfcImageBtn;
    Bevel1: TBevel;
    RxDBGrid1: TRxDBGrid;
    Bevel2: TBevel;
    RxLabel3: TRxLabel;
    dbpercjuros: TDBEdit;
    RxLabel7: TRxLabel;
    dbValorJuros: TRxDBCalcEdit;
    RxLabel6: TRxLabel;
    dbNovoVenc: TDBDateEdit;
    RxLabel8: TRxLabel;
    dbTotal: TRxDBCalcEdit;
    Panel3: TLMDBackPanel;
    fcImager2: TfcImager;
    btnBuscar: TfcImageBtn;
    btnGravar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    btnSair: TfcImageBtn;
    procedure BtnSairClick(Sender: TObject);
    procedure btLocCliClick(Sender: TObject);
    procedure dbpercjurosExit(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btngravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edcodigoExit(Sender: TObject);
    procedure edchequeExit(Sender: TObject);
    procedure edBancoExit(Sender: TObject);
    procedure dbNovoVencExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick0(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure fcImageBtn3Click(Sender: TObject);
    procedure fcImageBtn1Click(Sender: TObject);
    procedure btnBaixaClick(Sender: TObject);
    procedure fcImageBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRengCheque: TFrmRengCheque;
  NovoItem:Boolean;

implementation

uses unitDmDados, unitLocCliente, UnitPrincipal;

{$R *.DFM}



procedure TFrmRengCheque.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRengCheque.btLocCliClick(Sender: TObject);
begin
  frmLocCliente:=tfrmLocCliente.create(application);
  frmLocCliente.ShowModal;
  edcodigo.text:=IntToStr(frmLocCliente.resultado);
  ednome.Text:=frmLocCliente.Nome;
  frmLocCliente.Free;
end;

procedure TFrmRengCheque.dbpercjurosExit(Sender: TObject);
begin
  If NovoItem Then
    dmdados.tbChequeValorJuros.Value:=dmdados.tbChequeValor.Value*(dmdados.tbChequeJuros.Value/100);
end;

procedure TFrmRengCheque.btnBuscarClick(Sender: TObject);
begin
  dmdados.tbCheque.Filtered:=False;
  dmdados.tbCheque.Filter:='(codcli = '''+edcodigo.Text+''')and' +
                           '(NumCheque= '''+edcheque.Text+''')and'+
                           '(NumBanco='''+edit1.Text+''')and'+
                           '(Status='''+'DEVOLVIDO'+''')';
  dmdados.tbCheque.Filtered:=True;
  if dmDados.tbCheque.RecordCount=0 then
    begin
    ShowMessage('Cheque n�o cadastrado ou ATIVO');
    edcodigo.SetFocus;
    end
  else
    begin
    dmdados.tbCheque.Edit;
    NovoItem:=True;
    dmDados.vTabStt:=False;
    btnbuscar.Enabled:=false;
    btnCancelar.Enabled:=True;
    dbpercjuros.Enabled:=true;
    dbvalorjuros.Enabled:=true;
    dbNovoVenc.Enabled:=true;
    dbpercjuros.SetFocus;
    end;
end;

procedure TFrmRengCheque.btngravarClick(Sender: TObject);
begin
  dmdados.tbChequeStatus.Value:='RENEGOCIADO';
  dmdados.tbCheque.Post;
  if dmdados.tbLibCredito.Locate('CodCli',edcodigo.text,[]) then
    begin
    dmdados.tbLibCredito.Edit;
    dmdados.tbLibCreditoRestricao.Value:='Nada Consta';
    dmdados.tbLibCredito.Post;
    end;
  ShowMessage('Cheque'+' '+edcheque.Text+' '+'renegociado com sucesso');
  dmdados.tbCheque.Filtered:=false;
  btnGravar.Enabled:=false;
  btnCancelar.Enabled:=False;
  dmDados.vTabStt:=True;
  NovoItem:=False;
  Panel3.SetFocus;
end;

procedure TFrmRengCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.statusteclas(False,'');
  dmdados.tbCheque.Filtered:=false;
  dmDados.tbCheque.Close;
  dmDados.tbBanco.Close;
  dmDados.tbLibCredito.Close;
  dmDados.tbCliente.Close;
  action:=cafree;
end;

procedure TFrmRengCheque.edcodigoExit(Sender: TObject);
begin
  if edcodigo.Text='' then
    begin
    ShowMessage('Obrigat�rio o C�DIGO DO CLIENTE');
    edcodigo.SetFocus;
    end
  ELSE
    begin
    if dmdados.tbCliente.Locate('Codcli',StrToInt(edcodigo.text),[]) then
      begin
      ednome.Text:=dmdados.tbClienteNome.Value;
      edcodigo.text:=dmdados.tbClienteCodCli.AsString;
      end
    else
      begin
      ShowMessage('Cliente n�o cadastrado');
      edcodigo.SetFocus;
      end;
    end;
end;

procedure TFrmRengCheque.edchequeExit(Sender: TObject);
begin
  if edcheque.Text='' then
    ShowMessage('Obrigat�rio o N�MERO DO CHEQUE')
  ELSE
    begin
    btnBuscar.enabled:=true;
    Panel3.SetFocus;
    end;
end;

procedure TFrmRengCheque.edBancoExit(Sender: TObject);
begin
  If edBanco.Text= '' then
    Begin
    ShowMessage('� obrigat�rio o NOME DO BANCO');
    edBanco.SetFocus;
    End
  Else
    begin
    If Not(dmDados.tbBanco.Locate('NomeBanco',edBanco.Text,[])) Then
      Begin
      Showmessage('BANCO n�o Cadastrado');
      edBanco.SetFocus;
      End
    Else
      edit1.Text:=dmdados.tbBancoNumBanco.Value;
    end;
end;

procedure TFrmRengCheque.dbNovoVencExit(Sender: TObject);
begin
  if NovoItem then
    if dbNovoVenc.Text='  /  /    ' then
      begin
      ShowMessage('� necess�rio informar o NOVO VENCIMENTO');
      dbNovoVenc.SetFocus;
      end
    else
      begin
      btngravar.Enabled:=true;
      dmDados.vTabStt:=False;
      dbpercjuros.Enabled:=false;
      dbvalorjuros.Enabled:=false;
      dbNovoVenc.Enabled:=false;
      end;
end;

procedure TFrmRengCheque.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmRengCheque.btnSairClick0(Sender: TObject);
begin
  close;
end;

procedure TFrmRengCheque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : if dmDados.vTabStt then BtnSair.Click
                  else btnCancelar.Click;
      VK_End    : if not(dmDados.vTabStt) then BtnGravar.Click;
      VK_F10     : btLocCli.Click;
      VK_F11     : btnBuscar.Click;
    end;
end;

procedure TFrmRengCheque.FormShow(Sender: TObject);
begin
  dmDados.tbCheque.Open;
  dmDados.tbBanco.Open;
  dmDados.tbCliente.Open;
  dmDados.tbLibCredito.Open;
  FrmPrincipal.StatusTeclas(True,'[F10] Localizar Cliente [F11] Buscar Cheque [END] Gravar [Esc] Sair');
end;

procedure TFrmRengCheque.btnCancelarClick(Sender: TObject);
begin
  NovoItem:=False;
  dmDados.tbCheque.Cancel;
  btngravar.Enabled:=False;
  btnCancelar.Enabled:=False;
  dmDados.vTabStt:=True;
  dbpercjuros.Enabled:=false;
  dbvalorjuros.Enabled:=false;
  dbNovoVenc.Enabled:=false;
  edcodigo.SetFocus;
end;

procedure TFrmRengCheque.fcImageBtn3Click(Sender: TObject);
begin
  dmdados.tbCheque.Filtered:=False;
  dmdados.tbCheque.Filter:='(codcli = '''+edcodigo.Text+''')and' +
                           '(NumCheque= '''+edcheque.Text+''')and'+
                           '(NumBanco='''+edit1.Text+''')and'+
                           '(Status='''+'DEVOLVIDO'+''')';
  dmdados.tbCheque.Filtered:=True;
  if dmDados.tbCheque.RecordCount=0 then
    begin
    ShowMessage('Cheque n�o cadastrado ou ATIVO');
    edcodigo.SetFocus;
    end
  else
    begin
    dmdados.tbCheque.Edit;
    NovoItem:=True;
    dmDados.vTabStt:=False;
    btnbuscar.Enabled:=false;
    btnCancelar.Enabled:=True;
    dbpercjuros.Enabled:=true;
    dbvalorjuros.Enabled:=true;
    dbNovoVenc.Enabled:=true;
    dbpercjuros.SetFocus;
    end;
end;

procedure TFrmRengCheque.fcImageBtn1Click(Sender: TObject);
begin
  dmdados.tbChequeStatus.Value:='RENEGOCIADO';
  dmdados.tbCheque.Post;
  if dmdados.tbLibCredito.Locate('CodCli',edcodigo.text,[]) then
    begin
    dmdados.tbLibCredito.Edit;
    dmdados.tbLibCreditoRestricao.Value:='Nada Consta';
    dmdados.tbLibCredito.Post;
    end;
  ShowMessage('Cheque'+' '+edcheque.Text+' '+'renegociado com sucesso');
  dmdados.tbCheque.Filtered:=false;
  btnGravar.Enabled:=false;
  btnCancelar.Enabled:=False;
  dmDados.vTabStt:=True;
  NovoItem:=False;
  Panel3.SetFocus;
end;

procedure TFrmRengCheque.btnBaixaClick(Sender: TObject);
begin
  NovoItem:=False;
  dmDados.tbCheque.Cancel;
  btngravar.Enabled:=False;
  btnCancelar.Enabled:=False;
  dmDados.vTabStt:=True;
  dbpercjuros.Enabled:=false;
  dbvalorjuros.Enabled:=false;
  dbNovoVenc.Enabled:=false;
  edcodigo.SetFocus;
end;

procedure TFrmRengCheque.fcImageBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
