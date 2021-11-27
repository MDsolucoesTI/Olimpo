//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitCadTipoImovel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, DBCtrls, RXCtrls, ExtCtrls, SpeedBar,
  jpeg, RXSplit, fcButton, fcImgBtn, RackCtls, DbTables, DB,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDShapeHint;

type
  TfrmCadTipoImovel = class(TForm)
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
    RxLabel15: TRxLabel;
    LMDShapeHint1: TLMDShapeHint;
    procedure BtnSairClick(Sender: TObject);
//    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdescEnter(Sender: TObject);
    procedure DBEdescExit(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
//    procedure BtnLocalizarClick0(Sender: TObject);
    procedure fclGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure DBEcodEnter(Sender: TObject);
    procedure DBEcodExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoImovel: TfrmCadTipoImovel;
  NovoItem,Mudar: Boolean;

implementation

uses UnitDmdados, unitPrincipal;

{$R *.DFM}

procedure TfrmCadTipoImovel.BtnSairClick(Sender: TObject);
begin
     Close;
end;


procedure TfrmCadTipoImovel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:= Cafree;
end;

procedure TfrmCadTipoImovel.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TfrmCadTipoImovel.DBEdescEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=$00D2E2FF;
If ((DmDados.tbTipoImov.State<>dsInsert) And Not(Mudar)) Then
     dmDados.tbTipoImov.Append;

end;

procedure TfrmCadTipoImovel.DBEdescExit(Sender: TObject);
Var
Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbTipoImov.DatabaseName;
  Tabela.TableName := dmDados.tbTipoImov.TableName;
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
          If (DmDados.tbTipoImov.State=dsEdit) And (dmDados.tbTipoImov.RecNo = Tabela.RecNo) Then
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

  Tabela.Free;
end;

procedure TfrmCadTipoImovel.BtnAlterarClick(Sender: TObject);
begin
novoitem:=true;
//dmdados.vTabStt:=false;
Mudar:=True;
dmdados.tbTipoImov.Edit;
dbeDesc.Enabled:=True;
fclGravar.Enabled:=True;
DbeDesc.SetFocus;
end;

procedure TfrmCadTipoImovel.BtnDeletarClick(Sender: TObject);
var
   flag:boolean;
begin
NovoItem:=False;
flag:=false;
if dmdados.tbTipoImov.RecordCount=0 then
   ShowMessage('Tabela vazia')
   else
If application.MessageBox('Tem certeza que deseja excluir esse registro?','Aten��o', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
   begin
      {if dmdados.tbCReceber.Locate('CodHist',dmdados.tbTipoImovCodHist.Value,[]) then
         flag:=true;
      if dmdados.TbMovConta.Locate('CodHist',dmdados.tbTipoImovCodHist.Value,[]) then
         flag:=true;
      if flag then
         ShowMessage('Hist�rico ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
         else}
         dmdados.tbTipoImov.Delete;
         dmdados.tbTipoImov.Refresh;
   end
   else
     dmdados.tbTipoImov.Cancel;
end;

{procedure TfrmCadHist.BtnLocalizarClick0(Sender: TObject);
begin
FrmLocHistorico:=TFrmLocHistorico.Create(Application);
FrmLocHistorico.ShowModal;
end;}

procedure TfrmCadTipoImovel.fclGravarClick(Sender: TObject);
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
    Tabela.DatabaseName := dmDados.tbTipoImov.DatabaseName;
    Tabela.TableName := dmDados.tbTipoImov.TableName;
    Tabela.Open;
    If NovoItem Then
      If Tabela.Locate('DESCRICAO',dbeDesc.Text,[]) Then
        If (DmDados.tbTipoImov.State=dsEdit) And (dmDados.tbTipoImov.RecNo = Tabela.RecNo) Then
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
     	dmdados.tbTipoImov.Post;
     	NovoItem:=False;
     	fclGravar.Enabled:=False;
     	dbeDesc.Enabled:=False;
    	Mudar:=False;
     	End
  	Else
     	Begin
     	dmdados.tbTipoImov.Post;
     	NovoItem:=True;
     	dmdados.tbTipoImov.Append;
     	dbeDesc.SetFocus;
   		End;
  End;
end;

procedure TfrmCadTipoImovel.FormShow(Sender: TObject);
begin
Mudar:=False;
//dmDados.vTabStt:=True;
NovoItem:= false;
end;

procedure TfrmCadTipoImovel.BtnCancelarClick(Sender: TObject);
begin
dmdados.tbTipoImov.cancel;
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
DbGridhistorico.Enabled:= True;
SpeedBar1.SetFocus;
end;

procedure TfrmCadTipoImovel.BtnNovoClick(Sender: TObject);
begin
dmdados.tbTipoImov.cancel;
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
DbGridHistorico.Enabled:=False;
dmdados.tbTipoImov.Append;
dbeDesc.SetFocus;

end;

procedure TfrmCadTipoImovel.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbTipoImov.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  //dmdados.vTabStt:=true;
end;

procedure TfrmCadTipoImovel.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.tbTipoImov.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.tbTipoImov.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
  //dmdados.vTabStt:=true;
end;

procedure TfrmCadTipoImovel.BtnProximoClick(Sender: TObject);
begin
  dmdados.tbTipoImov.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.tbTipoImov.Eof Then
  Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
  End;
  //dmdados.vTabStt:=true;
end;

procedure TfrmCadTipoImovel.BtnUltimoClick(Sender: TObject);
begin
  dmdados.tbTipoImov.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  //dmdados.vTabStt:=true;
end;

procedure TfrmCadTipoImovel.DBEcodEnter(Sender: TObject);
begin
(Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TfrmCadTipoImovel.DBEcodExit(Sender: TObject);
begin
(Sender as TDbEdit).Color:=clWindow;
end;

procedure TfrmCadTipoImovel.FormKeyDown(Sender: TObject; var Key: Word;
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

end.
