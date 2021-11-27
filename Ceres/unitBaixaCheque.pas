//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2002
// Sistema...........: Ceres - Controle de Cheques
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitBaixaCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolEdit, RXDBCtrl, Grids, DBGrids, SpeedBar, jpeg, ExtCtrls, StdCtrls,
  RackCtls, Mask, DBCtrls, RXCtrls, fcButton, fcImgBtn, RXSplit, CurrEdit,
  EnhEdit, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  LMDShapeHint, RxLookup, DB, DBTables, RxGrdCpt, TFlatSplitterUnit,
  fcImager, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmBaixaCheque = class(TForm)
    RxGradientCaption1: TRxGradientCaption;
    LMDBackPanel2: TLMDBackPanel;
    fcImager2: TfcImager;
    Image1: TImage;
    RxLabel4: TRxLabel;
    LMDBackPanel1: TLMDBackPanel;
    fcImager4: TfcImager;
    lbcodcusto: TRxLabel;
    lbcusto: TRxLabel;
    edcodigo: TEdit;
    btnLocCli: TfcImageBtn;
    ednome: TEdit;
    RxLabel1: TRxLabel;
    edBanco: TRxLookupEdit;
    Edit1: TEdit;
    RxLabel2: TRxLabel;
    data1: TDateEdit;
    RxLabel5: TRxLabel;
    data2: TDateEdit;
    Bevel1: TBevel;
    DBGridCheque: TDBGrid;
    RxLabel3: TRxLabel;
    edcTotal: TCurrencyEdit;
    Panel3: TLMDBackPanel;
    fcImager1: TfcImager;
    btnBuscar: TfcImageBtn;
    btnBaixa: TfcImageBtn;
    btnSair: TfcImageBtn;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnLocCliClick(Sender: TObject);
    procedure edcodigoExit(Sender: TObject);
    procedure data1Exit(Sender: TObject);
    procedure data2Exit(Sender: TObject);
    procedure btnBaixaClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edBancoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridChequeCellClick(Column: TColumn);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure fcImageBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBaixaCheque: TFrmBaixaCheque;
     
implementation

uses unitDmDados, unitLocCliente, UnitPrincipal;

{$R *.DFM}

procedure TFrmBaixaCheque.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TFrmBaixaCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.statusteclas(False,'');
  dmdados.tbCheque.Filtered:=false;
  dmdados.tbCheque.Close;
  Action:= Cafree;
end;

procedure TFrmBaixaCheque.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmBaixaCheque.btnLocCliClick(Sender: TObject);
begin
  frmLocCliente:=tfrmLocCliente.create(application);
  frmLocCliente.showmodal;
  edCodigo.text:=IntToStr(frmLocCliente.resultado);
  ednome.Text:=frmLocCliente.Nome;
  frmLocCliente.free;
end;

procedure TFrmBaixaCheque.btnBuscarClick(Sender: TObject);
begin

  dmdados.tbCheque.Filtered:=False;
  dmdados.tbCheque.Filter:='(codcli = '''+edcodigo.Text+''')and' +
                           '(NumBanco  = '''+edit1.text +''')and' +
                           '(Vencimento >= '''+data1.Text+''')and' +
                           '(Vencimento <= '''+data2.Text+''')and' +
                           '(Status = '''+'ABERTO'+''')';
  dmdados.tbCheque.Filtered:=True;
  btnBaixa.Enabled:=true;
end;

procedure TFrmBaixaCheque.edcodigoExit(Sender: TObject);
begin
  if edcodigo.Text='' then
    begin
    ShowMessage('Obrigat�rio o c�digo do cliente');
    edcodigo.SetFocus;
    end
  else
    if dmdados.tbCliente.Locate('Codcli',edcodigo.text,[]) then
      ednome.Text:=dmdados.tbClienteNome.Value
    else
      begin
      ShowMessage('Cliente n�o cadastrado');
      edcodigo.SetFocus;
      end;
end;

procedure TFrmBaixaCheque.data1Exit(Sender: TObject);
begin
  If data1.Text= '  /  /    ' then
    Begin
    ShowMessage('� obrigat�rio a DATA INICIAL');
    DATA1.SetFocus;
    End
end;

procedure TFrmBaixaCheque.data2Exit(Sender: TObject);
begin
  If data2.Text= '  /  /    ' then
    Begin
    ShowMessage('� obrigat�rio a DATA FINAL');
    DATA2.SetFocus;
    End
  Else
    btnBuscar.Enabled:=true;
Panel3.SetFocus;
end;

procedure TFrmBaixaCheque.btnBaixaClick(Sender: TObject);
var
  PosReg:array[1..20] of integer;
  c,c1 : integer;
begin
  dmdados.tbCheque.First;
  c:=0;
  While not dmdados.tbCheque.Eof do
    begin
    if DBGridCheque.SelectedRows.IndexOf(dmdados.tbCheque.BookMark) >= 0 then
        begin
        c:=c+1;
        PosReg[c]:=dmDados.tbCheque.RecNo;
        end;
    dmdados.tbCheque.Next;
    end;
  For c1:=1 to c do
    begin
    dmdados.tbCheque.RecNo:=PosReg[c1];
    dmdados.tbCheque.edit;
    dmdados.tbChequeStatus.Value:='PAGO';
    dmdados.tbCheque.Post;
    end;
  btnBaixa.Enabled:=false;
  btnBuscar.Enabled:=false;
  dmdados.tbCheque.Filtered:=False;
  data1.Clear;
  data2.Clear;
  edNome.Clear;
  edCodigo.Clear;
  edcodigo.SetFocus;
end;

procedure TFrmBaixaCheque.FormShow(Sender: TObject);
begin
  dmdados.tbCheque.Open;
  FrmPrincipal.StatusTeclas(True,'[F10] Localizar Cliente [F11] Buscar Cheque [F12] Baixa [Esc] Sair');
  edcodigo.SetFocus;
end;

procedure TFrmBaixaCheque.edBancoExit(Sender: TObject);
begin
  If edBanco.Text= '' then
    Begin
    ShowMessage('� obrigat�rio o NOME DO BANCO');
    edBanco.SetFocus;
    End
  Else
    If Not(dmDados.tbBanco.Locate('NomeBanco',edBanco.Text,[])) Then
      Begin
      Showmessage('BANCO n�o Cadastrado');
      edBanco.SetFocus;
      End
    Else
      edit1.Text:=dmdados.tbBancoNumBanco.Value;
end;

procedure TFrmBaixaCheque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE  : BtnSair.Click;
      VK_F10     : btnLocCli.Click;
      VK_F11     : btnBuscar.Click;
      Vk_F12     : btnBaixa.Click;
    end;
end;

procedure TFrmBaixaCheque.DBGridChequeCellClick(Column: TColumn);
var
  i : Integer;
  Tabela: TTable;
begin
  edctotal.Value:=0;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbCheque.DatabaseName;
  Tabela.TableName := dmDados.tbCheque.TableName;
  Tabela.IndexName := dmdados.tbCheque.IndexName;
  Tabela.FieldDefs := dmdados.tbCheque.FieldDefs;
  Tabela.Open;
  if DBGridCheque.SelectedRows.Count>0 then
    for i:=0 to DBGridCheque.SelectedRows.Count-1 do
      begin
      Tabela.GotoBookmark(pointer(DBGridCheque.SelectedRows.Items[i]));
      edctotal.Value:=edctotal.value+Tabela.FieldValues['Valor'];
      end;
end;

procedure TFrmBaixaCheque.btnAlterarClick(Sender: TObject);
begin
  dmdados.tbCheque.Filtered:=False;
  dmdados.tbCheque.Filter:='(codcli = '''+edcodigo.Text+''')and' +
                           '(NumBanco  = '''+edit1.text +''')and' +
                           '(Vencimento >= '''+data1.Text+''')and' +
                           '(Vencimento <= '''+data2.Text+''')and' +
                           '(Status = '''+'ABERTO'+''')';
  dmdados.tbCheque.Filtered:=True;
  btnBaixa.Enabled:=true;
end;

procedure TFrmBaixaCheque.btnDeletarClick(Sender: TObject);
var
  PosReg:array[1..20] of integer;
  c,c1 : integer;
begin
  dmdados.tbCheque.First;
  c:=0;
  While not dmdados.tbCheque.Eof do
    begin
    if DBGridCheque.SelectedRows.IndexOf(dmdados.tbCheque.BookMark) >= 0 then
        begin
        c:=c+1;
        PosReg[c]:=dmDados.tbCheque.RecNo;
        end;
    dmdados.tbCheque.Next;
    end;
  For c1:=1 to c do
    begin
    dmdados.tbCheque.RecNo:=PosReg[c1];
    dmdados.tbCheque.edit;
    dmdados.tbChequeStatus.Value:='PAGO';
    dmdados.tbCheque.Post;
    end;
  btnBaixa.Enabled:=false;
  btnBuscar.Enabled:=false;
  dmdados.tbCheque.Filtered:=False;
  data1.Clear;
  data2.Clear;
  edNome.Clear;
  edCodigo.Clear;
  edctotal.Value:=0;
  edcodigo.SetFocus;

end;

procedure TFrmBaixaCheque.fcImageBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
