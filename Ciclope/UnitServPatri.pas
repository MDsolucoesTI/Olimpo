//////////////////////////////////////////////////////////////////////////
// Criacao...........: 05/2002
// Sistema...........: Ciclope - Controle de Funcionarios
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitServPatri;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, SpeedBar, jpeg, ExtCtrls, StdCtrls, RackCtls, fcButton,
  fcImgBtn, RXSplit, Mask, DBCtrls, RXCtrls, ToolEdit, CurrEdit, RXDBCtrl,
  dbTables,db,dbutils, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint;

type
  TfrmServpatri = class(TForm)
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
    dbNumPatri: TDBEdit;
    btnLocpatri: TfcImageBtn;
    RxLabel1: TRxLabel;
    dbCodPatri: TDBEdit;
    RxLabel2: TRxLabel;
    RxLabel15: TRxLabel;
    dbDescPatri: TDBEdit;
    Image2: TImage;
    Label2: TLabel;
    procedure btnLocpatriClick(Sender: TObject);
    procedure dbNumPatriExit(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
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
    procedure dbCodPatriExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServpatri: TfrmServpatri;
  NovoItem:Boolean;

implementation

uses UnitDmDados,UnitLocFunc,UntLocPatrimonio, unitPrincipal;

{$R *.DFM}

procedure TfrmServpatri.btnLocpatriClick(Sender: TObject);
begin
if (dmdados.tbServPatri.State=dsedit) or (dmdados.tbServPatri.State=dsInsert) then
  Begin
  FrmLocpatrimonio:=TFrmLocpatrimonio.Create(Application);
  FrmLocpatrimonio.Showmodal;
  dmdados.tbservpatriNumPatri.Value:=frmlocpatrimonio.resultado;
  FrmLocpatrimonio.Free;
  end;
end;

procedure TfrmServpatri.dbNumPatriExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbnumpatri.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o N�MERO DO PATRIM�NIO');
      dbnumpatri.SetFocus;
      End
    Else
      If Not(dmDados.tbpatrimonio.Locate('NumPatri',dbNumPatri.Text,[])) Then
        Begin
        Showmessage('Patrim�nio n�o Cadastrado');
        dbnumpatri.SetFocus;
        End;
     end;
end;

procedure TfrmServpatri.btnGravarClick(Sender: TObject);
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
  If dbCodpatri.Text='' Then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Contrato de Servi�o';
    Gravar:=False;
    Vazio:=True;
    End;

    If Not(dmDados.tbContrato.Locate('CodCserv',dbCodpatri.Text,[])) Then
    Begin
     Showmessage('Contrato n�o Cadastrado');
     dbCodpatri.SetFocus;
     Gravar:=False;
    End;


  If dbnumpatri.Text='' Then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
      Campos:=Campos+'N�mero do Patrim�nio';
      Gravar:=False;
      Vazio:=True;
    End
  Else
    If Not(dmDados.tbpatrimonio.Locate('NumPatri',dbNumPatri.Text,[])) Then
      Begin
      Showmessage('Patrim�nio n�o Cadastrado');
      Gravar:=False;
      End;

  //verificar se n�o est� duplicando a chave
  if Gravar Then
    if (Tabela.Locate('CodcServ',dbCodpatri.Text,[])) Then
       if (Tabela.Locate('NumPatri',dbNumPatri.Text,[loPartialKey,loCaseInsensitive])) Then
        Begin
        Showmessage('J� foi cadastrado patrim�nio para este Contrato !!!');
        Gravar:=False;
        end;
  Tabela.Free;
  If Gravar Then
    Begin
    DMDados.tbServpatri.Post;
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
    dbCodpatri.Enabled:=False;
    dbnumpatri.Enabled:=False;
    SpeedBar1.SetFocus;
    ShowMessage ('Dados gravados com sucesso!');
    End
  Else
    Begin
    If Vazio Then
      begin
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbCodpatri.SetFocus;
      end;
    end;
end;

procedure TfrmServpatri.btnLocFuncClick(Sender: TObject);
begin
if (dmdados.tbServFunc.State=dsedit)or(dmdados.tbServFunc.State=dsInsert) then
  Begin
  FrmLocFunc:=TFrmLocFunc.Create(Application);
  FrmLocFunc.Showmodal;
  dmdados.tbServFuncCodFunc.Value:=frmLocFunc.Resultado;
  FrmLocFunc.Free;
  end;
end;

procedure TfrmServpatri.BtnPrimeiroClick(Sender: TObject);
begin
DMDados.tbservpatri.First;
BtnPrimeiro.Enabled:=False;
BtnAnterior.Enabled:=False;
BtnProximo.Enabled:=True;
BtnUltimo.Enabled:=True;
dmdados.vTabStt:=true;
end;

procedure TfrmServpatri.BtnAnteriorClick(Sender: TObject);
begin
DMDados.tbServpatri.Prior;
BtnProximo.Enabled:=True;
BtnUltimo.Enabled:=True;
If DMDados.tbServpatri.Bof Then
  Begin
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  End;
dmdados.vTabStt:=true;
end;

procedure TfrmServpatri.BtnProximoClick(Sender: TObject);
begin
DMDados.tbServpatri.Next;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
If DMDados.tbServpatri.Eof Then
  Begin
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  End;
dmdados.vTabStt:=true;
end;

procedure TfrmServpatri.BtnUltimoClick(Sender: TObject);
begin
DMDados.tbServpatri.Last;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
BtnProximo.Enabled:=False;
BtnUltimo.Enabled:=False;
dmdados.vTabStt:=true;
end;

procedure TfrmServpatri.BtnNovoClick(Sender: TObject);
begin
DMDados.tbServpatri.Append;
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
dbCodPatri.Enabled:=True;
dbNumPatri.Enabled:=True;
dbCodPatri.SetFocus;
end;

procedure TfrmServpatri.BtnCancelarClick(Sender: TObject);
begin
NovoItem:=False;
DMDados.tbServpatri.Cancel;
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
dbCodpatri.Enabled:=False;
dbnumpatri.Enabled:=False;
end;

procedure TfrmServpatri.BtnAlterarClick(Sender: TObject);
begin
NovoItem:=True;
dmdados.vTabStt:=false;
DMDados.tbServpatri.Edit;
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
dbCodpatri.Enabled:=True;
dbnumpatri.Enabled:=True;
dbCodpatri.SetFocus;
end;

procedure TfrmServpatri.BtnDeletarClick(Sender: TObject);
begin
  if dmdados.tbservpatri.RecordCount=0 then
    begin
    ShowMessage('Tabela vazia');
    end
  else
    If Application.MessageBox('Tem certeza que deseja excluir este patrim�nio ?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
    begin
     DMDados.tbServpatri.Delete;
    end
    else
     DMDados.tbServpatri.Cancel;
end;

procedure TfrmServpatri.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmServpatri.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
  Begin
  Key:=#0;
  Perform(wm_nextdlgctl,0,0);
  End;
end;

procedure TfrmServpatri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FrmPrincipal.StatusTeclas(False,'');
dmDados.HabilitaTeclado:=True;
Action:= Cafree;
end;

procedure TfrmServpatri.FormKeyDown(Sender: TObject; var Key: Word;
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
      VK_F2     : btnLocpatri.Click;
      end;
end;

procedure TfrmServpatri.FormShow(Sender: TObject);
begin
dmDados.vTabStt:=True;
NovoItem:= false;
FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [F2] Localiza Cliente [F3] Localizar Produto [F9] Localizar [Esc] Cancelar ou Sair');
end;

procedure TfrmServpatri.dbCodPatriExit(Sender: TObject);
begin
If NovoItem Then
   Begin
   If dbCodpatri.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Contrato de Servi�o');
      dbCodpatri.SetFocus;
      End
   Else
      If Not(dmDados.tbContrato.Locate('CodCserv',dbCodpatri.Text,[])) Then
         Begin
         Showmessage('Contrato n�o Cadastrado');
         dbCodpatri.SetFocus;
         End;
  end;

end;

end.
