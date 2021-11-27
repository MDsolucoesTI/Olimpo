//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2002
// Sistema...........: Ceres - Controle de Cheques
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitLanChequeSF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, fcButton, fcImgBtn, RXSplit, Grids, DBGrids, RackCtls,
  ExtCtrls, RXCtrls, jpeg, dbtables, db, RXDBCtrl, EnhEdit, Mask, SpeedBar,
  ToolEdit, RxLookup, RxGrdCpt, TFlatSplitterUnit, fcImager,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TfrmLanChequeSF = class(TForm)
    RxGradientCaption1: TRxGradientCaption;
    LMDBackPanel2: TLMDBackPanel;
    fcImager4: TfcImager;
    RxLabel15: TRxLabel;
    Image1: TImage;
    LMDBackPanel1: TLMDBackPanel;
    fcImager2: TfcImager;
    RxLabel2: TRxLabel;
    Edit1: TEdit;
    RxLabel7: TRxLabel;
    RxLabel12: TRxLabel;
    dbConta: TEdit;
    RxLabel3: TRxLabel;
    dbNumCh: TEdit;
    dbnumAgencia: TEdit;
    edBanco: TRxLookupEdit;
    Bevel1: TBevel;
    RxDBGrid1: TDBGrid;
    Panel3: TLMDBackPanel;
    fcImager1: TfcImager;
    btnBuscar: TfcImageBtn;
    btnFundo: TfcImageBtn;
    btnSair: TfcImageBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnFundoClick(Sender: TObject);
    procedure edChequeExit(Sender: TObject);
    procedure edBancoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dbNumChExit(Sender: TObject);
    procedure fcImageBtn1Click(Sender: TObject);
    procedure btnBaixaClick(Sender: TObject);
    procedure fcImageBtn2Click(Sender: TObject);
  private
    { Private declarations }
    fresultado:string;
  public
    { Public declarations }
    Property Resultado:string Read fresultado write fresultado;
  end;

var
  frmLanChequeSF: TfrmLanChequeSF;
  PorCod,PorDesc,cor : boolean;
  LocOpts : TLocateOptions;
  DescTab,CodTab : String;
  vertipo : char;

implementation

uses UnitDmdados, unitLocCliente, UnitPrincipal;

{$R *.DFM}

procedure TfrmLanChequeSF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.tbCheque.Filtered:=false;
  dmDados.tbBanco.Close;
  dmDados.tbLibCredito.Close;
  dmDados.tbLibCred.Close;
  dmDados.tbCheque.Close;
  Action:= Cafree;
end;

procedure TfrmLanChequeSF.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TfrmLanChequeSF.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmLanChequeSF.btnBuscarClick(Sender: TObject);
begin
  dmdados.tbCheque.edit;
  dmdados.tbCheque.Filtered:=False;
  dmdados.tbCheque.Filter:='(NumBanco  = '''+edit1.text +''')and' +
                           '(Agencia = '''+dbnumAgencia.Text+''')and' +
                           '(Conta = '''+dbConta.Text+''')and' +
                           '(NumCheque = '''+ dbNumCh.Text+''')';
  dmdados.tbCheque.Filtered:=True;
  btnfundo.Enabled:=true;
end;

procedure TfrmLanChequeSF.btnFundoClick(Sender: TObject);
begin
  if dmdados.tbLibCredito.Locate('CodCli',dmdados.tbChequeCodCli.Value,[]) then
    begin
    dmdados.tbLibCredito.Edit;
    dmdados.tbLibCreditoRestricao.Value:='RESTRITO';
    dmdados.tbLibCredito.Post;
    end
  else
    begin
    dmdados.tbLibCredito.Append;
    dmdados.tbLibCreditoCodcli.Value:=dmdados.tbChequeCodCli.Value;
    dmdados.tbLibCreditoRestricao.Value:='RESTRITO';
    dmdados.tbLibCredito.Post;
    end;
  dmdados.tbCheque.Edit;
  dmdados.tbChequeStatus.Value:='DEVOLVIDO';
  dmdados.tbCheque.Post;
  btnfundo.Enabled:=false;
  btnBuscar.Enabled:=false;
  dmdados.tbCheque.Filtered:=false;
  edBanco.SetFocus
end;

procedure TfrmLanChequeSF.edChequeExit(Sender: TObject);
begin
  if dbNumch.Text='' then
    begin
    ShowMessage('Obrigat�rio o N�MERO DO CHEQUE');
    dbNumch.SetFocus;
    end
  else
    begin
    btnBuscar.enabled:=true;
    Panel3.SetFocus;
    end;
end;

procedure TfrmLanChequeSF.edBancoExit(Sender: TObject);
begin
  If edBanco.Text= '' then
    Begin
    ShowMessage('� obrigat�rio o NOME DO BANCO');
    edBanco.SetFocus;
    End
  Else
    If Not(dmDados.tbBanco.Locate('NomeBanco',edBanco.Text,[])) Then
      Begin
      Showmessage('NOME DO BANCO n�o Cadastrado');
      edBanco.SetFocus;
      End
    Else
      edit1.Text:=dmdados.tbBancoNumBanco.Value;
end;

procedure TfrmLanChequeSF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : BtnSair.Click;
      VK_F11     : btnBuscar.Click;
      VK_F12     : btnFundo.Click;
    end;
end;

procedure TfrmLanChequeSF.FormShow(Sender: TObject);
begin
  dmDados.tbBanco.Open;
  dmDados.tbLibCredito.Open;
  dmDados.tbLibCred.Open;
  dmDados.tbCheque.Open;
  FrmPrincipal.StatusTeclas(True,'[F10] Localizar Cliente [F11] Buscar Cheque [F12] Lan�ar Cheque SF [Esc] Cancelar ou Sair');
end;

procedure TfrmLanChequeSF.dbNumChExit(Sender: TObject);
begin
  btnBuscar.Enabled:=True;
  Panel3.SetFocus;
end;

procedure TfrmLanChequeSF.fcImageBtn1Click(Sender: TObject);
begin
  dmdados.tbCheque.edit;
  dmdados.tbCheque.Filtered:=False;
  dmdados.tbCheque.Filter:='(NumBanco  = '''+edit1.text +''')and' +
                           '(Agencia = '''+dbnumAgencia.Text+''')and' +
                           '(Conta = '''+dbConta.Text+''')and' +
                           '(NumCheque = '''+ dbNumCh.Text+''')';
  dmdados.tbCheque.Filtered:=True;
  btnfundo.Enabled:=true;
end;

procedure TfrmLanChequeSF.btnBaixaClick(Sender: TObject);
begin
  if dmdados.tbLibCred.Locate('CodCli',dmdados.tbChequeCodCli.Value,[]) then
    begin
    dmdados.tbLibCred.Edit;
    dmdados.tbLibCredRestricao.Value:='RESTRITO';
    dmdados.tbLibCred.Post;
    end
  else
    begin
    dmdados.tbLibCred.Append;
    dmdados.tbLibCredCodcli.Value:=dmdados.tbChequeCodCli.Value;
    dmdados.tbLibCredRestricao.Value:='RESTRITO';
    dmdados.tbLibCred.Post;
    end;
  dmdados.tbCheque.Edit;
  dmdados.tbChequeStatus.Value:='DEVOLVIDO';
  dmdados.tbCheque.Post;
  btnfundo.Enabled:=false;
  btnBuscar.Enabled:=false;
  dmdados.tbCheque.Filtered:=false;
  edBanco.SetFocus
end;

procedure TfrmLanChequeSF.fcImageBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
