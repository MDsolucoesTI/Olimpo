//////////////////////////////////////////////////////////////////////////
// Criacao...........: 05/2002
// Sistema...........: Metallum - Controle de Serviços
// Integracao........: Olimpo - Automacao Comercial
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
  EFocCol;

type
  TFrmFuncionario = class(TForm)
    Image6: TImage;
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
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    VerCPF1: TVerCPF;
    ImageList1: TImageList;
    DCPageControl1: TDCPageControl;
    DCPage2: TDCPage;
    RxLabel16: TRxLabel;
    RxLabel19: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel12: TRxLabel;
    RxLabel14: TRxLabel;
    Image3: TImage;
    RxLabel20: TRxLabel;
    rxdbComissao: TRxDBCalcEdit;
    dbdedtAdm: TDBDateEdit;
    RxDBSal: TRxDBCalcEdit;
    DBcmbSit: TDBComboBox;
    rxdbCusto: TRxDBCalcEdit;
    dbLookCargo: TDBLookupComboBox;
    RxSplitter3: TRxSplitter;
    RxSplitter6: TRxSplitter;
    dbObs: TDBMemo;
    DCPage1: TDCPage;
    RxLabel1: TRxLabel;
    RxLabel13: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabelnasc: TRxLabel;
    RxLabel11: TRxLabel;
    RxLabel17: TRxLabel;
    RxLabel18: TRxLabel;
    RxLabelcpf: TRxLabel;
    RxLabelrg: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel21: TRxLabel;
    RxLabel10: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel9: TRxLabel;
    RxLabel8: TRxLabel;
    DBECod: TDBEdit;
    DbDateEditCad: TDBDateEdit;
    RxSplitter1: TRxSplitter;
    DBEnome: TDBEdit;
    dbdEdtNasc: TDBDateEdit;
    DBEtel1: TDBEdit;
    DBETel2: TDBEdit;
    DBEcel: TDBEdit;
    DBEcpf: TDBEdit;
    DBErg: TDBEdit;
    DBEend: TDBEdit;
    RxSplitter5: TRxSplitter;
    RxSplitter4: TRxSplitter;
    DBEcompl: TDBEdit;
    DBEbairro: TDBEdit;
    DBEcidade: TDBEdit;
    DBEcep: TDBEdit;
    DBCBoxUF: TDBComboBox;
    DCPage3: TDCPage;
    RxLabel22: TRxLabel;
    RxLabel23: TRxLabel;
    RxLabel24: TRxLabel;
    dbNome: TDBEdit;
    DBedtNasc: TDBDateEdit;
    RxSplitter8: TRxSplitter;
    dbGridCadDep: TDBGrid;
    dbcmbParen: TDBComboBox;
    btnGravaDep: TfcImageBtn;
    RxLabel15: TRxLabel;
    dbeNum: TEvDBZeroEdit;
    Image2: TImage;
    Label2: TLabel;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure lkcmbCargoEnter(Sender: TObject);
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
    procedure DCPage3Show(Sender: TObject);
    procedure btnGravaDepClick(Sender: TObject);
    procedure DCPage3Exit(Sender: TObject);
    procedure DCPageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFuncionario: TFrmFuncionario;
  NovoItem:Boolean;

implementation

uses UnitLocFunc, UnitDmDados, UnitCustoFunc, unitPrincipal;

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

procedure TFrmFuncionario.lkcmbCargoEnter(Sender: TObject);
begin
  (Sender as TRxDBLookupCombo).color:=$00d2e2ff;
end;

procedure TFrmFuncionario.rxdbComissaoEnter(Sender: TObject);
begin
  rxdbComissao.Value:=0;
end;

procedure TFrmFuncionario.RxDBSalExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If RxDBSal.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Sal�rio');
      RxDBSal.SetFocus;
      End
    Else
      FrmCustoFunc:=TFrmCustoFunc.Create(Application);
      FrmCustoFunc.ShowModal;
    End;
end;

procedure TFrmFuncionario.DBEnomeExit(Sender: TObject);
begin
  If NovoItem Then
    If DBEnome.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Nome do Funcion�rio');
      DBEnome.SetFocus;
      End;
end;

procedure TFrmFuncionario.DBEendExit(Sender: TObject);
begin
  If NovoItem Then
    If DBEend.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Endere�o');
      DBEend.SetFocus;
      End;
end;

procedure TFrmFuncionario.DBEnumExit(Sender: TObject);
begin
  If NovoItem Then
    If DBEnum.Text= '00000' then
      Begin
      ShowMessage('� obrigat�rio o N�mero');
      DBEnum.SetFocus;
      End;
end;

procedure TFrmFuncionario.DBEbairroExit(Sender: TObject);
begin
  If NovoItem Then
    If DBEbairro.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Bairro');
      DBEbairro.SetFocus;
      End;
end;

procedure TFrmFuncionario.DBEcidadeExit(Sender: TObject);
begin
  If NovoItem Then
    If DBEcidade.Text= '' then
      Begin
      ShowMessage('� obrigat�rio a Cidade');
      DBEcidade.SetFocus;
      End;
end;

procedure TFrmFuncionario.DBEcepExit(Sender: TObject);
begin
  If NovoItem Then
    If DBEcep.Text= '        ' then
      Begin
      ShowMessage('� obrigat�rio o CEP');
      DBEcep.SetFocus;
      End;
end;

procedure TFrmFuncionario.dbdEdtNascExit(Sender: TObject);
begin
  If NovoItem Then
    If dbdEdtNasc.Text= '  /  /    ' then
      Begin
      ShowMessage('� obrigat�rio a Data de Nascimento');
      dbdEdtNasc.SetFocus;
      End;
end;

procedure TFrmFuncionario.dbdedtAdmExit(Sender: TObject);
begin
  If NovoItem Then
    If dbdedtAdm.Text= '  /  /    ' then
      Begin
      ShowMessage('� obrigat�rio a Data de Admiss�o');
      dbdedtAdm.SetFocus;
      End;
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
      ShowMessage('� obrigat�rio informar o Estado');
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
          ShowMessage('Sigla do Estado inv�lida');
          DBCBoxUF.SetFocus;
        End
        Else
        begin
        dcPageControl1.ActivePage:=dcPage2;
        end;
    End;
 End
 Else
 begin
    dcPageControl1.ActivePage:=dcPage2;
 end;
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
      ShowMessage('� obrigat�rio informar a Situa��o');
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
        ShowMessage('Tipo de Situa��o inv�lida');
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
  Tabela.DatabaseName := dmDados.TbFunc.DatabaseName;
  Tabela.TableName := dmDados.TbFunc.TableName;
  Tabela.Open;
  If NovoItem Then
    If DBEcpf.Text = '           ' Then
      Begin
      ShowMessage('� necess�rio Informar o CPF');
      DBEcpf.setfocus;
      end
    Else
      Begin
      VerCPF1.NumeroCPF:= DBEcpf.text;
      If not VerCpf1.valid Then
        Begin
        Showmessage('CPF inv�lido');
        DBEcpf.Clear;
        DBEcpf.setfocus;
        End
      Else
        Begin
        If Tabela.Locate('CPF',DBEcpf.Text,[]) Then
          If not((DmDados.tbFunc.State=dsEdit) And (dmDados.tbFunc.RecNo = Tabela.RecNo)) Then
            Begin
            Showmessage('CPF j� Cadastrado');
            DBEcpf.Clear;
            DBEcpf.setfocus;
            End;
        end;
      end;
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
DBENome.Enabled:=True;
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
dbObs.Enabled:=True;
dmdados.vTabStt:=false;
dcPageControl1.ActivePage:=dcPage1;
DbeNome.SetFocus;
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
BtnAlterar.Enabled:=True;
BtnDeletar.Enabled:=True;
BtnLocalizar.Enabled:=True;
dcPageControl1.ActivePage:=dcPage1;
dmdados.vTabStt:=true;
SpeedBar1.SetFocus;
{desabilitando os objetos}
DbLookCargo.Enabled:=False;
rxdbComissao.Enabled:=False;
DBENome.Enabled:=False;
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
dbObs.Enabled:= False;
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
DBENome.Enabled:=True;
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
dbObs.Enabled:= True;
dcPageControl1.ActivePage:=dcPage1;
DbeNome.SetFocus;
end;

procedure TFrmFuncionario.BtnDeletarClick(Sender: TObject);
var
  flag:boolean;
begin
flag:=false;
if dmdados.tbFunc.RecordCount=0 then
   ShowMessage('Tabela vazia')
   else
If Application.MessageBox('Tem certeza que deseja excluir este funcion�rio ?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
    begin
      if dmdados.tbDepenFunc.Locate('CodFunc',dmdados.tbFuncCodFunc.Value,[]) then
         flag:=true;
      {if dmdados.tbFuncEsto.Locate('CodFunc',dmdados.tbFuncCodFunc.Value,[]) then
         flag:=true;}
{      if dmdados.tbMovEstoque.Locate('CodFunc',dmdados.tbFuncCodFunc.Value,[]) then
         flag:=true;}
      if dmdados.tbVendas.Locate('CodFunc',dmdados.tbFuncCodFunc.Value,[]) then
         flag:=true;
      if flag then
         ShowMessage('Funcion�rio ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
         else
           dmdados.tbFunc.Delete;
           dmdados.tbFunc.Refresh;
    end
    else
    DMDados.tbFunc.cancel;
end;

procedure TFrmFuncionario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.HabilitaTeclado:=True;
  dmDados.tbDepenFunc.Cancel;
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
  If dbeCpf.Text='           ' Then
    Begin
      Campos:=Campos+' CPF ';
      Gravar:=False;
      Vazio:=True;
    End
  Else
    Begin
    VerCPF1.NumeroCPF:= dbecpf.text;
    If not VerCpf1.valid Then
      Begin
      Showmessage('CPF inv�lido');
      Gravar:=False;
      End
    Else
      Begin
      If Tabela.Locate('CPF',dbeCPF.Text,[]) Then
        If not((DmDados.tbFunc.State=dsEdit) And (dmDados.tbFunc.RecNo = Tabela.RecNo)) Then
          Begin
          Gravar:=False;
          End
      End;
    End;
  //Campo que n�o pode estar vazio
  If DBEnome.Text= '' then
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
      ShowMessage('Valor do Estado inv�lido');
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
      ShowMessage('Valor do Situa��o inv�lido');
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
      Showmessage('Cargo Ocupado n�o Cadastrado');
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
    BtnAlterar.Enabled:=True;
    Btndeletar.Enabled:=True;
    BtnLocalizar.Enabled:=True;
    SpeedBar1.SetFocus;
    {desabilitando os componentes}
    DbLookCargo.Enabled:=False;
    rxdbComissao.Enabled:=False;
    DBENome.Enabled:=False;
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
    dbObs.Enabled:=False;
    ShowMessage ('Dados gravados com sucesso!');
    End
  Else
    Begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dcPageControl1.ActivePage:=dcPage1;
    end;
  Tabela.Free;
end;

procedure TFrmFuncionario.DBMemoInfoExit(Sender: TObject);
begin
  SpeedBar1.SetFocus;
end;

procedure TFrmFuncionario.dbLookCargoExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DbLookCargo.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Cargo Ocupado');
      DbLookCargo.SetFocus;
      End
    Else
      If Not(dmDados.tbCargoFunc.Locate('Cargo',DbLookCargo.Text,[])) Then
        Begin
        Showmessage('Cargo n�o Cadastrado');
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
      ShowMessage('� obrigat�rio o Nome do Dependente');
      dbNome.SetFocus;
      end
    else
      Begin
      If Tabela.Locate('NomeDep',dbNome.Text,[]) Then
        If (DmDados.tbDepenFunc.State=dsEdit) And (dmDados.tbDepenFunc.RecNo = Tabela.RecNo) Then
        Else
          Begin
          Showmessage('Dependente j� Cadastrado');
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
    If DBedtNasc.Text= '  /  /    ' then
      Begin
      ShowMessage('� obrigat�rio a Data de Nascimento');
      DBedtNasc.SetFocus;
      End;
end;

procedure TFrmFuncionario.dbcmbParenExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If NovoItem Then
    Begin
    If dbcmbParen.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar o Parentesco');
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
        ShowMessage('Valor de Parentesco inv�lido');
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
    End;
end;

procedure TFrmFuncionario.DCPage3Show(Sender: TObject);
begin
  NovoItem:=True;
  dmDados.tbDepenFunc.Append;
  dbNome.SetFocus;
end;

procedure TFrmFuncionario.btnGravaDepClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar,Flag:Boolean;
  x:Integer;
  Tabela: TTable;
begin
  btnGravaDep.Default:= False;
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbDepenFunc.DatabaseName;
  Tabela.TableName := dmDados.tbDepenFunc.TableName;
  Tabela.IndexName := dmDados.tbDepenFunc.IndexName;
  Tabela.MasterSource := dmDados.tbDepenFunc.MasterSource;
  Tabela.MasterFields := dmDados.tbDepenFunc.MasterFields;
  Tabela.Open;

  //Campo que n�o pode repetir
  If dbNome.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Nome Dependente';
    Gravar:=False;
    Vazio:=True;
    end
  else
    If Tabela.Locate('NomeDep',dbNome.Text,[]) Then
      If Not((DmDados.tbDepenFunc.State=dsEdit) And (dmDados.tbDepenFunc.RecNo = Tabela.RecNo)) Then
        Begin
       	Gravar:=False;
        Showmessage('Dependente j� Cadastrado');
        End;

  //Campos com uso de Combo
  If dbcmbParen.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Parentesco';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to dbcmbParen.Items.Count-1 Do
      If dbcmbParen.Text=dbcmbParen.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor de Parentesco inv�lido');
      Gravar:=False;
      End;
    End;

  //Campo Data n�o podendo ser vazio
  If DBedtNasc.Text= '  /  /    ' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Data Nascimento';
    Gravar:=False;
    Vazio:=True;
    End;

  If Gravar Then
    Begin
    DMDados.TbDepenFunc.Post;
    SpeedBar1.SetFocus;
    ShowMessage ('Dados gravados com sucesso!');
    End
  Else
    Begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbNome.SetFocus;
    end;
  Tabela.Free;
  dmDados.tbDepenFunc.Append;
  dbNome.SetFocus;
end;

procedure TFrmFuncionario.DCPage3Exit(Sender: TObject);
begin
  NovoItem:=False;
  dmDados.tbDepenFunc.Cancel;
end;

procedure TFrmFuncionario.DCPageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
 if dcpagecontrol1.activePage=dcpage3 then
  Novoitem:=False;
end;

procedure TFrmFuncionario.FormShow(Sender: TObject);
begin
  dcpagecontrol1.activePage:=dcpage1;
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
end.
