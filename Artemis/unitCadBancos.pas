//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
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
  RxGrdCpt, fcImager, EMsgDlg;

type
  TFrmCadBancos = class(TForm)
    Panel1: TPanel;
    RxLabel1: TRxLabel;
    DBEnum: TDBEdit;
    RxSplitter1: TRxSplitter;
    RxLabel2: TRxLabel;
    DBEBanco: TDBEdit;
    DBGridBanco: TDBGrid;
    Panel2: TPanel;
    RxLabel3: TRxLabel;
    Image3: TImage;
    Image1: TImage;
    Panel4: TPanel;
    btnDeletar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    btnAlterar: TfcImageBtn;
    btnNovo: TfcImageBtn;
    btnGravar: TfcImageBtn;
    btnProximo: TfcImageBtn;
    btnUltimo: TfcImageBtn;
    btnPrimeiro: TfcImageBtn;
    btnAnterior: TfcImageBtn;
    btnSair: TfcImageBtn;
    RxGradientCaption2: TRxGradientCaption;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadBancos: TFrmCadBancos;
  NovoItem: Boolean;

implementation

uses UnitDmdados, unitPrincipal;

{$R *.DFM}

procedure TFrmCadBancos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
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
  if NovoItem then
    if dbeNum.Text= '' then
      begin
      MsgDlg.MsgError('� obrigat�rio o Nome');
      dbeNum.SetFocus;
      end
    else
      if Tabela.Locate('NumBanco',dbeNum.Text,[]) then
        if not ((DmDados.tbBanco.State=dsEdit) And (dmDados.tbBanco.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('N�mero j� cadastrado');
          dbeNum.Clear;
          dbeNum.setfocus;
          end;
  tabela.Free;
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
  if NovoItem then
    if dbeBanco.Text = '' then
      begin
      MsgDlg.MsgError('� necess�rio Informar o BANCO');
      DbeBanco.setfocus;
      end
    else
      if Tabela.Locate('NomeBanco',dbeBanco.Text,[]) then
        if not ((DmDados.tbBanco.State=dsEdit) And (dmDados.tbBanco.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('Banco j� cadastrado');
          dbeBanco.Clear;
          dbeBanco.setfocus;
          end;
  Tabela.Free;
end;

procedure TFrmCadBancos.BtnSairClick(Sender: TObject);
begin
  if (DmDados.tbBanco.State=dsEdit) or (DmDados.tbBanco.State=dsInsert) then
    DmDados.tbBanco.Cancel;
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
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  {Habilitando os componentes}
  DbeNum.Enabled:=False;
  DbeBanco.enabled:=false;
  Panel4.SetFocus;
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
    if MsgDlg.MsgConfirmation('Tem certeza que deseja excluir esse registro?') = id_yes then
      if dmDados.TbCCorrente.Locate('NumBanco',dmDados.tbBancoNumBanco.Value,[]) then
        MsgDlg.MsgWarning('Banco com Conta Corrente Ativa, n�o pode ser exclu�do !!!')
     else
        dmdados.tbBanco.Delete;
end;

procedure TFrmCadBancos.BtnProximoClick(Sender: TObject);
begin
  dmdados.TbBanco.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  if dmdados.TbBanco.Eof then
    begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    end;
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
  if dmdados.TbBanco.bof then
    begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    end;
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
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
  if dmdados.tbBanco.RecordCount=0 then
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
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbBanco.DatabaseName;
  Tabela.TableName := dmDados.TbBanco.TableName;
  Tabela.IndexName := dmdados.tbBanco.IndexName;
  Tabela.Open;
	if dbeNum.Text='' then
  	begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'N�mero do Banco';
    Gravar:=False;
    Vazio:=True;
    end
  else
    if Tabela.Locate('NumBanco',dbeNum.Text,[]) Then
      if not((DmDados.tbBanco.State=dsEdit) And (dmDados.tbBanco.RecNo = Tabela.RecNo)) then
        begin
        Gravar:=False;
        MsgDlg.MsgWarning('N�mero j� cadastrado');
        dbeNum.SetFocus;
        end;
	if dbeBanco.Text='' then
  	begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'Banco';
    Gravar:=False;
    Vazio:=True;
  	End
  else
    if Tabela.Locate('NomeBanco',dbeBanco.Text,[]) then
      if not((DmDados.tbBanco.State=dsEdit) And (dmDados.tbBanco.RecNo = Tabela.RecNo)) then
        begin
        Gravar:=False;
        MsgDlg.MsgWarning('Banco j� cadastrado');
        dbeBanco.SetFocus;
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
    BtnAlterar.Enabled:=True;
    Btndeletar.Enabled:=True;
    dbeNum.Enabled:=false;
    dbeBanco.Enabled:=false;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    Panel4.SetFocus;
    end
  else
    begin
    if Vazio then
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbeNum.Enabled:=true;
    end;
  tabela.Free;
end;

end.
