//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitCadTipoDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, DBCtrls, RXCtrls, ExtCtrls, SpeedBar,
  jpeg, fcButton, fcImgBtn, RXSplit, RackCtls, DbTables, DB,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDShapeHint;

type
  TFrmCadTipoDoc = class(TForm)
    Panel1: TPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    DBEcod: TDBEdit;
    RxSplitter1: TRxSplitter;
    fclGravar: TfcImageBtn;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    DBEdesc: TDBEdit;
    Panel2: TPanel;
    Image2: TImage;
    Label2: TLabel;
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
    DBGridTipoDoc: TDBGrid;
    RxLabel15: TRxLabel;
    LMDShapeHint1: TLMDShapeHint;
    procedure BtnSairClick(Sender: TObject);
    procedure DBETipoDocEnter(Sender: TObject);
    procedure DBETipoDocExit(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure DBEdescEnter(Sender: TObject);
    procedure DBEdescExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnNovoClick(Sender: TObject);
    procedure fclGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure DBGridHistoricoEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEcodEnter(Sender: TObject);
    procedure DBEcodExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadTipoDoc: TFrmCadTipoDoc;
  NovoItem,Mudar: Boolean;

implementation

uses UnitDmdados, unitPrincipal;

{$R *.DFM}

procedure TFrmCadTipoDoc.BtnSairClick(Sender: TObject);
begin
     Close;
end;

procedure TFrmCadTipoDoc.DBETipoDocEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clTeal;
end;

procedure TFrmCadTipoDoc.DBETipoDocExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCadTipoDoc.BtnLocalizarClick(Sender: TObject);
begin
{FrmLocTipoDoc:=TFrmLocTipoDoc.Create(Application);
FrmLocTipoDoc.ShowModal;}
end;

procedure TFrmCadTipoDoc.DBEdescEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=$00D2E2FF;
If ((DmDados.tbTipoDoc.State<>dsInsert) And Not(Mudar)) Then
   dmDados.tbTipoDoc.Append;
end;

procedure TFrmCadTipoDoc.DBEdescExit(Sender: TObject);
Var
Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbTipoDoc.DatabaseName;
  Tabela.TableName := dmDados.TbTipoDoc.TableName;
  Tabela.Open;
  If NovoItem Then
    If dbeDesc.Text = '' Then
      Begin
      ShowMessage('� necess�rio Informar a DESCRI��O');
      DbeDesc.setfocus;
      end
    Else
      Begin
        If Tabela.Locate('DESCRICAO',dbeDesc.Text,[]) Then
          If (DmDados.tbTipoDoc.State=dsEdit) And (dmDados.tbTipoDoc.RecNo = Tabela.RecNo) Then
            (Sender as TDbEdit).Color:=clwindow
          Else
            Begin
            Showmessage('DESCRI��O j� Cadastrada');
            dbeDesc.Clear;
            dbeDesc.setfocus;
            End;
      End
  Else
    (Sender as TDbEdit).Color:=clwindow;
  (Sender as TDbEdit).Color:=clwindow;
  Tabela.Free;
end;

procedure TFrmCadTipoDoc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//FrmPrincipal.StatusTeclas(False,'');
//dmDados.HabilitaTeclado:=True;
Action:= Cafree;
end;

procedure TFrmCadTipoDoc.BtnNovoClick(Sender: TObject);
begin
dmdados.tbTipoDoc.cancel;
NovoItem:= True;
//dmdados.vTabStt:=false;
Mudar:=False;
FclGravar.Enabled:=True;
BtnCancelar.Enabled := True;
BtnAlterar.Enabled:=False;
BtnDeletar.Enabled:=False;
BtnNovo.Enabled:=False;
{Habilitando os componentes}
DbeDesc.enabled:=True;
DbGridTipoDoc.Enabled:=False;
dmdados.tbTipoDoc.Append;
dbeDesc.SetFocus;

end;

procedure TFrmCadTipoDoc.fclGravarClick(Sender: TObject);
var
	Tabela: TTable;
  Gravar:Boolean;
begin
Gravar:=False;
Tabela := TTable.Create(Application);
	If dbeDesc.Text='' Then
  	Begin
		ShowMessage('O Campo DESCRI��O n�o tem Valor');
		dbeDesc.SetFocus;
  	End
  Else
    Begin
    Tabela.DatabaseName := dmDados.TbTipoDoc.DatabaseName;
    Tabela.TableName := dmDados.TbTipoDoc.TableName;
    Tabela.Open;
    If NovoItem Then
      If Tabela.Locate('DESCRICAO',dbeDesc.Text,[]) Then
        If (DmDados.tbTipoDoc.State=dsEdit) And (dmDados.tbTipoDoc.RecNo = Tabela.RecNo) Then
          Gravar:=True
        Else
          Begin
          Showmessage('DESCRI��O j� Cadastrada');
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
     	dmdados.tbTipoDoc.Post;
     	NovoItem:=False;
     	fclGravar.Enabled:=False;
     	dbeDesc.Enabled:=False;
    	Mudar:=False;
     	End
  	Else
     	Begin
     	dmdados.tbTipoDoc.Post;
     	NovoItem:=True;
     	dmdados.tbTipoDoc.Append;
     	dbeDesc.SetFocus;
   		End;
  End;
end;

procedure TFrmCadTipoDoc.BtnCancelarClick(Sender: TObject);
begin
dmdados.tbTipoDoc.cancel;
NovoItem:= False;
//dmdados.vTabStt:=true;
Mudar:=False;
FclGravar.Enabled:=false;
BtnCancelar.Enabled := false;
BtnAlterar.Enabled:=True;
BtnDeletar.Enabled:=True;
BtnNovo.Enabled:=True;
{Habilitando os componentes}
DbeDesc.enabled:=false;
DbGridTipoDoc.Enabled:= True;
SpeedBar1.SetFocus;
end;

procedure TFrmCadTipoDoc.BtnAlterarClick(Sender: TObject);
begin
if dmdados.tbTipoDoc.RecordCount=0 then
begin
ShowMessage('Tabela sem registro');
end
else
begin
novoitem:=true;
//  dmdados.vTabStt:=false;
Mudar:=True;
dmdados.tbTipoDoc.Edit;
dbeDesc.Enabled:=True;
fclGravar.Enabled:=True;
btnCancelar.Enabled:=true;
DbeDesc.SetFocus;
end;
end;

procedure TFrmCadTipoDoc.BtnDeletarClick(Sender: TObject);
var
  flag:boolean;
begin
NovoItem:=False;
if dmdados.tbTipoDoc.RecordCount=0 then
   ShowMessage('Tabela vazia')
   else
If application.MessageBox('Tem certeza que deseja exluir esse registro?','Aten��o', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
   begin
     {if dmDados.tbCReceber.Locate('CodDoc',dmDados.tbTipoDocCodDoc.Value,[]) Then
        Flag:=True;
     if dmDados.tbMovConta.Locate('CodCli',dmDados.tbTipoDocCodDoc.Value,[]) Then
        Flag:=True;
     if Flag Then
        ShowMessage('Documento ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
      else}
        dmdados.TbTipoDoc.Delete;
        dmdados.tbTipoDoc.Refresh;
   end
   else
   dmdados.tbTipoDoc.Cancel;
end;

{procedure TFrmCadTipoDoc.BtnLocalizarClick0(Sender: TObject);
begin
FrmLocTipoDoc:=TFrmLocTipoDoc.Create(Application);
FrmLocTipoDoc.ShowModal;
end;}

procedure TFrmCadTipoDoc.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbTipoDoc.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  //dmdados.vTabStt:=true;
end;

procedure TFrmCadTipoDoc.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.tbTipoDoc.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.TbTipoDoc.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
    //dmdados.vTabStt:=true;
  end;

procedure TFrmCadTipoDoc.BtnProximoClick(Sender: TObject);
begin
  dmdados.tbTipoDoc.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.TbTipoDoc.Eof Then
  Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
  End;
  //dmdados.vTabStt:=true;
end;

procedure TFrmCadTipoDoc.BtnUltimoClick(Sender: TObject);
begin
  dmdados.tbTipoDoc.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  //  dmdados.vTabStt:=true;
end;

procedure TFrmCadTipoDoc.DBGridHistoricoEnter(Sender: TObject);
begin
NovoItem:=False;
end;

procedure TFrmCadTipoDoc.FormShow(Sender: TObject);
begin
Mudar:=False;
//dmDados.vTabStt:=True;
NovoItem:= false;
//FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Esc] Cancelar ou Sair');
end;

procedure TFrmCadTipoDoc.DBEcodEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCadTipoDoc.DBEcodExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCadTipoDoc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_Home   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_Delete : if (dmDados.vTabStt) then BtnDeletar.Click;
      VK_End    : if not(dmDados.vTabStt) then fclGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
    end;}
end;

procedure TFrmCadTipoDoc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;

end;

end.
