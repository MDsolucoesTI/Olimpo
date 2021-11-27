//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitCadTipoArea;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, DBCtrls, RXCtrls, ExtCtrls, SpeedBar,
  jpeg, RXSplit, fcButton, fcImgBtn, RackCtls, DbTables, DB,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDShapeHint;

type
  TfrmTipoArea = class(TForm)
    Panel1: TPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    DBEcod: TDBEdit;
    DBGridHistorico: TDBGrid;
    RxSplitter1: TRxSplitter;
    fclGravar: TfcImageBtn;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    DBEdesc: TDBEdit;
    Panel2: TPanel;
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
    RxLabel15: TRxLabel;
    Image2: TImage;
    Label2: TLabel;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdescEnter(Sender: TObject);
    procedure DBEdescExit(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure fclGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridHistoricoEnter(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
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
  frmTipoArea: TfrmTipoArea;
  NovoItem,Mudar: Boolean;

implementation

uses UnitDmdados, unitPrincipal;

{$R *.DFM}

procedure TfrmTipoArea.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTipoArea.FormClose(Sender: TObject;
var
  Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.HabilitaTeclado:=True;
  Action:= Cafree;
end;

procedure TfrmTipoArea.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TfrmTipoArea.DBEdescEnter(Sender: TObject);
begin
  If ((DmDados.tbTipoArea.State<>dsInsert) And Not(Mudar)) Then
    dmDados.tbTipoArea.Append;
end;

procedure TfrmTipoArea.DBEdescExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbTipoArea.DatabaseName;
  Tabela.TableName := dmDados.tbTipoArea.TableName;
  Tabela.IndexName := dmdados.tbTipoArea.IndexName;
  Tabela.Open;
If NovoItem Then
  If dbeDesc.Text = '' Then
     Begin
      ShowMessage('� necess�rio Informar o TIPO DE �REA');
      DbeDesc.setfocus;
      end
  Else
     Begin
     If Tabela.Locate('TIPOAREA',dbeDesc.Text,[]) Then
        begin
            If not((DmDados.tbTipoArea.State=dsEdit) And (dmDados.tbTipoArea.RecNo = Tabela.RecNo)) Then
              Begin
              Showmessage('TIPO DE �REA j� Cadastrada');
              dbeDesc.Clear;
              dbeDesc.setfocus;
              End;
        End;
     Tabela.Free;
     end;
end;

procedure TfrmTipoArea.BtnAlterarClick(Sender: TObject);
begin
    if dmdados.tbTipoArea.RecordCount=0 then
      ShowMessage('Tabela vazia')
  else
    begin
     novoitem:=true;
     dmdados.vTabStt:=false;
     Mudar:=True;
     dmdados.tbTipoArea.Edit;
     dbeDesc.Enabled:=True;
     fclGravar.Enabled:=True;
     btnCancelar.Enabled:=True;
     DbeDesc.SetFocus;
    end;
end;

procedure TfrmTipoArea.BtnDeletarClick(Sender: TObject);
begin
  NovoItem:=False;
    if dmdados.tbTipoArea.RecordCount=0 then
    ShowMessage('Tabela vazia')
  else
    If application.MessageBox('Tem certeza que deseja excluir esse registro?','Aten��o', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      begin
      dmdados.tbTipoArea.Delete;
      dmdados.tbTipoArea.Refresh;
      end
    else
      dmdados.tbTipoArea.Cancel;
end;

procedure TfrmTipoArea.fclGravarClick(Sender: TObject);
var
	Tabela: TTable;
  Gravar:Boolean;
begin
  Gravar:=False;
  Tabela := TTable.Create(Application);
	If dbeDesc.Text='' Then
  	Begin
		ShowMessage('O Campo TIPO DE �REA n�o tem Valor');
		dbeDesc.SetFocus;
  	End
  Else
    Begin
    Tabela.DatabaseName := dmDados.tbTipoArea.DatabaseName;
    Tabela.TableName := dmDados.tbTipoArea.TableName;
    Tabela.IndexName := dmdados.tbTipoArea.IndexName;
    Tabela.Open;
    If NovoItem Then
      If Tabela.Locate('TIPOAREA',dbeDesc.Text,[]) Then
        If (DmDados.tbTipoArea.State=dsEdit) And (dmDados.tbTipoArea.RecNo = Tabela.RecNo) Then
          Gravar:=True
        Else
          Begin
          Showmessage('TIPO DE �REA j� Cadastrada');
          dbeDesc.Clear;
          dbeDesc.setfocus;
          End
      Else
      	Gravar:=True;
    End;
  Tabela.Free;
  If Gravar Then
	  Begin
  	If Mudar Then
     	Begin
     	dmdados.tbTipoArea.Post;
     	NovoItem:=False;
      dmDados.vTabStt:=True;
     	fclGravar.Enabled:=False;
      BtnCancelar.Enabled:=false;
     	dbeDesc.Enabled:=False;
    	Mudar:=False;
     	End
  	Else
     	Begin
     	dmdados.tbTipoArea.Post;
     	NovoItem:=True;
      dmDados.vTabStt:=false;
     	dmdados.tbTipoArea.Append;
     	dbeDesc.SetFocus;
   		End;
  End;
end;

procedure TfrmTipoArea.FormShow(Sender: TObject);
begin
  Mudar:=False;
  dmDados.vTabStt:=True;
  NovoItem:= false;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Esc] Cancelar ou Sair');
end;

procedure TfrmTipoArea.DBGridHistoricoEnter(Sender: TObject);
begin
  NovoItem:=False;
end;

procedure TfrmTipoArea.BtnCancelarClick(Sender: TObject);
begin
  dmdados.tbTipoArea.cancel;
  NovoItem:= False;
  dmdados.vTabStt:=true;
  Mudar:=False;
  FclGravar.Enabled:=false;
  BtnCancelar.Enabled := false;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  BtnNovo.Enabled:=True;
  {Habilitando os componentes}
  DbeDesc.enabled:=false;
  DbGridhistorico.Enabled:= True;
  SpeedBar1.SetFocus;
end;

procedure TfrmTipoArea.BtnNovoClick(Sender: TObject);
begin
  dmdados.tbTipoArea.cancel;
  NovoItem:= True;
  dmdados.vTabStt:=false;
  Mudar:=False;
  FclGravar.Enabled:=True;
  BtnCancelar.Enabled := True;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  BtnNovo.Enabled:=False;
  {Habilitando os componentes}
  DbeDesc.enabled:=True;
  DbGridHistorico.Enabled:=False;
  dmdados.tbTipoArea.Append;
  dbeDesc.SetFocus;
end;

procedure TfrmTipoArea.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbTipoArea.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmdados.vTabStt:=true;
end;

procedure TfrmTipoArea.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.tbTipoArea.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.tbTipoArea.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
  dmdados.vTabStt:=true;
end;

procedure TfrmTipoArea.BtnProximoClick(Sender: TObject);
begin
  dmdados.tbTipoArea.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.tbTipoArea.Eof Then
  Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
  End;
  dmdados.vTabStt:=true;
end;

procedure TfrmTipoArea.BtnUltimoClick(Sender: TObject);
begin
  dmdados.tbTipoArea.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
    dmdados.vTabStt:=true;
end;

procedure TfrmTipoArea.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_Home   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_Delete : if (dmDados.vTabStt) then BtnDeletar.Click;
      VK_End    : if not(dmDados.vTabStt) then fclGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
    end;
end;

end.
