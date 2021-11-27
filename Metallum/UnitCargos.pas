//////////////////////////////////////////////////////////////////////////
// Criacao...........: 05/2002
// Sistema...........: Metallum - Controle de Serviços
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCargos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolEdit, RXDBCtrl, Grids, DBGrids, SpeedBar, jpeg, ExtCtrls, StdCtrls,
  RackCtls, fcButton, fcImgBtn, RXSplit, Mask, DBCtrls, RXCtrls, ComCtrls,
  db,dbutils, CurrEdit,dbTables, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint, EFocCol;

type
  TFrmCargos = class(TForm)
    Panel1: TPanel;
    RxLabel1: TRxLabel;
    dbCargo: TDBEdit;
    RxSplitter1: TRxSplitter;
    btnGravar: TfcImageBtn;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    DBgridCargo: TDBGrid;
    Panel2: TPanel;
    RxLabel3: TRxLabel;
    dbComis: TRxDBCalcEdit;
    RxLabel4: TRxLabel;
    Image2: TImage;
    Label2: TLabel;
    BarraAcesso: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnPrimeiro: TSpeedItem;
    BtnAnterior: TSpeedItem;
    BtnProximo: TSpeedItem;
    BtnUltimo: TSpeedItem;
    BtnNovo: TSpeedItem;
    SpeedItem1: TSpeedItem;
    BtnCancelar: TSpeedItem;
    BtnAlterar: TSpeedItem;
    BtnDeletar: TSpeedItem;
    BtnLocalizar: TSpeedItem;
    BtnSair: TSpeedItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbComisExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCargos: TFrmCargos;
  NovoItem,mudar,vAltera:Boolean;

implementation

uses UnitDmDados, unitPrincipal;

{$R *.DFM}

procedure TFrmCargos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FrmPrincipal.StatusTeclas(False,'');
dmDados.HabilitaTeclado:=True;
Action:= Cafree;
end;

procedure TFrmCargos.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TFrmCargos.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
  Begin
  Key:=#0;
  Perform(wm_nextdlgctl,0,0);
  End;
end;

procedure TFrmCargos.dbComisExit(Sender: TObject);
begin
 btnGravar.Default:=True;
 btnGravar.SetFocus;
end;

procedure TFrmCargos.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  NovoItem:= false;
  vAltera:=False;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [F9] Localizar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

procedure TFrmCargos.btnGravarClick(Sender: TObject);
var
  Tabela: TTable;
  Gravar:Boolean;
begin
  Gravar:=False;
  BtnGravar.Default:=False;
  Tabela := TTable.Create(Application);
	If dbcargo.Text='' Then
  	Begin
	ShowMessage('O CAMPO CARGO n�o tem Valor!');
  	End
  Else
    Begin
    Tabela.DatabaseName := dmDados.tbCargoFunc.DatabaseName;
    Tabela.TableName := dmDados.TbCargoFunc.TableName;
    Tabela.Open;
    If NovoItem Then
      If Tabela.Locate('Cargo',dbCargo.Text,[]) Then
        If (DmDados.tbCargoFunc.State=dsEdit) And (dmDados.tbCargoFunc.RecNo = Tabela.RecNo) Then
          Gravar:=True
        Else
          Begin
          Showmessage('CARGO j� Cadastrado!!');
          End
      Else
      	Gravar:=True;
    End;
  Tabela.Free;
  If Gravar Then
	  Begin
    dmdados.tbCargoFunc.Post;
    if vAltera then
      begin
      NovoItem:=False;
      vAltera:=False;
      dmDados.vTabStt:=True;
      DBcargo.Enabled:=False;
      DBcomis.Enabled:=False;
      btngravar.Enabled:=false;
      BtnCancelar.Enabled := false;
      BtnAlterar.Enabled:=True;
      BtnDeletar.Enabled:=True;
      BtnNovo.Enabled:=True;
      BtnPrimeiro.Enabled:=True;
      BtnAnterior.Enabled:=True;
      BtnProximo.Enabled:=True;
      BtnUltimo.Enabled:=True;
      BtnAlterar.Enabled:=True;
      BarraAcesso.SetFocus;
      End
    Else
      Begin
      NovoItem:=True;
      dmdados.tbCargofunc.Append;
      dbcargo.SetFocus;
      End;
    End;
end;

procedure TFrmCargos.BtnNovoClick(Sender: TObject);
begin
  DMDados.tbCargoFunc.Append;
  NovoItem:=True;
  Mudar:= False;
  dmDados.vTabStt:=False;
{habilitando os bot�es}
  btngravar.Enabled:=True;
  BtnCancelar.Enabled := True;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
{habilitando os componentes}
  DBCargo.Enabled:=True;
  DBComis.Enabled:= True;
  DBcargo.SetFocus;
end;

procedure TFrmCargos.BtnCancelarClick(Sender: TObject);
begin
  dmdados.tbCargoFunc.Cancel;
  NovoItem:=False;
  Mudar:=False;
  dmDados.vTabStt:=True;
  btngravar.Enabled:=false;
  BtnCancelar.Enabled := false;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  BtnNovo.Enabled:=True;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  DBcargo.Enabled:=False;
  DBcomis.Enabled:=False;
  //BarraAcesso.SetFocus;
end;

procedure TFrmCargos.BtnAlterarClick(Sender: TObject);
begin
  if dmdados.tbCargoFunc.RecordCount=0 then
    ShowMessage('Tabela sem registro')
  else
    begin
    vAltera:=True;
    dmDados.vTabStt:=False;
    btngravar.Enabled:=True;
    BtnCancelar.Enabled := True;
    BtnAlterar.Enabled:=False;
    BtnDeletar.Enabled:=False;
    BtnNovo.Enabled:=False;
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    If (dmDados.tbCargoFuncCodCargo.Value >=1) and (dmDados.tbCargoFuncCodCargo.Value <=7) Then
      Begin
      novoitem:=true;
      Mudar:=True;
      dbcargo.Enabled:=false;
      dbcomis.Enabled:=true;
      dmdados.tbCargoFunc.Edit;
      dbcomis.SetFocus;
      end
    else
      begin
      novoitem:=true;
      Mudar:=True;
      dmdados.tbCargoFunc.Edit;
      dbcargo.Enabled:=True;
      dbcomis.Enabled:=true;
      btnGravar.Enabled:=True;
      btnCancelar.Enabled:=true;
      Dbcargo.SetFocus;
      end;
    end;
end;

procedure TFrmCargos.BtnDeletarClick(Sender: TObject);
begin
  if dmdados.tbCargoFunc.RecordCount=0 then
    begin
    ShowMessage('Tabela sem registro');
    end
  else
    If Application.MessageBox('Tem certeza que deseja excluir este Cargo ?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      begin
      If (dmDados.tbCargoFuncCodCargo.Value >=1) and (dmDados.tbCargoFuncCodCargo.Value <=7) Then
        Begin
        ShowMessage('Cargo pr�-definidos, n�o podem ser exclu�dos !!!');
        dmDados.tbCargoFunc.Cancel;
        End
      Else
        if dmDados.tbFunc.Locate('CodCargo',dmDados.tbCargoFuncCodCargo.Value,[]) then
          ShowMessage('Cargo com funcion�rios ocupando, n�o pode ser exclu�do !!!')
        else
          DMDados.tbCargoFunc.Delete;
      end
    else
      DMDados.tbCargoFunc.Cancel;
end;

procedure TFrmCargos.BtnPrimeiroClick(Sender: TObject);
begin
  DMDados.tbcargofunc.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmDados.vTabStt:=True;
end;

procedure TFrmCargos.BtnAnteriorClick(Sender: TObject);
begin
  DMDados.tbcargofunc.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If DMDados.tbcargofunc.Bof Then
    Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;


procedure TFrmCargos.BtnProximoClick(Sender: TObject);
begin
  DMDados.tbcargofunc.Next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If DMDados.tbcargofunc.Eof Then
    Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TFrmCargos.BtnUltimoClick(Sender: TObject);
begin
  DMDados.tbcargofunc.Last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmDados.vTabStt:=True;
end;

procedure TFrmCargos.FormKeyDown(Sender: TObject; var Key: Word;
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
