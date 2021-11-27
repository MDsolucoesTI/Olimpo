//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCadFornec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TFlatSplitterUnit, ToolEdit, RXDBCtrl, DBCtrls, EDBZero,
  StdCtrls, RxDBComb, Mask, RxGrdCpt, fcButton, fcImgBtn, VerCNPJ, VerCPF,
  RXCtrls, ExtCtrls, DbTables, DB, ShellApi, jpeg, fcImager;

type
  TFrmCadFornec = class(TForm)
    Panel2: TPanel;
    RxLabel4: TRxLabel;
    Image1: TImage;
    VerCPF1: TVerCPF;
    VerCNPJ1: TVerCNPJ;
    Panel3: TPanel;
    btnAlterar: TfcImageBtn;
    btnDeletar: TfcImageBtn;
    btnLocalizar: TfcImageBtn;
    btnNovo: TfcImageBtn;
    btnGravar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    btnAnterior: TfcImageBtn;
    btnProximo: TfcImageBtn;
    btnUltimo: TfcImageBtn;
    btnPrimeiro: TfcImageBtn;
    Panel1: TPanel;
    lbcod: TRxLabel;
    DBECod: TDBEdit;
    lctipopessoa: TRxLabel;
    DBCBoxTipo: TRxDBComboBox;
    dbRaz: TDBEdit;
    labelNome: TRxLabel;
    labelRaz: TRxLabel;
    labelFan: TRxLabel;
    dbFantasia: TDBEdit;
    dbNome: TDBEdit;
    RxLabelcnpj: TRxLabel;
    RxLabelcpf: TRxLabel;
    RxLabelrg: TRxLabel;
    RxLabelie: TRxLabel;
    DBErg: TDBEdit;
    DBEie: TDBEdit;
    DBEcpf: TDBEdit;
    DBEcnpj: TDBEdit;
    lbtel1: TRxLabel;
    DBEtel1: TDBEdit;
    lbtel2: TRxLabel;
    DBETel2: TDBEdit;
    lbcelular: TRxLabel;
    DBEcel: TDBEdit;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    DBEend: TDBEdit;
    RxLabel3: TRxLabel;
    dbeNum: TEvDBZeroEdit;
    RxLabel5: TRxLabel;
    DBEcompl: TDBEdit;
    RxLabel6: TRxLabel;
    DBEbairro: TDBEdit;
    RxLabel7: TRxLabel;
    DBEcidade: TDBEdit;
    RxLabel9: TRxLabel;
    DBCBoxUF: TDBComboBox;
    RxLabel8: TRxLabel;
    DBEcep: TDBEdit;
    RxLabel10: TRxLabel;
    DBEemail: TDBEdit;
    fcImageBtn2: TfcImageBtn;
    DbDateEditCad: TDBDateEdit;
    RxLabel11: TRxLabel;
    FlatSplitter1: TFlatSplitter;
    btnSair: TfcImageBtn;
    RxGradientCaption2: TRxGradientCaption;
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
    procedure fcImageBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadFornec: TFrmCadFornec;
  NovoItem: Boolean;
  mudaPag:boolean;

implementation

uses unitDmDados, UnitPrincipal, unitLocFornec;

{$R *.dfm}

procedure TFrmCadFornec.btnLocalizarClick(Sender: TObject);
begin
  FrmLocFornec:=TFrmLocFornec.Create(Application);
  FrmLocFornec.showmodal;
  FrmLocFornec.Free;
  If dmdados.tbFornecedorTipo.Value='1' then
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
    end;
end;

procedure TFrmCadFornec.btnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbFornecedor.First;
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
    end;
end;

procedure TFrmCadFornec.btnAnteriorClick(Sender: TObject);
begin
  dmdados.tbFornecedor.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.tbFornecedor.bof Then
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
    end;
end;

procedure TFrmCadFornec.btnProximoClick(Sender: TObject);
begin
 dmdados.tbFornecedor.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.tbFornecedor.Eof Then
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
    end;
end;

procedure TFrmCadFornec.btnUltimoClick(Sender: TObject);
begin
  dmdados.tbFornecedor.last;
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
    end;
end;

procedure TFrmCadFornec.btnNovoClick(Sender: TObject);
begin
  dmdados.tbFornecedor.Append;
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
    end;
    dbCBoxTipo.Enabled:=true;
    dbRaz.Enabled:=true;
    DbNome.Enabled:= True;
//dblookrota.Enabled:=true;
//dbprazo.Enabled:=true;
    dbfantasia.Enabled:=true;
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

procedure TFrmCadFornec.btnGravarClick(Sender: TObject);
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
  Tabela.DatabaseName := dmDados.tbFornecedor.DatabaseName;
  Tabela.TableName := dmDados.tbFornecedor.TableName;
  Tabela.IndexName := dmdados.tbFornecedor.IndexName;
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
        Showmessage('CPF inv�lido');
      If Tabela.Locate('CPF',dbeCPF.Text,[]) Then
        if not((DmDados.tbfornecedor.State=dsEdit) And (dmDados.tbfornecedor.RecNo = Tabela.RecNo)) Then
            Gravar:=False;
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
        Showmessage('CNPJ inv�lido');
      If Tabela.Locate('CNPJ',dbeCnpj.Text,[]) Then
        If Not((DmDados.tbfornecedor.State=dsEdit) And (dmDados.tbfornecedor.RecNo = Tabela.RecNo)) Then
          Gravar:=False;
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
    End;
  If Gravar Then
    Begin
    NovoItem:= False;
    dmdados.tbFornecedor.Post;
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
    dbRaz.Enabled:=false;
    DbNome.Enabled:= false;
    //dblookrota.Enabled:=false;
    //dbprazo.Enabled:=false;
    dbfantasia.Enabled:=false;
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
    showmessage('Dados gravados com sucesso!');
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
      end;
    End
  Else
    Begin
    If Vazio Then
      begin
        mudaPag:=false;
        ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
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

procedure TFrmCadFornec.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbFornecedor.cancel;
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
  dbRaz.Enabled:=false;
  dbNome.Enabled:=false;
  //dblookrota.Enabled:=false;
  //dbprazo.Enabled:=false;
  dbfantasia.Enabled:=false;
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
      end;
end;

procedure TFrmCadFornec.btnAlterarClick(Sender: TObject);
begin
if dmdados.tbFornecedor.RecordCount=0 then
begin
ShowMessage('Tabela vazia')
end
else
  begin
  dmdados.tbFornecedor.Edit;
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

procedure TFrmCadFornec.btnDeletarClick(Sender: TObject);
var
  Flag : Boolean;
begin
  Flag:=False;
  if dmdados.tbFornecedor.RecordCount=0 then
    begin
    ShowMessage('Tabela vazia');
    end
  else
    If application.MessageBox('Tem certeza que deseja excluir este registro?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      Begin
      if dmDados.tbCompras.Locate('CodFor',dmDados.tbfornecedorCodFor.Value,[]) Then
        Flag:=True;
      if dmDados.tbCPagar.Locate('CodFor',dmDados.tbFornecedorCodFor.Value,[]) Then
        Flag:=True;
      if Flag Then
        ShowMessage('Fornecedor ativo, ou com registro de opera��es anteriores.'+#13+#13+'N�o pode ser EXCLUI�DO!!!')
      else
        dmdados.tbFornecedor.Delete;
        dmdados.tbFornecedor.Refresh;
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
        end;
      End
    else
      dmdados.tbFornecedor.cancel;
end;

procedure TFrmCadFornec.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadFornec.DBCBoxTipoChange(Sender: TObject);
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
    end;
end;

procedure TFrmCadFornec.DBCBoxTipoExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If NovoItem Then
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
        End;
      End;
end;

procedure TFrmCadFornec.dbFantasiaExit(Sender: TObject);
begin
  If NovoItem Then
    If dbfantasia.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o NOME FANTASIA');
      dbfantasia.SetFocus;
      End
end;

procedure TFrmCadFornec.dbRazExit(Sender: TObject);
begin
  If NovoItem Then
    If dbRaz.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o NOME OU RAZ�O SOCIAL');
      dbRaz.SetFocus;
      End
end;

procedure TFrmCadFornec.dbNomeExit(Sender: TObject);
begin
  If NovoItem Then
    If dbNome.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Nome');
      dbNome.SetFocus;
      End
end;

procedure TFrmCadFornec.DBEcnpjExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbfornecedor.DatabaseName;
  Tabela.TableName := dmDados.tbfornecedor.TableName;
  Tabela.IndexName := dmdados.tbfornecedor.IndexName;
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
        if application.MessageBox('CNPJ inv�lido. Deseja continuar cadastro?','Valida��o CNPJ', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_no then
          begin
          dbecnpj.Clear;
          dbecnpj.setfocus;
          Exit;
          end;
      If Tabela.Locate('CNPJ',dbeCnpj.Text,[]) Then
        If not((DmDados.tbfornecedor.State=dsEdit) And (dmDados.tbfornecedor.RecNo = Tabela.RecNo)) Then
          Begin
          Showmessage('CNPJ j� Cadastrado');
          dbecnpj.Clear;
          dbecnpj.setfocus;
          End;
      End;
  Tabela.Free;
end;

procedure TFrmCadFornec.DBEcpfExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbfornecedor.DatabaseName;
  Tabela.TableName := dmDados.tbfornecedor.TableName;
  Tabela.IndexName := dmdados.tbfornecedor.IndexName;
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
        if application.MessageBox('CPF inv�lido. Deseja continuar cadastro?','Valida��o CPF', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_no then
          begin
          dbecpf.Clear;
          dbecpf.setfocus;
          Exit;
          end;
      If Tabela.Locate('CPF',dbeCPF.Text,[]) Then
        If not((DmDados.tbfornecedor.State=dsEdit) And (dmDados.tbfornecedor.RecNo = Tabela.RecNo)) Then
          Begin
          Showmessage('CPF j� Cadastrado');
          dbecpf.Clear;
          dbecpf.setfocus;
          End;
      End;
  Tabela.Free;
end;

procedure TFrmCadFornec.DBEendExit(Sender: TObject);
begin
  If NovoItem Then
    If DBEend.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Endere�o');
      DBEend.SetFocus;
      End
end;

procedure TFrmCadFornec.dbeNumExit(Sender: TObject);
begin
  If NovoItem Then
    If DBEnum.Text= '00000' then
      Begin
      ShowMessage('� obrigat�rio o N�mero');
      DBEnum.SetFocus;
      End
end;

procedure TFrmCadFornec.DBEbairroExit(Sender: TObject);
begin
  If NovoItem Then
    If DBEbairro.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Bairro');
      DBEbairro.SetFocus;
      End
end;

procedure TFrmCadFornec.DBEcidadeExit(Sender: TObject);
begin
  If NovoItem Then
    If DBEcidade.Text= '' then
      Begin
      ShowMessage('� obrigat�rio a Cidade');
      DBEcidade.SetFocus;
      End
end;

procedure TFrmCadFornec.DBCBoxUFExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If NovoItem Then
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
      End;

end;

procedure TFrmCadFornec.DBEemailExit(Sender: TObject);
begin
  Panel3.SetFocus;
end;

procedure TFrmCadFornec.fcImageBtn2Click(Sender: TObject);
var
 url : string;
begin
  url :='mailto:'+dmdados.tbFornecedorEMail.Value;
  if dmDados.tbfornecedorEMail.Value <> '' then
    shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;

procedure TFrmCadFornec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  Action:= Cafree;
end;

procedure TFrmCadFornec.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt) then btnNovo.Click;
      VK_Home   : if (dmDados.vTabStt) then btnAlterar.Click;
      VK_Delete : if (dmDados.vTabStt) then btnDeletar.Click;
      VK_End    : if not(dmDados.vTabStt) then btnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
      VK_F9     : btnLocalizar.Click;
    end;
end;

procedure TFrmCadFornec.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmCadFornec.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [F9] Localiza [Esc] Cancelar ou Sair');
  dmDados.vTabStt:=True;
  NovoItem:= false;
  mudaPag:=true;
  If dmdados.tbFornecedorTipo.Value='1' then
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
    end;
end;

end.
