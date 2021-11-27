///////////////////////////////////////////////////////////////////////////////////
// Cria��o...........: 09-01-2001
// Ultima modifica��o: 30-01-2001
// M�dulo............: Cadastro e Manuten��o de Unidades de Mercadorias/Produtos
// Sistema...........: Pegasus - Controle de Estoque
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////////////
unit UnitCadUnidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RackCtls, SpeedBar, RXSplit, fcButton, fcImgBtn, StdCtrls, Mask,
  DBCtrls, Grids, DBGrids, RXDBCtrl, RXCtrls, ExtCtrls, jpeg, DBTables, DB,
  EFocCol, RxGrdCpt, fcImager, EMsgDlg, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmCadUnidades = class(TForm)
    MsgDlg: TEvMsgDlg;
    RxLabel2: TRxLabel;
    Image2: TImage;
    RxLabel15: TRxLabel;
    dbSigla: TDBEdit;
    RxLabel1: TRxLabel;
    DBNome: TDBEdit;
    Bevel1: TBevel;
    DBGridUnidade: TRxDBGrid;
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
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure BtnGravarClick0(Sender: TObject);
    procedure dbSiglaExit(Sender: TObject);
    procedure DBNomeExit(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadUnidades: TFrmCadUnidades;
  Mudar, NovoItem: Boolean;

implementation

uses unitPrincipal, unitDmDados;

{$R *.dfm}

procedure TFrmCadUnidades.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.tbEstoque.Close;
  dmdados.tbUnidade.Close;
  action:=cafree;
end;

procedure TFrmCadUnidades.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmCadUnidades.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmCadUnidades.FormShow(Sender: TObject);
begin
  dmdados.tbEstoque.Open;
  dmdados.tbUnidade.Open;
  dmDados.vTabStt:=True;
  If dmDados.tbUnidade.RecordCount=0 Then
   begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    BtnCancelar.Enabled:=False;
    BtnAlterar.Enabled:=False;
    Btndeletar.Enabled:=False;
   end;
   BtnNovo.Enabled:=True;
   BtnSair.Enabled:= True;
   BtnGravar.Enabled:=False;
   NovoItem:=False;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

procedure TFrmCadUnidades.BtnNovoClick(Sender: TObject);
begin
  dmdados.tbUnidade.Append;
  NovoItem:= True;
  dmDados.vTabStt:=False;
  {Bot�es}
  BtnGravar.Enabled := true;
  BtnCancelar.Enabled:=true;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  {Habilitando os componentes}
  dbgridunidade.enabled:=false;
  Dbsigla.enabled:=True;
  Dbnome.enabled:=True;
  dbsigla.SetFocus;
end;

procedure TFrmCadUnidades.BtnCancelarClick(Sender: TObject);
begin
  dmdados.tbUnidade.cancel;
  NovoItem:= False;
  {Desabilitando os bot�es}
  btnPrimeiro.Enabled:=true;
  btnanterior.Enabled:=true;
  btnproximo.Enabled:=true;
  btnultimo.Enabled:=true;
  btnGravar.Enabled:=false;
  BtnCancelar.Enabled := false;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  BtnNovo.Enabled:=True;
  {Desabilitando os componentes}
  Dbsigla.Enabled:=False;
  Dbnome.enabled:=false;
  dbgridunidade.enabled:=true;
  dmdados.vTabStt:=True;
  Panel3.SetFocus;
end;

procedure TFrmCadUnidades.BtnAlterarClick(Sender: TObject);
begin
  if dmdados.tbUnidade.RecordCount=0 then
    MsgDlg.MsgError('Tabela sem registro')
  else
    begin
    novoitem:=true;
    Mudar:=True;
    dmdados.tbUnidade.Edit;
    Dbsigla.Enabled:=True;
    dbnome.Enabled:=True;
    dbgridunidade.enabled:=false;
    btnPrimeiro.Enabled:=false;
    btnanterior.Enabled:=false;
    btnproximo.Enabled:=false;
    btnultimo.Enabled:=false;
    btnnovo.Enabled:=false;
    btncancelar.Enabled:=true;
    btnalterar.Enabled:=false;
    BtnDeletar.Enabled:=false;
    btnGravar.Enabled:=True;
    dmdados.vTabStt:=False;
    dbSigla.SetFocus;
    end;
end;

procedure TFrmCadUnidades.BtnDeletarClick(Sender: TObject);
begin
  if dmDados.tbUnidade.RecordCount=0 then
    MsgDlg.MsgError('Tabela vazia !!!')
  else
    if Application.MessageBox('Deseja realmente excluir o registro?','Aten��o !',MB_YESNO + MB_DEFBUTTON2 + MB_ICONEXCLAMATION) = IDYES then
      if dmdados.tbEstoque.Locate('Sigla',dmdados.tbUnidadeSigla.Value,[]) then
        MsgDlg.MsgInformation('Unidade ativa no cadastro do estoque.|N�o pode ser EXCLU�DA.')
      else
        DMdados.tbUnidade.Delete;
end;

procedure TFrmCadUnidades.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadUnidades.btnPrimeiroClick(Sender: TObject);
begin
  DMDados.tbUnidade.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadUnidades.btnAnteriorClick(Sender: TObject);
begin
  DMDados.tbUnidade.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  if DMDados.tbUnidade.Bof then
    begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    end;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadUnidades.btnProximoClick(Sender: TObject);
begin
  DMDados.tbUnidade.Next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  if DMDados.tbUnidade.Eof then
    begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    end;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadUnidades.btnUltimoClick(Sender: TObject);
begin
  DMDados.tbUnidade.Last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadUnidades.BtnGravarClick0(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
  tabela: tTable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.Tbunidade.DatabaseName;
  Tabela.TableName := dmDados.Tbunidade.TableName;
  Tabela.IndexName := dmdados.tbunidade.IndexName;
  Tabela.Open;
	if dbsigla.Text='' then
  	begin
    if Length(Campos)>0 then
    	Campos:=Campos+', ';
    Campos:=Campos+'Sigla';
    Gravar:=False;
    Vazio:=True;
    end
  else
     begin
     if Tabela.Locate('sigla',dbsigla.Text,[]) then
       if not((DmDados.tbunidade.State=dsEdit) and (dmDados.tbunidade.RecNo = Tabela.RecNo)) then
          begin
          Gravar:=False;
          MsgDlg.MsgWarning('SIGLA j� cadastrada');
          end;
     end;
	if dbnome.Text='' then
  	begin
    if Length(Campos)>0 then
    	Campos:=Campos+', ';
    Campos:=Campos+'Nome';
    Gravar:=False;
    Vazio:=True;
  	end
   else
     begin
     if Tabela.Locate('descricao',dbnome.Text,[]) then
       if not((DmDados.tbunidade.State=dsEdit) and (dmDados.tbunidade.RecNo = Tabela.RecNo)) then
          begin
          Gravar:=False;
          MsgDlg.MsgWarning('UNIDADE j� cadastrada');
          end;
     end;
  if Gravar then
    begin
    NovoItem:= False;
    dmdados.tbunidade.Post;
    dmDados.vTabStt:=True;
    BtnGravar.enabled := False;
    BtnCancelar.Enabled := False;
    BtnNovo.Enabled:=True;
    BtnPrimeiro.Enabled:=True;
    BtnAnterior.Enabled:=True;
    BtnProximo.Enabled:=True;
    BtnUltimo.Enabled:=True;
    BtnAlterar.Enabled:=True;
    Btndeletar.Enabled:=True;
    dbsigla.enabled:=false;
    dbnome.enabled:=false;
    dbgridunidade.enabled:=true;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    Panel3.SetFocus;
    end
  else
    begin
    if Vazio then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbsigla.Enabled:=true;
      end;
    end;
  Tabela.Free;
end;

procedure TFrmCadUnidades.dbSiglaExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  If NovoItem Then
    Begin
    Tabela := TTable.Create(Application);
    Tabela.DatabaseName := dmDados.tbunidade.DatabaseName;
    Tabela.TableName := dmDados.tbunidade.TableName;
    Tabela.IndexFieldNames := dmDados.tbUnidade.IndexFieldNames;
    Tabela.Open;
    If DBsigla.Text= '' then
      begin
      MsgDlg.MsgWarning('� obrigat�rio a SIGLA');
      DBsigla.SetFocus;
      end
    else
      Begin
      If Tabela.Locate('sigla',DBsigla.Text,[]) Then
        If not ((DmDados.tbunidade.State=dsEdit) And (dmDados.tbunidade.RecNo = Tabela.RecNo)) Then
          Begin
          MsgDlg.MsgWarning('Sigla j� Cadastrada');
          DBsigla.Clear;
          DBsigla.setfocus;
          End;
      Tabela.Free;
      end;
    end;
end;

procedure TFrmCadUnidades.DBNomeExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  If NovoItem Then
    Begin
    Tabela := TTable.Create(Application);
    Tabela.DatabaseName := dmDados.tbunidade.DatabaseName;
    Tabela.TableName := dmDados.tbunidade.TableName;
    Tabela.IndexFieldNames := dmDados.tbUnidade.IndexFieldNames;
    Tabela.Open;
    If DBnome.Text= '' then
      begin
      MsgDlg.MsgWarning('� obrigat�rio o NOME');
      DBnome.SetFocus;
      end
    else
      Begin
      If Tabela.Locate('descricao',DBnome.Text,[]) Then
        If Not((DmDados.tbunidade.State=dsEdit) And (dmDados.tbunidade.RecNo = Tabela.RecNo)) Then
          Begin
          MsgDlg.MsgWarning('Nome j� Cadastrado');
          DBnome.Clear;
          DBnome.setfocus;
          End;
      end;
    Tabela.Free;
    end;
end;

procedure TFrmCadUnidades.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
  tabela: ttable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.Tbunidade.DatabaseName;
  Tabela.TableName := dmDados.Tbunidade.TableName;
  Tabela.IndexName := dmdados.tbunidade.IndexName;
  Tabela.Open;
	If dbsigla.Text='' Then
  	Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Sigla';
    Gravar:=False;
    Vazio:=True;
    end
  else
     begin
     If Tabela.Locate('sigla',dbsigla.Text,[]) Then
       If not((DmDados.tbunidade.State=dsEdit) And (dmDados.tbunidade.RecNo = Tabela.RecNo)) Then
          Begin
          Gravar:=False;
          MsgDlg.MsgWarning('Sigla j� cadastrada');
          dbsigla.SetFocus;
          End;
     end;
	If dbnome.Text='' Then
  	Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Nome';
    Gravar:=False;
    Vazio:=True;
  	End
   else
     begin
     If Tabela.Locate('descricao',dbnome.Text,[]) Then
       If not((DmDados.tbunidade.State=dsEdit) And (dmDados.tbunidade.RecNo = Tabela.RecNo)) Then
          Begin
          Gravar:=False;
          MsgDlg.MsgWarning('Unidade j� cadastrada');
          dbnome.SetFocus;
          End;
     end;
  If Gravar Then
    begin
    NovoItem:= False;
    dmdados.tbunidade.Post;
    dmDados.vTabStt:=True;
    BtnGravar.enabled := False;
    BtnCancelar.Enabled := False;
    BtnNovo.Enabled:=True;
    BtnPrimeiro.Enabled:=True;
    BtnAnterior.Enabled:=True;
    BtnProximo.Enabled:=True;
    BtnUltimo.Enabled:=True;
    BtnAlterar.Enabled:=True;
    Btndeletar.Enabled:=True;
    dbsigla.enabled:=false;
    dbnome.enabled:=false;
    dbgridunidade.enabled:=true;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    Panel3.SetFocus;
    end
  else
    begin
    if Vazio then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbsigla.Enabled:=true;
      end;
    end;
end;

end.
