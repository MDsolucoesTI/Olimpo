//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
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
  ExtCtrls, SpeedBar, jpeg, RXDBCtrl, RackCtls, CurrEdit, ShellApi, DBTables, DB, DBUtils;

type
  TFrmCCorrente = class(TForm)
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
    BtnSair: TSpeedItem;
    Panel1: TPanel;
    Panel2: TPanel;
    RxLabel3: TRxLabel;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    Image2: TImage;
    Label2: TLabel;
    RxLabel18: TRxLabel;
    Panel3: TPanel;
    RxLabel2: TRxLabel;
    DBDateEditAbert: TDBDateEdit;
    RxLabel11: TRxLabel;
    dbDescr: TDBEdit;
    RxLabel7: TRxLabel;
    dbNum: TDBEdit;
    RxLabel16: TRxLabel;
    dbLookBanc: TDBLookupComboBox;
    RxLabel5: TRxLabel;
    DBAgencia: TDBEdit;
    RxLabel4: TRxLabel;
    DbeConta: TDBEdit;
    RxLabel17: TRxLabel;
    dbTel1: TDBEdit;
    RxLabel14: TRxLabel;
    dbFax: TDBEdit;
    RxLabel10: TRxLabel;
    DBgerente: TDBEdit;
    RxLabel6: TRxLabel;
    DBtitular: TDBEdit;
    RxLabel8: TRxLabel;
    RxDBLimite: TRxDBCalcEdit;
    RxLabel1: TRxLabel;
    RxDBSaldo: TRxDBCalcEdit;
    dbHoraMov: TDBEdit;
    RxLabel13: TRxLabel;
    DBedtMov: TDBDateEdit;
    RxLabel9: TRxLabel;
    RxLabel12: TRxLabel;
    DBEemail: TDBEdit;
    fcImageBtn1: TfcImageBtn;
    RxLabel15: TRxLabel;
    dbEdtCad: TDBDateEdit;
    RxSplitter1: TRxSplitter;
    RxSplitter2: TRxSplitter;
    procedure fclEmailClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DEditDatAbertEnter(Sender: TObject);
    procedure DEditDatAbertExit(Sender: TObject);
    procedure DEditDatCadEnter(Sender: TObject);
    procedure DEditDatCadExit(Sender: TObject);
    procedure DbeContaEnter(Sender: TObject);
    procedure DbeContaExit(Sender: TObject);
    procedure DBbancoEnter(Sender: TObject);
    procedure DBbancoExit(Sender: TObject);
    procedure DBAgenciaEnter(Sender: TObject);
    procedure DBAgenciaExit(Sender: TObject);
    procedure DBebancoEnter(Sender: TObject);
    procedure DBebancoExit(Sender: TObject);
    procedure DBtitularEnter(Sender: TObject);
    procedure DBgerenteEnter(Sender: TObject);
    procedure DBgerenteExit(Sender: TObject);
    procedure DBlimiteEnter(Sender: TObject);
    procedure DBlimiteExit(Sender: TObject);
    procedure DBEemailEnter(Sender: TObject);
    procedure DBEemailExit(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure DBDateEditAbertExit(Sender: TObject);
    procedure DBDateEditAbertEnter(Sender: TObject);
    procedure DBEDataMovEnter(Sender: TObject);
    procedure DBEDataMovExit(Sender: TObject);
    procedure DBEHoraMovEnter(Sender: TObject);
    procedure DBEHoraMovExit(Sender: TObject);
    procedure DBDateEditCadEnter(Sender: TObject);
    procedure DBDateEditCadExit(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure dbTel1Enter(Sender: TObject);
    procedure dbTel1Exit(Sender: TObject);
    procedure dbFaxEnter(Sender: TObject);
    procedure dbFaxExit(Sender: TObject);
    procedure RxDBLimiteEnter(Sender: TObject);
    procedure RxDBLimiteExit(Sender: TObject);
    procedure RxDBSaldoEnter(Sender: TObject);
    procedure RxDBSaldoExit(Sender: TObject);
    procedure fcImageBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dbDescrEnter(Sender: TObject);
    procedure dbDescrExit(Sender: TObject);
    procedure DBtitularExit(Sender: TObject);
    procedure DBedtMovEnter(Sender: TObject);
    procedure DBedtMovExit(Sender: TObject);
    procedure dbHoraMovEnter(Sender: TObject);
    procedure dbHoraMovExit(Sender: TObject);
    procedure dbLookBancEnter(Sender: TObject);
    procedure dbLookBancExit(Sender: TObject);
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

procedure TFrmCCorrente.DEditDatAbertEnter(Sender: TObject);
begin
  (Sender as TDateEdit).Color:=clTeal;
end;

procedure TFrmCCorrente.DEditDatAbertExit(Sender: TObject);
begin
  (Sender as TDateEdit).Color:=clWindow;
end;

procedure TFrmCCorrente.DEditDatCadEnter(Sender: TObject);
begin
  (Sender as TDateEdit).Color:=clTeal;
end;

procedure TFrmCCorrente.DEditDatCadExit(Sender: TObject);
begin
  (Sender as TDateEdit).Color:=clWindow;
end;

procedure TFrmCCorrente.DbeContaEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
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
      ShowMessage('� obrigat�rio o N�MERO DA CONTA');
      DbeConta.SetFocus;
      end
    else
      Begin
      If Tabela.Locate('Conta',DbeConta.Text,[]) Then
        If (DmDados.TbCCorrente.State=dsEdit) And (dmDados.TbCCorrente.RecNo = Tabela.RecNo) Then
          (Sender as TDbEdit).Color:=clwindow
        Else
          Begin
          Showmessage('N�MERO DA CONTA j� Cadastrada');
          DbeConta.Clear;
          DbeConta.setfocus;
          End
      Else
        (Sender as TDbEdit).Color:=clwindow;
      End;
    Tabela.Free;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmCCorrente.DBbancoEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCCorrente.DBbancoExit(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCCorrente.DBAgenciaEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCCorrente.DBAgenciaExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBAgencia.Text= '' then
      Begin
      ShowMessage('� obrigat�rio a AG�NCIA');
      DBAgencia.SetFocus;
      End
    Else
      (Sender as TDBEdit).color:=clWindow;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmCCorrente.DBebancoEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCCorrente.DBebancoExit(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCCorrente.DBtitularEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCCorrente.DBgerenteEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCCorrente.DBgerenteExit(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCCorrente.DBlimiteEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCCorrente.DBlimiteExit(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCCorrente.DBEemailEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCCorrente.DBEemailExit(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCCorrente.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCCorrente.DBDateEditAbertExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBDateEditAbert.Text= '  /  /    ' then
      Begin
      ShowMessage('� obrigat�rio a DATA DE ABERTURA');
      DBDateEditAbert.SetFocus;
      End
    Else
      (Sender as TDBDateEdit).color:=clWindow;
    End
  Else
    (Sender as TDBDateEdit).color:=clWindow;
end;

procedure TFrmCCorrente.DBDateEditAbertEnter(Sender: TObject);
begin
  (Sender as TDbDateEdit).Color:=$00D2E2FF;
end;

procedure TFrmCCorrente.DBEDataMovEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCCorrente.DBEDataMovExit(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCCorrente.DBEHoraMovEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCCorrente.DBEHoraMovExit(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCCorrente.DBDateEditCadEnter(Sender: TObject);
begin
  (Sender as TDbDateEdit).Color:=$00D2E2FF;
end;

procedure TFrmCCorrente.DBDateEditCadExit(Sender: TObject);
begin
  (Sender as TDbDateEdit).Color:=clWindow;
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
  If dmdados.TbCCorrente.bof Then
    Begin
    btnPrimeiro.Enabled:=False;
    btnAnterior.Enabled:=False;
    End;
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
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'N�mero da Conta';
    Gravar:=False;
    Vazio:=True;
    end
  else
    If Tabela.Locate('Conta',DbeConta.Text,[]) Then
      If Not((DmDados.TbCCorrente.State=dsEdit) And (dmDados.TbCCorrente.RecNo = Tabela.RecNo)) Then
        Begin
       	Gravar:=False;
        Showmessage('N�mero da Conta j� Cadastrado');
        End;
  If DBDescr.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Descri��o';
    Gravar:=False;
    Vazio:=True;
    end
  else
    If Tabela.Locate('Descricao',dbDescr.Text,[]) Then
      If Not((DmDados.TbCCorrente.State=dsEdit) And (dmDados.TbCCorrente.RecNo = Tabela.RecNo)) Then
        Begin
       	Gravar:=False;
        Showmessage('Descri��o j� Cadastrada');
        End;

  //Campo que n�o pode estar vazio
  If DBtitular.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Titular';
    Gravar:=False;
    Vazio:=True;
    end;
  If DBAgencia.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Ag�ncia';
    Gravar:=False;
    Vazio:=True;
    end;
  //Campo Data n�o podendo ser vazio
  If DBDateEditAbert.Text= '  /  /    ' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Data de Abertura';
    Gravar:=False;
    Vazio:=True;
    End;
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
    dmdados.TbMovContaCodHist.Value:=2;
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
    showmessage('Dados gravados com sucesso!');
    SpeedBar1.SetFocus;
    End
  Else
    Begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
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
  SpeedBar1.SetFocus;
end;

procedure TFrmCCorrente.BtnAlterarClick(Sender: TObject);
begin
  if dmdados.tbCCorrente.RecordCount=0 then
    begin
    ShowMessage('Tabela sem registro');
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
    begin
    ShowMessage('Tabela sem registro');
    end
  else
    If application.MessageBox('Tem certeza que deseja exluir esse registro?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      if dmDados.TbMovConta.Locate('NumAgencia;Conta',VarArrayOf([dmDados.TbCCorrenteNumAgencia.Value,dmDados.TbCCorrenteConta.Value]),[]) then
        ShowMessage('CONTA CORRENTE ativa, n�o pode ser excluida !!!')
      Else
        dmdados.tbCCorrente.Delete;
end;

procedure TFrmCCorrente.dbTel1Enter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCCorrente.dbTel1Exit(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCCorrente.dbFaxEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCCorrente.dbFaxExit(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCCorrente.RxDBLimiteEnter(Sender: TObject);
begin
  (Sender as TRxDBCalcEdit).Color:=$00D2E2FF;
end;

procedure TFrmCCorrente.RxDBLimiteExit(Sender: TObject);
begin
  (Sender as TRxDBCalcEdit).Color:=clWindow;
end;

procedure TFrmCCorrente.RxDBSaldoEnter(Sender: TObject);
begin
  (Sender as TRxDBCalcEdit).Color:=$00D2E2FF;
end;

procedure TFrmCCorrente.RxDBSaldoExit(Sender: TObject);
begin
  (Sender as TRxDBCalcEdit).Color:=ClWindow;
end;

procedure TFrmCCorrente.fcImageBtn1Click(Sender: TObject);
var
 url : string;
begin
  url :='mailto:'+dmdados.tbCCorrenteEmail.Value;
  shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
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
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Esc] Cancelar ou Sair');
end;

procedure TFrmCCorrente.dbDescrEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCCorrente.dbDescrExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  If NovoItem Then
    Begin
    Tabela := TTable.Create(Application);
    Tabela.DatabaseName := dmDados.tbCCorrente.DatabaseName;
    Tabela.TableName := dmDados.tbCCorrente.TableName;
    Tabela.IndexName := dmdados.TbCCorrente.IndexName;
    Tabela.Open;
    If dbDescr.Text= '' then
      begin
      ShowMessage('� obrigat�rio a DESCRI��O');
      dbDescr.SetFocus;
      end
    else
      Begin
      If Tabela.Locate('Descricao',dbDescr.Text,[]) Then
        If (DmDados.tbCCorrente.State=dsEdit) And (dmDados.tbCCorrente.RecNo = Tabela.RecNo) Then
          (Sender as TDbEdit).Color:=clwindow
        Else
          Begin
          Showmessage('DEDSCRI��O j� Cadastrada');
          dbDescr.Clear;
          dbDescr.setfocus;
          End
      Else
        (Sender as TDbEdit).Color:=clwindow;
      End;
    Tabela.Free;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmCCorrente.DBtitularExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBtitular.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o TITULAR');
      DBtitular.SetFocus;
      End
    Else
      (Sender as TDBEdit).color:=clWindow;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmCCorrente.DBedtMovEnter(Sender: TObject);
begin
  (Sender as TDbDateEdit).Color:=$00D2E2FF;
end;

procedure TFrmCCorrente.DBedtMovExit(Sender: TObject);
begin
  (Sender as TDbDateEdit).Color:=clWindow;
end;

procedure TFrmCCorrente.dbHoraMovEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
  dmDados.TbCCorrenteHoraMov.Value:=Now;
end;

procedure TFrmCCorrente.dbHoraMovExit(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCCorrente.dbLookBancEnter(Sender: TObject);
begin
  (Sender as TDBLookupComboBox).color:=$00d2e2ff;
end;

procedure TFrmCCorrente.dbLookBancExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbLookBanc.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o BANCO');
      dbLookBanc.SetFocus;
      End
    Else
      (Sender as TDBLookupComboBox).color:=clWindow;
    End
  Else
    (Sender as TDBLookupComboBox).color:=clWindow;
end;

end.
