//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnirFechCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, StdCtrls, Mask, ToolEdit, RxLookup,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDShapeHint,
  jpeg, ExtCtrls, RackCtls, RXCtrls;

type
  TFrmFechCaixa = class(TForm)
    Panel1: TPanel;
    RxLabel6: TRxLabel;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    RxLabel4: TRxLabel;
    Panel2: TPanel;
    Image2: TImage;
    Label2: TLabel;
    LMDShapeHint1: TLMDShapeHint;
    Panel3: TPanel;
    cmblkCC: TRxLookupEdit;
    RxLabel3: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    btnConfirmar: TfcImageBtn;
    edtDtIni: TDateEdit;
    edtDtFim: TDateEdit;
    procedure cmblkCCExit(Sender: TObject);
    procedure cmblkCCEnter(Sender: TObject);
    procedure edtDtIniEnter(Sender: TObject);
    procedure edtDtIniExit(Sender: TObject);
    procedure edtDtFimEnter(Sender: TObject);
    procedure edtDtFimExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFechCaixa: TFrmFechCaixa;
  NovoItem : boolean;

implementation

uses unitDmDados;

{$R *.dfm}

procedure TFrmFechCaixa.cmblkCCExit(Sender: TObject);
begin
  (Sender as TRXLookupEdit).Color:=clwindow;
end;

procedure TFrmFechCaixa.cmblkCCEnter(Sender: TObject);
begin
  (Sender as TRXLookupEdit).Color:=$00D2E2FF;
end;

procedure TFrmFechCaixa.edtDtIniEnter(Sender: TObject);
begin
  (Sender as TDateEdit).color:=$00d2e2ff;
end;

procedure TFrmFechCaixa.edtDtIniExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If edtDtIni.Text= '  /  /    ' then
      Begin
      ShowMessage('� obrigat�rio a DATA INICIAL');
      edtDtIni.SetFocus;
      End
    Else
      (Sender as TDateEdit).color:=clWindow;
    End
  Else
    (Sender as TDateEdit).color:=clWindow;
end;

procedure TFrmFechCaixa.edtDtFimEnter(Sender: TObject);
begin
  (Sender as TDateEdit).color:=$00d2e2ff;
end;

procedure TFrmFechCaixa.edtDtFimExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If edtDtIni.Text= '  /  /    ' then
      Begin
      ShowMessage('� obrigat�rio a DATA FINAL');
      edtDtIni.SetFocus;
      End
    Else
      (Sender as TDateEdit).color:=clWindow;
    End
  Else
    (Sender as TDateEdit).color:=clWindow;
end;

procedure TFrmFechCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmFechCaixa.FormShow(Sender: TObject);
begin
  NovoItem:=True;
end;

procedure TFrmFechCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFrmFechCaixa.btnConfirmarClick(Sender: TObject);
var
  SaldoMov : Real;
begin
  with dmDados do
    begin
    TbCCorrente.Locate('Conta',cmblkCC.Text,[]);
    TbMovConta.Filtered:=False;
    TbMovConta.Filter:='(DataMov >='''+'edtDtIni.Text'+''') and'+
                       '(DataMov <='''+'edtDtFim.Text'+''') and' +
                       '(Conta = '''+'cmblkCC.Text'+''')';
    TbMovConta.Filtered:=True;
    TbMovConta.Locate('CodHist',2,[]);
    SaldoMov:=TbMovContaValor.Value;
    TbMovConta.First;
    while Not TbMovConta.Eof do
      begin
      if (TbMovContaCodHist.Value<>1)and(TbMovContaCodHist.Value<>2) then
        if TbMovContaTipoOper.Value='E' then
          SaldoMov:=SaldoMov+TbMovContaValor.Value
        else
          SaldoMov:=SaldoMov-TbMovContaValor.Value;
      TbMovConta.Next;
      end;
    TbMovConta.Filtered:=False;
    //Lan�a a transfer�ncia de saldo para o dia seguinte
    TbMovConta.Append;
    TbMovContaTipoOper.Value:='S';
    TbMovContaNumAgencia.Value:=TbCCorrenteNumAgencia.Value;
    TbMovContaConta.Value:=dmdados.TbCCorrenteConta.Value;
    TbMovContaCodHist.Value:=1;
    TbMovContaComplHist.Value:='FECHAMENTO DA CONTA';
    TbMovContaDataMov.Value:=edtDtFim.Date;
    TbMovContaValor.Value:=SaldoMov;
    TbMovContaDataReg.Value:=Now;
    TbMovContaHoraReg.Value:=StrToTime('23:59:59');
    TbMovConta.Post;
    TbMovConta.Filtered:=False;
    //Registra a entrado do Saldo ref. transfer�cnia do dia anterior
    TbMovConta.Append;
    TbMovContaTipoOper.Value:='E';
    TbMovContaNumAgencia.Value:=TbCCorrenteNumAgencia.Value;
    TbMovContaConta.Value:=dmdados.TbCCorrenteConta.Value;
    TbMovContaCodHist.Value:=2;
    TbMovContaComplHist.Value:='FECHAMENTO DA CONTA';
    TbMovContaDataMov.Value:=edtDtFim.Date+1;
    TbMovContaValor.Value:=SaldoMov;
    TbMovContaDataReg.Value:=Now;
    TbMovContaHoraReg.Value:=StrToTime('00:00:00');
    TbMovConta.Post;
    //Atualiza informa��o de movimento da C.Corrente
    TbCCorrente.Edit;
    TbCCorrenteUltMov.Value:=edtDtFim.Date+1;
    TbCCorrenteHoraMov.Value:=StrToTime('00:00:00');
    end;
    close;
end;

end.
