//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitFornec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VerCPF, VerCNPJ, fcButton, fcImgBtn, ToolEdit, RXDBCtrl,
  RXSplit, RxLookup, StdCtrls, DBCtrls, Mask, DCStdCtrls,ShellApi,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDShapeHint,
  SpeedBar, jpeg, RXCtrls, ExtCtrls, RackCtls, DBTables, DB, RxDBComb,
  EFocCol, EChkCPF, EDBZero;

type
  TFrmCadFornec = class(TForm)
    Panel1: TPanel;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    RxLabel4: TRxLabel;
    Panel2: TPanel;
    pgcFornec: TDCPageControl;
    DCPage1: TDCPage;
    DCPage3: TDCPage;
    lbcod: TRxLabel;
    DBECod: TDBEdit;
    lctipopessoa: TRxLabel;
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
    RxSplitter4: TRxSplitter;
    RxSplitter5: TRxSplitter;
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
    RxLabel2: TRxLabel;
    DBEend: TDBEdit;
    RxLabel3: TRxLabel;
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
    Image3: TImage;
    RxLabel12: TRxLabel;
    DBMemoInfo: TDBMemo;
    DBCBoxTipo: TRxDBComboBox;
    Image2: TImage;
    Label2: TLabel;
    DBEnum: TEvDBZeroEdit;
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
    procedure DBCBoxTipoExit(Sender: TObject);
    procedure dblookRotaEnter(Sender: TObject);
    procedure dbprazoEnter(Sender: TObject);
    procedure dbfantasiaExit(Sender: TObject);
    procedure DBEnomeExit(Sender: TObject);
    procedure DBEtel1Exit(Sender: TObject);
    procedure DBEcpfExit(Sender: TObject);
    procedure DBEcnpjExit(Sender: TObject);
    procedure DBEendExit(Sender: TObject);
    procedure DBEnumExit(Sender: TObject);
    procedure DBEbairroExit(Sender: TObject);
    procedure DBEcidadeExit(Sender: TObject);
    procedure DBCBoxUFExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnCreditoClick(Sender: TObject);
    procedure dbNomeExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fcImageBtn2Click(Sender: TObject);
    procedure DBMemoInfoExit(Sender: TObject);
    procedure EvCheckCPF1Error(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadFornec: TFrmCadFornec;
  NovoItem,mudaPag: Boolean;

implementation

uses unitDmDados, unitPrincipal, unitLocFornec;

{$R *.dfm}

procedure TFrmCadFornec.DBEemailExit(Sender: TObject);
begin
    pgcfornec.ActivePage:=dcPage3;
end;

procedure TFrmCadFornec.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.TbFornecedor.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If (DBCBoxTipo.Text='Pessoa F�sica') then
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
    end;
end;

procedure TFrmCadFornec.FormKeyDown(Sender: TObject; var Key: Word;
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
  dmDados.vTabStt:=True;
  NovoItem:= false;
  mudaPag:=true;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [F9] Localizar [Esc] Cancelar ou Sair');
  If (dbcBoxTipo.Text='Pessoa F�sica')  then
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
    end;
  if dmdados.TbFornecedor.RecordCount=0 then
    begin
    Btnprimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=false;
    BtnUltimo.Enabled:=false;
    btnGravar.Enabled:=false;
    btnAlterar.Enabled:=false;
    btnCancelar.Enabled:=false;
    btnDeletar.Enabled:=false;
    btnLocalizar.Enabled:=false;
    end;
end;

procedure TFrmCadFornec.btnCreditoClick(Sender: TObject);
begin
{  FrmLibCred:= TFrmlibCred.Create(application);
  FrmLibCred.Showmodal;}
end;

procedure TFrmCadFornec.DBEendExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBEend.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Endere�o');
      DBEend.SetFocus;
      End;
    end;
end;

procedure TFrmCadFornec.DBEnumExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBEnum.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o N�mero');
      DBEnum.SetFocus;
      End ;
    end;
end;

procedure TFrmCadFornec.DBEbairroExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBEbairro.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Bairro');
      DBEbairro.SetFocus;
      End;
    end;

end;

procedure TFrmCadFornec.DBEcidadeExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBEcidade.Text= '' then
      Begin
      ShowMessage('� obrigat�rio a Cidade');
      DBEcidade.SetFocus;
      End;
    end;
end;

procedure TFrmCadFornec.DBCBoxUFExit(Sender: TObject);
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
        end;
      end;
   end;   
end;

procedure TFrmCadFornec.BtnLocalizarClick(Sender: TObject);
begin
  FrmLocFornec:=TFrmLocFornec.Create(Application);
  FrmLocFornec.showmodal;
  FrmLocFornec.Free;
  If (dbcBoxTipo.Text='Pessoa F�sica') then
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
    end;
  end;


procedure TFrmCadFornec.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadFornec.DBCBoxTipoChange(Sender: TObject);
begin
  If (dbcBoxTipo.Text='Pessoa F�sica') then
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
    end;
end;

procedure TFrmCadFornec.DBCBoxTipoExit(Sender: TObject);
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
        End;
      End;
    end;
end;

procedure TFrmCadFornec.dblookRotaEnter(Sender: TObject);
begin
  (Sender as TRxDBLookupCombo).Color:=$00D2E2FF;
end;

procedure TFrmCadFornec.dbprazoEnter(Sender: TObject);
begin
  (Sender as TDbEdit).Color:=$00D2E2FF;
end;

procedure TFrmCadFornec.dbfantasiaExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbfantasia.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o PRAZO PAGAMENTO');
      dbfantasia.SetFocus;
      End;
    end;
end;

procedure TFrmCadFornec.DBEnomeExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBEnome.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o PRAZO PAGAMENTO');
      DBEnome.SetFocus;
      End;
    end;
end;

procedure TFrmCadFornec.DBEtel1Exit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBEtel1.Text= '           ' then
      Begin
      ShowMessage('� obrigat�rio o TELEFONE');
      DBEtel1.SetFocus;
      End;
    end;
end;

procedure TFrmCadFornec.DBEcpfExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbFornecedor.DatabaseName;
  Tabela.TableName := dmDados.TbFornecedor.TableName;
  Tabela.Open;
If NovoItem Then
  begin
     if dbecpf.text='           'then
        begin
        ShowMessage('Obrigat�rio informar o N�MERO DO CPF');
        DBECPF.SetFocus;
        end
     else
     begin
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
          If not((DmDados.TbFornecedor.State=dsEdit) And (dmDados.TbFornecedor.RecNo = Tabela.RecNo)) Then
            Begin
            Showmessage('CPF j� Cadastrado');
            dbecpf.Clear;
            dbecpf.setfocus;
            End;
        End;
      end;  
    Tabela.Free;
     end;
end;

procedure TFrmCadFornec.DBEcnpjExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbFornecedor.DatabaseName;
  Tabela.TableName := dmDados.TbFornecedor.TableName;
  Tabela.Open;
  If NovoItem Then
    If dbecnpj.Text = '              ' Then
      Begin
      ShowMessage('Obrigat�rio informar o N�MERO DO CNPJ');
      DBECNPJ.SetFocus;
      end
    else
      begin
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
          If not((DmDados.TbFornecedor.State=dsEdit) And (dmDados.TbFornecedor.RecNo = Tabela.RecNo)) Then
            Begin
            Showmessage('CNPJ j� Cadastrado');
            dbecnpj.Clear;
            dbecnpj.setfocus;
            End;
        End;
      Tabela.Free;
     end; 
end;

procedure TFrmCadFornec.BtnCancelarClick(Sender: TObject);
begin
  dmdados.TbFornecedor.cancel;
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
  dbfantasia.Enabled:=false;
  DbeTel1.Enabled:=false;
  dbeTel2.Enabled:=false;
  dbecel.Enabled:=false;
  dbecpf.Enabled:=false;
  DBEcnpj.Enabled:= False;
  dbeIe.Enabled:= False;
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
  pgcFornec.ActivePage:=DCPage1;
  speedbar1.SetFocus;
end;

procedure TFrmCadFornec.BtnAlterarClick(Sender: TObject);
begin
if dmdados.tbfornecedor.RecordCount=0 then
ShowMessage('Tabela vazia')
else
  begin
  dmdados.TbFornecedor.Edit;
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
  DbMemoInfo.Enabled:=True;
  dmDados.vTabStt:=False;
  pgcFornec.ActivePage:=dcpage1;
  dbCBoxTipo.SetFocus;
  end;
end;

procedure TFrmCadFornec.BtnDeletarClick(Sender: TObject);
var
  Flag : Boolean;
begin
  Flag:=False;
  if dmdados.TbFornecedor.RecordCount=0 then
    begin
    ShowMessage('Tabela vazia');
    end
  else
    If application.MessageBox('Tem certeza que deseja excluir este registro?','Aten��o', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      Begin
      if dmDados.TbPatrimonio.Locate('CodFor',dmDados.TbFornecedorCodFor.Value,[]) Then
        Flag:=True;
      if Flag Then
        ShowMessage('Fornecedor ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
      else
        dmdados.TbFornecedor.Delete;
        dmdados.TbFornecedor.Refresh;
      If (dbCBoxTipo.Text='Pessoa F�sica') then
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
        end;
      End
    else
      dmdados.TbFornecedor.cancel;
end;

procedure TFrmCadFornec.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.TbFornecedor.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.TbFornecedor.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
  If (dbCboxTipo.Text='Pessoa F�sica') then
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
    end;
end;

procedure TFrmCadFornec.BtnProximoClick(Sender: TObject);
begin
 dmdados.TbFornecedor.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.TbFornecedor.Eof Then
  Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
  End;
  If (dbcBoxTipo.Text='Pessoa F�sica') then
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
    end;
end;

procedure TFrmCadFornec.BtnUltimoClick(Sender: TObject);
begin
 dmdados.TbFornecedor.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  If (dbcBoxTipo.Text='Pessoa F�sica')  then
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
    end;
end;

procedure TFrmCadFornec.BtnNovoClick(Sender: TObject);
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
  end;

dbCBoxTipo.Enabled:=true;
Dbenome.Enabled:=true;
DbNome.Enabled:= True;
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
DbMemoInfo.Enabled:=true;
dmDados.vTabStt:=False;
pgcFornec.ActivePage:=dcPage1;
DbcBoxTipo.setfocus;
end;

procedure TFrmCadFornec.BtnGravarClick(Sender: TObject);
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
  Tabela.DatabaseName := dmDados.TbFornecedor.DatabaseName;
  Tabela.TableName := dmDados.TbFornecedor.TableName;
  Tabela.Open;

  If dbCBoxTipo.Text= '' then {tipo pessoa}{11}
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

If (dbCBoxTipo.Text='Pessoa Jur�dica') Then
BEGIN
     If dbfantasia.Text=' ' Then {nome fantasia}{1}
       Begin
       If Length(Campos)>0 Then
          Campos:=Campos+', ';
          Campos:=' Nome Fantasia ';
          Gravar:=False;
          Vazio:=True;
       end;

     {If dbeCNPJ.Text<>'              ' Then{CNPJ}{2}
      {Begin
      VerCnpj1.NumCnpj:= dbecnpj.text;
      If not VerCnpj1.valid Then
        Begin
        Showmessage('CNPJ inv�lido');
        Gravar:=False;
        End
      Else
        Begin
        If Tabela.Locate('CNPJ',dbeCnpj.Text,[]) Then
          If Not((DmDados.TbFornecedor.State=dsEdit) And (dmDados.TbFornecedor.RecNo = Tabela.RecNo)) Then
            Begin
            Gravar:=False;
            End;
        End;
      end;}

      If dbeNome.Text='' Then
       Begin
       If Length(Campos)>0 Then
          Campos:=Campos+', ';
          Campos:=' Raz�o Social ';
          Gravar:=False;
          Vazio:=True;
       End;
END;
{termina se PJ}
  If dbNome.Text='' Then    {nome}{3}
     Begin
     If Length(Campos)>0 Then
        Campos:=Campos+', ';
        Campos:='Nome';
        Gravar:=False;
        Vazio:=True;
     end;
  {If dbeCpf.Text<>'           ' Then {cpf}{4}
   {   Begin
      VerCPF1.NumeroCPF:= dbecpf.text;
      If not VerCpf1.valid Then
        Begin
        Showmessage('CPF inv�lido');
        Gravar:=False;
        End
      Else
        Begin
        If Tabela.Locate('CPF',dbeCPF.Text,[]) Then
          If not((DmDados.TbFornecedor.State=dsEdit) And (dmDados.TbFornecedor.RecNo = Tabela.RecNo)) Then
            Begin
            Gravar:=False;
            End
        End;
      End;}
    If DBEcidade.Text= '' then {cidade}{5}
      begin
      If Length(Campos)>0 Then
         Campos:=Campos+', ';
         Campos:=Campos+'Cidade';
         Gravar:=False;
         Vazio:=True;
      end;
    If DBEbairro.Text= '' then {bairro}{6}
       begin
       If Length(Campos)>0 Then
          Campos:=Campos+', ';
          Campos:=Campos+'Bairro';
          Gravar:=False;
          Vazio:=True;
       end;
    If DBEnum.Text= '' then  {n�mero}{7}
       begin
       If Length(Campos)>0 Then
          Campos:=Campos+', ';
          Campos:=Campos+'N�mero';
          Gravar:=False;
          Vazio:=True;
       end;
    If DBEend.Text= '' then {endere�o}{8}
       begin
       If Length(Campos)>0 Then
          Campos:=Campos+', ';
          Campos:=Campos+'Endere�o';
          Gravar:=False;
          Vazio:=True;
       end;
    If DBEtel1.Text= '          ' then {telefone}{9}
       begin
       If Length(Campos)>0 Then
          Campos:=Campos+', ';
          Campos:=Campos+'Telefone 1';
          Gravar:=False;
          Vazio:=True;
       end;
    If DBCBoxUF.Text= '' then     {Estado}{10}
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

  If Gravar Then
    Begin
    NovoItem:= False;
    dmdados.TbFornecedor.Post;
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
    dbfantasia.Enabled:=false;
    DbeTel1.Enabled:=false;
    dbeTel2.Enabled:=false;
    dbecel.Enabled:=false;
    dbecpf.Enabled:=false;
    dberg.Enabled:=false;
    DBEcnpj.Enabled:=false;
    DBEie.Enabled:=false;
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
    pgcfornec.ActivePage:=dcPage1;
    SpeedBar1.SetFocus;
    If (dbcBoxTipo.Text='Pessoa F�sica') then
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
      end;
    End
  Else
    Begin
    If Vazio Then
      begin
      mudaPag:=false;
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      pgcFornec.ActivePage:=dcPage1;
      If (dbcBoxTipo.Text='Pessoa F�sica') then
        begin
        pgcFornec.ActivePage:=dcPage1;
        dbnome.Enabled:=true;
        dbNome.SetFocus;
        end
      else
        begin
        pgcFornec.ActivePage:=dcPage1;
        dbfantasia.SetFocus;
        end;
      mudapag:=true;
      end;
    end;
end;

procedure TFrmCadFornec.dbNomeExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbNome.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o Nome');
      dbNome.SetFocus;
      End;
    end;  

end;

procedure TFrmCadFornec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.TbPatrimonio.Close;
  dmdados.tbFornecedor.Close;
  dmdados.TbComprador.Close;
  Action:= Cafree;
end;

procedure TFrmCadFornec.fcImageBtn2Click(Sender: TObject);
var
 url : string;
begin
  url :='mailto:'+dmdados.tbfornecedorEMail.Value;
  shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;

procedure TFrmCadFornec.DBMemoInfoExit(Sender: TObject);
begin
  if mudaPag then
   begin
    pgcFornec.ActivePage:= DCPage3;
   end;
end;

procedure TFrmCadFornec.EvCheckCPF1Error(Sender: TObject);
begin
ShowMessage('O CPF informado n�o � v�lido!');
end;

procedure TFrmCadFornec.FormCreate(Sender: TObject);
begin
  dmdados.tbFornecedor.Open;
  dmdados.TbComprador.Open;
  dmdados.TbPatrimonio.Open;
end;

end.
