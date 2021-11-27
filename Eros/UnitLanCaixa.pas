//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Lan�amento no Caixa
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitLanCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvGIF, ExtCtrls, fcpanel, fcButton, fcImgBtn, StdCtrls,
  CurrEdit, LMDControl, LMDBaseControl, LMDBaseGraphicControl,
  LMDBaseShape, LMDShapeControl, RXDBCtrl, Grids, BaseGrid, AdvGrid,
  RxDBComb, RxLookup, ToolEdit, Mask, DBCtrls, RXCtrls, JvPanel,
  JvTransparentPanel, EMsgDlg, JvComponent, JvTransBtn, fcLabel, EGrad,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel, DBGrids, DB, JvLabel;

type
  TFrmLanCaixa = class(TForm)
    dbNumLan: TDBEdit;
    dbDataLan: TDBDateEdit;
    dbHist: TDBEdit;
    dbNumDoc: TDBEdit;
    dbVal: TRxDBCalcEdit;
    dbTipoOp: TDBComboBox;
    GridGrupo: TRxDBGrid;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    JvLabel6: TJvLabel;
    fcLabel1: TfcLabel;
    MsgDlg: TEvMsgDlg;
    btnPrimeiro: TJvTransparentButton;
    btnAnterior: TJvTransparentButton;
    btnProximo: TJvTransparentButton;
    btnUltimo: TJvTransparentButton;
    btnGravar: TJvTransparentButton;
    btnNovo: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    btnAlterar: TJvTransparentButton;
    btnDeletar: TJvTransparentButton;
    btnLocalizar: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    procedure btnSairClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure dbValExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbHistExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLanCaixa: TFrmLanCaixa;
  NovoItem, Mudar: Boolean;

{$R *.dfm}

implementation

Uses UnitLocCaixa, unitDmDados, UnitPrincipal;

procedure TFrmLanCaixa.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmLanCaixa.btnLocalizarClick(Sender: TObject);
begin
    FrmLocCaixa:=TFrmLocCaixa.create(application);
    FrmLocCaixa.show;
end;

procedure TFrmLanCaixa.dbValExit(Sender: TObject);
begin
    Panel3.SetFocus;
end;

procedure TFrmLanCaixa.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [F9] Localiza [Esc] Cancelar ou Sair');
  if dmDados.tbCaixa.State = dsInactive then
    dmDados.tbCaixa.Open;
  if dmDados.tbMovCaixa.State = dsInactive then
    dmDados.tbMovCaixa.Open;
  dmDados.HabilitaTeclado := True;
end;

procedure TFrmLanCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.tbCaixa.Close;
  dmDados.tbMovCaixa.Close;
  dmDados.HabilitaTeclado := False;
  Action := caFree;
end;

procedure TFrmLanCaixa.btnPrimeiroClick(Sender: TObject);
begin
  DMDados.tbMovCaixa.First;
  BtnPrimeiro.Enabled := False;
  BtnAnterior.Enabled := False;
  BtnProximo.Enabled  := True ;
  BtnUltimo.Enabled   := True ;
  dmDados.vTabStt     := True ;
end;

procedure TFrmLanCaixa.btnAnteriorClick(Sender: TObject);
begin
  DMDados.tbMovCaixa.Prior;
  BtnProximo.Enabled := True;
  BtnUltimo.Enabled  := True;
  If DMDados.tbMovCaixa.Bof Then
    Begin
    BtnPrimeiro.Enabled := False;
    BtnAnterior.Enabled := False;
    End;
  dmDados.vTabStt := True;
end;

procedure TFrmLanCaixa.btnProximoClick(Sender: TObject);
begin
  DMDados.tbMovCaixa.Next;
  BtnPrimeiro.Enabled := True;
  BtnAnterior.Enabled := True;
  If DMDados.tbMovCaixa.Eof Then
    Begin
    BtnProximo.Enabled := False;
    BtnUltimo.Enabled  := False;
    End;
  dmDados.vTabStt := True;
end;

procedure TFrmLanCaixa.btnUltimoClick(Sender: TObject);
begin
  DMDados.tbMovCaixa.Last;
  BtnPrimeiro.Enabled := True ;
  BtnAnterior.Enabled := True ;
  BtnProximo.Enabled  := False;
  BtnUltimo.Enabled   := False;
  dmDados.vTabStt     := True ;
end;

procedure TFrmLanCaixa.btnNovoClick(Sender: TObject);
begin
  btnAnterior.Enabled := False;
  btnPrimeiro.Enabled := False;
  btnProximo.Enabled  := False;
  btnUltimo.Enabled   := False;
  DMDados.tbMovCaixa.Append;
  NovoItem := True;
  {habilitando os bot�es}
  btngravar.Enabled   := True ;
  BtnCancelar.Enabled := True ;
  BtnAlterar.Enabled  := False;
  BtnDeletar.Enabled  := False;
  BtnNovo.Enabled     := False;
  {habilitando os componentes}
  dbDataLan.Enabled   := True ;
  dbHist.Enabled      := True ;
  dbNumDoc.Enabled    := True ;
  dbVal.Enabled       := True ;
  dbTipoOp.Enabled    := True ;
  dmDados.vTabStt     := False;
  dbDataLan.SetFocus;
end;

procedure TFrmLanCaixa.btnGravarClick(Sender: TObject);
Var
    Gravar, Vazio : Boolean;
    Campos, Tipo  : string ;
begin
  Gravar := True ;
  Vazio  := False;
  Campos := ''   ;
  Tipo   := ''   ;
  if dbDataLan.Text='' then
    begin
    if Length(Campos)>0 then
      Campos:=Campos+', ';
    Campos:=Campos+'DATA LAN�AMENTO';
    Gravar:=False;
    end;
  if dbNumDoc.Text='' then
  	begin
	  if Length(Campos)>0 then
      Campos:=Campos+', ';
    Campos:=Campos+'N�MERO DOCUMENTO';
    Gravar:=False;
    end;
  if dbVal.Text='' then
  	begin
	  if Length(Campos)>0 then
      Campos:=Campos+', ';
    Campos:=Campos+'VALOR';
    Gravar:=False;
    end;
  if Gravar then
    begin
    NovoItem := False;
    if (dbTipoOp.Text = 'PAGAMENTO') then
      begin
      dmDados.tbMovCaixaTipoOper.Value := 'S';
      Tipo := 'P';
      end
    else
      if (dbTipoOp.Text = 'SA�DA') then
        begin
        dmDados.tbMovCaixaTipoOper.Value := 'S';
        Tipo := 'S';
        end
      else
        if (dbTipoOp.Text = 'VALES') then
          begin
          dmDados.tbMovCaixaTipoOper.Value := 'S';
          Tipo := 'V';
          end
        else
          if (dbTipoOp.Text = 'ENTRADA') then
            begin
            dmDados.tbMovCaixaTipoOper.Value := 'E';
            Tipo := 'E';
            end;
    dmDados.tbMovCaixa.Post;
    dmDados.vTabStt := True;
    dmDados.tbCaixa.Last;
    dmDados.tbCaixa.Edit;
    if (Tipo = 'P') then
      dmDados.tbCaixaPagto.Value := dmDados.tbCaixaPagto.Value + dbVal.Value
    else
      if (Tipo = 'S') then
        dmDados.tbCaixaSaida.Value := dmDados.tbCaixaSaida.Value + dbVal.Value
      else
        if (Tipo = 'V') then
          dmDados.tbCaixaVales.Value := dmDados.tbCaixaVales.Value + dbVal.Value
        else
          if (Tipo = 'E') then
            dmDados.tbCaixaReforco.Value := dmDados.tbCaixaReforco.Value + dbVal.Value;
    dmDados.tbCaixa.Post;
    {bot�es}
    BtnGravar.enabled   := False;
    BtnCancelar.Enabled := False;
    BtnNovo.Enabled     := True ;
    BtnPrimeiro.Enabled := True ;
    BtnAnterior.Enabled := True ;
    BtnProximo.Enabled  := True ;
    BtnUltimo.Enabled   := True ;
    BtnAlterar.Enabled  := True ;
    Btndeletar.Enabled  := True ;
    {componentes}
    dbDataLan.Enabled   := False;
    dbHist.Enabled      := False;
    dbNumDoc.Enabled    := False;
    dbVal.Enabled       := False;
    dbTipoOp.Enabled    := False;
    //MsgDlg.MsgInformation('Dados gravados com sucesso!');
    Panel3.SetFocus;
    end
  else
    if Vazio then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbDataLan.SetFocus;
      end;
end;

procedure TFrmLanCaixa.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbMovCaixa.Cancel;
  NovoItem            := False;
  btngravar.Enabled   := False;
  BtnCancelar.Enabled := False;
  BtnAlterar.Enabled  := True ;
  BtnDeletar.Enabled  := True ;
  BtnNovo.Enabled     := True ;
  {Habilitando os componentes}
  BtnPrimeiro.Enabled := True ;
  BtnAnterior.Enabled := True ;
  BtnProximo.Enabled  := True ;
  BtnUltimo.Enabled   := True ;
  BtnAlterar.Enabled  := True ;
  BtnDeletar.Enabled  := True ;
  {desabilitando os objetos}
  dbDataLan.Enabled   := False;
  dbHist.Enabled      := False;
  dbNumDoc.Enabled    := False;
  dbVal.Enabled       := False;
  dbTipoOp.Enabled    := False;
  dmDados.vTabStt     := True ;
  Panel3.SetFocus;
end;

procedure TFrmLanCaixa.btnAlterarClick(Sender: TObject);
begin
  if dmdados.tbMovCaixa.RecordCount=0 then
    MsgDlg.MsgError('Tabela sem registro')
  else
    begin
    novoitem:=true;
    dmdados.tbMovCaixa.Edit;
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
    dbDataLan.Enabled   := True ;
    dbHist.Enabled      := True ;
    dbNumDoc.Enabled    := True ;
    dbVal.Enabled       := True ;
    dbTipoOp.Enabled    := True ;
    dmDados.vTabStt:=False;
    DBDataLan.SetFocus;
    end;
end;

procedure TFrmLanCaixa.btnDeletarClick(Sender: TObject);
begin
  If dmDados.tbMovCaixa.RecordCount=0 Then
    MsgDlg.MsgError('Tabela vazia!!!')
  Else
    if Application.MessageBox('Deseja realmente excluir o registro?','Aten��o !',MB_YESNO + MB_DEFBUTTON2 + MB_ICONEXCLAMATION) = IDYES then
       DMdados.tbMovCaixa.Delete;
end;

procedure TFrmLanCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmLanCaixa.FormKeyDown(Sender: TObject; var Key: Word;
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
      VK_F2     : BtnLocalizar.Click;
    end;
end;

procedure TFrmLanCaixa.dbHistExit(Sender: TObject);
begin
  Panel3.SetFocus;
end;

end.
