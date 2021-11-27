//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2002
// Sistema...........: Ceres - Controle de Cheques
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitCadBancos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcButton, fcImgBtn, RXSplit, Grids, DBGrids, StdCtrls, Mask, DBCtrls,
  RXCtrls, ExtCtrls, SpeedBar, jpeg, RackCtls, DBTables, DB,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDShapeHint,
  TFlatSplitterUnit, RxGrdCpt, fcImager, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel, EMsgDlg;

type
  TFrmCadBancos = class(TForm)
    RxGradientCaption1: TRxGradientCaption;
    LMDBackPanel2: TLMDBackPanel;
    fcImager4: TfcImager;
    RxLabel4: TRxLabel;
    Image1: TImage;
    LMDBackPanel1: TLMDBackPanel;
    fcImager2: TfcImager;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    DBEnum: TDBEdit;
    DBEBanco: TDBEdit;
    Bevel1: TBevel;
    DBGridBanco: TDBGrid;
    Panel3: TLMDBackPanel;
    fcImager1: TfcImager;
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
    MsgDlg: TEvMsgDlg;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBEnumExit(Sender: TObject);
    procedure DBEbancoExit(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGravarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnBaixaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadBancos: TFrmCadBancos;
  NovoItem: Boolean;

implementation

uses UnitDmdados, UnitPrincipal;

{$R *.DFM}

procedure TFrmCadBancos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.tbBanco.Close;
  dmdados.TbCCorrente.Close;
  Action:= Cafree;
end;

procedure TFrmCadBancos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmCadBancos.DBEnumExit(Sender: TObject);
Var
Tabela: TTable;

begin
Tabela := TTable.Create(Application);
Tabela.DatabaseName := dmDados.TbBanco.DatabaseName;
Tabela.TableName := dmDados.TbBanco.TableName;
Tabela.IndexName := dmdados.tbBanco.IndexName;
Tabela.Open;
If NovoItem Then
BEGIN
 If dbeNum.Text= '' then
   Begin
   MsgDlg.MsgError('� obrigat�rio o Nome');
   dbeNum.SetFocus;
   End
 else
   begin
   If Tabela.Locate('NumBanco',dbeNum.Text,[]) Then
    begin
    If not ((DmDados.tbBanco.State=dsEdit) And (dmDados.tbBanco.RecNo = Tabela.RecNo)) Then
      begin
      MsgDlg.MsgWarning('N�mero j� cadastrado');
      dbeNum.Clear;
      dbeNum.setfocus;
      end;
    end
   else
      tabela.Free;
   end;
end;
end;

procedure TFrmCadBancos.DBEbancoExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbBanco.DatabaseName;
  Tabela.TableName := dmDados.TbBanco.TableName;
  Tabela.IndexName := dmdados.tbBanco.IndexName;
  Tabela.Open;
If NovoItem Then
begin
  If dbeBanco.Text = '' Then
     Begin
     MsgDlg.MsgError('� necess�rio Informar o BANCO');
     DbeBanco.setfocus;
     end
  Else
     Begin
     If Tabela.Locate('NomeBanco',dbeBanco.Text,[]) Then
       begin
       If not ((DmDados.tbBanco.State=dsEdit) And (dmDados.tbBanco.RecNo = Tabela.RecNo)) Then
         begin
         MsgDlg.MsgWarning('Banco j� cadastrado');
         dbeBanco.Clear;
         dbeBanco.setfocus;
         End;
       end
     else
       Tabela.Free;
    end;
end;
end;

procedure TFrmCadBancos.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadBancos.BtnNovoClick(Sender: TObject);
begin
  DMDados.tbBanco.Append;
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
//BtnLocalizar.Enabled:=False;
  {habilitando os componentes}
  DBenum.Enabled:=True;
  DBebanco.Enabled:= True;
  DBenum.SetFocus;
end;

procedure TFrmCadBancos.BtnCancelarClick(Sender: TObject);
begin
  dmdados.tbBanco.cancel;
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
//  BtnLocalizar.Enabled:=True;
  {Habilitando os componentes}
  DbeNum.Enabled:=False;
  DbeBanco.enabled:=false;
  Panel3.SetFocus;
end;

procedure TFrmCadBancos.BtnAlterarClick(Sender: TObject);
begin
  novoitem:=true;
  dmdados.vTabStt:=false;
  dmdados.tbBanco.Edit;
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
//  BtnLocalizar.Enabled:=False;
  //habilitar objetos
  DbeNum.Enabled:=True;
  dbeBanco.Enabled:=True;
  Dbenum.SetFocus;
end;

procedure TFrmCadBancos.BtnDeletarClick(Sender: TObject);
begin
  NovoItem:=False;
  if dmdados.tbBanco.RecordCount=0 then
    MsgDlg.MsgInformation('Tabela sem registro')
  else
    If MsgDlg.MsgConfirmation('Tem certeza que deseja excluir esse registro?') = id_yes then
      if dmDados.TbCCorrente.Locate('NumBanco',dmDados.tbBancoNumBanco.Value,[]) then
        begin
        MsgDlg.MsgWarning('Banco com Conta Corrente Ativa, n�o pode ser exclu�do !!!');
        dmdados.tbBanco.Cancel;
        end
     else
        dmdados.tbBanco.Delete;
end;

procedure TFrmCadBancos.BtnProximoClick(Sender: TObject);
begin
  dmdados.TbBanco.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.TbBanco.Eof Then
  Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
  End;
  dmdados.vTabStt:=true;
end;

procedure TFrmCadBancos.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.TbBanco.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmdados.vTabStt:=true;
end;

procedure TFrmCadBancos.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.TbBanco.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.TbBanco.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
  dmdados.vTabStt:=true;
end;

procedure TFrmCadBancos.BtnUltimoClick(Sender: TObject);
begin
  dmdados.TbBanco.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmdados.vTabStt:=true;
end;

procedure TFrmCadBancos.FormShow(Sender: TObject);
begin
  dmdados.tbBanco.Open;
  dmdados.TbCCorrente.Open;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

procedure TFrmCadBancos.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmCadBancos.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
  tabela: ttable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela:=TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbBanco.DatabaseName;
  Tabela.TableName := dmDados.TbBanco.TableName;
  Tabela.IndexName := dmdados.tbBanco.IndexName;
  Tabela.Open;
	If dbeNum.Text='' Then
  	Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'N�mero do Banco';
    Gravar:=False;
    Vazio:=True;
    end
  else
     begin
     If Tabela.Locate('NumBanco',dbeNum.Text,[]) Then
       If not((DmDados.tbBanco.State=dsEdit) And (dmDados.tbBanco.RecNo = Tabela.RecNo)) Then
          Begin
          Gravar:=False;
          MsgDlg.MsgWarning('N�mero j� cadastrado');
          dbeNum.SetFocus;
          End;
     end;
	If dbeBanco.Text='' Then
  	Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Banco';
    Gravar:=False;
    Vazio:=True;
  	End
   else
     begin
     If Tabela.Locate('NomeBanco',dbeBanco.Text,[]) Then
       If not((DmDados.tbBanco.State=dsEdit) And (dmDados.tbBanco.RecNo = Tabela.RecNo)) Then
          Begin
          Gravar:=False;
          MsgDlg.MsgWarning('Banco j� cadastrado');
          dbeBanco.SetFocus;
          End;
     end;
  if gravar then
    begin
    NovoItem:= False;
    dmdados.tbBanco.Post;
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
    //BtnLocalizar.enabled:=true;
    dbeNum.Enabled:=false;
    dbeBanco.Enabled:=false;
    MsgDlg.MsgInformation('Dados Cadastrados com Sucesso!!!');
    Panel3.SetFocus;
    end
  else
    If Vazio Then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbeNum.Enabled:=true;
      end;
end;

procedure TFrmCadBancos.btnBuscarClick(Sender: TObject);
begin
  novoitem:=true;
  dmdados.vTabStt:=false;
  dmdados.tbBanco.Edit;
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
//  BtnLocalizar.Enabled:=False;
  //habilitar objetos
  DbeNum.Enabled:=True;
  dbeBanco.Enabled:=True;
  Dbenum.SetFocus;
end;

procedure TFrmCadBancos.btnBaixaClick(Sender: TObject);
begin
  NovoItem:=False;
  if dmdados.tbBanco.RecordCount=0 then
    MsgDlg.MsgInformation('Tabela sem registro')
  else
    If MsgDlg.MsgConfirmation('Tem certeza que deseja excluir esse registro?') = id_yes then
      if dmDados.TbCCorrente.Locate('NumBanco',dmDados.tbBancoNumBanco.Value,[]) then
        begin
        MsgDlg.MsgWarning('Banco com Conta Corrente Ativa, n�o pode ser exclu�do !!!');
        dmdados.tbBanco.Cancel;
        end
     else
        dmdados.tbBanco.Delete;
end;

procedure TFrmCadBancos.FormActivate(Sender: TObject);
begin
  dmdados.tbBanco.Open;
  dmdados.TbCCorrente.Open;
  if (frmPrincipal.Acesso=1) or (frmPrincipal.Acesso=2) then
    BtnAlterar.Enabled:=True;
  if (frmPrincipal.Acesso=1) then
    Btndeletar.Enabled:=True;
end;

end.
