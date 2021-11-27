//////////////////////////////////////////////////////////////////////////
// Criacao...........: 05/2002
// Sistema...........: Ciclope - Controle de Funcionarios
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitServFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, SpeedBar, jpeg, ExtCtrls, StdCtrls, RackCtls, fcButton,
  fcImgBtn, RXSplit, Mask, DBCtrls, RXCtrls, ToolEdit, CurrEdit, RXDBCtrl,
  dbTables,db,dbutils, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint;

type
  TfrmServFunc = class(TForm)
    Panel1: TPanel;
    RxSplitter1: TRxSplitter;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnPrimeiro: TSpeedItem;
    BtnAnterior: TSpeedItem;
    BtnProximo: TSpeedItem;
    BtnUltimo: TSpeedItem;
    BtnNovo: TSpeedItem;
    BtnCancelar: TSpeedItem;
    BtnAlterar: TSpeedItem;
    BtnDeletar: TSpeedItem;
    BtnSair: TSpeedItem;
    dbGridCadDep: TDBGrid;
    Panel2: TPanel;
    btnGravar: TSpeedItem;
    RxLabel25: TRxLabel;
    dbCodMerc: TDBEdit;
    btnLocMerc: TfcImageBtn;
    RxLabel1: TRxLabel;
    dbCodFunc: TDBEdit;
    RxLabel2: TRxLabel;
    RxLabel15: TRxLabel;
    dbText2: TDBEdit;
    Image2: TImage;
    Label2: TLabel;
    dbcPeriodo: TDBComboBox;
    rxLbPeriodo: TRxLabel;
    procedure btnLocMercClick(Sender: TObject);
    procedure dbCodMercExit(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure dbCodFuncExit(Sender: TObject);
    procedure btnLocFuncClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dbcPeriodoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServFunc: TfrmServFunc;
  NovoItem:Boolean;

implementation

uses UnitDmDados,UnitLocFunc, unitPrincipal;

{$R *.DFM}

procedure TfrmServFunc.btnLocMercClick(Sender: TObject);
begin
if (dmdados.tbServFunc.State=dsedit)or(dmdados.tbServFunc.State=dsInsert) then
  Begin
  FrmLocFunc:=TFrmLocFunc.Create(Application);
  FrmLocFunc.Showmodal;
  dmdados.tbServFuncCodFunc.Value:=frmLocFunc.Resultado;
  FrmLocFunc.Free;
  end;
end;

procedure TfrmServFunc.dbCodMercExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbCodMerc.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Funcion�rio');
      dbCodMerc.SetFocus;
      End
    Else
      If Not(dmDados.tbfunc.Locate('CodFunc',dbCodMerc.Text,[])) Then
        Begin
        Showmessage('Funcion�rio n�o Cadastrado');
        dbCodMerc.SetFocus;
        End;
     end;
end;

procedure TfrmServFunc.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar,Flag:Boolean;
  x: integer;
	Tabela: TTable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbServFunc.DatabaseName;
  Tabela.TableName := dmDados.tbServFunc.TableName;
  Tabela.Open;
  //Campo que tem conte�do de outra Tabela
  If dbCodFunc.Text='' Then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'C�digo Funcion�rio';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    If Not(dmDados.tbContrato.Locate('CodCServ',dbCodFunc.Text,[])) Then
      Begin
      Showmessage('Contrato n�o Cadastrado');
      Gravar:=False;
      End;
  If dbCodMerc.Text='' Then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
      Campos:=Campos+'C�digo Funcion�rio';
      Gravar:=False;
      Vazio:=True;
    End
  Else
    If Not(dmDados.tbFunc.Locate('CodFunc',dbCodMerc.Text,[])) Then
      Begin
      Showmessage('Funcion�rio n�o Cadastrado');
      Gravar:=False;
      End;
 If dbcPeriodo.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Per�odo';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to dbcPeriodo.Items.Count-1 Do
      If dbcPeriodo.Text=dbcPeriodo.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor inv�lido');
      Gravar:=False;
      End;
    End;
  //verificar se n�o est� duplicando a chave
  if Gravar Then
    if (Tabela.Locate('CodcServ',dbCodFunc.Text,[])) Then
       if (Tabela.Locate('CodFunc',dbCodMerc.Text,[loPartialKey,loCaseInsensitive])) Then
        Begin
        Showmessage('J� foi cadastrado funcion�rio para este Contrato !!!');
        Gravar:=False;
        end;
  Tabela.Free;
  If Gravar Then
    Begin
    DMDados.tbServFunc.Post;
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
    dbCodFunc.Enabled:=False;
    dbCodMerc.Enabled:=False;
    dbcPeriodo.Enabled:=false;
    SpeedBar1.SetFocus;
    ShowMessage ('Dados gravados com sucesso!');
    End
  Else
    Begin
    If Vazio Then
      begin
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbCodFunc.SetFocus;
      end;
    end;
end;

procedure TfrmServFunc.dbCodFuncExit(Sender: TObject);
begin
If NovoItem Then
   Begin
   If dbCodFunc.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o C�digo do Contrato');
      dbCodFunc.SetFocus;
      End
   Else
      If Not(dmDados.tbContrato.Locate('CodCserv',dbCodFunc.Text,[])) Then
         Begin
         Showmessage('Contrato n�o Cadastrado');
         dbCodFunc.SetFocus;
         End;
  end;
end;

procedure TfrmServFunc.btnLocFuncClick(Sender: TObject);
begin
if (dmdados.tbServFunc.State=dsedit)or(dmdados.tbServFunc.State=dsInsert) then
  Begin
  FrmLocFunc:=TFrmLocFunc.Create(Application);
  FrmLocFunc.Showmodal;
  dmdados.tbServFuncCodFunc.Value:=frmLocFunc.Resultado;
  FrmLocFunc.Free;
  end;
end;

procedure TfrmServFunc.BtnPrimeiroClick(Sender: TObject);
begin
DMDados.tbServFunc.First;
BtnPrimeiro.Enabled:=False;
BtnAnterior.Enabled:=False;
BtnProximo.Enabled:=True;
BtnUltimo.Enabled:=True;
dmdados.vTabStt:=true;
end;

procedure TfrmServFunc.BtnAnteriorClick(Sender: TObject);
begin
DMDados.tbServFunc.Prior;
BtnProximo.Enabled:=True;
BtnUltimo.Enabled:=True;
If DMDados.tbServFunc.Bof Then
  Begin
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  End;
dmdados.vTabStt:=true;  
end;

procedure TfrmServFunc.BtnProximoClick(Sender: TObject);
begin
DMDados.tbServFunc.Next;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
If DMDados.tbServFunc.Eof Then
  Begin
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  End;
dmdados.vTabStt:=true;
end;

procedure TfrmServFunc.BtnUltimoClick(Sender: TObject);
begin
DMDados.tbServFunc.Last;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
BtnProximo.Enabled:=False;
BtnUltimo.Enabled:=False;
dmdados.vTabStt:=true;
end;

procedure TfrmServFunc.BtnNovoClick(Sender: TObject);
begin
DMDados.tbServFunc.Append;
dmdados.vTabStt:=false;
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
{habilitando os componentes}
dbcPeriodo.Enabled:=true;
dbCodFunc.Enabled:=True;
dbCodMerc.Enabled:=True;
dbCodFunc.SetFocus;
end;

procedure TfrmServFunc.BtnCancelarClick(Sender: TObject);
begin
NovoItem:=False;
DMDados.tbServFunc.Cancel;
dmdados.vTabStt:=true;
BtnGravar.Enabled:=False;
BtnCancelar.Enabled:=False;
BtnNovo.Enabled:=True;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
BtnProximo.Enabled:=True;
BtnUltimo.Enabled:=True;
BtnAlterar.Enabled:=True;
BtnDeletar.Enabled:=True;
SpeedBar1.SetFocus;
{desabilitando os objetos}
dbCodFunc.Enabled:=False;
dbCodMerc.Enabled:=False;
end;

procedure TfrmServFunc.BtnAlterarClick(Sender: TObject);
begin
NovoItem:=True;
dmdados.vTabStt:=false;
DMDados.tbServFunc.Edit;
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
{habilitando os componentes}
dbCodFunc.Enabled:=True;
dbCodMerc.Enabled:=True;
dbCodFunc.SetFocus;
end;

procedure TfrmServFunc.BtnDeletarClick(Sender: TObject);
begin
  if dmdados.tbservfunc.RecordCount=0 then
    begin
    ShowMessage('Tabela vazia');
    end
  else
    If Application.MessageBox('Tem certeza que deseja excluir esta comiss�o ?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
    begin
     DMDados.tbServFunc.Delete;
    end
    else
    DMDados.tbServFunc.Cancel;
end;

procedure TfrmServFunc.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmServFunc.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
  Begin
  Key:=#0;
  Perform(wm_nextdlgctl,0,0);
  End;
end;

procedure TfrmServFunc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FrmPrincipal.StatusTeclas(False,'');
dmDados.HabilitaTeclado:=True;
Action:= Cafree;
end;

procedure TfrmServFunc.FormKeyDown(Sender: TObject; var Key: Word;
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
      VK_F2     : btnLocMerc.Click;
      end;
end;

procedure TfrmServFunc.FormShow(Sender: TObject);
begin
dmDados.vTabStt:=True;
NovoItem:= false;
FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [F2] Localiza Cliente [F3] Localizar Produto [F9] Localizar [Esc] Cancelar ou Sair');
end;

procedure TfrmServFunc.dbcPeriodoExit(Sender: TObject);
begin
if dbcPeriodo.Text = ' ' then
   begin
   ShowMessage('Necess�rio informar o per�odo para realiza��o do servi�o');
   dbcPeriodo.SetFocus;
   end;
end;

end.
