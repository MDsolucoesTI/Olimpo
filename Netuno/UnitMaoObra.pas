//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitMaoObra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, SpeedBar, jpeg, ExtCtrls, StdCtrls, RackCtls, fcButton,
  fcImgBtn, RXSplit, Mask, DBCtrls, RXCtrls, ToolEdit, CurrEdit, RXDBCtrl,
  dbTables,db,dbutils, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint;

type
  TfrmMaoObra = class(TForm)
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
    dbCodCServ: TDBEdit;
    btnLoccontrato: TfcImageBtn;
    RxLabel1: TRxLabel;
    dbCodFunc: TDBEdit;
    RxLabel2: TRxLabel;
    btnLocFunc: TfcImageBtn;
    RxLabel3: TRxLabel;
    RxLabel15: TRxLabel;
    dbText1: TDBEdit;
    dbText2: TDBEdit;
    Image2: TImage;
    Label2: TLabel;
    procedure btnLoccontratoClick(Sender: TObject);
    procedure dbCodCServExit(Sender: TObject);
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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMaoObra: TfrmMaoObra;
  NovoItem:Boolean;

implementation

uses UnitDmDados, UnitLocFunc, unitPrincipal, UnitLocContrato;

{$R *.DFM}

procedure TfrmMaoObra.btnLoccontratoClick(Sender: TObject);
begin
if (dmdados.tbCServFunc.State=dsedit)or(dmdados.tbCServFunc.State=dsInsert) then
  Begin
  FrmLocContrato:=TFrmLocContrato.Create(Application);
  FrmLocContrato.Showmodal;
  dmdados.tbCServFuncCodCServ.Value:=frmLocContrato.Resultado;
  FrmLocContrato.Free;
  end;
end;

procedure TfrmMaoObra.dbCodCServExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbCodCServ.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o CONTRATO');
      dbCodCServ.SetFocus;
      End
    Else
      If Not(dmDados.tbContrato.Locate('CodCServ',dbCodCServ.Text,[])) Then
        Begin
        Showmessage('CONTRATO n�o Cadastrado');
        dbCodCServ.SetFocus;
        End;
     end;
end;

procedure TfrmMaoObra.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
	Tabela: TTable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbCServFunc.DatabaseName;
  Tabela.TableName := dmDados.tbCServFunc.TableName;
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
    If Not(dmDados.tbFunc.Locate('CodFunc',dbCodFunc.Text,[])) Then
      Begin
      Showmessage('Funcion�rio n�o Cadastrado');
      Gravar:=False;
      End;
  If dbCodCServ.Text='' Then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'C�digo Contrato';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    If Not(dmDados.tbContrato.Locate('CodCServ',dbCodCServ.Text,[loPartialKey,loCaseInsensitive])) Then
      Begin
      Showmessage('CONTRATO n�o Cadastrado');
      Gravar:=False;
      End;
  //verificar se n�o est� duplicando a chave
  if Gravar Then
    if (Tabela.Locate('CodFunc',dbCodFunc.Text,[])) Then
       if (Tabela.Locate('CodCServ',dbCodCServ.Text,[])) Then
        Begin
        Showmessage('Funcion�rio j� cadastrado para este Contrato !!!');
        Gravar:=False;
        end;
  Tabela.Free;
  If Gravar Then
    Begin
    DMDados.tbCServFunc.Post;
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
    dbCodCServ.Enabled:=False;
    SpeedBar1.SetFocus;
    ShowMessage ('Dados gravados com sucesso!');
    End
  Else
    Begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbCodFunc.SetFocus;
    end;
end;

procedure TfrmMaoObra.dbCodFuncExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbCodFunc.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Funcion�rio');
      dbCodFunc.SetFocus;
      End
    Else
      If Not(dmDados.tbFunc.Locate('CodFunc',dbCodFunc.Text,[])) Then
        Begin
        Showmessage('Funcion�rio n�o Cadastrado');
        dbCodFunc.SetFocus;
        End;
    end;  
    
end;

procedure TfrmMaoObra.btnLocFuncClick(Sender: TObject);
begin
if (dmdados.tbCservfunc.State=dsedit)or(dmdados.tbCservfunc.State=dsInsert) then
  Begin
  FrmLocFunc:=TFrmLocFunc.Create(Application);
  FrmLocFunc.Showmodal;
  dmdados.tbCservfuncCodFunc.Value:=frmLocFunc.Resultado;
  FrmLocFunc.Free;
  dbCodCServ.SetFocus;
  end;
end;

procedure TfrmMaoObra.BtnPrimeiroClick(Sender: TObject);
begin
DMDados.tbCServFunc.First;
BtnPrimeiro.Enabled:=False;
BtnAnterior.Enabled:=False;
BtnProximo.Enabled:=True;
BtnUltimo.Enabled:=True;
dmdados.vTabStt:=true;
end;

procedure TfrmMaoObra.BtnAnteriorClick(Sender: TObject);
begin
DMDados.tbCServFunc.Prior;
BtnProximo.Enabled:=True;
BtnUltimo.Enabled:=True;
If DMDados.tbCServFunc.Bof Then
  Begin
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  End;
dmdados.vTabStt:=true;
end;

procedure TfrmMaoObra.BtnProximoClick(Sender: TObject);
begin
DMDados.tbCServFunc.Next;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
If DMDados.tbCServFunc.Eof Then
  Begin
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  End;
dmdados.vTabStt:=true;
end;

procedure TfrmMaoObra.BtnUltimoClick(Sender: TObject);
begin
DMDados.tbCServFunc.Last;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
BtnProximo.Enabled:=False;
BtnUltimo.Enabled:=False;
dmdados.vTabStt:=true;
end;

procedure TfrmMaoObra.BtnNovoClick(Sender: TObject);
begin
NovoItem:=True;
DMDados.tbCServFunc.Append;
dmdados.vTabStt:=false;
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
dbCodFunc.Enabled:=True;
dbCodCServ.Enabled:=True;
dbCodFunc.SetFocus;
end;

procedure TfrmMaoObra.BtnCancelarClick(Sender: TObject);
begin
NovoItem:=False;
DMDados.tbCServFunc.Cancel;
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
dbCodCServ.Enabled:=False;
end;

procedure TfrmMaoObra.BtnAlterarClick(Sender: TObject);
begin
NovoItem:=True;
dmdados.vTabStt:=false;
DMDados.tbCServFunc.Edit;
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
dbCodCServ.Enabled:=True;
dbCodFunc.SetFocus;
end;

procedure TfrmMaoObra.BtnDeletarClick(Sender: TObject);
begin
If Application.MessageBox('Tem certeza que deseja excluir esta'+#13+'atribui��o de M�o-de-Obra ?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
  begin
  DMDados.tbCServFunc.Delete;
  end
else
  DMDados.tbCServFunc.Cancel;
end;

procedure TfrmMaoObra.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmMaoObra.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
  Begin
  Key:=#0;
  Perform(wm_nextdlgctl,0,0);
  End;
end;

procedure TfrmMaoObra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  //dmDados.HabilitaTeclado:=True;
  DMDados.tbContrato.Close;
  DMDados.tbFunc.Close;
  DMDados.tbCServFunc.Close;
  DMDados.tbCServServ.Close;
  Action:= Cafree;
end;

procedure TfrmMaoObra.FormKeyDown(Sender: TObject; var Key: Word;
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
      VK_F2     : btnLocFunc.Click;
      Vk_F3     : btnLoccontrato.Click;
      end;
end;

procedure TfrmMaoObra.FormShow(Sender: TObject);
begin
  NovoItem:= false;
  dmDados.vTabStt:=True;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [F2] Localiza Funcion�rio [F3] Localizar Contrato [Esc] Cancelar ou Sair');
end;

procedure TfrmMaoObra.FormCreate(Sender: TObject);
begin
  DMDados.tbCServServ.Open;
  DMDados.tbContrato.Open;
  DMDados.tbFunc.Open;
  DMDados.tbCServFunc.Open;
end;

end.
