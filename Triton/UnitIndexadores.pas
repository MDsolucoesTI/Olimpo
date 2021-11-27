//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitIndexadores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, DBCtrls, RXCtrls, ExtCtrls, SpeedBar,
  jpeg, ToolEdit, RXDBCtrl, RackCtls, CurrEdit, RXSplit, fcButton, fcImgBtn,
  db, dbTables, dbUtils;

type
  TFrmCadIndex = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ScrewPanel1: TScrewPanel;
    Label1: TLabel;
    Image1: TImage;
    Image2: TImage;
    Label2: TLabel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    btnGravar: TfcImageBtn;
    RxSplitter1: TRxSplitter;
    DBGridBanco: TDBGrid;
    DBDateCad: TDBDateEdit;
    dbeDescr: TDBEdit;
    RxLabel3: TRxLabel;
    dbeCodIndex: TDBEdit;
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
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBDateCadEnter(Sender: TObject);
    procedure DBDateCadExit(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure dbeDescrEnter(Sender: TObject);
    procedure dbeDescrExit(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadIndex: TFrmCadIndex;
  NovoItem, Mudar : boolean;

implementation

uses UnitDmdados, unitPrincipal;

{$R *.DFM}

procedure TFrmCadIndex.BtnSairClick(Sender: TObject);
begin
 Dmdados.TBindexador.Cancel;
 Close;
end;

procedure TFrmCadIndex.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmCadIndex.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  Action:= Cafree;
end;

procedure TFrmCadIndex.DBDateCadEnter(Sender: TObject);
begin
  (Sender as TDBDateEdit).Color:=$00d2e2ff;
end;

procedure TFrmCadIndex.DBDateCadExit(Sender: TObject);
begin
  (Sender as TDBDateEdit).Color:=clWindow;
end;

procedure TFrmCadIndex.BtnDeletarClick(Sender: TObject);
var
  Flag : boolean;
begin
  NovoItem:=False;
  Flag:=False;
  if dmdados.TBindexador.RecordCount=0 then
    begin
    ShowMessage('Tabela sem registro');
    end
  else
    If application.MessageBox('Tem certeza que deseja exluir esse registro?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      if dmDados.tbCReceber.Locate('CodIndex',dmDados.TbIndexadorCodIndex.Value,[]) then
        Flag:=True;
      if dmDados.tbCPagar.Locate('CodIndex',dmDados.TbIndexadorCodIndex.Value,[]) then
        Flag:=True;
      if dmDados.tbVendas.Locate('CodIndex',dmDados.TbIndexadorCodIndex.Value,[]) then
        Flag:=True;
      if dmDados.tbEstoque.Locate('CodIndex',dmDados.TbIndexadorCodIndex.Value,[]) then
        Flag:=True;
      if dmDados.tbCompras.Locate('CodIndex',dmDados.TbIndexadorCodIndex.Value,[]) then
        Flag:=True;
      if Flag Then
        ShowMessage('Indexador em uso, n�o pode ser exclu�do !!!')
      else
        dmdados.TBindexador.Delete;
end;

procedure TFrmCadIndex.dbeDescrEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00d2e2ff;
end;

procedure TFrmCadIndex.dbeDescrExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  If NovoItem Then
    Begin
    Tabela := TTable.Create(Application);
    Tabela.DatabaseName := dmDados.TbIndexador.DatabaseName;
    Tabela.TableName := dmDados.TbIndexador.TableName;
    Tabela.IndexName := dmdados.TbIndexador.IndexName;
    Tabela.Open;
    If dbeDescr.Text= '' then
      begin
      ShowMessage('� obrigat�rio a DESCRI��O');
      dbeDescr.SetFocus;
      end
    else
      Begin
      If Tabela.Locate('Descricao',dbeDescr.Text,[]) Then
        If (DmDados.TbIndexador.State=dsEdit) And (dmDados.TbIndexador.RecNo = Tabela.RecNo) Then
          Begin
          btnGravar.Default:=True;
          btnGravar.SetFocus;
          (Sender as TDbEdit).Color:=clwindow;
          end
        Else
          Begin
          Showmessage('DESCRI��O j� Cadastrada');
          dbeDescr.Clear;
          dbeDescr.setfocus;
          End
      Else
        begin
        (Sender as TDbEdit).Color:=clwindow;
        btnGravar.Default:=True;
        btnGravar.SetFocus;
        end
      End;
    Tabela.Free;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmCadIndex.BtnAlterarClick(Sender: TObject);
begin
  novoitem:=true;
  dmdados.vTabStt:=false;
  Mudar:=True;
  dmdados.TBindexador.Edit;
  dbeDescr.Enabled:=True;
  DBGridBanco.Enabled:=True;
  btnGravar.Enabled:=True;
  dbeDescr.SetFocus;
end;

procedure TFrmCadIndex.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.TBindexador.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.TBindexador.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
  dmdados.vTabStt:=true;
end;

procedure TFrmCadIndex.BtnCancelarClick(Sender: TObject);
begin
  dmdados.TBindexador.cancel;
  NovoItem:= False;
  Mudar:=False;
  dmdados.vTabStt:=true;
  {Desabilitando os bot�es}
  btnGravar.Enabled:=false;
  BtnCancelar.Enabled := false;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  BtnNovo.Enabled:=True;
  {Habilitando os componentes}
  DBGridBanco.Enabled:=False;
  dbeDescr.Enabled:=False;
  SpeedBar1.SetFocus;
end;

procedure TFrmCadIndex.BtnNovoClick(Sender: TObject);
begin
  DMDados.TBindexador.Append;
  NovoItem:=True;
  dmdados.vTabStt:=false;
  Mudar:= False;
  {habilitando os bot�es}
  btnGravar.Enabled:=True;
  BtnCancelar.Enabled := True;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  BtnNovo.Enabled:=False;
  {habilitando os componentes}
  DBGridBanco.Enabled:=True;
  dbeDescr.Enabled:=True;
  dbeDescr.SetFocus;
end;

procedure TFrmCadIndex.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.TBindexador.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmdados.vTabStt:=true;
end;

procedure TFrmCadIndex.BtnProximoClick(Sender: TObject);
begin
  dmdados.TBindexador.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.TbIndexador.Eof Then
  Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
  End;
  dmdados.vTabStt:=true;
end;

procedure TFrmCadIndex.BtnUltimoClick(Sender: TObject);
begin
  dmdados.TBindexador.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmdados.vTabStt:=true;
end;

procedure TFrmCadIndex.FormKeyDown(Sender: TObject; var Key: Word;
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
    end;
end;

procedure TFrmCadIndex.FormShow(Sender: TObject);
begin
  Mudar:=False;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

procedure TFrmCadIndex.btnGravarClick(Sender: TObject);
var
  Tabela: TTable;
  Gravar,Vazio:Boolean;
  Campos:String;
begin
  btnGravar.Default:=False;
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbIndexador.DatabaseName;
  Tabela.TableName := dmDados.TbIndexador.TableName;
  Tabela.IndexName := dmdados.TbIndexador.IndexName;
  Tabela.Open;
	If dbeDescr.Text='' Then
  	Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Descri��o';
    Gravar:=False;
    Vazio:=True;
  	End
  Else
    If Tabela.Locate('Descricao',dbeDescr.Text,[]) Then
      If (DmDados.TbIndexador.State=dsEdit) And (dmDados.TbIndexador.RecNo = Tabela.RecNo) Then
        Gravar:=True
      Else
        Begin
        Showmessage('INDEXADOR j� Cadastrado');
       	Gravar:=False;
        End;
  Tabela.Free;
  If Gravar Then
    begin
    if Mudar Then
	    Begin
      dmdados.vTabStt:=true;
     	dmdados.TbIndexador.Post;
     	NovoItem:=False;
     	btnGravar.Enabled:=False;
      DBGridBanco.Enabled:=False;
     	dbeDescr.Enabled:=False;
    	Mudar:=False;
     	End
  	Else
     	Begin
      dmdados.vTabStt:=False;
     	dmdados.TbIndexador.Post;
     	NovoItem:=True;
     	dmdados.TbIndexador.Append;
     	dbeDescr.SetFocus;
   		End;
    End
  Else
    Begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbeDescr.SetFocus;
    end;
end;

end.
