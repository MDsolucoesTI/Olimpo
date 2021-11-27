/////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Cadastro e Manuten��o de Clientes
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCadCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TFlatSplitterUnit, ToolEdit, RXDBCtrl, DBCtrls, EDBZero,
  StdCtrls, RxDBComb, Mask, RxGrdCpt, fcButton, fcImgBtn, VerCNPJ, VerCPF,
  RXCtrls, ExtCtrls, DbTables, DB, ShellApi, jpeg, fcImager, EMsgDlg,
  EUserAcs, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmCadCliente = class(TForm)
    VerCPF1: TVerCPF;
    VerCNPJ1: TVerCNPJ;
    MsgDlg: TEvMsgDlg;
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
    RxLabel4: TRxLabel;
    Image1: TImage;
    RxLabelrg: TRxLabel;
    rxLabelNasc: TRxLabel;
    RxLabelie: TRxLabel;
    RxLabelcpf: TRxLabel;
    RxLabelcnpj: TRxLabel;
    RxLabel9: TRxLabel;
    RxLabel8: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel11: TRxLabel;
    RxLabel10: TRxLabel;
    RxLabel1: TRxLabel;
    lctipopessoa: TRxLabel;
    lbtel2: TRxLabel;
    lbtel1: TRxLabel;
    lbcod: TRxLabel;
    lbcelular: TRxLabel;
    labelRaz: TRxLabel;
    labelNome: TRxLabel;
    labelFan: TRxLabel;
    btnEMail: TfcImageBtn;
    dbRaz: TDBEdit;
    dbNome: TDBEdit;
    dbFantasia: TDBEdit;
    DBETel2: TDBEdit;
    DBEtel1: TDBEdit;
    DBErg: TDBEdit;
    dbeNum: TEvDBZeroEdit;
    DBEie: TDBEdit;
    DBEend: TDBEdit;
    DBEemail: TDBEdit;
    DBEcpf: TDBEdit;
    DBEcompl: TDBEdit;
    DBECod: TDBEdit;
    DBEcnpj: TDBEdit;
    DBEcidade: TDBEdit;
    DBEcep: TDBEdit;
    DBEcel: TDBEdit;
    DBEbairro: TDBEdit;
    dbdEdtNasc: TDBDateEdit;
    DbDateEditCad: TDBDateEdit;
    DBCBoxUF: TDBComboBox;
    DBCBoxTipo: TRxDBComboBox;
    btnCredito: TfcImageBtn;
    btnLocalizar: TfcImageBtn;
    btnDepen: TfcImageBtn;
    LMDBackPanel2: TPanel;
    Panel3: TPanel;
    LMDBackPanel1: TPanel;
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure DBCBoxTipoChange(Sender: TObject);
    procedure DBCBoxTipoExit(Sender: TObject);
    procedure dbFantasiaExit(Sender: TObject);
    procedure dbRazExit(Sender: TObject);
    procedure dbNomeExit(Sender: TObject);
    procedure DBEcnpjExit(Sender: TObject);
    procedure DBEcpfExit(Sender: TObject);
    procedure DBEendExit(Sender: TObject);
    procedure dbeNumExit(Sender: TObject);
    procedure DBEbairroExit(Sender: TObject);
    procedure DBEcidadeExit(Sender: TObject);
    procedure DBCBoxUFExit(Sender: TObject);
    procedure DBEemailExit(Sender: TObject);
    procedure btnEMailClick(Sender: TObject);
    procedure btnCreditoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnDepenClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadCliente: TFrmCadCliente;
  NovoItem: Boolean;
  mudaPag:boolean;

implementation

uses unitDmDados, unitLocCliente, unitLibCredito, UnitPrincipal, untDepende;

{$R *.dfm}

procedure TFrmCadCliente.btnLocalizarClick(Sender: TObject);
begin
  FrmLocCliente:=TFrmLocCliente.Create(Application);
  FrmLocCliente.showmodal;
  FrmLocCliente.Free;
  If dmdados.tbClienteTipo.Value='1' then
    begin
    dbfantasia.Visible:= False;
    Labelfan.Visible:= False;
    dbRaz.Visible:= False;
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
    dbRaz.Visible:= True;
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

procedure TFrmCadCliente.btnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbCliente.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If (DBCBoxTipo.Text='Pessoa F�sica') then
    Begin
    dbfantasia.Visible:= False;
    Labelfan.Visible:= False;
    dbRaz.Visible:= False;
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
    dbRaz.Visible:= True;
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

procedure TFrmCadCliente.btnAnteriorClick(Sender: TObject);
begin
  dmdados.tbCliente.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.TbCliente.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
  If (dbCboxTipo.Text='Pessoa F�sica') then
    Begin
    dbfantasia.Visible:= False;
    Labelfan.Visible:= False;
    dbRaz.Visible:= False;
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
    dbRaz.Visible:= True;
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

procedure TFrmCadCliente.btnProximoClick(Sender: TObject);
begin
 dmdados.tbCliente.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.TbCliente.Eof Then
  Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
  End;
  If (dbcBoxTipo.Text='Pessoa F�sica') then
    Begin
    dbfantasia.Visible:= False;
    Labelfan.Visible:= False;
    dbRaz.Visible:= False;
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
    dbRaz.Visible:= True;
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

procedure TFrmCadCliente.btnUltimoClick(Sender: TObject);
begin
  dmdados.tbCliente.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  If (dbcBoxTipo.Text='Pessoa F�sica') then
    Begin
    dbfantasia.Visible:= False;
    Labelfan.Visible:= False;
    dbRaz.Visible:= False;
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
    dbRaz.Visible:= True;
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

procedure TFrmCadCliente.btnNovoClick(Sender: TObject);
begin
  dmdados.tbCliente.Append;
  NovoItem:=true;
  {habilitando os bot�es}
  BtnGravar.Enabled := true;
  BtnCancelar.Enabled:=true;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  btnDeletar.Enabled:=False;
  BtnLocalizar.Enabled:=False;
  {habilitando os componentes}
  If (dbcBoxTipo.Text='Pessoa F�sica') then
    Begin
    dbfantasia.Visible:= False;
    Labelfan.Visible:= False;
    dbRaz.Visible:= False;
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
    dbRaz.Visible:= True;
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
  dbRaz.Enabled:=true;
  DbNome.Enabled:= True;
//dblookrota.Enabled:=true;
//dbprazo.Enabled:=true;
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
  dmDados.vTabStt:=False;
  DbcBoxTipo.setfocus;
end;

procedure TFrmCadCliente.btnGravarClick(Sender: TObject);
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
  If (dbCBoxTipo.Text='Pessoa F�sica') Then
    Begin
    If dbNome.Text='' Then
      Begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:='Nome';
      Gravar:=False;
      Vazio:=True;
      end;
    If dbeCpf.Text<>'           ' Then
      Begin
      VerCPF1.NumeroCPF:= dbecpf.text;
      If not VerCpf1.valid Then
        MsgDlg.MsgError('CPF inv�lido');
      If Tabela.Locate('CPF',dbeCPF.Text,[]) Then
        If not((DmDados.tbCliente.State=dsEdit) And (dmDados.tbCliente.RecNo = Tabela.RecNo)) Then
          Begin
          Gravar:=False;
          MsgDlg.MsgWarning('CPF j� Cadastrado');
          end;
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
        MsgDlg.MsgError('Valor da UF inv�lido');
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
        MsgDlg.MsgError('Valor do TIPO DE PESSOA inv�lido');
        Gravar:=False;
        End;
      End;
    End
  Else
    Begin
    If dbfantasia.Text='' Then
      Begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:=' Nome Fantasia ';
      Gravar:=False;
      Vazio:=True;
      end;
    If dbRaz.Text='' Then
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
        MsgDlg.MsgError('CNPJ inv�lido');
      If Tabela.Locate('CNPJ',dbeCnpj.Text,[]) Then
        If Not((DmDados.tbCliente.State=dsEdit) And (dmDados.tbCliente.RecNo = Tabela.RecNo)) Then
          Begin
          Gravar:=False;
          MsgDlg.MsgWarning('CNPJ j� Cadastrado');
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
        MsgDlg.MsgError('Valor da UF inv�lido');
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
        MsgDlg.MsgError('Valor do TIPO DE PESSOA inv�lido');
        Gravar:=False;
        End;
      End;
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
    if (frmPrincipal.Acesso=1) or (frmPrincipal.Acesso=2) then
      BtnAlterar.Enabled:=True;
    if (frmPrincipal.Acesso=1) then
      Btndeletar.Enabled:=True;
    BtnLocalizar.Enabled:=True;
    {desabilitando os componentes}
    dbCBoxTipo.Enabled:=false;
    dbRaz.Enabled:=false;
    DbNome.Enabled:= false;
    //dblookrota.Enabled:=false;
    //dbprazo.Enabled:=false;
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
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    Panel3.SetFocus;
    If (dbcBoxTipo.Text='Pessoa F�sica') then
      Begin
      dbfantasia.Visible:= False;
      Labelfan.Visible:= False;
      dbRaz.Visible:= False;
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
      dbRaz.Visible:= True;
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
      begin
        mudaPag:=false;
        MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
        If (dbcBoxTipo.Text='Pessoa F�sica') then
           begin
            dbnome.Enabled:=true;
            dbNome.SetFocus;
           end
        else
           begin
           dbfantasia.SetFocus;
           end;
        mudapag:=true;   
      end;
    end;
end;

procedure TFrmCadCliente.btnCancelarClick(Sender: TObject);
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
  if (frmPrincipal.Acesso=1) or (frmPrincipal.Acesso=2) then
    BtnAlterar.Enabled:=True;
  if (frmPrincipal.Acesso=1) then
    Btndeletar.Enabled:=True;
  BtnLocalizar.Enabled:=True;
  {desabilitando os componentes}
  dbCBoxTipo.Enabled:=false;
  dbRaz.Enabled:=false;
  dbNome.Enabled:=false;
  //dblookrota.Enabled:=false;
  //dbprazo.Enabled:=false;
  dbfantasia.Enabled:=false;
  DbDedtnasc.Enabled:=false;
  DbeTel1.Enabled:=false;
  dbeTel2.Enabled:=false;
  dbecel.Enabled:=false;
  dbecpf.Enabled:=false;
  DBEcnpj.Enabled:= False;
  DBEie.Enabled:= False;
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
  dmDados.vTabStt:=True;
  Panel3.SetFocus;
end;

procedure TFrmCadCliente.btnAlterarClick(Sender: TObject);
begin
if dmdados.tbCliente.RecordCount=0 then
  begin
  MsgDlg.MsgError('Tabela vazia')
  end
else
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
  dbRaz.Enabled:=True;
  dbNome.Enabled:= True;
  //dblookrota.Enabled:=true;
  //dbprazo.Enabled:=true;
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
  dmDados.vTabStt:=False;
  dbCBoxTipo.SetFocus;
  end;
end;

procedure TFrmCadCliente.btnDeletarClick(Sender: TObject);
var
  Flag : Boolean;
begin
  Flag:=False;
  if dmdados.tbCliente.RecordCount=0 then
    begin
    MsgDlg.MsgError('Tabela vazia');
    end
  else
    If MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes then
      Begin
      if dmDados.tbVendas.Locate('CodCli',dmDados.tbClienteCodCli.Value,[]) Then
        Flag:=True;
      if dmDados.tbCReceber.Locate('CodCli',dmDados.tbClienteCodCli.Value,[]) Then
        Flag:=True;
      if dmDados.tbDepende.Locate('CodCli',dmDados.tbClienteCodCli.Value,[]) Then
        Flag:=True;
      if dmDados.tbLibCredito.Locate('CodCli',dmDados.tbClienteCodCli.Value,[]) Then
        Flag:=True;
      if Flag Then
        MsgDlg.MsgInformation('Cliente ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
      else
        dmdados.TbCliente.Delete;
      If (dbCBoxTipo.Text='Pessoa F�sica') then
        Begin
        dbfantasia.Visible:= False;
        Labelfan.Visible:= False;
        dbRaz.Visible:= False;
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
        dbRaz.Visible:= True;
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

procedure TFrmCadCliente.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadCliente.DBCBoxTipoChange(Sender: TObject);
begin
  If (dbcBoxTipo.Text='Pessoa F�sica') then
    begin
    dbfantasia.Visible:= False;
    Labelfan.Visible:= False;
    dbRaz.Visible:= False;
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
    dbRaz.Visible:= True;
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

procedure TFrmCadCliente.DBCBoxTipoExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If NovoItem Then
    If dbCBoxTipo.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio informar o TIPO DE PESSOA');
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
        MsgDlg.MsgError('Valor do TIPO DE PESSOA inv�lido');
        dbCBoxTipo.SetFocus;
        End;
      End;
end;

procedure TFrmCadCliente.dbFantasiaExit(Sender: TObject);
begin
  If NovoItem Then
    If dbfantasia.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o NOME FANTASIA');
      dbfantasia.SetFocus;
      End
end;

procedure TFrmCadCliente.dbRazExit(Sender: TObject);
begin
  If NovoItem Then
    If dbRaz.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o NOME OU RAZ�O SOCIAL');
      dbRaz.SetFocus;
      End
end;

procedure TFrmCadCliente.dbNomeExit(Sender: TObject);
begin
  If NovoItem Then
    If dbNome.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o Nome');
      dbNome.SetFocus;
      End;
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
      MsgDlg.MsgWarning('� necess�rio Informar o CNPJ');
      dbecnpj.setfocus;
      end
    Else
      Begin
      VerCnpj1.NumCnpj:= dbecnpj.text;
      If not VerCnpj1.valid Then
        if MsgDlg.MsgConfirmation('CNPJ inv�lido. Deseja continuar cadastro?') = id_no then
          begin
          dbecnpj.Clear;
          dbecnpj.setfocus;
          Exit;
          end;
      If Tabela.Locate('CNPJ',dbeCnpj.Text,[]) Then
        If not((DmDados.tbCliente.State=dsEdit) And (dmDados.tbCliente.RecNo = Tabela.RecNo)) Then
          Begin
          MsgDlg.MsgWarning('CNPJ j� Cadastrado');
          dbecnpj.Clear;
          dbecnpj.setfocus;
          End;
      End;
  Tabela.Free;
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
      MsgDlg.MsgWarning('� necess�rio Informar o CPF');
      dbeCPF.setfocus;
      end
    else
      Begin
      VerCPF1.NumeroCPF:= dbecpf.text;
      If not VerCpf1.valid Then
        if MsgDlg.MsgConfirmation('CPF inv�lido. Deseja continuar cadastro?') = id_no then
          begin
          dbecpf.Clear;
          dbecpf.setfocus;
          Exit;
          end;
      If Tabela.Locate('CPF',dbeCPF.Text,[]) Then
        If not((DmDados.tbCliente.State=dsEdit) And (dmDados.tbCliente.RecNo = Tabela.RecNo)) Then
          Begin
          MsgDlg.MsgWarning('CPF j� Cadastrado');
          dbecpf.Clear;
          dbecpf.setfocus;
          End;
      End;
  Tabela.Free;
end;

procedure TFrmCadCliente.DBEendExit(Sender: TObject);
begin
  If NovoItem Then
    If DBEend.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o Endere�o');
      DBEend.SetFocus;
      End
end;

procedure TFrmCadCliente.dbeNumExit(Sender: TObject);
begin
  If NovoItem Then
    If DBEnum.Text= '00000' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o N�mero');
      DBEnum.SetFocus;
      End
end;

procedure TFrmCadCliente.DBEbairroExit(Sender: TObject);
begin
  If NovoItem Then
    If DBEbairro.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o Bairro');
      DBEbairro.SetFocus;
      End
end;

procedure TFrmCadCliente.DBEcidadeExit(Sender: TObject);
begin
  If NovoItem Then
    If DBEcidade.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio a Cidade');
      DBEcidade.SetFocus;
      End
end;

procedure TFrmCadCliente.DBCBoxUFExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If NovoItem Then
    If DBCBoxUF.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio informar ESTADO');
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
        MsgDlg.MsgError('ESTADO inv�lido');
        DBCboxUF.SetFocus;
        End
      End;
end;

procedure TFrmCadCliente.DBEemailExit(Sender: TObject);
begin
  Panel3.SetFocus;
end;

procedure TFrmCadCliente.btnEMailClick(Sender: TObject);
var
 url : string;
begin
  url :='mailto:'+dmdados.tbClienteEMail.Value;
  if dmDados.tbClienteEMail.Value <> '' then
    shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;

procedure TFrmCadCliente.btnCreditoClick(Sender: TObject);
begin
  if (dmdados.tbCliente.State=dsInsert) or (dmdados.tbCliente.State=dsEdit) then
    MsgDlg.MsgWarning('Bot�o n�o pode ser acionado no momento|Gravar as Informa��es do Cliente primeiro')
  else
    begin
    FrmLibCred:= TFrmlibCred.Create(application);
    FrmLibCred.Showmodal;
    end;
end;

procedure TFrmCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.tbLibCredito.Close;
  dmDados.tbDepende.Close;
  dmDados.tbCReceber.Close;
  dmDados.tbVendas.Close;
  dmDados.tbCliente.Close;
  Action:= Cafree;
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
      VK_F6     : btnCredito.Click;
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

procedure TFrmCadCliente.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[F6] Liberar Cr�dito [F9] Localizar [Esc] Cancelar ou Sair');
  dmDados.tbCliente.Open;
  dmDados.tbCReceber.Open;
  dmDados.tbVendas.Open;
  dmDados.tbDepende.Open;
  dmDados.tbLibCredito.Open;
  dmDados.vTabStt:=True;
  NovoItem:= false;
  mudaPag:=true;
  If dmdados.tbClienteTipo.Value='1' then
    begin
    dbfantasia.Visible:= False;
    Labelfan.Visible:= False;
    dbRaz.Visible:= False;
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
    dbRaz.Visible:= True;
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

procedure TFrmCadCliente.btnDepenClick(Sender: TObject);
begin
  if (dmdados.tbCliente.State=dsInsert) or (dmdados.tbCliente.State=dsEdit) then
    MsgDlg.MsgWarning('Bot�o n�o pode ser acionado no momento|Gravar as Informa��es do Cliente primeiro')
  else
    begin
    FrmDependentes:= TFrmDependentes.Create(application);
    FrmDependentes.Showmodal;
    end;
end;

procedure TFrmCadCliente.FormActivate(Sender: TObject);
begin
  dmDados.tbCliente.Open;
  dmDados.tbCReceber.Open;
  dmDados.tbVendas.Open;
  dmDados.tbDepende.Open;
  dmDados.tbLibCredito.Open;
  dmDados.vTabStt:=True;
  if (frmPrincipal.Acesso=1) or (frmPrincipal.Acesso=2) then
    BtnAlterar.Enabled:=True;
  if (frmPrincipal.Acesso=1) then
    Btndeletar.Enabled:=True;
end;

end.
