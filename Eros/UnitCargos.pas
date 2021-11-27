//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Cadastro e Manuten��o de Cargos - Funcion�rios
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
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
  LMDCustomShapeHint, LMDShapeHint, EFocCol, RxGrdCpt, fcImager, EMsgDlg,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmCargos = class(TForm)
    MsgDlg: TEvMsgDlg;
    RxLabel4: TRxLabel;
    Image2: TImage;
    RxLabel2: TRxLabel;
    RxLabel5: TRxLabel;
    dbComis: TRxDBCalcEdit;
    dbGridCargo: TDBGrid;
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
    dbCargo: TDBEdit;
    LMDBackPanel2: TPanel;
    Panel3: TPanel;
    LMDBackPanel1: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
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
    procedure dbCargoExit(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure dbComisExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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
  dmdados.tbCargo.Close;
  dmdados.tbCargoFunc.Close;
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

procedure TFrmCargos.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  NovoItem:= false;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [F9] Localizar [Delete] Excluir [Esc] Cancelar ou Sair');
  dmdados.tbCargo.Open;
  dmdados.tbCargoFunc.Open;
  if dmdados.tbcargofunc.RecordCount=0 then
    begin
    btnPrimeiro.Enabled:=false;
    btnAnterior.Enabled:=false;
    btnProximo.Enabled:=false;
    btnUltimo.Enabled:=false;
    btnAlterar.Enabled:=false;
    btnGravar.Enabled:=false;
    btnCancelar.Enabled:=false;
    BtnDeletar.Enabled:=false;
    end;
  end;

procedure TFrmCargos.BtnNovoClick(Sender: TObject);
begin
  DMDados.tbcargofunc.Append;
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
  DBcargo.Enabled:=True;
  DBcomis.Enabled:= True;
  DBcargo.SetFocus;
end;

procedure TFrmCargos.BtnCancelarClick(Sender: TObject);
begin
  dmdados.tbcargofunc.cancel;
  NovoItem:= False;
  dmdados.vTabStt:=true;
  {Desabilitando os bot�es}
  BtnGravar.enabled := false;
  BtnCancelar.Enabled := false;
  BtnNovo.Enabled:=True;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  Btnproximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  if (frmPrincipal.Acesso=1) or (frmPrincipal.Acesso=2) then
    BtnAlterar.Enabled:=True;
  if (frmPrincipal.Acesso=1) then
    Btndeletar.Enabled:=True;
  {Habilitando os componentes}
  Dbcargo.Enabled:=False;
  Dbcomis.enabled:=false;
  Panel3.SetFocus;
end;

procedure TFrmCargos.BtnAlterarClick(Sender: TObject);
begin
  if dmdados.tbCargoFunc.RecordCount=0 then
    MsgDlg.MsgError('Tabela vazia')
  else
    begin
    NovoItem:=true;
    dmdados.vTabStt:=false;
    If (dmDados.tbCargoFuncCodCargo.Value >=1) and (dmDados.tbCargoFuncCodCargo.Value <=7) Then
      begin
      dmdados.tbCargoFunc.Edit;
      dbcargo.enabled:=false;
      dbcomis.enabled:=true;
      dbcomis.SetFocus;
      end
    else
      begin
      dmdados.tbCargoFunc.Edit;
      dbcargo.enabled:=true;
      dbcomis.enabled:=true;
      Dbcargo.SetFocus;
      end;
    DBgridCargo.Enabled:=false;
    //habilitar bot�es
    BtnCancelar.enabled:= true;
    BtnGravar.Enabled:= true;
    BtnNovo.Enabled:=False;
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    BtnAlterar.Enabled:=False;
    Btndeletar.Enabled:=False;
    end;
end;

procedure TFrmCargos.BtnDeletarClick(Sender: TObject);
begin
  if dmdados.tbCargoFunc.RecordCount=0 then
    begin
    MsgDlg.MsgError('Tabela sem registro');
    end
  else
    If MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este Cargo ?') = id_yes then
      begin
      If (dmDados.tbCargoFuncCodCargo.Value >=1) and (dmDados.tbCargoFuncCodCargo.Value <=7) Then
        Begin
        MsgDlg.MsgInformation('Cargo pr�-definidos....|N�o podem ser EXCLU�DOS!!!');
        dmDados.tbCargoFunc.Cancel;
        End
      Else
        if dmDados.tbFunc.Locate('CodCargo',dmDados.tbCargoFuncCodCargo.Value,[]) then
          MsgDlg.MsgInformation('Cargo com funcion�rios ocupando.|N�o pode ser EXCLU�DO!!!')
        else
          DMDados.tbCargoFunc.Delete;
      end;
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
    end;
end;

procedure TFrmCargos.dbCargoExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.Tbcargofunc.DatabaseName;
  Tabela.TableName := dmDados.Tbcargofunc.TableName;
  Tabela.IndexName := dmdados.tbcargofunc.IndexName;
  Tabela.Open;
  if NovoItem then
    begin
    if dbcargo.Text= '' then
      begin
      MsgDlg.MsgWarning('� obrigat�rio o CARGO');
      dbcargo.SetFocus;
      end
    else
      begin
      if Tabela.Locate('Cargo',dbcargo.Text,[]) then
        if not((DmDados.tbCargofunc.State=dsEdit) and (dmDados.tbcargofunc.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('CARGO j� cadastrado');
          dbcargo.Clear;
          dbcargo.setfocus;
          end;
      end;
    end;
  tabela.Free;
end;

procedure TFrmCargos.BtnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
  tabela: ttable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbcargofunc.DatabaseName;
  Tabela.TableName := dmDados.tbcargofunc.TableName;
  Tabela.IndexName := dmdados.tbcargofunc.IndexName;
  Tabela.Open;
	If dbcargo.Text='' Then
  	Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Cargo';
    Gravar:=False;
    Vazio:=True;
    end
  else
    If Tabela.Locate('Cargo',dbcargo.Text,[]) Then
      If not((DmDados.tbcargofunc.State=dsEdit) And (dmDados.tbcargofunc.RecNo = Tabela.RecNo)) Then
        begin
        Gravar:=False;
        MsgDlg.MsgWarning('Cargo j� cadastrado');
        end;
	If dbcomis.Text='' Then
  	Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Comiss�o';
    Gravar:=False;
    Vazio:=True;
  	End;
  if gravar then
    begin
    NovoItem:= False;
    dmdados.tbcargofunc.Post;
    dmDados.vTabStt:=True;
    BtnGravar.enabled := False;
    BtnCancelar.Enabled := False;
    BtnNovo.Enabled:=True;
    BtnPrimeiro.Enabled:=True;
    BtnAnterior.Enabled:=True;
    BtnProximo.Enabled:=True;
    BtnUltimo.Enabled:=True;
    if (frmPrincipal.Acesso=1) or (frmPrincipal.Acesso=2) then
      BtnAlterar.Enabled:=True;
    if (frmPrincipal.Acesso=1) then
      Btndeletar.Enabled:=True;
    dbcargo.Enabled:=false;
    dbcomis.Enabled:=false;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    Panel3.SetFocus;
    end
  else
    If Vazio Then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbcargo.Enabled:=true;
      end;
end;

procedure TFrmCargos.dbComisExit(Sender: TObject);
begin
  Panel3.SetFocus;
end;

procedure TFrmCargos.FormActivate(Sender: TObject);
begin
  dmdados.tbCargo.Open;
  dmdados.tbCargoFunc.Open;
  if (frmPrincipal.Acesso=1) or (frmPrincipal.Acesso=2) then
    BtnAlterar.Enabled:=True;
  if (frmPrincipal.Acesso=1) then
    Btndeletar.Enabled:=True;  
end;

end.
