//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
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
  RxLookup, DB, DBTables, DbUtils;

type
  TFrmMovCaixa = class(TForm)
    Panel1: TPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    dbCod: TDBEdit;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    RxLabel4: TRxLabel;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnPrimeiro: TSpeedItem;
    BtnAnterior: TSpeedItem;
    BtnProximo: TSpeedItem;
    BtnUltimo: TSpeedItem;
    BtnNovo: TSpeedItem;
    BtnCancelar: TSpeedItem;
    BtnAlterar: TSpeedItem;
    BtnDeletar: TSpeedItem;
    BtnSair: TSpeedItem;
    DBGridBanco: TDBGrid;
    Panel2: TPanel;
    Image2: TImage;
    Label2: TLabel;
    LMDShapeHint1: TLMDShapeHint;
    RxLabel3: TRxLabel;
    dbBanco: TDBEdit;
    cmbCcorr: TRxDBLookupCombo;
    cmbTipoOp: TRxDBComboBox;
    RxLabel8: TRxLabel;
    RxLabel5: TRxLabel;
    cmbLkHist: TRxDBLookupCombo;
    RxLabel7: TRxLabel;
    RxLabel6: TRxLabel;
    Panel3: TPanel;
    RxLabel10: TRxLabel;
    dbNumDoc: TDBEdit;
    RxLabel9: TRxLabel;
    dbHora: TDBEdit;
    RxLabel12: TRxLabel;
    RxLabel11: TRxLabel;
    dbData: TDBDateEdit;
    RxLabel13: TRxLabel;
    dbValor: TRxDBCalcEdit;
    cmbLkCCusto: TRxDBLookupCombo;
    dbComplHist: TDBEdit;
    btnGravar: TSpeedItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure cmbCcorrEnter(Sender: TObject);
    procedure cmbCcorrExit(Sender: TObject);
    procedure dbBancoEnter(Sender: TObject);
    procedure dbBancoExit(Sender: TObject);
    procedure cmbTipoOpEnter(Sender: TObject);
    procedure cmbTipoOpExit(Sender: TObject);
    procedure cmbLkHistEnter(Sender: TObject);
    procedure cmbLkHistExit(Sender: TObject);
    procedure dbComplHistEnter(Sender: TObject);
    procedure dbComplHistExit(Sender: TObject);
    procedure cmbLkCCustoEnter(Sender: TObject);
    procedure cmbLkCCustoExit(Sender: TObject);
    procedure dbNumDocEnter(Sender: TObject);
    procedure dbNumDocExit(Sender: TObject);
    procedure dbValorEnter(Sender: TObject);
    procedure dbValorExit(Sender: TObject);
    procedure dbHoraEnter(Sender: TObject);
    procedure dbHoraExit(Sender: TObject);
    procedure dbDataEnter(Sender: TObject);
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMovCaixa: TFrmMovCaixa;
  NovoItem: Boolean;

implementation

uses unitDmDados;

{$R *.dfm}

procedure TFrmMovCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= Cafree;
end;

procedure TFrmMovCaixa.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMovCaixa.cmbCcorrEnter(Sender: TObject);
begin
(Sender as TRxDBLookupCombo).Color:=$00D2E2FF;
end;

procedure TFrmMovCaixa.cmbCcorrExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If cmbCcorr.Text= '' then
      Begin
      ShowMessage('� obrigat�rio a CONTA CORRENTE');
      cmbCcorr.SetFocus;
      End
    Else
      (Sender as TRxDBLookupCombo).color:=clWindow;
    End
  Else
    (Sender as TRxDBLookupCombo).color:=clWindow;
end;

procedure TFrmMovCaixa.dbBancoEnter(Sender: TObject);
begin
(Sender as TDBEdit).Color:=$00D2E2FF;
end;

procedure TFrmMovCaixa.dbBancoExit(Sender: TObject);
begin
(Sender as TDBEdit).Color:=clwindow;
end;

procedure TFrmMovCaixa.cmbTipoOpEnter(Sender: TObject);
begin
(Sender as TRxDBComboBox).Color:=$00D2E2FF;
end;

procedure TFrmMovCaixa.cmbTipoOpExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If cmbTipoOp.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Tipo de Opera��o!');
      cmbTipoOp.SetFocus;
      End
    Else
      (Sender as TRxDBComboBox).color:=clWindow;
    End
  Else
    (Sender as TRxDBComboBox).color:=clWindow;
end;

procedure TFrmMovCaixa.cmbLkHistEnter(Sender: TObject);
begin
(Sender as TRxDBLookupCombo).Color:=$00D2E2FF;
end;

procedure TFrmMovCaixa.cmbLkHistExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If cmbLkHist.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Hist�rico');
      cmbLkHist.SetFocus;
      End
    Else
      (Sender as TRxDBLookupCombo).color:=clWindow;
    End
  Else
    (Sender as TRxDBLookupCombo).color:=clWindow;
end;

procedure TFrmMovCaixa.dbComplHistEnter(Sender: TObject);
begin
(Sender as TDBEdit).Color:=$00D2E2FF;
end;

procedure TFrmMovCaixa.dbComplHistExit(Sender: TObject);
begin
(Sender as TDBEdit).Color:=$00D2E2FF;
end;

procedure TFrmMovCaixa.cmbLkCCustoEnter(Sender: TObject);
begin
(Sender as TDBLookupComboBox).Color:=$00D2E2FF;
end;

procedure TFrmMovCaixa.cmbLkCCustoExit(Sender: TObject);
begin
(Sender as TDBLookupComboBox).Color:=clwindow;
end;

procedure TFrmMovCaixa.dbNumDocEnter(Sender: TObject);
begin
(Sender as TDBEdit).Color:=$00D2E2FF;
end;

procedure TFrmMovCaixa.dbNumDocExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If dbNumDoc.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o N.� DO DOCUMENTO!');
      dbNumDoc.SetFocus;
      End
    Else
      (Sender as TDBEdit).color:=clWindow;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmMovCaixa.dbValorEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).Color:=$00D2E2FF;
end;

procedure TFrmMovCaixa.dbValorExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If dbValor.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o VALOR!');
      dbValor.SetFocus;
      End
    Else
      (Sender as TRxDBCalcEdit).color:=clWindow;
    End
  Else
    (Sender as TRxDBCalcEdit).color:=clWindow;
end;

procedure TFrmMovCaixa.dbHoraEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color:=$00D2E2FF;
  dmDados.TbMovContaHoraReg.Value:=Now;
end;

procedure TFrmMovCaixa.dbHoraExit(Sender: TObject);
begin
(Sender as TDBEdit).Color:=clwindow;
end;

procedure TFrmMovCaixa.dbDataEnter(Sender: TObject);
begin
(Sender as TDBDateEdit).Color:=$00D2E2FF;
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
  NovoItem:= True;
  btnGravar.Enabled:=True;
  BtnCancelar.Enabled := True;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  BtnNovo.Enabled:=False;
  {Habilitando os Componentes}
  cmbCCorr.Enabled:= True;
  dbBanco.Enabled:=True;
  cmbTipoOp.Enabled:=True;
  cmbLkHist.Enabled:=True;
  dbComplHist.Enabled:= True;
  cmbLkCCusto.Enabled:=True;
  dbNumDoc.Enabled:=True;
  dbValor.Enabled:=True;
  cmbCCorr.SetFocus;
end;

procedure TFrmMovCaixa.BtnCancelarClick(Sender: TObject);
begin
  dmdados.TbMovConta .cancel;
  NovoItem:= False;
  btnGravar.Enabled:=false;
  BtnCancelar.Enabled := false;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  BtnNovo.Enabled:=True;
  //Desabilitando os componentes
  cmbCCorr.Enabled:= False;
  dbBanco.Enabled:=False;
  cmbTipoOp.Enabled:=False;
  cmbLkHist.Enabled:=False;
  dbComplHist.Enabled:= False;
  cmbLkCCusto.Enabled:=False;
  dbNumDoc.Enabled:=False;
  dbValor.Enabled:=False;
  SpeedBar1.SetFocus;
end;

procedure TFrmMovCaixa.BtnAlterarClick(Sender: TObject);
begin
if dmdados.TbMovConta.RecordCount=0 then
    begin
    ShowMessage('Tabela sem registro');
    end
  else
    begin
    novoitem:=true;
    dmdados.TbMovConta.Edit;
    {Habilitando os Bot�es}
    btnGravar.Enabled:=True;
    BtnCancelar.Enabled := True;
    BtnAlterar.Enabled:=False;
    BtnDeletar.Enabled:=False;
    BtnNovo.Enabled:=False;
    {Habilitando os Componentes}
    cmbCCorr.Enabled:= True;
    dbBanco.Enabled:=True;
    cmbTipoOp.Enabled:=True;
    cmbLkHist.Enabled:=True;
    dbComplHist.Enabled:= True;
    cmbLkCCusto.Enabled:=True;
    dbNumDoc.Enabled:=True;
    dbValor.Enabled:=True;
    cmbCCorr.SetFocus;
    end;
end;

procedure TFrmMovCaixa.BtnDeletarClick(Sender: TObject);
begin
if dmdados.TbMovConta.RecordCount=0 then
   begin
   ShowMessage('Tabela sem registro');
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
    If dbNumDoc.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Numero';
    Gravar:=False;
    Vazio:=True;
    End;

    If cmbCcorr.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Numero';
    Gravar:=False;
    Vazio:=True;
    end;

    If cmbLkHist.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Numero';
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
    If Gravar Then
        Begin
          DMDados.TbMovConta.Post;
          NovoItem:=False;
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
          SpeedBar1.SetFocus;
          {desabilitando os componentes}
          cmbCCorr.Enabled:= False;
          dbBanco.Enabled:=False;
          cmbTipoOp.Enabled:=False;
          cmbLkHist.Enabled:=False;
          dbComplHist.Enabled:= False;
          cmbLkCCusto.Enabled:=False;
          dbNumDoc.Enabled:=False;
          dbValor.Enabled:=False;
          SpeedBar1.SetFocus;
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

end.
