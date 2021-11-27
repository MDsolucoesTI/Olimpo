//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2002
// Sistema...........: Ceres - Controle de Cheques
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitConsultaCPF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SpeedBar, jpeg, StdCtrls, DBCtrls, CurrEdit, RXDBCtrl, ToolEdit, Mask,
  Spin, fcButton, fcImgBtn, RackCtls, RXSplit, ExtCtrls, SRColBtn, RXCtrls,
  Grids, DBGrids, EnhEdit, DB, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint, RxGrdCpt, TFlatSplitterUnit, fcImager,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmConsultaCPF = class(TForm)
    RxGradientCaption1: TRxGradientCaption;
    LMDBackPanel2: TLMDBackPanel;
    fcImager4: TfcImager;
    Image3: TImage;
    RxLabel1: TRxLabel;
    LMDBackPanel1: TLMDBackPanel;
    fcImager3: TfcImager;
    edctotal: TCurrencyEdit;
    edqtde: TEnhancedEdit;
    lbCPF: TRxLabel;
    mskcpf: TMaskEdit;
    RxLabel12: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel2: TRxLabel;
    ednome: TEdit;
    RxDBGridcpf: TRxDBGrid;
    edrestricao: TEdit;
    RxLabel5: TRxLabel;
    fclLocCli: TfcImageBtn;
    mskcnpj: TMaskEdit;
    lbCNPJ: TRxLabel;
    cbtipo: TComboBox;
    Panel3: TLMDBackPanel;
    fcImager1: TfcImager;
    btnSair: TfcImageBtn;
    Bevel1: TBevel;
    procedure BtnSairClick(Sender: TObject);
    procedure fclLocCliClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mskcpfExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnconsultaClick(Sender: TObject);
    procedure mskcnpjExit(Sender: TObject);
    procedure cbtipoChange(Sender: TObject);
    procedure cbtipoExit(Sender: TObject);
    procedure cbtipoEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ednomeExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultaCPF: TFrmConsultaCPF;
  Cons : boolean;

implementation

uses unitDmDados, unitLocCliente, UnitPrincipal;

{$R *.DFM}

procedure TFrmConsultaCPF.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TFrmConsultaCPF.fclLocCliClick(Sender: TObject);
begin
  if cbtipo.Text='Pessoa F�sica'then
    begin
    dmdados.tbCliente.Filtered:=false;
    dmdados.tbCliente.Filter:='(CPF <> '''+''+''')';
    dmdados.tbCliente.Filtered:=true;
    frmLocCliente:=tfrmLocCliente.create(application);
    frmLocCliente.showmodal;
    mskcpf.Text:=frmlocCliente.cpf;
    ednome.Text:=frmLocCliente.Nome;
    edrestricao.Text:=frmLocCliente.Restricao;
    frmLocCliente.free;
    dmdados.tbCliente.Filtered:=false;
    end
  else
    begin
    dmdados.tbCliente.Filtered:=false;
    dmdados.tbCliente.Filter:='(CNPJ <> '''+''+''')';
    dmdados.tbCliente.Filtered:=true;
    frmLocCliente:=tfrmLocCliente.create(application);
    frmLocCliente.showmodal;
    mskcnpj.Text:=frmlocCliente.cnpj;
    ednome.Text:=frmLocCliente.Nome;
    edrestricao.Text:=frmLocCliente.Restricao;
    frmLocCliente.free;
    dmdados.tbCliente.Filtered:=false;
    end;
end;


procedure TFrmConsultaCPF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.statusteclas(False,'');
  dmdados.tbCliente.Close;
  dmdados.tbCheque.Close;
	Action:= CAfree;
end;

procedure TFrmConsultaCPF.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmConsultaCPF.mskcpfExit(Sender: TObject);
var
  total : currency;
  codcli : integer;
begin
  if mskcpf.Text='   .   .   -  ' then
    begin
    ShowMessage('Obrigat�rio o CPF DO CLIENTE');
    mskcpf.SetFocus;
    end
  else
    begin
    if (dmdados.tbCliente.Locate('Cpf',mskcpf.text,[])) then
      begin
      codcli:=dmdados.tbClienteCodCli.Value;
      ednome.Text:=dmdados.tbClienteNome.Value;
      mskcpf.Text:=dmdados.tbClienteCPF.Value;
      edrestricao.Text:=dmdados.tbLibCreditoRestricao.Value;
      dmdados.tbCheque.Filtered:=False;
      dmdados.tbCheque.Filter:='(codcli    = '''+IntTostr(codcli)+''')and' +
                               '(Status = '''+'DEVOLVIDO'+''')';
      dmdados.tbCheque.Filtered:=True;
      edqtde.ValueInt:=dmdados.tbCheque.RecordCount;
      total:=0;
      dmdados.tbCheque.First;
      while not dmdados.tbCheque.Eof do
        begin
        total:=total+dmdados.tbChequeValor.Value;
        dmdados.tbCheque.Next;
        end;
      edctotal.Value:=total;
      end
    else
      begin
      ShowMessage('Cliente n�o cadastrado');
      mskcpf.SetFocus;
      end;
    dmdados.tbCliente.Filtered:=false;
    Panel3.SetFocus;
    end;
end;

procedure TFrmConsultaCPF.FormShow(Sender: TObject);
begin
  dmdados.tbCliente.Open;
  dmdados.tbCheque.Open;
  FrmPrincipal.StatusTeclas(True,'[F10] Localizar Cliente [Esc] Sair');
  cbtipo.SetFocus;
end;

procedure TFrmConsultaCPF.btnconsultaClick(Sender: TObject);
begin
  cons:=true;
  mskcpf.Enabled:=true;
end;

procedure TFrmConsultaCPF.mskcnpjExit(Sender: TObject);
var
  total : currency;
  codcli : integer;
begin
  if mskCnpj.Text='' then
    begin
    ShowMessage('Obrigat�rio o CNPJ DO CLIENTE');
    mskCnpj.SetFocus;
    end
  else
    begin
    if (dmdados.tbCliente.Locate('Cnpj',mskcnpj.text,[])) then
      begin
      codcli:=dmdados.tbClienteCodCli.Value;
      ednome.Text:=dmdados.tbClienteNome.Value;
      mskcnpj.Text:=dmdados.tbClienteCNPJ.Value;
      edrestricao.Text:=dmdados.tbLibCreditoRestricao.Value;
      dmdados.tbCheque.Filtered:=False;
      dmdados.tbCheque.Filter:='(codcli    = '''+IntTostr(codcli)+''')and' +
                               '(Status = '''+'DEVOLVIDO'+''')';
      dmdados.tbCheque.Filtered:=True;
      edqtde.ValueInt:=dmdados.tbCheque.RecordCount;
      total:=0;
      dmdados.tbCheque.First;
      while not dmdados.tbCheque.Eof do
        begin
        total:=total+dmdados.tbChequeValor.Value;
        dmdados.tbCheque.Next;
        end;
      edctotal.Value:=total;
      end
    else
      begin
      ShowMessage('Cliente n�o cadastrado');
      mskCnpj.SetFocus;
      end;
    dmdados.tbCliente.Filtered:=false;
    Panel3.SetFocus;
    end;
end;

procedure TFrmConsultaCPF.cbtipoChange(Sender: TObject);
begin
  if cbtipo.Text='Pessoa F�sica'then
    begin
    lbCPF.Visible:=true;
    mskCPF.Visible:=true;
    lbCNPJ.Visible:=false;
    mskCNPJ.Visible:=false;
    end
  else
    begin
    lbCNPJ.Visible:=true;
    mskCNPJ.Visible:=true;
    lbCPF.Visible:=false;
    mskCPF.Visible:=false;
    end;
end;

procedure TFrmConsultaCPF.cbtipoExit(Sender: TObject);
begin
  if cbtipo.Text=''then
    begin
    ShowMessage('Obrigat�rio informar o TIPO DE PESSOA a consultar');
    cbtipo.SetFocus;
    end
end;

procedure TFrmConsultaCPF.cbtipoEnter(Sender: TObject);
begin
  dmdados.tbCheque.Filtered:=false;
end;

procedure TFrmConsultaCPF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : if dmDados.vTabStt then BtnSair.Click;
      VK_F10     : fclLocCli.Click;
    end;
end;

procedure TFrmConsultaCPF.ednomeExit(Sender: TObject);
begin
  Panel3.SetFocus;
end;

end.
