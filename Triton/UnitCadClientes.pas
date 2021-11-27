//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCadClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VerCPF, VerCNPJ, fcButton, fcImgBtn, ToolEdit, RXDBCtrl,
  RXSplit, RxLookup, StdCtrls, DBCtrls, Mask, DCStdCtrls,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDShapeHint,
  SpeedBar, jpeg, RXCtrls, ExtCtrls, RackCtls, DBTables, DB, ShellAPI;

type
  TFrmCadCliente = class(TForm)
    Panel1: TPanel;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    RxLabel4: TRxLabel;
    Panel2: TPanel;
    Image2: TImage;
    Label2: TLabel;
    LMDShapeHint1: TLMDShapeHint;
    DCPageControl1: TDCPageControl;
    DCPage1: TDCPage;
    DCPage3: TDCPage;
    lbcod: TRxLabel;
    DBECod: TDBEdit;
    lctipopessoa: TRxLabel;
    DBCBoxTipo: TDBComboBox;
    lbrota: TRxLabel;
    dblookRota: TRxDBLookupCombo;
    RxLabel1: TRxLabel;
    dbprazo: TDBEdit;
    RxSplitter1: TRxSplitter;
    lbtel1: TRxLabel;
    DBEtel1: TDBEdit;
    lbtel2: TRxLabel;
    DBETel2: TDBEdit;
    lbcelular: TRxLabel;
    DBEcel: TDBEdit;
    RxLabelcnpj: TRxLabel;
    DBEcnpj: TDBEdit;
    RxLabelcpf: TRxLabel;
    DBEcpf: TDBEdit;
    RxLabelie: TRxLabel;
    DBEie: TDBEdit;
    RxLabelrg: TRxLabel;
    DBErg: TDBEdit;
    VerCNPJ1: TVerCNPJ;
    VerCPF1: TVerCPF;
    dbfantasia: TDBEdit;
    LabelRaz: TRxLabel;
    DBEnome: TDBEdit;
    rxLabelNasc: TRxLabel;
    dbdEdtNasc: TDBDateEdit;
    RxSplitter4: TRxSplitter;
    RxSplitter5: TRxSplitter;
    RxLabel2: TRxLabel;
    DBEend: TDBEdit;
    RxLabel3: TRxLabel;
    DBEnum: TDBEdit;
    RxLabel5: TRxLabel;
    DBEcompl: TDBEdit;
    RxLabel6: TRxLabel;
    DBEbairro: TDBEdit;
    RxLabel7: TRxLabel;
    DBEcidade: TDBEdit;
    RxLabel8: TRxLabel;
    DBEcep: TDBEdit;
    RxLabel9: TRxLabel;
    DBCBoxUF: TDBComboBox;
    RxSplitter2: TRxSplitter;
    RxLabel10: TRxLabel;
    DBEemail: TDBEdit;
    fcImageBtn2: TfcImageBtn;
    RxLabel11: TRxLabel;
    DbDateEditCad: TDBDateEdit;
    btnCredito: TfcImageBtn;
    DBMemoInfo: TDBMemo;
    labelFan: TRxLabel;
    dbNome: TDBEdit;
    LabelNome: TRxLabel;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnPrimeiro: TSpeedItem;
    BtnAnterior: TSpeedItem;
    BtnProximo: TSpeedItem;
    BtnUltimo: TSpeedItem;
    BtnNovo: TSpeedItem;
    BtnGravar: TSpeedItem;
    BtnCancelar: TSpeedItem;
    BtnAlterar: TSpeedItem;
    BtnDeletar: TSpeedItem;
    BtnLocalizar: TSpeedItem;
    BtnSair: TSpeedItem;
    procedure DBEemailExit(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure DBCBoxTipoChange(Sender: TObject);
    procedure DBCBoxTipoEnter(Sender: TObject);
    procedure DBCBoxTipoExit(Sender: TObject);
    procedure dblookRotaEnter(Sender: TObject);
    procedure dblookRotaExit(Sender: TObject);
    procedure dbprazoEnter(Sender: TObject);
    procedure dbprazoExit(Sender: TObject);
    procedure dbfantasiaEnter(Sender: TObject);
    procedure dbfantasiaExit(Sender: TObject);
    procedure DBEnomeEnter(Sender: TObject);
    procedure DBEnomeExit(Sender: TObject);
    procedure dbdEdtNascEnter(Sender: TObject);
    procedure dbdEdtNascExit(Sender: TObject);
    procedure DBEtel1Enter(Sender: TObject);
    procedure DBEtel1Exit(Sender: TObject);
    procedure DBETel2Enter(Sender: TObject);
    procedure DBETel2Exit(Sender: TObject);
    procedure DBEcelEnter(Sender: TObject);
    procedure DBEcelExit(Sender: TObject);
    procedure DBEcpfEnter(Sender: TObject);
    procedure DBEcpfExit(Sender: TObject);
    procedure DBEcnpjEnter(Sender: TObject);
    procedure DBEcnpjExit(Sender: TObject);
    procedure DBErgEnter(Sender: TObject);
    procedure DBErgExit(Sender: TObject);
    procedure DBEieEnter(Sender: TObject);
    procedure DBEieExit(Sender: TObject);
    procedure DBEendEnter(Sender: TObject);
    procedure DBEendExit(Sender: TObject);
    procedure DBEnumEnter(Sender: TObject);
    procedure DBEnumExit(Sender: TObject);
    procedure DBEcomplEnter(Sender: TObject);
    procedure DBEcomplExit(Sender: TObject);
    procedure DBEbairroEnter(Sender: TObject);
    procedure DBEbairroExit(Sender: TObject);
    procedure DBEcidadeEnter(Sender: TObject);
    procedure DBEcidadeExit(Sender: TObject);
    procedure DBEcepEnter(Sender: TObject);
    procedure DBEcepExit(Sender: TObject);
    procedure DBCBoxUFEnter(Sender: TObject);
    procedure DBCBoxUFExit(Sender: TObject);
    procedure DBEemailEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCreditoClick(Sender: TObject);
    procedure dbNomeEnter(Sender: TObject);
    procedure dbNomeExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fcImageBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadCliente: TFrmCadCliente;
  NovoItem: Boolean;

implementation

uses unitDmDados, unitPrincipal, unitLibCredito, unitLocCliente;

{$R *.dfm}

procedure TFrmCadCliente.DBEemailExit(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=clwindow;
  dcPageControl1.ActivePage:=dcPage3;
end;

procedure TFrmCadCliente.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbCliente.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If (DBCBoxTipo.Text='1 - Pessoa F�sica') Or (DBCBoxTipo.Text='1') then
    Begin
    dbfantasia.Visible:= False;
    Labelfan.Visible:= False;
    dbeNome.Visible:= False;
    LabelRaz.Visible:= False;
    dbeCnpj.visible:= false;
    dbeIE.visible:= false;
    RxLabelcnpj.visible:= false;
    RxLabelie.visible:= false;
    dbNome.Visible:= True;
    Labelnome.Visible:= True;
    dbeCpf.visible:= true;
    dbeRg.visible:= true;
    Rxlabelcpf.visible:= true;
    RxlabelRg.visible:= true;
    dbdEdtNasc.Visible:= True;
    RxLabelNasc.Visible:= True;
    end
  else
    Begin
    dbfantasia.Visible:= True;
    labelfan.Visible:= True;
    dbeNome.Visible:= True;
    labelRaz.Visible:=True;
    dbeCnpj.visible:= true;
    RxlabelCnpj.visible:= true;
    dbeIE.visible:= true;
    Rxlabelie.visible:= true;
    dbNome.Visible:=False;
    LabelNome.Visible:=false;
    dbeRg.visible:= false;
    dbeCpf.visible:= false;
    RxlabelRg.visible:= false;
    RxlabelCpf.visible:= false;
    dbdEdtNasc.Visible:= false;
    RxLabelNasc.Visible:= false;
    end;
end;

procedure TFrmCadCliente.DBEemailEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCadCliente.FormKeyDown(Sender: TObject; var Key: Word;
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
      VK_F2     : btnCredito.Click;
      VK_F9     : btnLocalizar.Click;
    end;
end;

procedure TFrmCadCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmCadCliente.btnCreditoClick(Sender: TObject);
begin
  FrmLibCred:= TFrmlibCred.Create(application);
  FrmLibCred.Showmodal;
end;

procedure TFrmCadCliente.DBErgEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCadCliente.DBErgExit(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=clwindow;
end;

procedure TFrmCadCliente.DBEieEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCadCliente.DBEieExit(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=clwindow;
end;

procedure TFrmCadCliente.DBEendEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCadCliente.DBEendExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBEend.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Endere�o');
      DBEend.SetFocus;
      End
    Else
      (Sender as TDbEdit).color:=clWindow;
    End
  Else
    (Sender as TDbEdit).color:=clWindow;
end;

procedure TFrmCadCliente.DBEnumEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCadCliente.DBEnumExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBEnum.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o N�mero');
      DBEnum.SetFocus;
      End
    Else
      (Sender as TDbEdit).color:=clWindow;
    End
  Else
    (Sender as TDbEdit).color:=clWindow;
end;

procedure TFrmCadCliente.DBEcomplEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCadCliente.DBEcomplExit(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=clWindow;
end;

procedure TFrmCadCliente.DBEbairroEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCadCliente.DBEbairroExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBEbairro.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Bairro');
      DBEbairro.SetFocus;
      End
    Else
      (Sender as TDBEdit).color:=clWindow;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmCadCliente.DBEcidadeEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCadCliente.DBEcidadeExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBEcidade.Text= '' then
      Begin
      ShowMessage('� obrigat�rio a Cidade');
      DBEcidade.SetFocus;
      End
    Else
      (Sender as TDBEdit).color:=clWindow;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmCadCliente.DBEcepEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCadCliente.DBEcepExit(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=clwindow;
end;

procedure TFrmCadCliente.DBCBoxUFEnter(Sender: TObject);
begin
  (Sender as TDbComboBox).Color:=$00D2E2FF;
end;

procedure TFrmCadCliente.DBCBoxUFExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If NovoItem Then
    Begin
    If DBCBoxUF.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar ESTADO');
      DBCBoxUF.SetFocus;
      End
    Else
      Begin
      Flag:=True;
      For x:=0 to DBCboxUF.Items.Count-1 Do
        If DBCboxUF.Text=DBCboxUF.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('ESTADO inv�lido');
        DBCboxUF.SetFocus;
        End
      Else
        (Sender as TDBComboBox).color:=clWindow;
      End;
    End
  Else
    (Sender as TDBComboBox).color:=clWindow;
end;

procedure TFrmCadCliente.BtnLocalizarClick(Sender: TObject);
begin
  FrmLocClientes:=TFrmLocClientes.Create(Application);
  FrmLocClientes.showmodal;
  FrmLocClientes.Free;
  If (dbcBoxTipo.Text='1 - Pessoa F�sica') Or (dbcBoxTipo.Text='1') then
  Begin
    dbeCnpj.visible:= false;
    dbeIE.visible:= false;
    RxLabelcnpj.visible:= false;
    RxLabelie.visible:= false;
    dbdEdtNasc.visible:= True;
    RxlabelNasc.visible:= True;
    dbeCpf.visible:= true;
    dbeRg.visible:= true;
    Rxlabelcpf.visible:= true;
    RxlabelRg.visible:= true;
end
else
  Begin
    dbeCnpj.visible:= true;
    RxlabelCnpj.visible:= true;
    dbeIE.visible:= true;
    Rxlabelie.visible:= true;
    dbeRg.visible:= false;
    dbeCpf.visible:= false;
    dbdEdtNasc.visible:= false;
    RxlabelNasc.visible:= false;
    RxlabelRg.visible:= false;
    RxlabelCpf.visible:= false;
  end;
end;

procedure TFrmCadCliente.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadCliente.DBCBoxTipoChange(Sender: TObject);
begin
  If (dbcBoxTipo.Text='1 - Pessoa F�sica') Or (dbcBoxTipo.Text='1') then
    begin
    dbfantasia.Visible:= False;
    Labelfan.Visible:= False;
    dbeNome.Visible:= False;
    LabelRaz.Visible:= False;
    dbeCnpj.visible:= false;
    dbeIE.visible:= false;
    RxLabelcnpj.visible:= false;
    RxLabelie.visible:= false;
    dbNome.Visible:= True;
    Labelnome.Visible:= True;
    dbeCpf.visible:= true;
    dbeRg.visible:= true;
    Rxlabelcpf.visible:= true;
    RxlabelRg.visible:= true;
    dbdEdtNasc.Visible:= True;
    RxLabelNasc.Visible:= True;
    end
  else
    Begin
    dbfantasia.Visible:= True;
    labelfan.Visible:= True;
    dbeNome.Visible:= True;
    labelRaz.Visible:=True;
    dbeCnpj.visible:= true;
    RxlabelCnpj.visible:= true;
    dbeIE.visible:= true;
    Rxlabelie.visible:= true;
    dbNome.Visible:=False;
    LabelNome.Visible:=false;
    dbeRg.visible:= false;
    dbeCpf.visible:= false;
    RxlabelRg.visible:= false;
    RxlabelCpf.visible:= false;
    dbdEdtNasc.Visible:= false;
    RxLabelNasc.Visible:= false;
    end;
end;

procedure TFrmCadCliente.DBCBoxTipoEnter(Sender: TObject);
begin
  (Sender as TDbComboBox).Color:=$00D2E2FF;
end;

procedure TFrmCadCliente.DBCBoxTipoExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If NovoItem Then
    Begin
    If dbCBoxTipo.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar o TIPO DE PESSOA');
      dbCBoxTipo.SetFocus;
      End
    Else
      Begin
      Flag:=True;
      For x:=0 to dbCBoxTipo.Items.Count-1 Do
        If dbCBoxTipo.Text=dbCBoxTipo.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor do TIPO DE PESSOA inv�lido');
        dbCBoxTipo.SetFocus;
        End
      Else
        (Sender as TDBComboBox).color:=clWindow;
      End;
    End
  Else
    (Sender as TDBComboBox).color:=clWindow;
end;

procedure TFrmCadCliente.dblookRotaEnter(Sender: TObject);
begin
  (Sender as TRxDBLookupCombo).Color:=$00D2E2FF;
end;

procedure TFrmCadCliente.dblookRotaExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dblookRota.Text= '' then
      Begin
      ShowMessage('� obrigat�rio a ROTA');
      dblookRota.SetFocus;
      End
    Else
      (Sender as TRxDBLookupCombo).color:=clWindow;
    End
  Else
    (Sender as TRxDBLookupCombo).color:=clWindow;
end;

procedure TFrmCadCliente.dbprazoEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCadCliente.dbprazoExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbprazo.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o PRAZO PAGAMENTO');
      dbprazo.SetFocus;
      End
    Else
      (Sender as TDBEdit).color:=clWindow;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmCadCliente.dbfantasiaEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCadCliente.dbfantasiaExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbfantasia.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o PRAZO PAGAMENTO');
      dbfantasia.SetFocus;
      End
    Else
      (Sender as TDBEdit).color:=clWindow;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmCadCliente.DBEnomeEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCadCliente.DBEnomeExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBEnome.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o PRAZO PAGAMENTO');
      DBEnome.SetFocus;
      End
    Else
      (Sender as TDBEdit).color:=clWindow;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmCadCliente.dbdEdtNascEnter(Sender: TObject);
begin
  (Sender as TDbDateEdit).Color:=$00D2E2FF;
end;

procedure TFrmCadCliente.dbdEdtNascExit(Sender: TObject);
begin
  (Sender as TDBDateEdit).color:=clWindow;
end;

procedure TFrmCadCliente.DBEtel1Enter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCadCliente.DBEtel1Exit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBEtel1.Text= '           ' then
      Begin
      ShowMessage('� obrigat�rio o TELEFONE');
      DBEtel1.SetFocus;
      End
    Else
      (Sender as TDBEdit).color:=clWindow;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmCadCliente.DBETel2Enter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCadCliente.DBETel2Exit(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=clwindow;
end;

procedure TFrmCadCliente.DBEcelEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCadCliente.DBEcelExit(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=clwindow;
end;

procedure TFrmCadCliente.DBEcpfEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCadCliente.DBEcpfExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbCliente.DatabaseName;
  Tabela.TableName := dmDados.TbCliente.TableName;
  Tabela.IndexName := dmdados.tbCliente.IndexName;
  Tabela.Open;
  If NovoItem Then
    If dbeCPF.Text = '           ' Then
      Begin
      ShowMessage('� necess�rio Informar o CPF');
      dbeCPF.setfocus;
      end
    else
      Begin
      VerCPF1.NumeroCPF:= dbecpf.text;
      If not VerCpf1.valid Then
        Begin
        Showmessage('CPF inv�lido');
        dbecpf.Clear;
        dbecpf.setfocus;
        End
      Else
        Begin
        If Tabela.Locate('CPF',dbeCPF.Text,[]) Then
          If (DmDados.tbCliente.State=dsEdit) And (dmDados.tbCliente.RecNo = Tabela.RecNo) Then
            (Sender as TDbEdit).Color:=clwindow
          Else
            Begin
            Showmessage('CPF j� Cadastrado');
            dbecpf.Clear;
            dbecpf.setfocus;
            End
        Else
          (Sender as TDbEdit).Color:=clwindow;
        End;
      End
  Else
    (Sender as TDbEdit).Color:=clwindow;
  Tabela.Free;
end;

procedure TFrmCadCliente.DBEcnpjEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCadCliente.DBEcnpjExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbCliente.DatabaseName;
  Tabela.TableName := dmDados.TbCliente.TableName;
  Tabela.IndexName := dmdados.tbCliente.IndexName;
  Tabela.Open;
  If NovoItem Then
    If dbecnpj.Text = '              ' Then
      Begin
      ShowMessage('� necess�rio Informar o CNPJ');
      dbecnpj.setfocus;
      end
    Else
      Begin
      VerCnpj1.NumCnpj:= dbecnpj.text;
      If not VerCnpj1.valid Then
        Begin
        Showmessage('CNPJ inv�lido');
        dbecnpj.Clear;
        dbecnpj.setfocus;
        End
      Else
        Begin
        If Tabela.Locate('CNPJ',dbeCnpj.Text,[]) Then
          If (DmDados.tbCliente.State=dsEdit) And (dmDados.tbCliente.RecNo = Tabela.RecNo) Then
            (Sender as TDbEdit).Color:=clwindow
          Else
            Begin
            Showmessage('CNPJ j� Cadastrado');
            dbecnpj.Clear;
            dbecnpj.setfocus;
            End;
        End;
      End
  Else
    (Sender as TDbEdit).Color:=clwindow;
    (Sender as TDbEdit).Color:=clwindow;
  Tabela.Free;
end;

procedure TFrmCadCliente.BtnCancelarClick(Sender: TObject);
begin
  dmdados.tbCliente.cancel;
  NovoItem:= False;
  BtnGravar.enabled := false;
  BtnCancelar.Enabled := false;
  BtnNovo.Enabled:=True;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  Btnproximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  BtnLocalizar.Enabled:=True;
  {desabilitando os componentes}
  dbCBoxTipo.Enabled:=false;
  Dbenome.Enabled:=false;
  dbNome.Enabled:=false;
  dblookrota.Enabled:=false;
  dbprazo.Enabled:=false;
  dbfantasia.Enabled:=false;
  DbDedtnasc.Enabled:=false;
  DbeTel1.Enabled:=false;
  dbeTel2.Enabled:=false;
  dbecel.Enabled:=false;
  dbecpf.Enabled:=false;
  dberg.Enabled:=false;
  dbeEnd.Enabled:=false;
  dbenum.Enabled:=false;
  Dbecompl.Enabled:=false;
  DbeBairro.Enabled:=false;
  dbeCidade.Enabled:=false;
  dbecep.Enabled:=false;
  dbcBoxUF.Enabled:=false;
  dbeemail.Enabled:=false;
  DbDateEditCad.enabled:=false;
  DbMemoInfo.Enabled:=false;
  dmDados.vTabStt:=True;
  DCPageControl1.ActivePage:=DCPage1;
  speedbar1.SetFocus;
end;

procedure TFrmCadCliente.BtnAlterarClick(Sender: TObject);
begin
  dmdados.tbCliente.Edit;
  NovoItem:= True;
  {habilitando os bot�es}
  BtnCancelar.enabled:= true;
  BtnGravar.Enabled:= true;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  Btndeletar.Enabled:=False;
  BtnLocalizar.Enabled:=False;
  {habilitando os componentes}
  dbCBoxTipo.Enabled:=True;
  Dbenome.Enabled:=True;
  dbNome.Enabled:= True;
  dblookrota.Enabled:=true;
  dbprazo.Enabled:=true;
  dbfantasia.Enabled:=true;
  DbDedtnasc.Enabled:=True;
  DbeTel1.Enabled:=True;
  dbeTel2.Enabled:=True;
  dbecel.Enabled:=True;
  dbecpf.Enabled:=True;
  dberg.Enabled:=True;
  dbecnpj.Enabled:=True;
  dbeie.Enabled:=True;
  dbeEnd.Enabled:=True;
  dbenum.Enabled:=True;
  Dbecompl.Enabled:=True;
  DbeBairro.Enabled:=True;
  dbeCidade.Enabled:=True;
  dbecep.Enabled:=True;
  DBCBoxUF.Enabled:=True;
  dbeemail.Enabled:=True;
  DbDateEditCad.enabled:=True;
  DbMemoInfo.Enabled:=True;
  dmDados.vTabStt:=False;
  dbCBoxTipo.SetFocus;
end;

procedure TFrmCadCliente.BtnDeletarClick(Sender: TObject);
var
  Flag : Boolean;
begin
  Flag:=False;
  if dmdados.tbCliente.RecordCount=0 then
    begin
    ShowMessage('Tabela sem registro');
    end
  else
    If application.MessageBox('Tem certeza que deseja excluir este registro?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      Begin
      if dmDados.tbVendas.Locate('CodCli',dmDados.tbClienteCodCli.Value,[]) Then
        Flag:=True;
      if dmDados.tbCReceber.Locate('CodCli',dmDados.tbClienteCodCli.Value,[]) Then
        Flag:=True;
      if Flag Then
        ShowMessage('Cliente ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
      else
        dmdados.TbCliente.Delete;
        dmdados.tbCliente.Refresh;
      If (dbCBoxTipo.Text='1 - Pessoa F�sica') Or (dbcBoxTipo.Text='1') then
        Begin
        dbfantasia.Visible:= False;
        Labelfan.Visible:= False;
        dbeNome.Visible:= False;
        LabelRaz.Visible:= False;
        dbeCnpj.visible:= false;
        dbeIE.visible:= false;
        RxLabelcnpj.visible:= false;
        RxLabelie.visible:= false;
        dbNome.Visible:= True;
        Labelnome.Visible:= True;
        dbeCpf.visible:= true;
        dbeRg.visible:= true;
        Rxlabelcpf.visible:= true;
        RxlabelRg.visible:= true;
        dbdEdtNasc.Visible:= True;
        RxLabelNasc.Visible:= True;
        end
      else
        Begin
        dbfantasia.Visible:= True;
        labelfan.Visible:= True;
        dbeNome.Visible:= True;
        labelRaz.Visible:=True;
        dbeCnpj.visible:= true;
        RxlabelCnpj.visible:= true;
        dbeIE.visible:= true;
        Rxlabelie.visible:= true;
        dbNome.Visible:=False;
        LabelNome.Visible:=false;
        dbeRg.visible:= false;
        dbeCpf.visible:= false;
        RxlabelRg.visible:= false;
        RxlabelCpf.visible:= false;
        dbdEdtNasc.Visible:= false;
        RxLabelNasc.Visible:= false;
        end;
      End
    else
      dmdados.TbCliente.cancel;
end;

procedure TFrmCadCliente.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.tbCliente.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.TbCliente.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
  If (dbCboxTipo.Text='1 - Pessoa F�sica') Or (dbCboxTipo.Text='1') then
    Begin
    dbfantasia.Visible:= False;
    Labelfan.Visible:= False;
    dbeNome.Visible:= False;
    LabelRaz.Visible:= False;
    dbeCnpj.visible:= false;
    dbeIE.visible:= false;
    RxLabelcnpj.visible:= false;
    RxLabelie.visible:= false;
    dbNome.Visible:= True;
    Labelnome.Visible:= True;
    dbeCpf.visible:= true;
    dbeRg.visible:= true;
    Rxlabelcpf.visible:= true;
    RxlabelRg.visible:= true;
    dbdEdtNasc.Visible:= True;
    RxLabelNasc.Visible:= True;
    end
  else
    Begin
    dbfantasia.Visible:= True;
    labelfan.Visible:= True;
    dbeNome.Visible:= True;
    labelRaz.Visible:=True;
    dbeCnpj.visible:= true;
    RxlabelCnpj.visible:= true;
    dbeIE.visible:= true;
    Rxlabelie.visible:= true;
    dbNome.Visible:=False;
    LabelNome.Visible:=false;
    dbeRg.visible:= false;
    dbeCpf.visible:= false;
    RxlabelRg.visible:= false;
    RxlabelCpf.visible:= false;
    dbdEdtNasc.Visible:= false;
    RxLabelNasc.Visible:= false;
    end;
end;

procedure TFrmCadCliente.BtnProximoClick(Sender: TObject);
begin
 dmdados.tbCliente.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.TbCliente.Eof Then
  Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
  End;
  If (dbcBoxTipo.Text='1 - Pessoa F�sica') Or (dbcBoxTipo.Text='1') then
    Begin
    dbfantasia.Visible:= False;
    Labelfan.Visible:= False;
    dbeNome.Visible:= False;
    LabelRaz.Visible:= False;
    dbeCnpj.visible:= false;
    dbeIE.visible:= false;
    RxLabelcnpj.visible:= false;
    RxLabelie.visible:= false;
    dbNome.Visible:= True;
    Labelnome.Visible:= True;
    dbeCpf.visible:= true;
    dbeRg.visible:= true;
    Rxlabelcpf.visible:= true;
    RxlabelRg.visible:= true;
    dbdEdtNasc.Visible:= True;
    RxLabelNasc.Visible:= True;
    end
  else
    Begin
    dbfantasia.Visible:= True;
    labelfan.Visible:= True;
    dbeNome.Visible:= True;
    labelRaz.Visible:=True;
    dbeCnpj.visible:= true;
    RxlabelCnpj.visible:= true;
    dbeIE.visible:= true;
    Rxlabelie.visible:= true;
    dbNome.Visible:=False;
    LabelNome.Visible:=false;
    dbeRg.visible:= false;
    dbeCpf.visible:= false;
    RxlabelRg.visible:= false;
    RxlabelCpf.visible:= false;
    dbdEdtNasc.Visible:= false;
    RxLabelNasc.Visible:= false;
    end;
end;

procedure TFrmCadCliente.BtnUltimoClick(Sender: TObject);
begin
 dmdados.tbCliente.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  If (dbcBoxTipo.Text='1 - Pessoa F�sica') Or (dbcBoxTipo.Text='1') then
    Begin
    dbfantasia.Visible:= False;
    Labelfan.Visible:= False;
    dbeNome.Visible:= False;
    LabelRaz.Visible:= False;
    dbeCnpj.visible:= false;
    dbeIE.visible:= false;
    RxLabelcnpj.visible:= false;
    RxLabelie.visible:= false;
    dbNome.Visible:= True;
    Labelnome.Visible:= True;
    dbeCpf.visible:= true;
    dbeRg.visible:= true;
    Rxlabelcpf.visible:= true;
    RxlabelRg.visible:= true;
    dbdEdtNasc.Visible:= True;
    RxLabelNasc.Visible:= True;
    end
  else
    Begin
    dbfantasia.Visible:= True;
    labelfan.Visible:= True;
    dbeNome.Visible:= True;
    labelRaz.Visible:=True;
    dbeCnpj.visible:= true;
    RxlabelCnpj.visible:= true;
    dbeIE.visible:= true;
    Rxlabelie.visible:= true;
    dbNome.Visible:=False;
    LabelNome.Visible:=false;
    dbeRg.visible:= false;
    dbeCpf.visible:= false;
    RxlabelRg.visible:= false;
    RxlabelCpf.visible:= false;
    dbdEdtNasc.Visible:= false;
    RxLabelNasc.Visible:= false;
    end;
end;

procedure TFrmCadCliente.BtnNovoClick(Sender: TObject);
begin
  dmdados.tbCliente.Append;
  novoitem:=true;
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
  BtnLocalizar.Enabled:=False;
  {habilitando os componentes}
  If (dbcBoxTipo.Text='1 - Pessoa F�sica') Or (dbcBoxTipo.Text='1') then
    Begin
    dbfantasia.Visible:= False;
    Labelfan.Visible:= False;
    dbeNome.Visible:= False;
    LabelRaz.Visible:= False;
    dbeCnpj.visible:= false;
    dbeIE.visible:= false;
    RxLabelcnpj.visible:= false;
    RxLabelie.visible:= false;
    dbNome.Visible:= True;
    Labelnome.Visible:= True;
    dbeCpf.visible:= true;
    dbeRg.visible:= true;
    Rxlabelcpf.visible:= true;
    RxlabelRg.visible:= true;
    dbdEdtNasc.Visible:= True;
    RxLabelNasc.Visible:= True;
    end
  else
    Begin
    dbfantasia.Visible:= True;
    labelfan.Visible:= True;
    dbeNome.Visible:= True;
    labelRaz.Visible:=True;
    dbeCnpj.visible:= true;
    RxlabelCnpj.visible:= true;
    dbeIE.visible:= true;
    Rxlabelie.visible:= true;
    dbNome.Visible:=False;
    LabelNome.Visible:=false;
    dbeRg.visible:= false;
    dbeCpf.visible:= false;
    RxlabelRg.visible:= false;
    RxlabelCpf.visible:= false;
    dbdEdtNasc.Visible:= false;
    RxLabelNasc.Visible:= false;
    end;
  dbCBoxTipo.Enabled:=true;
  Dbenome.Enabled:=true;
  DbNome.Enabled:= True;
  dblookrota.Enabled:=true;
  dbprazo.Enabled:=true;
  dbfantasia.Enabled:=true;
  DbDedtnasc.Enabled:=true;
  DbeTel1.Enabled:=true;
  dbeTel2.Enabled:=true;
  dbecel.Enabled:=true;
  dbecpf.Enabled:=true;
  dbecnpj.Enabled:=true;
  dberg.Enabled:=true;
  dbeie.Enabled:=true;
  dbeEnd.Enabled:=true;
  dbenum.Enabled:=true;
  Dbecompl.Enabled:=true;
  DbeBairro.Enabled:=true;
  dbeCidade.Enabled:=true;
  dbecep.Enabled:=true;
  DBCBoxUF.Enabled:=true;
  dbeemail.Enabled:=true;
  DbMemoInfo.Enabled:=true;
  dmDados.vTabStt:=False;
  dcPageControl1.ActivePage:=dcPage1;
  DbcBoxTipo.setfocus;
end;

procedure TFrmCadCliente.BtnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar,Flag:Boolean;
  Tabela: TTable;
  x:integer;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbCliente.DatabaseName;
  Tabela.TableName := dmDados.TbCliente.TableName;
  Tabela.IndexName := dmdados.tbCliente.IndexName;
  Tabela.Open;
  If (dbCBoxTipo.Text='1 - Pessoa F�sica') or (dbCboxTipo.Text='1') Then
    Begin
    If dbNome.Text='' Then
      Begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:='Nome';
      Gravar:=False;
      Vazio:=True;
      end;
    {If dbprazo.Text='' Then
      Begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:='Prazo pagamento';
      Gravar:=False;
      Vazio:=True;
      end;}
    If dbeCpf.Text<>'           ' Then
      Begin
      VerCPF1.NumeroCPF:= dbecpf.text;
      If not VerCpf1.valid Then
        Begin
        Showmessage('CPF inv�lido');
        Gravar:=False;
        End
      Else
        Begin
        If Tabela.Locate('CPF',dbeCPF.Text,[]) Then
          If not((DmDados.tbCliente.State=dsEdit) And (dmDados.tbCliente.RecNo = Tabela.RecNo)) Then
            Begin
            Gravar:=False;
            End
        End;
      End;
    If DBEcidade.Text= '' then
      begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:=Campos+'Cidade';
      Gravar:=False;
      Vazio:=True;
    end;
    If DBEbairro.Text= '' then
      begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:=Campos+'Bairro';
      Gravar:=False;
      Vazio:=True;
    end;
    If DBEnum.Text= '' then
      begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:=Campos+'N�mero';
      Gravar:=False;
      Vazio:=True;
    end;
    If DBEend.Text= '' then
      begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:=Campos+'Endere�o';
      Gravar:=False;
      Vazio:=True;
    end;
    If DBEtel1.Text= '          ' then
      begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:=Campos+'Telefone 1';
      Gravar:=False;
      Vazio:=True;
    end;
    If DBCBoxUF.Text= '' then
      begin
      If Length(Campos)>0 Then
    	  Campos:=Campos+', ';
      Campos:=Campos+'Estado';
      Gravar:=False;
      Vazio:=True;
      End
    Else
      Begin
      Flag:=True;
      For x:=0 to DBCBoxUF.Items.Count-1 Do
        If DBCBoxUF.Text=DBCBoxUF.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor da UF inv�lido');
        Gravar:=False;
        End;
      End;
    If dbCBoxTipo.Text= '' then
      begin
      If Length(Campos)>0 Then
    	  Campos:=Campos+', ';
      Campos:=Campos+'Tipo de Pessoa';
      Gravar:=False;
      Vazio:=True;
      End
    Else
      Begin
      Flag:=True;
      For x:=0 to dbCBoxTipo.Items.Count-1 Do
        If dbCBoxTipo.Text=dbCBoxTipo.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor do TIPO DE PESSOA inv�lido');
        Gravar:=False;
        End;
      End;
    {If dblookRota.Text='' Then
      begin
      If Length(Campos)>0 Then
    	  Campos:=Campos+', ';
      Campos:=Campos+'Rota';
      Gravar:=False;
      Vazio:=True;
      End;}
    End
  Else
    Begin
    {If dbprazo.Text='' Then
      Begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:='Prazo pagamento';
      Gravar:=False;
      Vazio:=True;
      end;}
    If dbfantasia.Text='' Then
      Begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:=' Nome Fantasia ';
      Gravar:=False;
      Vazio:=True;
      end;
    If dbeNome.Text='' Then
      Begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:=' Raz�o Social ';
      Gravar:=False;
      Vazio:=True;
      End;
    If dbeCNPJ.Text<>'              ' Then
      Begin
      VerCnpj1.NumCnpj:= dbecnpj.text;
      If not VerCnpj1.valid Then
        Begin
        Showmessage('CNPJ inv�lido');
        Gravar:=False;
        End
      Else
        Begin
        If Tabela.Locate('CNPJ',dbeCnpj.Text,[]) Then
          If Not((DmDados.tbCliente.State=dsEdit) And (dmDados.tbCliente.RecNo = Tabela.RecNo)) Then
            Begin
            Gravar:=False;
            End;
        End;
      end;
    If DBEcidade.Text= '' then
      begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:=Campos+'Cidade';
      Gravar:=False;
      Vazio:=True;
    end;
    If DBEbairro.Text= '' then
      begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:=Campos+'Bairro';
      Gravar:=False;
      Vazio:=True;
    end;
    If DBEnum.Text= '' then
      begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:=Campos+'N�mero';
      Gravar:=False;
      Vazio:=True;
    end;
    If DBEend.Text= '' then
      begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:=Campos+'Endere�o';
      Gravar:=False;
      Vazio:=True;
    end;
    If DBEtel1.Text= '          ' then
      begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:=Campos+'Telefone 1';
      Gravar:=False;
      Vazio:=True;
    end;
    If DBCBoxUF.Text= '' then
      begin
      If Length(Campos)>0 Then
    	  Campos:=Campos+', ';
      Campos:=Campos+'Estado';
      Gravar:=False;
      Vazio:=True;
      End
    Else
      Begin
      Flag:=True;
      For x:=0 to DBCBoxUF.Items.Count-1 Do
        If DBCBoxUF.Text=DBCBoxUF.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor da UF inv�lido');
        Gravar:=False;
        End;
      End;
    If dbCBoxTipo.Text= '' then
      begin
      If Length(Campos)>0 Then
    	  Campos:=Campos+', ';
      Campos:=Campos+'Tipo de Pessoa';
      Gravar:=False;
      Vazio:=True;
      End
    Else
      Begin
      Flag:=True;
      For x:=0 to dbCBoxTipo.Items.Count-1 Do
        If dbCBoxTipo.Text=dbCBoxTipo.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor do TIPO DE PESSOA inv�lido');
        Gravar:=False;
        End;
      End;
    {If dblookRota.Text='' Then
      begin
      If Length(Campos)>0 Then
    	  Campos:=Campos+', ';
      Campos:=Campos+'Rota';
      Gravar:=False;
      Vazio:=True;
      End;}
    End;
  If Gravar Then
    Begin
    NovoItem:= False;
    dmdados.tbCliente.Post;
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
    BtnLocalizar.Enabled:=True;
    {desabilitando os componentes}
    dbCBoxTipo.Enabled:=false;
    Dbenome.Enabled:=false;
    DbNome.Enabled:= false;
    dblookrota.Enabled:=false;
    dbprazo.Enabled:=false;
    dbfantasia.Enabled:=false;
    DbDedtnasc.Enabled:=false;
    DbeTel1.Enabled:=false;
    dbeTel2.Enabled:=false;
    dbecel.Enabled:=false;
    dbecpf.Enabled:=false;
    dberg.Enabled:=false;
    dbeEnd.Enabled:=false;
    dbenum.Enabled:=false;
    Dbecompl.Enabled:=false;
    DbeBairro.Enabled:=false;
    dbeCidade.Enabled:=false;
    dbecep.Enabled:=false;
    dbcBoxUF.Enabled:=false;
    dbeemail.Enabled:=false;
    DbDateEditCad.enabled:=false;
    DbMemoInfo.Enabled:=false;
    showmessage('Dados gravados com sucesso!');
    dcPageControl1.ActivePage:=dcPage1;
    SpeedBar1.SetFocus;
    If (dbcBoxTipo.Text='1 - Pessoa F�sica') Or (dbcBoxTipo.Text='1') then
      Begin
      dbfantasia.Visible:= False;
      Labelfan.Visible:= False;
      dbeNome.Visible:= False;
      LabelRaz.Visible:= False;
      dbeCnpj.visible:= false;
      dbeIE.visible:= false;
      RxLabelcnpj.visible:= false;
      RxLabelie.visible:= false;
      dbNome.Visible:= True;
      Labelnome.Visible:= True;
      dbeCpf.visible:= true;
      dbeRg.visible:= true;
      Rxlabelcpf.visible:= true;
      RxlabelRg.visible:= true;
      dbdEdtNasc.Visible:= True;
      RxLabelNasc.Visible:= True;
      end
    else
      Begin
      dbfantasia.Visible:= True;
      labelfan.Visible:= True;
      dbeNome.Visible:= True;
      labelRaz.Visible:=True;
      dbeCnpj.visible:= true;
      RxlabelCnpj.visible:= true;
      dbeIE.visible:= true;
      Rxlabelie.visible:= true;
      dbNome.Visible:=False;
      LabelNome.Visible:=false;
      dbeRg.visible:= false;
      dbeCpf.visible:= false;
      RxlabelRg.visible:= false;
      RxlabelCpf.visible:= false;
      dbdEdtNasc.Visible:= false;
      RxLabelNasc.Visible:= false;
      end;
    End
  Else
    Begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dcPageControl1.ActivePage:=dcPage1;
    If (dbcBoxTipo.Text='1 - Pessoa F�sica') Or (dbcBoxTipo.Text='1') then
      dbNome.SetFocus
    else
      dbfantasia.SetFocus;
    end;
end;

procedure TFrmCadCliente.dbNomeEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCadCliente.dbNomeExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbNome.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Nome');
      dbNome.SetFocus;
      End
    Else
      (Sender as TDBEdit).color:=clWindow;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmCadCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  Action:= Cafree;
end;

procedure TFrmCadCliente.fcImageBtn2Click(Sender: TObject);
var
 url : string;
begin
  url :='mailto:'+dmdados.tbClienteEMail.Value;
  shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;

end.
