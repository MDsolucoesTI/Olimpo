//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Cadastro de ICMS
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UniCadICMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RackCtls, SpeedBar, RXSplit, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids, RXDBCtrl, ExtCtrls, jpeg, RXCtrls, RxGrdCpt, fcButton, fcImgBtn,
  fcImager, EMsgDlg, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmCadICMS = class(TForm)
    RxGradientCaption1: TRxGradientCaption;
    MsgDlg: TEvMsgDlg;
    Image3: TImage;
    RxLabel1: TRxLabel;
    RxLabel15: TRxLabel;
    DBCBoxUF: TDBComboBox;
    RxLabel2: TRxLabel;
    DBNome: TDBEdit;
    Bevel1: TBevel;
    DBGridUnidade: TRxDBGrid;
    btnNovo: TfcImageBtn;
    btnGravar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    btnAlterar: TfcImageBtn;
    btnDeletar: TfcImageBtn;
    btnSair: TfcImageBtn;
    LMDBackPanel2: TPanel;
    Panel3: TPanel;
    LMDBackPanel1: TPanel;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnDeletarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadICMS: TFrmCadICMS;
  NovoItem:Boolean;
implementation

uses unitDmDados, UnitPrincipal;

{$R *.dfm}

procedure TFrmCadICMS.BtnNovoClick(Sender: TObject);
begin
  dmdados.tbIcms.Append;
  NovoItem:= True;
  dmDados.vTabStt:=False;
  {Bot�es}
  BtnGravar.Enabled := true;
  BtnCancelar.Enabled:=true;
  BtnNovo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  {Habilitando os componentes}
  DBGridUnidade.Enabled:=false;
  dbgridunidade.enabled:=true;
  DBCBoxUF.enabled:=True;
  Dbnome.enabled:=True;
  DBCBoxUF.SetFocus;
end;

procedure TFrmCadICMS.BtnCancelarClick(Sender: TObject);
begin
  dmdados.tbIcms.cancel;
  NovoItem:= False;
  {Desabilitando os bot�es}
  btnGravar.Enabled:=false;
  BtnCancelar.Enabled := false;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  BtnNovo.Enabled:=True;
  {Desabilitando os componentes}
  DBGridUnidade.Enabled:=true;
  DBCBoxUF.Enabled:=False;
  Dbnome.enabled:=false;
  dmdados.vTabStt:=True;
  Panel3.SetFocus;
end;

procedure TFrmCadICMS.BtnAlterarClick(Sender: TObject);
begin
  if dmdados.tbIcms.RecordCount=0 then
    MsgDlg.MsgError('Tabela sem registro!!!')
  else
    begin
    novoitem:=true;
    dmdados.tbICMS.Edit;
    DBCBoxUF.Enabled:=True;
    dbnome.Enabled:=True;
    DBGridUnidade.Enabled:=false;
    btnnovo.Enabled:=false;
    btncancelar.Enabled:=true;
    btnalterar.Enabled:=false;
    BtnDeletar.Enabled:=false;
    btnGravar.Enabled:=True;
    dmdados.vTabStt:=False;
    DBCBoxUF.SetFocus;
  end;
end;

procedure TFrmCadICMS.BtnGravarClick(Sender: TObject);
var
   Campos:String;
  Vazio,Gravar:Boolean;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  If DBCBoxUF.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Estado';
    Gravar:=False;
    Vazio:=True;
    End;
  If dbnome.Text='' Then
  	Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'ICMS';
    Gravar:=False;
    Vazio:=True;
  end;
  If Gravar Then
    begin
    dmdados.tbicms.Post;
    dmDados.vTabStt:=True;
    BtnGravar.enabled := False;
    BtnCancelar.Enabled := False;
    BtnNovo.Enabled:=True;
    BtnAlterar.Enabled:=True;
    Btndeletar.Enabled:=True;
    DBCBoxUF.enabled:=false;
    dbnome.enabled:=false;
    DBGridUnidade.Enabled:=true;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    Panel3.SetFocus;
    end
  else
    begin
    If Vazio Then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      DBCBoxUF.Enabled:=true;
      end;
    end;
end;

procedure TFrmCadICMS.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadICMS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.tbICMS.Close;
  action:=cafree;
end;

procedure TFrmCadICMS.BtnDeletarClick(Sender: TObject);
begin
  If dmDados.tbICMS.RecordCount=0 Then
    MsgDlg.MsgError('Tabela vazia!!!')
  Else
    if Application.MessageBox('Deseja realmente excluir o registro?','Aten��o !',MB_YESNO + MB_DEFBUTTON2 + MB_ICONEXCLAMATION) = IDYES then
      DMdados.tbICMS.Delete
    else
      DMdados.tbICMS.Cancel;
end;

procedure TFrmCadICMS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmCadICMS.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmCadICMS.FormShow(Sender: TObject);
begin
  dmdados.tbICMS.Open;
end;

end.
