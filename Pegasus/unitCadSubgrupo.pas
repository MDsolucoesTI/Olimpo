//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 09-01-2001
// Ultima modifica��o: 30-01-2001
// M�dulo............: Cadastro e Manuten��o de SubGrupos de Estoque
// Sistema...........: Pegasus - Controle de Estoque
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////
unit UnitCadSubgrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RackCtls, SpeedBar, DBCtrls, fcButton, fcImgBtn, StdCtrls, Mask,
  RXSplit, Grids, DBGrids, RXDBCtrl, RXCtrls, ExtCtrls, jpeg, DB, DBTables,
  EFocCol, TFlatSplitterUnit, RxGrdCpt, fcImager, EMsgDlg, EUserAcs,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmCadSubgrupo = class(TForm)
    MsgDlg: TEvMsgDlg;
    UserAcess: TEvUserAccess;
    Image2: TImage;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    dbgrupo: TDBLookupComboBox;
    Bevel1: TBevel;
    RxDBGridSubgrupo: TRxDBGrid;
    RxLabel15: TRxLabel;
    dbSubGrupo: TDBEdit;
    btnPrimeiro: TfcImageBtn;
    btnAnterior: TfcImageBtn;
    btnProximo: TfcImageBtn;
    btnUltimo: TfcImageBtn;
    btnNovo: TfcImageBtn;
    btnGravar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    btnAlterar: TfcImageBtn;
    btnDeletar: TfcImageBtn;
    btnSair: TfcImageBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btngravarClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dbSubGrupoExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadSubgrupo: TFrmCadSubgrupo;
  NovoItem, Mudar: Boolean;

implementation

uses unitDmDados, unitPrincipal;

{$R *.dfm}

procedure TFrmCadSubgrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmdados.tbGrupo.Close;
  dmdados.tbSubGrupo.Close;
  dmdados.tbEstoque.Close;
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.tbEstoque.Close;
  dmdados.tbSubGrupo.Close;
  dmdados.tbGrupo.Close;
  Action:= Cafree;
end;

procedure TFrmCadSubgrupo.btngravarClick(Sender: TObject);
var
  Gravar,vazio:Boolean;
  Campos:String;
  Tabela: TTable;
begin
  Gravar:=true;
  Vazio:=False;
  Campos:='';
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbSubGrupo.DatabaseName;
  Tabela.TableName := dmDados.tbSubGrupo.TableName;
  Tabela.IndexName := dmdados.tbSubGrupo.IndexName;
  Tabela.Open;
  if dbGrupo.Text='' then
    begin
    if Length(Campos)>0 then
      Campos:=Campos+', ';
    Campos:=Campos+'GRUPO';
    Gravar:=False;
    end;
	if dbSubGrupo.Text='' then
  	begin
	  if Length(Campos)>0 then
      Campos:=Campos+', ';
    Campos:=Campos+'SUBGRUPO';
    Gravar:=False;
    end
  else
    begin
    Tabela.Filtered:=False;
    Tabela.Filter:= '(SubGrupo = '+'''dbSubGrupo.Text'''+')';
    Tabela.Filtered:=True;
    if Tabela.RecordCount> 0 then
      Tabela.First;
      while not Tabela.Eof do
        begin
        if Tabela.FieldByName('CodGrupo').AsInteger=dmDados.tbSubGrupoCodGrupo.Value then
          if not((DmDados.tbSubGrupo.State=dsEdit) and (dmDados.tbSubGrupo.RecNo = Tabela.RecNo)) then
            begin
       	    Gravar:=False;
            MsgDlg.MsgWarning('SUBGRUPO j� cadastrado neste GRUPO');
            break;
            end;
        Tabela.Next;
        end;
    end;
  if Gravar then
    begin
    NovoItem:= False;
    dmdados.tbSubGrupo.Post;
    dmDados.vTabStt:=True;
    {bot�es}
    BtnGravar.enabled := False;
    BtnCancelar.Enabled := False;
    BtnNovo.Enabled:=True;
    BtnPrimeiro.Enabled:=True;
    BtnAnterior.Enabled:=True;
    BtnProximo.Enabled:=True;
    BtnUltimo.Enabled:=True;
    BtnAlterar.Enabled:=True;
    Btndeletar.Enabled:=True;
    {componentes}
    DBGrupo.Enabled:=False;
    DBsubgrupo.Enabled:=False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    Panel3.SetFocus;
    end
  else
    if Vazio then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      DbGrupo.Enabled:=true;
      end;
  Tabela.Free;
end;

procedure TFrmCadSubgrupo.BtnPrimeiroClick(Sender: TObject);
begin
  DMDados.tbSubGrupo.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadSubgrupo.BtnAnteriorClick(Sender: TObject);
begin
  DMDados.tbSubGrupo.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If DMDados.tbSubGrupo.Bof Then
    Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadSubgrupo.BtnProximoClick(Sender: TObject);
begin
  DMDados.tbSubGrupo.Next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If DMDados.tbSubGrupo.Eof Then
    Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadSubgrupo.BtnUltimoClick(Sender: TObject);
begin
  DMDados.tbSubGrupo.Last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadSubgrupo.BtnNovoClick(Sender: TObject);
begin
  btnAnterior.Enabled:=false;
  btnPrimeiro.Enabled:=false;
  btnProximo.Enabled:=false;
  btnUltimo.Enabled:=false;
  DMDados.tbSubGrupo.Append;
  NovoItem:=True;
  {habilitando os bot�es}
  btngravar.Enabled:=True;
  BtnCancelar.Enabled:=True;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  BtnNovo.Enabled:=False;
  {habilitando os componentes}
  DBGrupo.Enabled:=True;
  DBSubGRupo.Enabled:=True;
  dmDados.vTabStt:=False;
  DBGrupo.SetFocus;
  UserAcess.ForceDefinitions;
end;

procedure TFrmCadSubgrupo.BtnCancelarClick(Sender: TObject);
begin
  dmdados.tbSubGrupo.Cancel;
  NovoItem:= False;
  btngravar.Enabled:=false;
  BtnCancelar.Enabled := false;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  BtnNovo.Enabled:=True;
  {Habilitando os componentes}
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  {desabilitando os objetos}
  DBGrupo.Enabled:=False;
  DBsubgrupo.Enabled:=False;
  dmDados.vTabStt:=True;
  Panel3.SetFocus;
  UserAcess.ForceDefinitions;
end;

procedure TFrmCadSubgrupo.BtnAlterarClick(Sender: TObject);
begin
  if dmdados.tbSubGrupo.RecordCount=0 then
    MsgDlg.MsgError('Tabela sem registro')
  else
    begin
    novoitem:=true;
    dmdados.tbSubGRupo.Edit;
    {habilitando os bot�es}
    BtnCancelar.Enabled:=True;
    btngravar.Enabled:=True;
    BtnNovo.Enabled:=False;
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    BtnAlterar.Enabled:=False;
    Btndeletar.Enabled:=False;
    {habilitando os componentes}
    DBGrupo.Enabled:=True;
    DBsubgrupo.Enabled:=True;
    dmDados.vTabStt:=False;
    DBgrupo.SetFocus;
    end;
  UserAcess.ForceDefinitions;
end;

procedure TFrmCadSubgrupo.BtnDeletarClick(Sender: TObject);
begin
  If dmDados.tbSubGrupo.RecordCount=0 Then
    MsgDlg.MsgError('Tabela vazia!!!')
  Else
    if Application.MessageBox('Deseja realmente excluir o registro?','Aten��o !',MB_YESNO + MB_DEFBUTTON2 + MB_ICONEXCLAMATION) = IDYES then
      if dmdados.tbEstoque.Locate('CodSubGrupo',dmdados.tbSubGrupoCodSubGrupo.value,[]) then
        MsgDlg.MsgInformation('SubGrupo ativo no cadastro do estoque.||N�o pode ser EXCLU�DO!!!')
      else
        DMdados.tbSubGrupo.Delete;
end;

procedure TFrmCadSubgrupo.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadSubgrupo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmDados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_INSERT : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_HOME   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_DELETE : if (dmDados.vTabStt) then BtnDeletar.Click;
      VK_END    : if not(dmDados.vTabStt) then BtnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
    end;
end;

procedure TFrmCadSubgrupo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmCadSubgrupo.FormShow(Sender: TObject);
begin
  dmdados.tbEstoque.Open;
  dmdados.tbSubGrupo.Open;
  dmdados.tbGrupo.Open;
  dmDados.vTabStt:=True;
  //habilitando-desabilitanto bot�es
  If dmDados.tbSubGrupo.RecordCount=0 Then
    begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    BtnNovo.Enabled:=True;
    BtnCancelar.Enabled:=False;
    BtnAlterar.Enabled:=False;
    Btndeletar.Enabled:=False;
    end;
  BtnSair.Enabled:= True;
  BtnGravar.Enabled:=False;
  DBGrupo.Enabled:=False;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

procedure TFrmCadSubgrupo.dbSubGrupoExit(Sender: TObject);
begin
  if novoitem then
    if dbSubGrupo.Text='' then
  	  begin
	    MsgDlg.MsgWarning('Necess�rio informar o SUBGRUPO !');
	    dbSubGrupo.SetFocus;
  	  end
end;

procedure TFrmCadSubgrupo.FormActivate(Sender: TObject);
begin
  UserAcess.UserID:=frmPrincipal.Acesso;
end;

end.
