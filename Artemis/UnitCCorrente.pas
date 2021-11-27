//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitCcorrente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, fcButton, fcImgBtn, RXSplit, ToolEdit, Mask, RXCtrls,
  ExtCtrls, SpeedBar, jpeg, RXDBCtrl, RackCtls, CurrEdit, ShellApi, DBTables, DB, DBUtils,
  RxGrdCpt, fcImager, EMsgDlg, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmCCorrente = class(TForm)
    RxGradientCaption2: TRxGradientCaption;
    MsgDlg: TEvMsgDlg;
    LMDBackPanel2: TLMDBackPanel;
    Image1: TImage;
    RxLabel3: TRxLabel;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel2: TRxLabel;
    DBDateEditAbert: TDBDateEdit;
    RxLabel7: TRxLabel;
    dbNum: TDBEdit;
    RxLabel17: TRxLabel;
    dbTel1: TDBEdit;
    RxLabel6: TRxLabel;
    DBtitular: TDBEdit;
    RxLabel12: TRxLabel;
    DBEemail: TDBEdit;
    RxLabel15: TRxLabel;
    dbEdtCad: TDBDateEdit;
    fcImageBtn1: TfcImageBtn;
    RxDBLimite: TRxDBCalcEdit;
    RxLabel8: TRxLabel;
    RxLabel1: TRxLabel;
    RxDBSaldo: TRxDBCalcEdit;
    DBgerente: TDBEdit;
    RxLabel10: TRxLabel;
    dbFax: TDBEdit;
    RxLabel14: TRxLabel;
    dbLookBanc: TDBLookupComboBox;
    RxLabel16: TRxLabel;
    dbDescr: TDBEdit;
    RxLabel11: TRxLabel;
    RxLabel9: TRxLabel;
    DBedtMov: TDBDateEdit;
    RxLabel13: TRxLabel;
    dbHoraMov: TDBEdit;
    RxLabel4: TRxLabel;
    DbeConta: TDBEdit;
    DBAgencia: TDBEdit;
    RxLabel5: TRxLabel;
    Panel4: TLMDBackPanel;
    btnPrimeiro: TfcImageBtn;
    btnAnterior: TfcImageBtn;
    btnProximo: TfcImageBtn;
    btnUltimo: TfcImageBtn;
    btnNovo: TfcImageBtn;
    btnGravar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    btnALterar: TfcImageBtn;
    btnDeletar: TfcImageBtn;
    btnSair: TfcImageBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure fclEmailClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DbeContaExit(Sender: TObject);
    procedure DBAgenciaExit(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure DBDateEditAbertExit(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dbDescrExit(Sender: TObject);
    procedure DBtitularExit(Sender: TObject);
    procedure dbHoraMovEnter(Sender: TObject);
    procedure DBEemailExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCCorrente: TFrmCCorrente;
  NovoItem: Boolean;

implementation

uses  UnitDmdados, unitPrincipal;

{$R *.DFM}

procedure TFrmCCorrente.fclEmailClick(Sender: TObject);
var
  url : string;
begin
  url :='mailto:'+dmdados.TbCCorrenteEMail.Value;
  shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;

procedure TFrmCCorrente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  Action:= Cafree;
end;

procedure TFrmCCorrente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmCCorrente.DbeContaExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  If NovoItem Then
    Begin
    Tabela := TTable.Create(Application);
    Tabela.DatabaseName := dmDados.TbCCorrente.DatabaseName;
    Tabela.TableName := dmDados.TbCCorrente.TableName;
    Tabela.IndexName := dmdados.TbCCorrente.IndexName;
    Tabela.Open;
    If DbeConta.Text= '' then
       begin
       MsgDlg.MsgError('� obrigat�rio o N�MERO DA CONTA');
       DbeConta.SetFocus;
       end
    else
      If Tabela.Locate('Conta',DbeConta.Text,[]) Then
        If not ((DmDados.TbCCorrente.State=dsEdit) And (dmDados.TbCCorrente.RecNo = Tabela.RecNo)) Then
          Begin
          MsgDlg.MsgWarning('N�MERO DA CONTA j� Cadastrada');
          DbeConta.Clear;
          DbeConta.setfocus;
          End;
    Tabela.Free;
    End;
end;

procedure TFrmCCorrente.DBAgenciaExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBAgencia.Text= '' then
      Begin
      MsgDlg.MsgError('� obrigat�rio a AG�NCIA');
      DBAgencia.SetFocus;
      End;
    end;
end;

procedure TFrmCCorrente.BtnSairClick(Sender: TObject);
begin
  if (DmDados.TbCCorrente.State=dsEdit) or (DmDados.TbCCorrente.State=dsInsert) then
    DmDados.TbCCorrente.Cancel;
  Close;
end;

procedure TFrmCCorrente.DBDateEditAbertExit(Sender: TObject);
begin
  if NovoItem then
    if DBDateEditAbert.Text= '  /  /    ' then
      begin
      MsgDlg.MsgError('� obrigat�rio a DATA INICIAL');
      DBDateEditAbert.SetFocus;
      End
  else
    begin
    try
      StrToDate(DBDateEditAbert.Text);
    except
      on EConvertError do
        begin
        MsgDlg.MsgError('Data Inv�lida');
        DBDateEditAbert.SetFocus;
        end;
    end;
    end;
end;

procedure TFrmCCorrente.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbCCorrente.First;
  btnPrimeiro.Enabled:=False;
  btnAnterior.Enabled:=False;
  btnProximo.Enabled:=True;
  btnUltimo.Enabled:=True;
  dmDados.vTabStt:=True;
end;

procedure TFrmCCorrente.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.tbCCorrente.Prior;
  btnProximo.Enabled:=True;
  btnUltimo.Enabled:=True;
  if dmdados.TbCCorrente.bof then
    begin
    btnPrimeiro.Enabled:=False;
    btnAnterior.Enabled:=False;
    end;
  dmDados.vTabStt:=True;
end;

procedure TFrmCCorrente.BtnProximoClick(Sender: TObject);
begin
  dmdados.tbCCorrente.next;
  btnPrimeiro.Enabled:=True;
  btnAnterior.Enabled:=True;
  If dmdados.tbCCorrente.Eof Then
    Begin
    btnProximo.Enabled:=False;
    btnUltimo.Enabled:=False;
    end;
  dmDados.vTabStt:=True;
end;

procedure TFrmCCorrente.BtnUltimoClick(Sender: TObject);
begin
  dmdados.tbCCorrente.Last;
  btnPrimeiro.Enabled:=True;
  btnAnterior.Enabled:=True;
  btnProximo.Enabled:=False;
  btnUltimo.Enabled:=False;
  dmDados.vTabStt:=True;
end;

procedure TFrmCCorrente.BtnNovoClick(Sender: TObject);
begin
  novoitem:=true;
  dmDados.vTabStt:=False;
  dmdados.tbCCorrente.Append;
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
  DbDateEditAbert.Enabled:= true;
  DbDescr.Enabled:= True;
  DbLookBanc.Enabled:=True;
  dbAgencia.Enabled:=true;
  dbeconta.Enabled:=true;
  dbTel1.Enabled:=True;
  dbFax.Enabled:=True;
  dbGerente.Enabled:=true;
  dbTitular.Enabled:=True;
  RXdbLimite.Enabled:=true;
  RXdbSaldo.Enabled:=true;
  dbeEmail.Enabled:=True;
  dmDados.TbCCorrenteHoraMov.Value:=Now;
  DbDateEditAbert.SetFocus;
end;

procedure TFrmCCorrente.BtnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
  Tabela: TTable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbCCorrente.DatabaseName;
  Tabela.TableName := dmDados.TbCCorrente.TableName;
  Tabela.IndexName := dmdados.TbCCorrente.IndexName;
  Tabela.Open;
  //Campo que n�o pode repetir
  If DbeConta.Text= '' then
    begin
    If Length(Campos)>0 Then Campos:=Campos+', ';
    Campos:=Campos+'N�mero da Conta';
    Gravar:=False;
    Vazio:=True;
    end
  else
    If Tabela.Locate('Conta',DbeConta.Text,[]) Then
      If Not((DmDados.TbCCorrente.State=dsEdit) And (dmDados.TbCCorrente.RecNo = Tabela.RecNo)) Then
        Begin
       	Gravar:=False;
        MsgDlg.MsgWarning('N�mero da Conta j� Cadastrado');
        End;
  If DBDescr.Text= '' then
    begin
    If Length(Campos)>0 Then Campos:=Campos+', ';
    Campos:=Campos+'Descri��o';
    Gravar:=False;
    Vazio:=True;
    end
  else
    If Tabela.Locate('Descricao',dbDescr.Text,[]) Then
      If Not((DmDados.TbCCorrente.State=dsEdit) And (dmDados.TbCCorrente.RecNo = Tabela.RecNo)) Then
        Begin
       	Gravar:=False;
        MsgDlg.MsgWarning('Descri��o j� Cadastrada');
        End;
  //Campo que n�o pode estar vazio
  If DBtitular.Text= '' then
    begin
    If Length(Campos)>0 Then Campos:=Campos+', ';
    Campos:=Campos+'Titular';
    Gravar:=False;
    Vazio:=True;
    end;
  If DBAgencia.Text= '' then
    begin
    If Length(Campos)>0 Then Campos:=Campos+', ';
    Campos:=Campos+'Ag�ncia';
    Gravar:=False;
    Vazio:=True;
    end;
  //Campo Data n�o podendo ser vazio
  If DBDateEditAbert.Text= '  /  /    ' then
    Begin
    If Length(Campos)>0 Then Campos:=Campos+', ';
    Campos:=Campos+'Data de Abertura';
    Gravar:=False;
    Vazio:=True;
    End;
  If dbLookBanc.Text= '' then
    Begin
    if Length(campos)>0 then campos:=campos+', ';
    campos:=campos+'BANCO';
    gravar:=false;
    vazio:=true;
    End;
  if (DBDateEditAbert.text <> '') then
    try StrToDate(DBDateEditAbert.text)
    except on EConvertError do
      begin
      MsgDlg.MsgError('Data de Abertura Inv�lida');
      gravar:=false;
      end;
    end;
  If Gravar Then
    Begin
    NovoItem:=False;
    dmDados.vTabStt:=True;
    //lan�a o primeiro movimento ref. a cadastro
    dmdados.tbCCorrente.Post;
    dmDados.TbMovConta.Append;
    dmdados.TbMovContaTipoOper.Value:='E';
    dmdados.TbMovContaNumAgencia.Value:=dmdados.TbCCorrenteNumAgencia.Value;
    dmdados.TbMovContaConta.Value:=dmdados.TbCCorrenteConta.Value;
    dmdados.TbMovContaCodHist.Value:='2';
    dmdados.TbMovContaComplHist.Value:='ABERTURA/CRIA��O DA CONTA';
    dmdados.TbMovContaDataMov.Value:=dmdados.TbCCorrenteDataCad.Value;
    dmDados.TbMovContaValor.Value:=dmdados.TbCCorrenteSaldo.Value;
    dmDados.TbMovContaDataReg.Value:=dmDados.TbCCorrenteUltMov.Value;
    dmdados.TbMovContaHoraReg.Value:=StrToTime('00:00:00');
    dmdados.TbMovConta.Post;
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
    DbDateEditAbert.Enabled:= False;
    DbDescr.Enabled:= False;
    DbLookBanc.Enabled:=False;
    dbAgencia.Enabled:=False;
    dbeconta.Enabled:=False;
    dbTel1.Enabled:=False;
    dbFax.Enabled:=False;
    dbGerente.Enabled:=False;
    dbTitular.Enabled:=False;
    RXdbLimite.Enabled:=False;
    RXdbSaldo.Enabled:=False;
    dbeEmail.Enabled:=False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    Panel4.SetFocus;
    End
  Else
    Begin
    If Vazio Then
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    DbDateEditAbert.SetFocus;
    end;
  Tabela.Free;
end;

procedure TFrmCCorrente.BtnCancelarClick(Sender: TObject);
begin
  NovoItem:=False;
  dmDados.vTabStt:=True;
  dmdados.tbCCorrente.cancel;
  BtnGravar.enabled := false;
  BtnCancelar.Enabled := false;
  BtnNovo.Enabled:=True;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  Btnproximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  DbDateEditAbert.SetFocus;
  {desabilitando os componentes}
  DbDateEditAbert.Enabled:= False;
  DbDescr.Enabled:= False;
  DbLookBanc.Enabled:=False;
  dbAgencia.Enabled:=False;
  dbeconta.Enabled:=False;
  dbTel1.Enabled:=False;
  dbFax.Enabled:=False;
  dbGerente.Enabled:=False;
  dbTitular.Enabled:=False;
  RXdbLimite.Enabled:=False;
  RXdbSaldo.Enabled:=False;
  dbeEmail.Enabled:=False;
  Panel4.SetFocus;
end;

procedure TFrmCCorrente.BtnAlterarClick(Sender: TObject);
begin
  if dmdados.tbCCorrente.RecordCount=0 then
    begin
    MsgDlg.MsgInformation('Tabela sem registro');
    end
  else
    begin
    NovoItem:=True;
    dmDados.vTabStt:=False;
    dmdados.tbCCorrente.Edit;
    BtnCancelar.enabled:= true;
    BtnGravar.Enabled:= true;
    BtnNovo.Enabled:=False;
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    BtnAlterar.Enabled:=False;
    Btndeletar.Enabled:=False;
    {habilitando os componentes}
    DbDateEditAbert.Enabled:= true;
    DbDescr.Enabled:= True;
    DbLookBanc.Enabled:=True;
    dbAgencia.Enabled:=true;
    dbeconta.Enabled:=true;
    dbTel1.Enabled:=True;
    dbFax.Enabled:=True;
    dbGerente.Enabled:=true;
    dbTitular.Enabled:=True;
    RXdbLimite.Enabled:=true;
    RXdbSaldo.Enabled:=true;
    dbeEmail.Enabled:=True;
    DbDateEditAbert.SetFocus;
    end;
end;

procedure TFrmCCorrente.BtnDeletarClick(Sender: TObject);
begin
  if dmdados.tbCCorrente.RecordCount=0 then
    MsgDlg.MsgInformation('Tabela sem registro')
  else
    If MsgDlg.MsgConfirmation('Tem certeza que deseja exluir esse registro?') = id_yes then
      if dmDados.TbMovConta.Locate('NumAgencia;Conta',VarArrayOf([dmDados.TbCCorrenteNumAgencia.Value,dmDados.TbCCorrenteConta.Value]),[]) then
        MsgDlg.MsgWarning('CONTA CORRENTE ativa, n�o pode ser excluida !!!')
      Else
        dmdados.tbCCorrente.Delete;
end;

procedure TFrmCCorrente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_Home   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_Delete : if (dmDados.vTabStt) then BtnDeletar.Click;
      VK_End    : if not(dmDados.vTabStt) then BtnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
    end;
end;

procedure TFrmCCorrente.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  NovoItem:= false;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
  if dmdados.TbCCorrente.RecordCount=0 then
    begin
    Btnprimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=false;
    BtnUltimo.Enabled:=false;
    btnGravar.Enabled:=false;
    btnAlterar.Enabled:=false;
    btnCancelar.Enabled:=false;
    btnDeletar.Enabled:=false;
    end;
end;

procedure TFrmCCorrente.dbDescrExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  if NovoItem then
    begin
    Tabela := TTable.Create(Application);
    Tabela.DatabaseName := dmDados.tbCCorrente.DatabaseName;
    Tabela.TableName := dmDados.tbCCorrente.TableName;
    Tabela.IndexName := dmdados.TbCCorrente.IndexName;
    Tabela.Open;
    if dbDescr.Text= '' then
      begin
      MsgDlg.MsgError('� obrigat�rio a DESCRI��O');
      dbDescr.SetFocus;
      end
    else
      if Tabela.Locate('Descricao',dbDescr.Text,[]) Then
        If not ((DmDados.tbCCorrente.State=dsEdit) And (dmDados.tbCCorrente.RecNo = Tabela.RecNo)) Then
          Begin
          MsgDlg.MsgWarning('DEDSCRI��O j� Cadastrada');
          dbDescr.Clear;
          dbDescr.setfocus;
          End;
    Tabela.Free;
    end;
end;

procedure TFrmCCorrente.DBtitularExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBtitular.Text= '' then
      Begin
      MsgDlg.MsgError('� obrigat�rio o TITULAR');
      DBtitular.SetFocus;
      End;
    end;
end;

procedure TFrmCCorrente.dbHoraMovEnter(Sender: TObject);
begin
  dmDados.TbCCorrenteHoraMov.Value:=Now;
end;

procedure TFrmCCorrente.DBEemailExit(Sender: TObject);
begin
  Panel4.SetFocus;
end;

end.


