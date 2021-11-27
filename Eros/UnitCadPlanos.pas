//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Cadastro e Manuten��o de Planos de Pagamento
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCadPlanos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, RxGrdCpt, Mask, fcButton, fcImgBtn, ExtCtrls,
  RXCtrls, fcImager, RXSpin,db,dbTables, EMsgDlg, EDBNum, RxDBComb,
  EUserAcs, jpeg, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmCadPlanos = class(TForm)
    MsgDlg: TEvMsgDlg;
    UserAcess: TEvUserAccess;
    RxLabel4: TRxLabel;
    Image1: TImage;
    RxLabel1: TRxLabel;
    dbPlanoPagto: TDBEdit;
    RxLabel2: TRxLabel;
    dbEntrada: TRxDBComboBox;
    RxLabel3: TRxLabel;
    dbDtEntra: TEvDBNumEdit;
    RxLabel9: TRxLabel;
    dbQtd: TEvDBNumEdit;
    RxLabel10: TRxLabel;
    dbPrimPrest: TEvDBNumEdit;
    dbIntervalo: TEvDBNumEdit;
    RxLabel11: TRxLabel;
    dbJuros: TEvDBNumEdit;
    RxLabel13: TRxLabel;
    btnPrimeiro: TfcImageBtn;
    btnAnterior: TfcImageBtn;
    btnProximo: TfcImageBtn;
    btnUltimo: TfcImageBtn;
    btnNovo: TfcImageBtn;
    btnGravar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    btnAlterar: TfcImageBtn;
    btnDeletar: TfcImageBtn;
    btnSair: TfcImageBtn;
    LMDBackPanel2: TPanel;
    Panel3: TPanel;
    LMDBackPanel1: TPanel;
    procedure btnSairClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure dbPlanoPagtoExit(Sender: TObject);
    procedure dbQtdExit(Sender: TObject);
    procedure dbPrimPrestExit(Sender: TObject);
    procedure dbJurosExit(Sender: TObject);
    procedure dbEntradaExit(Sender: TObject);
    procedure dbIntervaloExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadPlanos: TFrmCadPlanos;
  NovoItem: Boolean;

implementation

uses unitDmDados, UnitPrincipal;

{$R *.dfm}

procedure TFrmCadPlanos.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadPlanos.btnPrimeiroClick(Sender: TObject);
begin
  DMDados.tbPlanos.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadPlanos.btnAnteriorClick(Sender: TObject);
begin
  DMDados.tbPlanos.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If DMDados.tbPlanos.Bof Then
    Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadPlanos.btnProximoClick(Sender: TObject);
begin
  DMDados.tbPlanos.Next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If DMDados.tbPlanos.Eof Then
    Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadPlanos.btnUltimoClick(Sender: TObject);
begin
  DMDados.tbPlanos.Last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadPlanos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.tbPlanos.Open;
  Action:= cafree;
end;

procedure TFrmCadPlanos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmDados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_INSERT : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_HOME   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_DELETE : if (dmDados.vTabStt) then BtnDeletar.Click;
      VK_END    : if not(dmDados.vTabStt) then BtnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
    end;
end;

procedure TFrmCadPlanos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmCadPlanos.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
  dmdados.tbPlanos.Open;
  If dmDados.tbPlanos.RecordCount=0 Then
    begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    BtnNovo.Enabled:=True;
    BtnCancelar.Enabled:=False;
    BtnAlterar.Enabled:=False;
    Btndeletar.Enabled:=False;
     end;
   BtnSair.Enabled:= True;
   BtnGravar.Enabled:=False;
end;

procedure TFrmCadPlanos.btnNovoClick(Sender: TObject);
begin
  dmdados.tbPlanos.append;
  NovoItem:= True;
  dmDados.vTabStt:=False;
  //Desabilitando e Habilitando Bot�es
  BtnGravar.Enabled := True;
  BtnCancelar.Enabled:=True;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  //Habilitando os componentes
  dbPlanoPagto.Enabled:=True;
  dbEntrada.Enabled:=True;
  dbQtd.Enabled:=True;
  dbPrimPrest.Enabled:=True;
  dbJuros.Enabled:=True;
  dbPlanoPagto.SetFocus;
  UserAcess.ForceDefinitions;
end;

procedure TFrmCadPlanos.btnAlterarClick(Sender: TObject);
begin
  if dmdados.tbPlanos.RecordCount=0 then
    MsgDlg.MsgError('Tabela sem registro')
  else
    begin
    NovoItem:=true;
    dmdados.tbPlanos.Edit;
    //Desabilitando e Habilitando Bot�es
    BtnGravar.Enabled := True;
    BtnCancelar.Enabled:=True;
    BtnNovo.Enabled:=False;
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    BtnAlterar.Enabled:=False;
    BtnDeletar.Enabled:=False;
    //Habilitando os componentes
    dbPlanoPagto.Enabled:=True;
    dbEntrada.Enabled:=True;
    dbQtd.Enabled:=True;
    dbPrimPrest.Enabled:=True;
    dbJuros.Enabled:=True;
    dbPlanoPagto.SetFocus;
    End;
  UserAcess.ForceDefinitions;
end;

procedure TFrmCadPlanos.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbPlanos.Cancel;
  NovoItem:= False;
  //Desabilitando e Habilitando Bot�es
  BtnGravar.Enabled := False;
  BtnCancelar.Enabled:=False;
  BtnNovo.Enabled:=True;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  //Desabilitando os componentes
  dbPlanoPagto.Enabled:=False;
  dbEntrada.Enabled:=False;
  dbDtEntra.Enabled:=False;
  dbQtd.Enabled:=False;
  dbPrimPrest.Enabled:=False;
  dbIntervalo.Enabled:=False;
  dbJuros.Enabled:=False;
  Panel3.SetFocus;
  UserAcess.ForceDefinitions;
end;

procedure TFrmCadPlanos.btnDeletarClick(Sender: TObject);
begin
  If dmDados.tbPlanos.RecordCount=0 Then
    MsgDlg.MsgError('Tabela vazia!!!')
  Else
    if Application.MessageBox('Deseja realmente excluir o Registro?','Aten��o !',MB_YESNO + MB_DEFBUTTON2 + MB_ICONEXCLAMATION) = IDYES then
      DMdados.tbPlanos.Delete;
end;

procedure TFrmCadPlanos.btnGravarClick(Sender: TObject);
var
  Tabela: TTable;
  Gravar,Vazio:Boolean;
  Campos:String;
begin
  Gravar:=True;
  Vazio:=False;
  Campos:='';
  Tabela:=TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbPlanos.DatabaseName;
  Tabela.TableName := dmDados.tbPlanos.TableName;
  Tabela.IndexName := dmdados.tbPlanos.IndexName;
  Tabela.Open;
	if dbPlanoPagto.Text='' then
  	begin
    if Length(Campos)>0 then
      Campos:=Campos+', ';
    Campos:='Descri��o';
	  Vazio:=True;
    Gravar:=False;
  	end
  else
    if Tabela.Locate('Descricao',dbPlanoPagto.Text,[]) then
      if (DmDados.tbPlanos.State=dsEdit) and (dmDados.tbPlanos.RecNo = Tabela.RecNo) then
        Gravar:=True
      else
        begin
        MsgDlg.MsgWarning('DESCR��O j� Cadastrada!!!');
        Gravar:=false;
        end
    else
      Gravar:=True;
  if dbQtd.Value < 1 then
    begin
    MsgDlg.MsgWarning('A QUANTIDADE deve ser maior que ZERO');
    Gravar:=False;
    end;
  if dbPrimPrest.Value < 0 then
    begin
    MsgDlg.MsgWarning('O n�mero de dias para a Primeira Parcela|deve ser maior ou igual a ZERO');
    Gravar:=False;
    end;
  if dbQtd.Value > 1 then
    if dbIntervalo.Value <= 0 then
      begin
      MsgDlg.MsgWarning('O Intervalo entre as Parcelas|deve ser maior que ZERO');
      Gravar:=False;
      end;
  if dbJuros.Value < 0 then
    begin
    MsgDlg.MsgWarning('O JUROS deve ser maior ou igual a ZERO');
    Gravar:=False;
    end;
  Tabela.Free;
  if Gravar then
    begin
    NovoItem:= False;
    dmdados.tbPlanos.Post;
    dmDados.vTabStt:=True;
    //Desabilitando e Habilitando Bot�es
    btnGravar.enabled := False;
    btnCancelar.Enabled := False;
    btnNovo.Enabled:=True;
    btnPrimeiro.Enabled:=True;
    btnAnterior.Enabled:=True;
    btnProximo.Enabled:=True;
    btnUltimo.Enabled:=True;
    btnAlterar.Enabled:=True;
    btndeletar.Enabled:=True;
    //Desabilitando os componentes
    dbPlanoPagto.Enabled:=False;
    dbEntrada.Enabled:=False;
    dbDtEntra.Enabled:=False;
    dbQtd.Enabled:=False;
    dbPrimPrest.Enabled:=False;
    dbIntervalo.Enabled:=False;
    dbJuros.Enabled:=False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!!!');
    Panel3.SetFocus;
    end
  else
    if Vazio then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbPlanoPagto.SetFocus;
      end;
  UserAcess.ForceDefinitions;
end;

procedure TFrmCadPlanos.dbPlanoPagtoExit(Sender: TObject);
begin
  If NovoItem Then
    If dbPlanoPagto.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio uma DESCRI��O');
      dbPlanoPagto.SetFocus;
      End;
end;

procedure TFrmCadPlanos.dbQtdExit(Sender: TObject);
begin
  if NovoItem then
    begin
    if dbQtd.Value < 1 then
      begin
      MsgDlg.MsgWarning('A QUANTIDADE deve ser maior que ZERO');
      dbQtd.SetFocus;
      end
    else
      if dbQtd.Value > 1 then
        dbIntervalo.Enabled:=True;
    end;
end;

procedure TFrmCadPlanos.dbPrimPrestExit(Sender: TObject);
begin
  if NovoItem then
    begin
    if dbPrimPrest.Value < 0 then
      begin
      MsgDlg.MsgWarning('O n�mero de dias para a Primeira Parcela|deve ser maior ou igual a ZERO');
      dbPrimPrest.SetFocus;
      end;
    end;
end;

procedure TFrmCadPlanos.dbJurosExit(Sender: TObject);
begin
  if NovoItem then
    begin
    if dbJuros.Value < 0 then
      begin
      MsgDlg.MsgWarning('O JUROS deve ser maior ou igual a ZERO');
      dbJuros.SetFocus;
      end;
    end;
end;

procedure TFrmCadPlanos.dbEntradaExit(Sender: TObject);
begin
  if NovoItem then
    if dbEntrada.Text='' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio informar se haver� ENTRADA');
      dbEntrada.SetFocus;
      End
    else
      if dbEntrada.Text='Sim' then
        dbDtEntra.Enabled:=True;
end;

procedure TFrmCadPlanos.dbIntervaloExit(Sender: TObject);
begin
  if NovoItem then
    begin
    if dbIntervalo.Value <= 0 then
      begin
      MsgDlg.MsgWarning('O Intervalo entre as Parcelas|deve ser maior que ZERO');
      dbIntervalo.SetFocus;
      end;
    end;
end;

procedure TFrmCadPlanos.FormActivate(Sender: TObject);
begin
  UserAcess.UserID:=frmPrincipal.Acesso;
end;

end.
