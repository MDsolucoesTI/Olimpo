//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Cadastro e Manuten��o de Marcas - Produtos
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCadMarca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxGIF, RackCtls, SpeedBar, fcButton, fcImgBtn, RXSplit,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, RXDBCtrl, RXCtrls, ExtCtrls,
  jpeg, DBTables, DB, EFocCol, TFlatSplitterUnit, RxGrdCpt, fcImager,
  EMsgDlg, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmCadMarca = class(TForm)
    MsgDlg: TEvMsgDlg;
    RxLabel2: TRxLabel;
    Image2: TImage;
    RxLabel15: TRxLabel;
    dbMarca: TDBEdit;
    Bevel1: TBevel;
    RxDBGridMarca: TRxDBGrid;
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
//    procedure btnGravaClick(Sender: TObject);
    procedure RxDBGridMarcaEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure dbMarcaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadMarca: TFrmCadMarca;
  NovoItem: Boolean;

implementation

uses unitDmDados, unitPrincipal;

{$R *.dfm}

procedure TFrmCadMarca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.tbMarca.Close;
  dmdados.tbEstoque.Close;
  Action:= Cafree;
end;

procedure TFrmCadMarca.RxDBGridMarcaEnter(Sender: TObject);
begin
  NovoItem:=False;
end;

procedure TFrmCadMarca.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmCadMarca.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmCadMarca.FormShow(Sender: TObject);
begin
  dbmarca.Clear;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
  dmdados.tbMarca.Open;
  dmdados.tbEstoque.Open;
  If dmDados.tbMarca.RecordCount=0 Then
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
end;

procedure TFrmCadMarca.BtnPrimeiroClick(Sender: TObject);
begin
  DMDados.tbMarca.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadMarca.BtnAnteriorClick(Sender: TObject);
begin
  DMDados.tbMarca.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If DMDados.tbMarca.Bof Then
    Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadMarca.BtnProximoClick(Sender: TObject);
begin
  DMDados.tbMarca.Next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If DMDados.tbMarca.Eof Then
    Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadMarca.BtnUltimoClick(Sender: TObject);
begin
  DMDados.tbMarca.Last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadMarca.BtnNovoClick(Sender: TObject);
begin
  dmdados.tbMarca.append;
  NovoItem:= True;
  dmdados.vTabStt:=False;
  BtnPrimeiro.Enabled:=false;
  Btnanterior.Enabled:=false;
  Btnproximo.Enabled:=false;
  Btnultimo.Enabled:=false;
  btngravar.Enabled:=True;
  BtnCancelar.Enabled := True;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  BtnNovo.Enabled:=False;
  {Habilitando os componentes}
  DbMARCA.enabled:=True;
  RxDBGridmarca.Enabled:=true;
  dmdados.tbMarca.Append;
  dbmarca.SetFocus;
end;

procedure TFrmCadMarca.BtnCancelarClick(Sender: TObject);
begin
  dmdados.tbMarca.cancel;
  NovoItem:= False;
  BtnPrimeiro.Enabled:=true;
  Btnanterior.Enabled:=true;
  Btnproximo.Enabled:=true;
  Btnultimo.Enabled:=true;
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
  Panel3.SetFocus;
  {desabilitando os objetos}
  DBmarca.Enabled:=False;
  RxDBGridmarca.Enabled:=true;
  dmDados.vTabStt:=True;
  Panel3.SetFocus;
end;

procedure TFrmCadMarca.BtnAlterarClick(Sender: TObject);
begin
  if dmdados.tbMarca.RecordCount=0 then
    begin
    MsgDlg.MsgError('Tabela sem registro!!!');
    end
  else
    begin
    novoitem:=true;
    dmdados.tbMarca.Edit;
    dbmarca.Enabled:=True;
    RxDBGridmarca.Enabled:=False;
    BtnPrimeiro.Enabled:=false;
    Btnanterior.Enabled:=false;
    Btnproximo.Enabled:=false;
    Btnultimo.Enabled:=false;
    btnnovo.Enabled:=false;
    btnalterar.Enabled:=false;
    BtnDeletar.Enabled:=false;
    btnGravar.Enabled:=True;
    btnCancelar.Enabled:=true;
    dmdados.vTabStt:=False;
    Dbmarca.SetFocus;
    end;
end;

procedure TFrmCadMarca.BtnDeletarClick(Sender: TObject);
begin
  if dmDados.tbMarca.RecordCount=0 then
    MsgDlg.MsgError('Tabela vazia!!!')
  Else
    if Application.MessageBox('Deseja realmente excluir o registro?','Aten��o !',MB_YESNO + MB_DEFBUTTON2 + MB_ICONEXCLAMATION) = IDYES then
      if dmDados.tbEstoque.Locate('CodMarca',dmDados.tbMarcaCodMarca.Value,[]) then
        Msgdlg.MsgInformation('Marca ativa no estoque, n�o pode ser exclu�da!!!')
      else
        DMdados.tbMarca.Delete;
end;

procedure TFrmCadMarca.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadMarca.BtnGravarClick(Sender: TObject);
var
  Tabela: TTable;
  Gravar:Boolean;
begin
  Gravar:=False;
  Tabela := TTable.Create(Application);
	If dbmarca.Text='' Then
  	Begin
	  MsgDlg.MsgWarning('Necess�rio informar a MARCA!');
	  dbmarca.SetFocus;
  	End
  Else
    Begin
    Tabela.DatabaseName := dmDados.tbmarca.DatabaseName;
    Tabela.TableName := dmDados.Tbmarca.TableName;
    Tabela.Open;
    If NovoItem Then
      If Tabela.Locate('marca',dbmarca.Text,[]) Then
        If (DmDados.tbmarca.State=dsEdit) And (dmDados.tbmarca.RecNo = Tabela.RecNo) Then
          Gravar:=True
        Else
          Begin
          MsgDlg.MsgWarning('NOME DA MARCA j� Cadastrado!!');
          dbmarca.Clear;
          dbmarca.setfocus;
          End
      Else
      	Gravar:=True;
    End;
  Tabela.Free;
  if Gravar then
    begin
    NovoItem:= False;
    dmdados.tbmarca.Post;
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
    RxDBGridmarca.Enabled:=true;
    dbMarca.Enabled:=false;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    Panel3.SetFocus;
    end;
end;

procedure TFrmCadMarca.dbMarcaExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  If NovoItem Then
    Begin
    Tabela := TTable.Create(Application);
    Tabela.DatabaseName := dmDados.tbMarca.DatabaseName;
    Tabela.TableName := dmDados.tbMarca.TableName;
    Tabela.Open;
    If DBmarca.Text= '' then
      begin
      MsgDlg.MsgWarning('� obrigat�rio o Nome da Marca');
      dbMarca.SetFocus;
      end
    else
      Begin
      If Tabela.Locate('Marca',dbMarca.Text,[]) Then
        If (DmDados.tbMarca.State=dsEdit) And (dmDados.tbMarca.RecNo = Tabela.RecNo) Then
        Else
          Begin
          MsgDlg.MsgWarning('Marca j� Cadastrada');
          dbMarca.Clear;
          dbMarca.setfocus;
          End;
    Tabela.Free;
      end;
    end;
  Panel3.setfocus;
end;

end.
