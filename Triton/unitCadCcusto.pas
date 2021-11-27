//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitCadCcusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SpeedBar, jpeg, ExtCtrls, StdCtrls, Mask, DBCtrls, RXCtrls, RxGrdCpt,
  fcButton, fcImgBtn, RXSplit, Grids, DBGrids, RackCtls, DBTables, DB,
  RXDBCtrl, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  LMDShapeHint, DButils;

type
  TFrmCCusto = class(TForm)
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
    Panel1: TPanel;
    RxLabel2: TRxLabel;
    RxSplitter1: TRxSplitter;
    fclGravar: TfcImageBtn;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    DBEdesc: TDBEdit;
    Panel2: TPanel;
    RxLabel1: TRxLabel;
    DBEcod: TDBEdit;
    Image2: TImage;
    Label2: TLabel;
    RxDBGridGrupo: TRxDBGrid;
    RxLabel4: TRxLabel;
    LMDShapeHint1: TLMDShapeHint;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure DBEdescEnter(Sender: TObject);
    procedure DBEdescExit(Sender: TObject);
    procedure DBEcodEnter(Sender: TObject);
    procedure DBEcodExit(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure fclGravarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure DBGridCCustoEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCCusto : TFrmCCusto;
  NovoItem, Mudar : Boolean;

implementation

uses UnitLocCCusto, UnitDmdados, unitPrincipal;

{$R *.DFM}

procedure TFrmCCusto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= Cafree;
end;

procedure TFrmCCusto.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TFrmCCusto.DBEdescEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color:=$00D2E2FF;
end;

procedure TFrmCCusto.DBEdescExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbCCusto.DatabaseName;
  Tabela.TableName := dmDados.TbCCusto.TableName;
  Tabela.IndexName := dmdados.TbCCusto.IndexName;
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
        If (DmDados.tbCCusto.State=dsEdit) And (dmDados.tbCCusto.RecNo = Tabela.RecNo) Then
          begin
          (Sender as TDbEdit).Color:=clwindow;
          fclGravar.Default:=True;
          fclGravar.SetFocus;
          end
        Else
          Begin
          Showmessage('DESCRI��O j� Cadastrada');
          dbeDesc.Clear;
          dbeDesc.setfocus;
          End
      Else
        begin
        (Sender as TDbEdit).Color:=clwindow;
        fclGravar.Default:=True;
        fclGravar.SetFocus;
        end;
      End
  Else
    (Sender as TDbEdit).Color:=clwindow;
  Tabela.Free;
end;

procedure TFrmCCusto.DBEcodEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCCusto.DBEcodExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbCcusto.DatabaseName;
  Tabela.TableName := dmDados.TbCcusto.TableName;
  Tabela.IndexName := dmdados.TbCCusto.IndexName;
  Tabela.Open;
  If NovoItem Then
    If dbecod.Text = '' Then
      Begin
      ShowMessage('� necess�rio Informar o C�digo do centro de custo');
      Dbecod.setfocus;
      end
    Else
      Begin
      If Tabela.Locate('CodCcusto',dbecod.Text,[]) Then
        If (DmDados.tbCcusto.State=dsEdit) And (dmDados.tbCcusto.RecNo = Tabela.RecNo) Then
          (Sender as TDbEdit).Color:=clwindow
        Else
          Begin
          Showmessage('C�digo j� cadastrado');
          dbecod.Clear;
          dbecod.setfocus;
          End;
      End
  Else
    (Sender as TDbEdit).Color:=clwindow;
  Tabela.Free;
end;

procedure TFrmCCusto.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbCCusto.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
end;

procedure TFrmCCusto.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.tbCCusto.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.TbCCusto.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
end;

procedure TFrmCCusto.BtnProximoClick(Sender: TObject);
begin
  dmdados.tbCCusto.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.TbCCusto.Eof Then
  Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
  End;
end;

procedure TFrmCCusto.BtnUltimoClick(Sender: TObject);
begin
  dmdados.tbCCusto.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
end;

procedure TFrmCCusto.BtnNovoClick(Sender: TObject);
begin
  dmdados.tbCCusto.append;
  NovoItem:= True;
  Mudar:=False;
  FclGravar.Enabled:=True;
  BtnCancelar.Enabled := True;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  BtnNovo.Enabled:=False;
  //Habilitando os componentes
  DbeDesc.enabled:=True;
  dbeCod.Enabled:=true;
  RxDBGridGrupo.Enabled:=False;
  dbecod.SetFocus;
end;

procedure TFrmCCusto.BtnCancelarClick(Sender: TObject);
begin
  dmdados.tbCCusto.cancel;
  NovoItem:= False;
  Mudar:=False;
  FclGravar.Enabled:=false;
  BtnCancelar.Enabled := false;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  BtnNovo.Enabled:=True;
  //Habilitando os componentes
  DbeDesc.enabled:=false;
  dbecod.Enabled:=false;
  SpeedBar1.SetFocus;
end;

procedure TFrmCCusto.BtnAlterarClick(Sender: TObject);
begin
  if dmdados.tbCcusto.RecordCount=0 then
    begin
    ShowMessage('Tabela sem registro');
    end
  else
    begin
    novoitem:=true;
    Mudar:=True;
    dmdados.tbCCusto.Edit;
    dbeDesc.Enabled:=True;
    dbecod.Enabled:=true;
    fclGravar.Enabled:=True;
    btnCancelar.Enabled:=true;
    Dbecod.SetFocus;
    end;
end;

procedure TFrmCCusto.fclGravarClick(Sender: TObject);
var
  Tabela: TTable;
  Gravar,Vazio:Boolean;
  Campos:String;
begin
  fclGravar.Default:=False;
  Gravar:=True;
  Vazio:=False;
  Campos:='';
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbCCusto.DatabaseName;
  Tabela.TableName := dmDados.TbCCusto.TableName;
  Tabela.IndexName := dmdados.TbCCusto.IndexName;
  Tabela.Open;
	If dbeDesc.Text='' Then
  	Begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Descri��o';
    Gravar:=False;
    Vazio:=True;
  	End
  Else
    If Tabela.Locate('DESCRICAO',dbeDesc.Text,[]) Then
      If (DmDados.tbCCusto.State=dsEdit) And (dmDados.tbCCusto.RecNo = Tabela.RecNo) Then
        Gravar:=True
      Else
        Begin
        Showmessage('DESCRI��O j� Cadastrada');
        Gravar:=False;
        End;
  If dbecod.Text = '' Then
    Begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'C�digo';
    Gravar:=False;
    Vazio:=True;
    end
  Else
    If Tabela.Locate('CodCcusto',dbecod.Text,[]) Then
      If (DmDados.tbCcusto.State=dsEdit) And (dmDados.tbCcusto.RecNo = Tabela.RecNo) Then
        (Sender as TDbEdit).Color:=clwindow
      Else
        Begin
        Showmessage('C�digo j� cadastrado');
        Gravar:=False;
        End;
  Tabela.Free;
  If Gravar Then
	  Begin
  	If Mudar Then
     	Begin
     	dmdados.tbCCusto.Post;
     	NovoItem:=False;
     	fclGravar.Enabled:=False;
     	dbeDesc.Enabled:=False;
    	Mudar:=False;
     	End
  	Else
     	Begin
     	dmdados.tbCCusto.Post;
     	NovoItem:=True;
     	dmdados.tbCCusto.Append;
     	dbecod.SetFocus;
   		End;
    End
  Else
    Begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbecod.SetFocus;
    end;
end;

procedure TFrmCCusto.BtnDeletarClick(Sender: TObject);
var
   flag : boolean;
Begin
  NovoItem:=False;
  flag := false;
  if dmdados.tbCcusto.RecordCount=0 then
    ShowMessage('Tabela vazia')
  else
    If application.MessageBox('Tem certeza que deseja exluir esse registro?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      begin
      if dmdados.tbBalCusto.Locate('CodCcusto',dmdados.TbCCustoCodCCusto.Value,[]) then
        flag:=true;
      if dmdados.tbCReceber.Locate('CodCcusto',dmdados.TbCCustoCodCCusto.Value,[] ) then
        flag:=true;
      if flag then
        ShowMessage('Centro de Custo ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
      else
        dmdados.TbCcusto.Delete;
      end
    else
      dmdados.tbCcusto.cancel;
end;

procedure TFrmCCusto.DBGridCCustoEnter(Sender: TObject);
begin
  NovoItem:=False;
end;

procedure TFrmCCusto.FormShow(Sender: TObject);
begin
  Mudar:=False;
  dmDados.vTabStt:=True;
  NovoItem:= false;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [F9] Localizar [Esc] Cancelar ou Sair');
end;

procedure TFrmCCusto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;

end;

procedure TFrmCCusto.FormKeyDown(Sender: TObject; var Key: Word;
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
