//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitMovCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  LMDShapeHint, StdCtrls, Grids, DBGrids, SpeedBar, jpeg, ExtCtrls,
  RackCtls, Mask, DBCtrls, RXCtrls, CurrEdit, RXDBCtrl, ToolEdit, RxDBComb,
  RxLookup, DB, DBTables, DbUtils, RxGrdCpt, RXSplit, fcButton, fcImgBtn,
  fcImager;

type
  TFrmMovCaixa = class(TForm)
    Panel1: TPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    dbCod: TDBEdit;
    DBGridBanco: TDBGrid;
    RxLabel3: TRxLabel;
    cmbCcorr: TRxDBLookupCombo;
    cmbTipoOp: TRxDBComboBox;
    RxLabel8: TRxLabel;
    RxLabel5: TRxLabel;
    cmbLkHist: TRxDBLookupCombo;
    RxLabel7: TRxLabel;
    dbComplHist: TDBEdit;
    RxLabel10: TRxLabel;
    dbNumDoc: TDBEdit;
    RxLabel12: TRxLabel;
    RxLabel9: TRxLabel;
    RxLabel11: TRxLabel;
    dbBanco: TDBEdit;
    dbDataMov: TDBDateEdit;
    Panel2: TPanel;
    RxLabel15: TRxLabel;
    Image1: TImage;
    RxSplitter1: TRxSplitter;
    dbValor: TRxDBCalcEdit;
    dbData: TDBDateEdit;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure cmbCcorrExit(Sender: TObject);
    procedure cmbTipoOpExit(Sender: TObject);
    procedure cmbLkHistExit(Sender: TObject);
    procedure dbNumDocExit(Sender: TObject);
    procedure dbValorExit(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dbDataMovExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMovCaixa: TFrmMovCaixa;
  NovoItem: Boolean;

implementation

uses unitDmDados, UnitPrincipal;

{$R *.dfm}

procedure TFrmMovCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  Action:= Cafree;
end;

procedure TFrmMovCaixa.BtnSairClick(Sender: TObject);
begin
  if (dmDados.TbMovConta.State=dsEdit) or (dmDados.TbMovConta.
           State=dsInsert) then
    dmDados.TbMovConta.Cancel;
  Close;
end;

procedure TFrmMovCaixa.cmbCcorrExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If cmbCcorr.Text= '' then
      Begin
      ShowMessage('� obrigat�rio a CONTA CORRENTE');
      cmbCcorr.SetFocus;
      End;
    end;
end;

procedure TFrmMovCaixa.cmbTipoOpExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If cmbTipoOp.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Tipo de Opera��o!');
      cmbTipoOp.SetFocus;
      End;
    end;
end;

procedure TFrmMovCaixa.cmbLkHistExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If cmbLkHist.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Hist�rico');
      cmbLkHist.SetFocus;
      End;
    end;
end;

procedure TFrmMovCaixa.dbNumDocExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If dbNumDoc.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o N.� DO DOCUMENTO!');
      dbNumDoc.SetFocus;
      End;
    end;
end;

procedure TFrmMovCaixa.dbValorExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If dbValor.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o VALOR!');
      dbValor.SetFocus;
      End;
    end;
end;

procedure TFrmMovCaixa.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.TbMovConta.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
end;

procedure TFrmMovCaixa.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.TbMovConta.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.TbMovConta.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
end;

procedure TFrmMovCaixa.BtnProximoClick(Sender: TObject);
begin
  dmdados.TbMovConta.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.TbMovConta.Eof Then
  Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
  End;
end;

procedure TFrmMovCaixa.BtnUltimoClick(Sender: TObject);
begin
  dmdados.TbMovConta.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
end;

procedure TFrmMovCaixa.BtnNovoClick(Sender: TObject);
begin
  dmdados.TbMovConta.append;
  dmdados.TbMovContaHoraReg.Value:=time;
  NovoItem:= True;
  dmdados.vTabStt:= False;
  btnGravar.Enabled:=True;
  BtnCancelar.Enabled := True;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  BtnNovo.Enabled:=False;
  {Habilitando os Componentes}
  dbDataMov.Enabled:=true;
  cmbCCorr.Enabled:= True;
  cmbTipoOp.Enabled:=True;
  cmbLkHist.Enabled:=True;
  dbComplHist.Enabled:= True;
  dbNumDoc.Enabled:=True;
  dbValor.Enabled:=True;
  cmbCCorr.SetFocus;
end;

procedure TFrmMovCaixa.BtnCancelarClick(Sender: TObject);
begin
  dmdados.TbMovConta.cancel;
  NovoItem:= False;
  dmdados.vTabStt:= True;
  btnGravar.Enabled:=false;
  BtnCancelar.Enabled := false;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  BtnNovo.Enabled:=True;
  //Desabilitando os componentes
  cmbCCorr.Enabled:= False;
  cmbTipoOp.Enabled:=False;
  cmbLkHist.Enabled:=False;
  dbComplHist.Enabled:= False;
  dbNumDoc.Enabled:=False;
  dbValor.Enabled:=False;
  dbDataMov.Enabled:=false;
  Panel4.SetFocus;
end;

procedure TFrmMovCaixa.BtnAlterarClick(Sender: TObject);
begin
if dmdados.TbMovConta.RecordCount=0 then
    begin
    ShowMessage('Tabela vazia');
    end
  else
    begin
    novoitem:=true;
    dmdados.vTabStt:= False;
    dmdados.TbMovConta.Edit;
    {Habilitando os Bot�es}
    btnGravar.Enabled:=True;
    BtnCancelar.Enabled := True;
    BtnAlterar.Enabled:=False;
    BtnDeletar.Enabled:=False;
    BtnNovo.Enabled:=False;
    {Habilitando os Componentes}
    cmbCCorr.Enabled:= True;
    cmbTipoOp.Enabled:=True;
    cmbLkHist.Enabled:=True;
    dbComplHist.Enabled:= True;
    dbNumDoc.Enabled:=True;
    dbValor.Enabled:=True;
    dbDataMov.Enabled:=true;
    cmbCCorr.SetFocus;
    end;
end;

procedure TFrmMovCaixa.BtnDeletarClick(Sender: TObject);
begin
if dmdados.TbMovConta.RecordCount=0 then
   begin
   ShowMessage('Tabela vazia');
   end
   else
   If application.MessageBox('Tem certeza que deseja exluir esse registro?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
   begin
    dmdados.TbMovConta.Delete;
   end
   else
   dmdados.TbMovConta.Cancel;
end;

procedure TFrmMovCaixa.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar,Flag:Boolean;
  x:Integer;
  Tabela: TTable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbMovConta.DatabaseName;
  Tabela.TableName := dmDados.TbMovConta.TableName;
  Tabela.Open;
  //Campo que n�o pode estar vazio
   { If dbNumDoc.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Numero';
    Gravar:=False;
    Vazio:=True;
    End;}

    If cmbCcorr.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'CC';
    Gravar:=False;
    Vazio:=True;
    end;

    If cmbLkHist.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Historico';
    Gravar:=False;
    Vazio:=True;
    End;
   //Campo Monet�rio que n�o pode estar vazio
   If dbValor.Text= '' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Valor';
    Gravar:=False;
    Vazio:=True;
    End;
  //Campos com uso de Combo
  If cmbTipoOp.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
      Campos:=Campos+'';
      Gravar:=False;
      Vazio:=True;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to cmbTipoOp.Items.Count-1 Do
      If cmbTipoOp.Text=cmbTipoOp.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor do Tipo de Opera��o inv�lido!');
      Gravar:=False;
      End;
    End;

    if (dbDataMov.text <> '  /  /    ') then
      try StrToDate(dbDataMov.text)
        except on EConvertError do
        begin
          ShowMessage('Data Inv�lida');
          gravar:=false;
        end;
      end;
    If Gravar Then
        Begin
          DMDados.TbMovConta.Post;
          NovoItem:=False;
          dmdados.vTabStt:= True;
          //Atualiza o saldo do c.corrente
          dmdados.TbCCorrente.Locate('Conta',cmbCcorr.Text,[]);
          dmdados.TbCCorrente.Edit;
          if cmbTipoOp.Text='E' then
            dmdados.TbCCorrenteSaldo.Value:=dmdados.TbCCorrenteSaldo.Value+dbValor.Value
          else
            dmdados.TbCCorrenteSaldo.Value:=dmdados.TbCCorrenteSaldo.Value-dbValor.Value;
          dmdados.TbCCorrenteUltMov.Value:=dmdados.TbMovContaDataMov.Value;
          dmDados.TbCCorrenteHoraMov.Value:=Now;
          dmdados.TbCCorrente.Post;
          //desabilita bot�es
          BtnGravar.Enabled:=False;
          BtnCancelar.Enabled:=False;
          BtnNovo.Enabled:=True;
          BtnPrimeiro.Enabled:=True;
          BtnAnterior.Enabled:=True;
          BtnProximo.Enabled:=True;
          BtnUltimo.Enabled:=True;
          BtnAlterar.Enabled:=True;
          Btndeletar.Enabled:=True;
          Panel4.SetFocus;
          {desabilitando os componentes}
          dbDataMov.Enabled:=false;
          cmbCCorr.Enabled:= False;
          cmbTipoOp.Enabled:=False;
          cmbLkHist.Enabled:=False;
          dbComplHist.Enabled:= False;
          dbNumDoc.Enabled:=False;
          dbValor.Enabled:=False;
          Panel4.SetFocus;
          ShowMessage ('Dados gravados com sucesso!');
        End
      Else
        Begin
          If Vazio Then
           ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
           cmbCcorr.SetFocus;
        end;
Tabela.Free;

end;

procedure TFrmMovCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmMovCaixa.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmMovCaixa.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
  if dmdados.TbMovConta.RecordCount=0 then
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

procedure TFrmMovCaixa.dbDataMovExit(Sender: TObject);
begin
    if (dbDataMov.text <> '  /  /    ') then
      try StrToDate(dbDataMov.text)
        except on EConvertError do
        begin
          ShowMessage('Data Inv�lida');
          dbDataMov.SetFocus;
        end;
      end;
end;

end.
