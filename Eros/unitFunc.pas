//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Cadastro e Manuten��o de Funcion�rios
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  VerCPF, ToolEdit, RXDBCtrl, RackCtls, StdCtrls, DBCtrls, RXSplit, Mask,
  RXCtrls, ExtCtrls, SpeedBar, jpeg, CurrEdit, fcButton, fcImgBtn, RxLookup,
  DB, DBTables, DCStdCtrls, ImgList, Grids, DBGrids, ComCtrls, EDBZero,
  EFocCol, RxGrdCpt, fcImager, EMsgDlg, EUserAcs, TFlatSplitterUnit,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmFuncionario = class(TForm)
    VerCPF1: TVerCPF;
    MsgDlg: TEvMsgDlg;
    RxLabel25: TRxLabel;
    Image4: TImage;
    RxLabel1: TRxLabel;
    DBECod: TDBEdit;
    RxLabel2: TRxLabel;
    DBnome: TDBEdit;
    RxLabel11: TRxLabel;
    DBEtel1: TDBEdit;
    RxLabelnasc: TRxLabel;
    dbdEdtNasc: TDBDateEdit;
    RxLabel19: TRxLabel;
    rxdbComissao: TRxDBCalcEdit;
    RxLabel17: TRxLabel;
    RxLabel5: TRxLabel;
    DBEend: TDBEdit;
    RxLabel6: TRxLabel;
    DBEbairro: TDBEdit;
    DBEcidade: TDBEdit;
    RxLabel7: TRxLabel;
    dbeNum: TEvDBZeroEdit;
    RxLabel21: TRxLabel;
    RxLabel10: TRxLabel;
    DBEcompl: TDBEdit;
    RxLabel9: TRxLabel;
    DBEcep: TDBEdit;
    DBCBoxUF: TDBComboBox;
    RxLabel8: TRxLabel;
    dbLimDesc: TRxDBCalcEdit;
    RxLabel15: TRxLabel;
    RxLabel14: TRxLabel;
    rxdbCusto: TRxDBCalcEdit;
    RxDBSal: TRxDBCalcEdit;
    RxLabel4: TRxLabel;
    dbdedtAdm: TDBDateEdit;
    RxLabel3: TRxLabel;
    DBETel2: TDBEdit;
    RxLabel20: TRxLabel;
    RxLabel18: TRxLabel;
    DBEcel: TDBEdit;
    RxLabel12: TRxLabel;
    DBcmbSit: TDBComboBox;
    RxLabel16: TRxLabel;
    dbLookCargo: TDBLookupComboBox;
    DBEcpf: TDBEdit;
    RxLabelcpf: TRxLabel;
    RxLabelrg: TRxLabel;
    DBErg: TDBEdit;
    DbDateEditCad: TDBDateEdit;
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
    btnLocalizar: TfcImageBtn;
    btnDepen: TfcImageBtn;
    btnSair: TfcImageBtn;
    Panel3: TPanel;
    LMDBackPanel2: TPanel;
    LMDBackPanel1: TPanel;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure rxdbComissaoEnter(Sender: TObject);
    procedure RxDBSalExit(Sender: TObject);
    procedure DBEnomeExit(Sender: TObject);
    procedure DBEendExit(Sender: TObject);
    procedure DBEnumExit(Sender: TObject);
    procedure DBEbairroExit(Sender: TObject);
    procedure DBEcidadeExit(Sender: TObject);
    procedure DBEcepExit(Sender: TObject);
    procedure dbdEdtNascExit(Sender: TObject);
    procedure dbdedtAdmExit(Sender: TObject);
    procedure DBCBoxUFExit(Sender: TObject);
    procedure DBcmbSitExit(Sender: TObject);
    procedure DBEcpfExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure DBMemoInfoExit(Sender: TObject);
    procedure dbLookCargoExit(Sender: TObject);
    procedure dbNomeExit(Sender: TObject);
    procedure DBedtNascExit(Sender: TObject);
    procedure dbcmbParenExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure btnDepenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFuncionario: TFrmFuncionario;
  NovoItem:Boolean;

implementation

uses UnitLocFunc, UnitDmDados, UnitCustoFunc, unitPrincipal, UnitCadDepFunc;

{$R *.DFM}

procedure TFrmFuncionario.BtnSairClick(Sender: TObject);
begin
  dmDados.tbDepenFunc.Cancel;
	Close;
end;

procedure TFrmFuncionario.BtnLocalizarClick(Sender: TObject);
begin
  FrmLocFunc:=TFrmLocFunc.Create(Application);
  FrmLocFunc.Showmodal;
  FrmLocFunc.Free;
end;

procedure TFrmFuncionario.rxdbComissaoEnter(Sender: TObject);
begin
  rxdbComissao.Value:=0;
end;

procedure TFrmFuncionario.RxDBSalExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If RxDBSal.Text<> '' then
      begin
      FrmCustoFunc:=TFrmCustoFunc.Create(Application);
      FrmCustoFunc.ShowModal;
      end;
    End;
end;

procedure TFrmFuncionario.DBEnomeExit(Sender: TObject);
begin
  If NovoItem Then
    If DBnome.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o Nome do Funcion�rio');
      DBnome.SetFocus;
      End;
end;

procedure TFrmFuncionario.DBEendExit(Sender: TObject);
begin
  If NovoItem Then
    If DBEend.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o Endere�o');
      DBEend.SetFocus;
      End;
end;

procedure TFrmFuncionario.DBEnumExit(Sender: TObject);
begin
  If NovoItem Then
    If DBEnum.Text= '00000' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o N�mero');
      DBEnum.SetFocus;
      End;
end;

procedure TFrmFuncionario.DBEbairroExit(Sender: TObject);
begin
  If NovoItem Then
    If DBEbairro.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o Bairro');
      DBEbairro.SetFocus;
      End;
end;

procedure TFrmFuncionario.DBEcidadeExit(Sender: TObject);
begin
  If NovoItem Then
    If DBEcidade.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio a Cidade');
      DBEcidade.SetFocus;
      End;
end;

procedure TFrmFuncionario.DBEcepExit(Sender: TObject);
begin
  If NovoItem Then
    If DBEcep.Text= '        ' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o CEP');
      DBEcep.SetFocus;
      End;
end;

procedure TFrmFuncionario.dbdEdtNascExit(Sender: TObject);
begin
  If NovoItem Then
    If dbdEdtNasc.Text= '  /  /    ' then
      Begin
      MsgDlg.MsgWarning ('� obrigat�rio a Data de Nascimento');
      dbdEdtNasc.SetFocus;
      End
    else
      begin
        try StrToDate(dbdEdtNasc.text)
        except on EConvertError do
          begin
          MsgDlg.MsgError('DATA DE NASCIMENTO INV�LIDA');
          dbdEdtNasc.SetFocus;
          end;
        end;
      end;
end;

procedure TFrmFuncionario.dbdedtAdmExit(Sender: TObject);
begin
  If NovoItem Then
    If dbdedtAdm.Text= '  /  /    ' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio a Data de Admiss�o');
      dbdedtAdm.SetFocus;
      End
    else
      begin
      try StrToDate(dbdedtAdm.text)
        except on EConvertError do
          begin
          MsgDlg.MsgError('DATA DE ADMISS�O INV�LIDA');
          dbdedtAdm.SetFocus;
          end;
      end;
      end;
end;

procedure TFrmFuncionario.DBCBoxUFExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If NovoItem Then
    Begin
    If DBCBoxUF.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio informar o Estado');
      DBCBoxUF.SetFocus;
      End
    Else
      Begin
      Flag:=True;
      For x:=0 to DBCBoxUF.Items.Count-1 Do
        If DBCBoxUF.Text=DBCBoxUF.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        MsgDlg.MsgError('Sigla do Estado inv�lida');
        DBCBoxUF.SetFocus;
        End
      Else
      End;
    End
  Else
end;

procedure TFrmFuncionario.DBcmbSitExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If NovoItem Then
    Begin
    If DBcmbSit.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio informar a Situa��o');
      DBcmbSit.SetFocus;
      End
    Else
      Begin
      Flag:=True;
      For x:=0 to DBcmbSit.Items.Count-1 Do
        If DBcmbSit.Text=DBcmbSit.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        MsgDlg.MsgError('Tipo de Situa��o inv�lida');
        DBcmbSit.SetFocus;
        End;
      End;
    end;
end;

procedure TFrmFuncionario.DBEcpfExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbFunc.DatabaseName;
  Tabela.TableName := dmDados.tbFunc.TableName;
  Tabela.IndexName := dmdados.tbFunc.IndexName;
  Tabela.Open;
  If NovoItem Then
    If dbeCPF.Text = '           ' Then
      Begin
      MsgDlg.MsgWarning('� necess�rio Informar o CPF');
      dbeCPF.setfocus;
      end
    else
      Begin
      VerCPF1.NumeroCPF:= dbecpf.text;
      If not VerCpf1.valid Then
        if application.MessageBox('CPF inv�lido. Deseja continuar cadastro?','Valida��o CPF', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_no then
          begin
          dbecpf.Clear;
          dbecpf.setfocus;
          Exit;
          end;
      If Tabela.Locate('CPF',dbeCPF.Text,[]) Then
        If not((DmDados.tbFunc.State=dsEdit) And (dmDados.tbFunc.RecNo = Tabela.RecNo)) Then
          Begin
          MsgDlg.MsgWarning('CPF j� Cadastrado');
          dbecpf.Clear;
          dbecpf.setfocus;
          End;
      End;
  Tabela.Free;
end;

procedure TFrmFuncionario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmFuncionario.BtnPrimeiroClick(Sender: TObject);
begin
  DMDados.tbFunc.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmdados.vTabStt:=true;
end;

procedure TFrmFuncionario.BtnAnteriorClick(Sender: TObject);
begin
  DMDados.tbFunc.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If DMDados.tbFunc.Bof Then
    Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    End;
  dmdados.vTabStt:=true;
end;

procedure TFrmFuncionario.BtnProximoClick(Sender: TObject);
begin
  DMDados.tbFunc.Next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If DMDados.tbFunc.Eof Then
    Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    End;
  dmdados.vTabStt:=true;
end;

procedure TFrmFuncionario.BtnUltimoClick(Sender: TObject);
begin
  DMDados.tbFunc.Last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmdados.vTabStt:=true;
end;

procedure TFrmFuncionario.BtnNovoClick(Sender: TObject);
begin
  DMDados.tbFunc.Append;
  NovoItem:=True;
  {habilitando os bot�es}
  BtnGravar.Enabled :=True;
  BtnCancelar.Enabled:=True;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  BtnLocalizar.Enabled:=False;
  {habilitando os componentes}
  DbLookCargo.Enabled:=True;
  rxdbComissao.Enabled:=True;
  DBNome.Enabled:=True;
  DBdEdtNasc.Enabled:=True;
  DBETel1.Enabled:=True;
  dbeTel2.Enabled:=True;
  dbeCel.Enabled:=True;
  DBEcpf.Enabled:=True;
  DBErg.Enabled:=True;
  DBEend.Enabled:=True;
  DBEnum.Enabled:=True;
  DBEcompl.Enabled:=True;
  DBEbairro.Enabled:=True;
  DBEcidade.Enabled:=True;
  DBEcep.Enabled:=True;
  DBCBoxUF.Enabled:=True;
  dbdedtAdm.Enabled:=True;
  RxDBSal.Enabled:=True;
  DBcmbSit.Enabled:=True;
  dbLimDesc.Enabled:=True;
  dmdados.vTabStt:=false;
  DbNome.SetFocus;
end;

procedure TFrmFuncionario.BtnCancelarClick(Sender: TObject);
begin
  NovoItem:=False;
  DMDados.tbFunc.Cancel;
  BtnGravar.Enabled:=False;
  BtnCancelar.Enabled:=False;
  BtnNovo.Enabled:=True;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  if (frmPrincipal.Acesso=1) or (frmPrincipal.Acesso=2) then
    BtnAlterar.Enabled:=True;
  if (frmPrincipal.Acesso=1) then
    Btndeletar.Enabled:=True;
  BtnLocalizar.Enabled:=True;
  dmdados.vTabStt:=true;
  Panel3.SetFocus;
  {desabilitando os objetos}
  DbLookCargo.Enabled:=False;
  rxdbComissao.Enabled:=False;
  DBNome.Enabled:=False;
  DBdEdtNasc.Enabled:=False;
  DBETel1.Enabled:=False;
  dbeTel2.Enabled:=False;
  dbeCel.Enabled:=False;
  DBEcpf.Enabled:=False;
  DBErg.Enabled:=False;
  DBEend.Enabled:=False;
  DBEnum.Enabled:=False;
  DBEcompl.Enabled:=False;
  DBEbairro.Enabled:=False;
  DBEcidade.Enabled:=False;
  dbLimDesc.Enabled:=False;
  DBEcep.Enabled:=False;
  DBCBoxUF.Enabled:=False;
  dbdedtAdm.Enabled:=False;
  RxDBSal.Enabled:=False;
  DBcmbSit.Enabled:=False;
end;

procedure TFrmFuncionario.BtnAlterarClick(Sender: TObject);
begin
  NovoItem:=True;
  DMDados.tbFunc.Edit;
  dmdados.vTabStt:=false;
  {habilitando os bot�es}
  BtnCancelar.Enabled:=True;
  BtnGravar.Enabled:=True;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  Btndeletar.Enabled:=False;
  BtnLocalizar.Enabled:=False;
  {habilitando os componentes}
  DbLookCargo.Enabled:=True;
  rxdbComissao.Enabled:=True;
  DBNome.Enabled:=True;
  DBdEdtNasc.Enabled:=True;
  DBETel1.Enabled:=True;
  dbeTel2.Enabled:=True;
  dbeCel.Enabled:=True;
  DBEcpf.Enabled:=True;
  DBErg.Enabled:=True;
  DBEend.Enabled:=True;
  DBEnum.Enabled:=True;
  DBEcompl.Enabled:=True;
  DBEbairro.Enabled:=True;
  DBEcidade.Enabled:=True;
  DBEcep.Enabled:=True;
  DBCBoxUF.Enabled:=True;
  dbdedtAdm.Enabled:=True;
  RxDBSal.Enabled:=True;
  dbLimDesc.Enabled:=True;
  DBcmbSit.Enabled:=True;
  DbNome.SetFocus;
end;

procedure TFrmFuncionario.BtnDeletarClick(Sender: TObject);
var
  flag:boolean;
begin
  flag:=false;
  if dmdados.tbFunc.RecordCount=0 then
    MsgDlg.MsgError('Tabela vazia')
  else
    If MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este funcion�rio ?') = id_yes then
      begin
      if dmdados.tbDepenFunc.Locate('CodFunc',dmdados.tbFuncCodFunc.Value,[]) then
         flag:=true;
      if dmdados.tbFuncEsto.Locate('CodFunc',dmdados.tbFuncCodFunc.Value,[]) then
         flag:=true;
      if dmdados.tbMovEstoque.Locate('CodFunc',dmdados.tbFuncCodFunc.Value,[]) then
         flag:=true;
      if dmdados.tbVendas.Locate('CodFunc',dmdados.tbFuncCodFunc.Value,[]) then
         flag:=true;
      if flag then
         MsgDlg.MsgInformation('Funcion�rio ativo, ou com registro de opera��es anteriores.|N�o pode ser EXCLU�DO!!!')
         else
           dmdados.tbFunc.Delete;
      dmdados.tbFunc.Refresh;
      end;
end;

procedure TFrmFuncionario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.HabilitaTeclado:=True;
  if (dmDados.tbDepenFunc.State=dsEdit) or (dmDados.tbDepenFunc.State=dsInsert) then
    dmDados.tbDepenFunc.Cancel;
  if (dmDados.tbFunc.State=dsEdit) or (dmDados.tbFunc.State=dsInsert) then
    dmDados.tbFunc.Cancel;
  dmDados.tbFuncEsto.Close;
  dmDados.tbMovEstoque.Close;
  dmDados.tbVendas.Close;
  dmDados.tbDepenFunc.Close;
  dmDados.tbFunc.Close;
  Action:=caFree;
end;

procedure TFrmFuncionario.FormCreate(Sender: TObject);
begin
  NovoItem:=False;
end;

procedure TFrmFuncionario.BtnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar,Flag:Boolean;
  x:Integer;
  Tabela: TTable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbFunc.DatabaseName;
  Tabela.TableName := dmDados.tbFunc.TableName;
  Tabela.Open;
  //Campo que n�o pode repetir
  If dbeCpf.Text<>'           ' Then
      Begin
      VerCPF1.NumeroCPF:= dbecpf.text;
      If not VerCpf1.valid Then
        MsgDlg.MsgError('CPF inv�lido');
      If Tabela.Locate('CPF',dbeCPF.Text,[]) Then
        If not((DmDados.tbFunc.State=dsEdit) And (dmDados.tbFunc.RecNo = Tabela.RecNo)) Then
          Begin
          Gravar:=False;
          MsgDlg.MsgWarning('CPF j� Cadastrado');
          end;
      End;
  //Campo que n�o pode estar vazio
  If DBnome.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Nome do Funcion�rio';
    Gravar:=False;
    Vazio:=True;
    end;
  If DBEend.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Endere�o';
    Gravar:=False;
    Vazio:=True;
    end;
  If DBEnum.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'N�mero';
    Gravar:=False;
    Vazio:=True;
    end;
  If DBEbairro.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Bairro';
    Gravar:=False;
    Vazio:=True;
    end;
  If DBEcidade.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Cidade';
    Gravar:=False;
    Vazio:=True;
    end;
  If DBEcep.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'CEP';
    Gravar:=False;
    Vazio:=True;
    end;
  If RxDBSal.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Sal�rio';
    Gravar:=False;
    Vazio:=True;
    end;
  //Campos com uso de Combo
  If DBCBoxUF.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Estado';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to DBCBoxUF.Items.Count-1 Do
      If DBCBoxUF.Text=DBCBoxUF.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      MsgDlg.MsgError('Valor do Estado inv�lido');
      Gravar:=False;
      End;
    End;
  If DBcmbSit.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Situa��o';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to DBcmbSit.Items.Count-1 Do
      If DBcmbSit.Text=DBcmbSit.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      MsgDlg.MsgError('Valor do Situa��o inv�lido');
      Gravar:=False;
      End;
    End;
  //Campo que tem conte�do de outra Tabela
  If DbLookCargo.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Cargo Ocupado';
    Gravar:=False;
    Vazio:=True;
    end
  Else
    If Not(dmDados.tbCargoFunc.Locate('Cargo',DbLookCargo.Text,[])) Then
      Begin
      MsgDlg.MsgWarning('Cargo Ocupado n�o Cadastrado');
      Gravar:=False;
      End;
  //Campo Data n�o podendo ser vazio
  If dbdEdtNasc.Text= '  /  /    ' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Data de Nascimento';
    Gravar:=False;
    Vazio:=True;
    End;
  If dbdedtAdm.Text= '  /  /    ' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Data de Admiss�o';
    Gravar:=False;
    Vazio:=True;
    End;
  If Gravar Then
    Begin
    DMDados.TbFunc.Post;
    NovoItem:=False;
    BtnGravar.Enabled:=False;
    BtnCancelar.Enabled:=False;
    BtnNovo.Enabled:=True;
    BtnPrimeiro.Enabled:=True;
    BtnAnterior.Enabled:=True;
    BtnProximo.Enabled:=True;
    BtnUltimo.Enabled:=True;
    if (frmPrincipal.Acesso=1) or (frmPrincipal.Acesso=2) then
      BtnAlterar.Enabled:=True;
    if (frmPrincipal.Acesso=1) then
      Btndeletar.Enabled:=True;
    BtnLocalizar.Enabled:=True;
    Panel3.SetFocus;
    {desabilitando os componentes}
    DbLookCargo.Enabled:=False;
    rxdbComissao.Enabled:=False;
    DBNome.Enabled:=False;
    DBdEdtNasc.Enabled:=False;
    DBETel1.Enabled:=False;
    dbeTel2.Enabled:=False;
    dbeCel.Enabled:=False;
    DBEcpf.Enabled:=False;
    DBErg.Enabled:=False;
    DBEend.Enabled:=False;
    DBEnum.Enabled:=False;
    DBEcompl.Enabled:=False;
    DBEbairro.Enabled:=False;
    DBEcidade.Enabled:=False;
    DBEcep.Enabled:=False;
    DBCBoxUF.Enabled:=False;
    dbdedtAdm.Enabled:=False;
    RxDBSal.Enabled:=False;
    DBcmbSit.Enabled:=False;
    dbLimDesc.Enabled:=False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    End
  Else
    Begin
    If Vazio Then
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    end;
  Tabela.Free;
end;

procedure TFrmFuncionario.DBMemoInfoExit(Sender: TObject);
begin
  Panel3.SetFocus;
end;

procedure TFrmFuncionario.dbLookCargoExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DbLookCargo.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o Cargo Ocupado');
      DbLookCargo.SetFocus;
      End
    Else
      If Not(dmDados.tbCargoFunc.Locate('Cargo',DbLookCargo.Text,[])) Then
        Begin
        MsgDlg.MsgWarning('Cargo n�o Cadastrado');
        DbLookCargo.SetFocus;
        End;
    end;
end;

procedure TFrmFuncionario.dbNomeExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  If NovoItem Then
    Begin
    Tabela := TTable.Create(Application);
    Tabela.DatabaseName := dmDados.tbDepenFunc.DatabaseName;
    Tabela.TableName := dmDados.tbDepenFunc.TableName;
    Tabela.IndexName := dmDados.tbDepenFunc.IndexName;
    Tabela.MasterSource := dmDados.tbDepenFunc.MasterSource;
    Tabela.MasterFields := dmDados.tbDepenFunc.MasterFields;
    Tabela.Open;
    If dbNome.Text= '' then
      begin
      MsgDlg.MsgWarning('� obrigat�rio o Nome do Dependente');
      dbNome.SetFocus;
      end
    else
      Begin
      If Tabela.Locate('NomeDep',dbNome.Text,[]) Then
        If (DmDados.tbDepenFunc.State=dsEdit) And (dmDados.tbDepenFunc.RecNo = Tabela.RecNo) Then
        Else
          Begin
          MsgDlg.MsgWarning('Dependente j� Cadastrado');
          dbNome.Clear;
          dbNome.setfocus;
          End;
      End;
    Tabela.Free;
    end;
end;

procedure TFrmFuncionario.DBedtNascExit(Sender: TObject);
begin
  If NovoItem Then
    If DbDateEditCad.Text= '  /  /    ' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio a Data de Nascimento');
      DbDateEditCad.SetFocus;
      End;
end;

procedure TFrmFuncionario.dbcmbParenExit(Sender: TObject);
{Var
  x:integer;
  Flag:Boolean;}
begin
 { If NovoItem Then
    Begin
    If dbcmbParen.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio informar o Parentesco');
      dbcmbParen.SetFocus;
      End
    Else
      Begin
      Flag:=True;
      For x:=0 to dbcmbParen.Items.Count-1 Do
        If dbcmbParen.Text=dbcmbParen.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        MsgDlg.MsgWarning('Valor de Parentesco inv�lido');
        dbcmbParen.SetFocus;
        End
      Else
        Begin
        btnGravaDep.Default:= True;
        btnGravaDep.SetFocus;
        End;
      End;
    End
  Else
    Begin
    btnGravaDep.Default:= True;
    btnGravaDep.SetFocus;
    End; }
end;

procedure TFrmFuncionario.FormShow(Sender: TObject);
begin
  dmDados.tbFunc.Open;
  dmDados.tbDepenFunc.Open;
  dmDados.tbFuncEsto.Open;
  dmDados.tbMovEstoque.Open;
  dmDados.tbVendas.Open;
  dmDados.vTabStt:=True;
  NovoItem:= false;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar  [F9] Localizar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

procedure TFrmFuncionario.FormKeyDown(Sender: TObject; var Key: Word;
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
      VK_F9     : btnLocalizar.Click;
     end;
end;
procedure TFrmFuncionario.FormActivate(Sender: TObject);
begin
  dmDados.tbFunc.Open;
  dmDados.tbDepenFunc.Open;
  dmDados.tbFuncEsto.Open;
  dmDados.tbMovEstoque.Open;
  dmDados.tbVendas.Open;
  if (frmPrincipal.Acesso=1) or (frmPrincipal.Acesso=2) then
    BtnAlterar.Enabled:=True;
  if (frmPrincipal.Acesso=1) then
    Btndeletar.Enabled:=True;
end;

procedure TFrmFuncionario.btnDepenClick(Sender: TObject);
begin
  if (dmdados.tbFunc.State=dsInsert) or (dmdados.tbFunc.State=dsEdit) then
    MsgDlg.MsgWarning('Bot�o n�o pode ser acionado no momento|Gravar as Informa��es do Cliente primeiro')
  else
    begin
    FrmCadDepFunc:=TFrmCadDepFunc.create(application);
    FrmCadDepFunc.Showmodal;
    end;
end;

end.
