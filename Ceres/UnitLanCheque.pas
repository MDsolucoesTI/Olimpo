//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2002
// Sistema...........: Ceres - Controle de Cheques
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitLanCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, DBCtrls, StdCtrls, Spin, fcButton, fcImgBtn, ExtCtrls, RackCtls,
  RXSplit, RXCtrls, SpeedBar, jpeg, TFlatSplitterUnit, ToolEdit, RXDBCtrl,
  CurrEdit, Grids, DBGrids, SRColBtn, Buttons, db, RxLookup, EFocCol,
  RxGrdCpt, fcImager, EMsgDlg, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmLanCheque = class(TForm)
    RxGradientCaption1: TRxGradientCaption;
    MsgDlg: TEvMsgDlg;
    LMDBackPanel2: TLMDBackPanel;
    fcImager4: TfcImager;
    RxLabel7: TRxLabel;
    Image1: TImage;
    LMDBackPanel1: TLMDBackPanel;
    fcImager2: TfcImager;
    RxLabel1: TRxLabel;
    dbCodCli: TDBEdit;
    RxLabel2: TRxLabel;
    dbNome: TDBEdit;
    btLocCli: TfcImageBtn;
    RxLabel3: TRxLabel;
    dbNumbanco: TDBEdit;
    RxLabel11: TRxLabel;
    dbBanco: TRxDBLookupCombo;
    RxLabel5: TRxLabel;
    dbnumAgencia: TDBEdit;
    RxLabel12: TRxLabel;
    dbConta: TDBEdit;
    RxLabel16: TRxLabel;
    dbNumCh: TDBEdit;
    RxLabel6: TRxLabel;
    dbemissao: TDBDateEdit;
    RxLabel14: TRxLabel;
    dbvenc: TDBDateEdit;
    RxLabel17: TRxLabel;
    dbvalor: TRxDBCalcEdit;
    RxLabel8: TRxLabel;
    DbStatus: TDBEdit;
    Bevel1: TBevel;
    dbmObs: TDBMemo;
    RxLabel15: TRxLabel;
    Image7: TImage;
    Panel3: TLMDBackPanel;
    fcImager1: TfcImager;
    btnPrimeiro: TfcImageBtn;
    btnAnterior: TfcImageBtn;
    btnProximo: TfcImageBtn;
    btnUltimo: TfcImageBtn;
    btnNovo: TfcImageBtn;
    btnGravar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    btnAlterar: TfcImageBtn;
    btnDeletar: TfcImageBtn;
    btnBaixa: TfcImageBtn;
    btnSair: TfcImageBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure btnGerarParcClick(Sender: TObject);
    procedure BtnBaixaClic(Sender: TObject);
    procedure btLocCliClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure dbCodCliExit(Sender: TObject);
    procedure dbBancoExit(Sender: TObject);
    procedure dbNumChExit(Sender: TObject);
    procedure dbemissaoExit(Sender: TObject);
    procedure dbvencExit(Sender: TObject);
    procedure dbvalorExit(Sender: TObject);
    procedure dbmObsExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbnumAgenciaExit(Sender: TObject);
    procedure dbContaExit(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnBaixaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
    FrmLanCheque: TFrmLanCheque;
    novoitem:boolean;
implementation

uses UnitDmdados, UnitPrincipal, unitLocCliente;

{$R *.DFM}

procedure TFrmLanCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.tbCheque.Close;
  dmDados.tbBanco.Close;
  dmDados.tbCliente.Close;
  FrmPrincipal.StatusTeclas(False,'');
  Action:= Cafree;
end;

procedure TFrmLanCheque.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmLanCheque.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLanCheque.btnGerarParcClick(Sender: TObject);
begin
  {if (dmdados.tbCheque.State=dsinsert) or (dmdados.tbCheque.State=dsedit) then
    begin
    //habilitar bot�es
    BtnGravar.enabled := False;
    BtnCancelar.Enabled := False;
    BtnNovo.Enabled:=True;
    BtnPrimeiro.Enabled:=True;
    BtnAnterior.Enabled:=True;
    BtnProximo.Enabled:=True;
    BtnUltimo.Enabled:=True;
    BtnAlterar.Enabled:=True;
    Btndeletar.Enabled:=True;
    //desabilitar componentes
    dbCodCli.Enabled:=false;
    dbNome.Enabled:=false;
    dbNumBanco.Enabled:=false;
    dbNumAgencia.Enabled:=false;
    dbBanco.Enabled:=false;
    dbConta.Enabled:=false;
    dbNumCh.Enabled:=false;
    dbEmissao.Enabled:=false;
    dbVenc.Enabled:=false;
    dbValor.Enabled:=false;
    dbmObs.Enabled:=false;
    //Gravar dados e gerar parcelas
    dmdados.tbCheque.Post;
    pos:=dmdados.tbCheque.GetBookmark;
    FrmGerParc:= TFrmgerParc.Create(application);
    FrmGerParc.Showmodal;
    end;}
end;

procedure TFrmLanCheque.BtnBaixaClic(Sender: TObject);
begin
  dmdados.tbCheque.edit;
  dmdados.tbChequeStatus.Value:='PAGO';
  dmdados.tbCheque.Post;
end;

procedure TFrmLanCheque.btLocCliClick(Sender: TObject);
begin
  if (dmdados.tbCheque.State=dsinsert) or (dmdados.tbCheque.State=dsedit) then
    begin
    frmLocCliente:=tfrmLocCliente.create(application);
    frmLocCliente.showmodal;
    dmdados.tbChequeCodCli.Value:=frmLocCliente.Resultado;
    frmloccliente.Free;
    end; 
end;

procedure TFrmLanCheque.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbCheque.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
end;

procedure TFrmLanCheque.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.tbCheque.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.TbCheque.bof Then
    Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    end;
end;

procedure TFrmLanCheque.BtnProximoClick(Sender: TObject);
begin
  dmdados.tbCheque.Next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.TbCheque.Eof Then
    Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    End;
end;

procedure TFrmLanCheque.BtnAlterarClick(Sender: TObject);
begin
  if dmdados.tbCheque.RecordCount=0 then
    begin
    MsgDlg.MsgInformation('Tabela sem registro');
    end
  else
    begin
    novoitem:=true;
    dmdados.vTabStt:= False;
    dmdados.tbCheque.Edit;
    BtnCancelar.enabled:= true;
    BtnGravar.Enabled:= true;
    BtnNovo.Enabled:=False;
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    BtnAlterar.Enabled:=False;
    Btndeletar.Enabled:=False;
    {}
    dbCodCli.Enabled:=true;
    dbNumBanco.Enabled:=true;
    dbNumAgencia.Enabled:=true;
    dbBanco.Enabled:=true;
    dbConta.Enabled:=true;
    dbNumCh.Enabled:=true;
    dbEmissao.Enabled:=true;
    dbVenc.Enabled:=true;
    dbValor.Enabled:=true;
    dbmObs.Enabled:=true;
    dbCodCli.SetFocus;
    end;
end;

procedure TFrmLanCheque.dbCodCliExit(Sender: TObject);
begin
  if NovoItem then
    if dbcodcli.Text='' then
      begin
      ShowMessage('Obrigat�rio o C�DIGO DO CLIENTE');
      dbcodcli.SetFocus;
      end
   else
    BEGIN
    if dmdados.tbCliente.Locate('CodCli',StrToInt(dbcodcli.text),[]) then
      begin
      dbcodcli.text:=IntToStr(dmdados.tbClienteCodCli.Value);
      end
    else
      begin
      ShowMessage('C�DIGO DO CLIENTE n�o cadastrado');
      dbcodcli.SetFocus;
      end;
    END;
end;

procedure TFrmLanCheque.dbBancoExit(Sender: TObject);
begin
  If NovoItem Then
    If dbBanco.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o NOME DO BANCO');
      dbBanco.SetFocus;
      End
end;

procedure TFrmLanCheque.dbNumChExit(Sender: TObject);
begin
  If NovoItem Then
    If dbNumCH.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o N�MERO DO CHEQUE');
      dbNumCH.SetFocus;
      End
end;

procedure TFrmLanCheque.dbemissaoExit(Sender: TObject);
begin
  If NovoItem Then
    If dbEmissao.Text= '  /  /    ' then
      Begin
      ShowMessage('� obrigat�rio a DATA DE EMISS�O');
      dbEmissao.SetFocus;
      End
end;

procedure TFrmLanCheque.dbvencExit(Sender: TObject);
begin
  If NovoItem Then
    If dbVenc.Text= '  /  /    ' then
      Begin
      ShowMessage('� obrigat�rio a DATA DE VENCIMENTO');
      dbVenc.SetFocus;
      End
end;

procedure TFrmLanCheque.dbvalorExit(Sender: TObject);
begin
  If NovoItem Then
    If dbValor.Value = 0 then
      Begin
      ShowMessage('� obrigat�rio o VALOR DO CHEQUE');
      dbValor.SetFocus;
      End
end;

procedure TFrmLanCheque.dbmObsExit(Sender: TObject);
begin
Panel3.SetFocus;
end;


procedure TFrmLanCheque.FormShow(Sender: TObject);
begin

  dmDados.tbBanco.Open;
  dmDados.tbCliente.Open;
  dmDados.tbCheque.Open;
  FrmPrincipal.StatusTeclas(True,'[F10] Localizar Cliente [F12] Baixa de Cheques [Esc] Cancelar ou Sair');
  novoItem:=false;
end;

procedure TFrmLanCheque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_Home   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_Delete : if (dmDados.vTabStt) then BtnDeletar.Click;
      VK_End    : if not(dmDados.vTabStt) then btnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
      VK_F10     : btLocCli.Click;
      VK_F12     : BtnBaixa.Click;
    end;
end;

procedure TFrmLanCheque.dbnumAgenciaExit(Sender: TObject);
begin
  If NovoItem Then
    If dbnumAgencia.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o N�MERO DA AG�NCIA');
      dbnumAgencia.SetFocus;
      End
end;

procedure TFrmLanCheque.dbContaExit(Sender: TObject);
begin
  If NovoItem Then
    If dbConta.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o N�MERO DA C/C');
      dbConta.SetFocus;
      End
end;

procedure TFrmLanCheque.btnUltimoClick(Sender: TObject);
begin
  dmdados.tbCheque.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
end;

procedure TFrmLanCheque.btnNovoClick(Sender: TObject);
begin
  novoitem:=true;
  dmdados.vTabStt:= False;
  dmdados.tbCheque.Append;
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
  {habilitar os objetos}
  dbCodCli.Enabled:=true;
  dbNumBanco.Enabled:=true;
  dbNumAgencia.Enabled:=true;
  dbBanco.Enabled:=true;
  dbConta.Enabled:=true;
  dbNumCh.Enabled:=true;
  dbEmissao.Enabled:=true;
  dbVenc.Enabled:=true;
  dbValor.Enabled:=true;
  DbStatus.Enabled:=true;
  dbmObs.Enabled:=true;
  dbCodCli.SetFocus;
end;

procedure TFrmLanCheque.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;

  If dbCodCli.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
      Campos:=Campos+'C�digo do Cliente';
      Gravar:=False;
      Vazio:=True;
    end;

 If dbBanco.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
      Campos:=Campos+'Banco do Cliente';
      Gravar:=False;
      Vazio:=True;
    end;

 If dbConta.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
      Campos:=Campos+'N�mero da Conta';
      Gravar:=False;
      Vazio:=True;
    end;

 If dbNumCh.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
      Campos:=Campos+'N�mero do Cheque';
      Gravar:=False;
      Vazio:=True;
    end;

 If dbEmissao.Text= '  /  /    ' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Data de Emiss�o';
    Gravar:=False;
    Vazio:=True;
    End;

 If dbVenc.Text= '  /  /    ' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
      Campos:=Campos+'Data de Vencimento';
      Gravar:=False;
      Vazio:=True;
    End;

 If dbvalor.Text= '' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
      Campos:=Campos+'Valor do Cheque';
      Gravar:=False;
      Vazio:=True;
    End;

If dbConta.Text= '' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
      Campos:=Campos+'Conta Corrente';
      Gravar:=False;
      Vazio:=True;
    End;
    
  If Gravar Then
    Begin
    dmdados.tbChequeStatus.Value:='ABERTO';
    dmdados.tbChequeNomeBanco.Value:=dmdados.tbBanco.Lookup('NumBanco',dbNumBanco.Text,'NomeBanco');
    dmdados.tbCheque.Post;
    novoitem:=false;
    dmdados.vTabStt:= True;
    BtnGravar.enabled := False;
    BtnCancelar.Enabled := False;
    BtnNovo.Enabled:=True;
    BtnPrimeiro.Enabled:=True;
    BtnAnterior.Enabled:=True;
    BtnProximo.Enabled:=True;
    BtnUltimo.Enabled:=True;
    BtnAlterar.Enabled:=True;
    Btndeletar.Enabled:=True;
    {}
    dbCodCli.Enabled:=false;
    dbNumBanco.Enabled:=false;
    dbNumAgencia.Enabled:=false;
    dbBanco.Enabled:=false;
    dbConta.Enabled:=false;
    dbNumCh.Enabled:=false;
    dbEmissao.Enabled:=false;
    dbVenc.Enabled:=false;
    dbValor.Enabled:=false;
    DbStatus.Enabled:=false;
    dbmObs.Enabled:=false;
    ShowMessage('Dados gravados com sucesso');
    Panel3.setfocus;
    End
  Else
    Begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbcodcli.SetFocus;
    end;

end;

procedure TFrmLanCheque.btnCancelarClick(Sender: TObject);
begin
  novoitem:=false;
  dmdados.vTabStt:=True;
  dmdados.tbCheque.cancel;
  BtnGravar.enabled := false;
  BtnCancelar.Enabled := false;
  BtnNovo.Enabled:=True;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  Btnproximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  {}
  dbCodCli.Enabled:=false;
  dbNumBanco.Enabled:=false;
  dbNumAgencia.Enabled:=false;
  dbBanco.Enabled:=false;
  dbConta.Enabled:=false;
  dbNumCh.Enabled:=false;
  dbEmissao.Enabled:=false;
  dbVenc.Enabled:=false;
  dbValor.Enabled:=false;
  DbStatus.Enabled:=false;
  dbmObs.Enabled:=false;
  Panel3.SetFocus;
end;

procedure TFrmLanCheque.btnDeletarClick(Sender: TObject);
begin
  novoitem:=false;
  dmdados.vTabStt:= True;
  if dmdados.tbCheque.RecordCount=0 then
    begin
    ShowMessage('Tabela vazia');
    end
  else
    begin
    If application.MessageBox('Tem certeza que deseja exluir esse registro?','Aten��o', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      dmdados.tbCheque.Delete
    else
      dmdados.tbCheque.Cancel;
    end;
end;

procedure TFrmLanCheque.btnBaixaClick(Sender: TObject);
begin
  dmdados.tbCheque.edit;
  dmdados.tbChequeStatus.Value:='PAGO';
  dmdados.tbCheque.Post;
end;

end.
