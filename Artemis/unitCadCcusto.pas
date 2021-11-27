//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
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
  LMDShapeHint, EFocCol, fcImager, EMsgDlg, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmCCusto = class(TForm)
    RxGradientCaption2: TRxGradientCaption;
    MsgDlg: TEvMsgDlg;
    LMDBackPanel2: TLMDBackPanel;
    RxLabel4: TRxLabel;
    Image6: TImage;
    LMDBackPanel1: TLMDBackPanel;
    RxLabel1: TRxLabel;
    DBEcod: TDBEdit;
    RxLabel2: TRxLabel;
    DBEdesc: TDBEdit;
    gridCusto: TRxDBGrid;
    Panel4: TLMDBackPanel;
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
    Bevel1: TBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure DBEdescExit(Sender: TObject);
    procedure DBEcodExit(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure DBGridCCustoEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCCusto : TFrmCCusto;
  NovoItem, Mudar : Boolean;

implementation

uses UnitDmdados, unitPrincipal;

{$R *.DFM}

procedure TFrmCCusto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.HabilitaTeclado:=True;
  Action:= Cafree;
end;

procedure TFrmCCusto.BtnSairClick(Sender: TObject);
begin
  if (DmDados.tbCCusto.State=dsEdit) or (DmDados.tbCCusto.State=dsInsert)Then
    DmDados.tbCCusto.Cancel;
  Close;
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
  if NovoItem Then
    begin
    If dbeDesc.Text = '' Then
      Begin
      MsgDlg.MsgError('� necess�rio Informar o CENTRO DE CUSTO');
      DbeDesc.setfocus;
      end
    else
      begin
      if Tabela.Locate('Descricao',dbeDesc.Text,[]) Then
        begin
        if not ((DmDados.tbCCusto.State=dsEdit) And (dmDados.tbCCusto.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('CENTRO DE CUSTO j� cadastrado');
          dbeDesc.Clear;
          dbeDesc.setfocus;
          end
        else
          Panel4.SetFocus;
        end;
      end;
    end;
  Tabela.Free;
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
  if NovoItem then
    begin
    if dbecod.Text = '' Then
      begin
      MsgDlg.MsgError('� necess�rio Informar o C�digo');
      Dbecod.setfocus;
      end
    else
      begin
      if Tabela.Locate('CodCcusto',dbecod.Text,[]) then
        begin
        if not ((DmDados.tbCcusto.State=dsEdit) And (dmDados.tbCcusto.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('C�digo j� cadastrado');
          dbecod.Clear;
          dbecod.setfocus;
          end;
        end;
      end;
    end;
  Tabela.Free;
end;

procedure TFrmCCusto.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbCCusto.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmdados.vTabStt:=true;
end;

procedure TFrmCCusto.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.tbCCusto.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  if dmdados.TbCCusto.bof then
    begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    end;
  dmdados.vTabStt:=true;
end;

procedure TFrmCCusto.BtnProximoClick(Sender: TObject);
begin
  dmdados.tbCCusto.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  if dmdados.TbCCusto.Eof then
    begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    end;
  dmdados.vTabStt:=true;
end;

procedure TFrmCCusto.BtnUltimoClick(Sender: TObject);
begin
  dmdados.tbCCusto.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmdados.vTabStt:=true;
end;

procedure TFrmCCusto.BtnNovoClick(Sender: TObject);
begin
  DMDados.tbCcusto.Append;
  NovoItem:=True;
  dmdados.vTabStt:=false;
  {habilitando os bot�es}
  BtnGravar.Enabled := true;
  BtnCancelar.Enabled:=true;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  {habilitando os componentes}
  dbeCod.Enabled:=True;
  dbeDesc.Enabled:= True;
  gridcusto.Enabled:=true;
  dbeCod.SetFocus;
end;

procedure TFrmCCusto.BtnCancelarClick(Sender: TObject);
begin
  dmdados.tbCcusto.cancel;
  NovoItem:= False;
  dmdados.vTabStt:=true;
  {Desabilitando os bot�es}
  BtnGravar.enabled := false;
  BtnCancelar.Enabled := false;
  BtnNovo.Enabled:=True;
  btnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  Btnproximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  {Habilitando os componentes}
  gridcusto.Enabled:=false;
  DbeCod.Enabled:=False;
  DbeDesc.enabled:=false;
  Panel4.SetFocus;
end;

procedure TFrmCCusto.BtnAlterarClick(Sender: TObject);
begin
  if dmdados.TbCCusto.RecordCount=0 then
    MsgDlg.MsgInformation('Tabela vazia')
  else
    begin
    novoitem:=true;
    dmdados.vTabStt:=false;
    dmdados.tbCcusto.Edit;
    BtnCancelar.enabled:= true;
    BtnGravar.Enabled:= true;
    BtnNovo.Enabled:=False;
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    BtnAlterar.Enabled:=False;
    Btndeletar.Enabled:=False;
    //habilitar objetos
    gridcusto.Enabled:=true;
    DbeCod.Enabled:=True;
    dbeDesc.Enabled:=True;
    DbeCod.SetFocus;
    end;
end;

procedure TFrmCCusto.BtnDeletarClick(Sender: TObject);
var
  flag : boolean;
Begin
  NovoItem:=False;
  flag := false;
  if dmdados.tbCcusto.RecordCount=0 then
    MsgDlg.MsgInformation('Tabela vazia')
  else
    if MsgDlg.MsgConfirmation('Tem certeza que deseja exluir esse registro?') = id_yes then
      begin
      if dmdados.tbBalCusto.Locate('CodCcusto',dmdados.TbCCustoCodCCusto.Value,[]) then
        flag:=true;
      if dmdados.tbCReceber.Locate('CodCcusto',dmdados.TbCCustoCodCCusto.Value,[] ) then
        flag:=true;
      if flag then
        MsgDlg.MsgWarning('Centro de Custo ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
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
  dmDados.vTabStt:=True;
  NovoItem:= false;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
  if dmdados.TbCCusto.RecordCount=0 then
    begin
    Btnprimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=false;
    BtnUltimo.Enabled:=false;
    btnGravar.Enabled:=false;
    btnAlterar.Enabled:=false;
    btnCancelar.Enabled:=false;
    btnDeletar.Enabled:=false;
    end;
end;

procedure TFrmCCusto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    end;
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
      VK_End    : if not(dmDados.vTabStt) then btnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
    end;
end;

procedure TFrmCCusto.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
  tabela: ttable;
begin
  Campos:='';
  Gravar:=true;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbCcusto.DatabaseName;
  Tabela.TableName := dmDados.TbCcusto.TableName;
  Tabela.IndexName := dmdados.tbCcusto.IndexName;
  Tabela.Open;
  if dbeCod.Text='' then
    begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'C�digo';
    Gravar:=false;
    Vazio:=True;
    end
  else
    begin
    if Tabela.Locate('CodCCusto',dbeCod.Text,[]) then
      if not((DmDados.tbCCusto.State=dsEdit) And (dmDados.tbCCusto.RecNo = Tabela.RecNo)) Then
        begin
        Gravar:=false;
        MsgDlg.MsgWarning('C�digo j� cadastrado');
        end;
    end;
  if dbeDesc.Text='' then
    begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'Descri��o';
    Gravar:=False;
    Vazio:=True;
    end
  else
    begin
    if Tabela.Locate('Descricao',dbeDesc.Text,[]) then
      if not((DmDados.tbCCusto.State=dsEdit) And (dmDados.tbCCusto.RecNo = Tabela.RecNo)) Then
        begin
        Gravar:=False;
        MsgDlg.MsgWarning('Centro de Custo j� cadastrado');
        end;
    end;
  if gravar then
    begin
    NovoItem:= False;
    dmdados.tbCcusto.Post;
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
    dbeCod.Enabled:=false;
    dbeDesc.Enabled:=false;
    gridcusto.Enabled:=false;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    Panel4.SetFocus;
    end
  else
    begin
    if Vazio then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbeCod.SetFocus;
      end;
    end;
  tabela.Free;
end;

end.
