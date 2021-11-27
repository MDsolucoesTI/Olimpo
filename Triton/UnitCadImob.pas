//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCadImob;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, StdCtrls, Mask, DBCtrls, ExtCtrls,
  RackCtls, fcButton, fcImgBtn, RXSplit, RXCtrls, SpeedBar, jpeg, ToolEdit,
  DCStdCtrls, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  LMDShapeHint, TFlatHintUnit, VerCNPJ, DB, DBtables, ShellApi;

type
  TFrmCadImob = class(TForm)
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
    Panel1: TPanel;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    Panel2: TPanel;
    Image2: TImage;
    Label2: TLabel;
    pgcImob: TDCPageControl;
    pgdados: TDCPage;
    pglogra: TDCPage;
    RxLabel1: TRxLabel;
    dbCod: TDBEdit;
    RxLabel2: TRxLabel;
    RxSplitter1: TRxSplitter;
    RxLabel11: TRxLabel;
    dbTel1: TDBEdit;
    RxLabel17: TRxLabel;
    dbTel2: TDBEdit;
    RxLabel24: TRxLabel;
    dbFax: TDBEdit;
    RxLabel18: TRxLabel;
    dbCel: TDBEdit;
    RxLabel53: TRxLabel;
    dbInsMun: TDBEdit;
    dbCreci: TDBEdit;
    RxLabel35: TRxLabel;
    dbCNPJ: TDBEdit;
    RxLabel36: TRxLabel;
    RxSplitter4: TRxSplitter;
    lbemail: TRxLabel;
    dbEmail: TDBEdit;
    BtnEmail: TfcImageBtn;
    dbDataCad: TDBDateEdit;
    RxLabel13: TRxLabel;
    lbendereco: TRxLabel;
    dbEnd: TDBEdit;
    lbnumero: TRxLabel;
    dbNum: TDBEdit;
    lbcompl: TRxLabel;
    dbCompl: TDBEdit;
    lbBairro: TRxLabel;
    dbBairro: TDBEdit;
    lbcep: TRxLabel;
    dbCep: TDBEdit;
    dbUf: TDBComboBox;
    lbuf: TRxLabel;
    lbcidade: TRxLabel;
    dbCidade: TDBEdit;
    RxLabel38: TRxLabel;
    dbMemoRef: TDBMemo;
    RxLabel3: TRxLabel;
    dbContato: TDBEdit;
    dbRazSocial: TDBEdit;
    RxLabel15: TRxLabel;
    cmbForPgto: TDBComboBox;
    RxLabel4: TRxLabel;
    VerCNPJ1: TVerCNPJ;
    LMDShapeHint1: TLMDShapeHint;
    BtnGravar: TSpeedItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbRazSocialEnter(Sender: TObject);
    procedure dbRazSocialExit(Sender: TObject);
    procedure dbTel1Enter(Sender: TObject);
    procedure dbTel1Exit(Sender: TObject);
    procedure dbTel2Enter(Sender: TObject);
    procedure dbTel2Exit(Sender: TObject);
    procedure dbFaxEnter(Sender: TObject);
    procedure dbFaxExit(Sender: TObject);
    procedure dbCelEnter(Sender: TObject);
    procedure dbCelExit(Sender: TObject);
    procedure dbCNPJEnter(Sender: TObject);
    procedure dbCNPJExit(Sender: TObject);
    procedure dbCreciEnter(Sender: TObject);
    procedure dbCreciExit(Sender: TObject);
    procedure dbInsMunEnter(Sender: TObject);
    procedure dbInsMunExit(Sender: TObject);
    procedure dbContatoEnter(Sender: TObject);
    procedure dbContatoExit(Sender: TObject);
    procedure cmbForPgtoEnter(Sender: TObject);
    procedure cmbForPgtoExit(Sender: TObject);
    procedure dbEmailEnter(Sender: TObject);
    procedure dbEmailExit(Sender: TObject);
    procedure dbDataCadEnter(Sender: TObject);
    procedure dbDataCadExit(Sender: TObject);
    procedure dbEndEnter(Sender: TObject);
    procedure dbEndExit(Sender: TObject);
    procedure dbNumEnter(Sender: TObject);
    procedure dbNumExit(Sender: TObject);
    procedure dbComplEnter(Sender: TObject);
    procedure dbComplExit(Sender: TObject);
    procedure dbBairroEnter(Sender: TObject);
    procedure dbBairroExit(Sender: TObject);
    procedure dbCepEnter(Sender: TObject);
    procedure dbCepExit(Sender: TObject);
    procedure dbUfEnter(Sender: TObject);
    procedure dbCidadeEnter(Sender: TObject);
    procedure dbCidadeExit(Sender: TObject);
    procedure dbMemoRefEnter(Sender: TObject);
    procedure dbMemoRefExit(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnEmailClick(Sender: TObject);
    procedure dbUfExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadImob: TFrmCadImob;
  NovoItem: Boolean;

implementation

uses UnitDmdados;

{$R *.dfm}

procedure TFrmCadImob.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= Cafree;
end;

procedure TFrmCadImob.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadImob.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmCadImob.dbRazSocialEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImob.dbRazSocialExit(Sender: TObject);
Var
Tabela: TTable;
begin
  If NovoItem Then
    Begin
    Tabela := TTable.Create(Application);
    Tabela.DatabaseName := dmDados.tbImob.DatabaseName;
    Tabela.TableName := dmDados.tbImob.TableName;
    Tabela.Open;
    If DBRazSocial.Text= '' then
      begin
      ShowMessage('� obrigat�rio a RAZ�O SOCIAL');
      DBRazSocial.SetFocus;
      end
    else
      begin
      If Tabela.Locate('RazaoSocial',DBRazSocial.Text,[]) Then
        If (DmDados.tbImob.State=dsEdit) And (dmDados.tbImob.RecNo = Tabela.RecNo) Then
          (Sender as TDbEdit).Color:=clwindow
        Else
          Begin
          Showmessage('RAZ�O SOCIAL j� Cadastrada');
          DBRazSocial.Clear;
          DBRazSocial.setfocus;
          End
      Else
        (Sender as TDbEdit).Color:=clwindow;
      end;
    Tabela.Free;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmCadImob.dbTel1Enter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImob.dbTel1Exit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmCadImob.dbTel2Enter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImob.dbTel2Exit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmCadImob.dbFaxEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImob.dbFaxExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmCadImob.dbCelEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImob.dbCelExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmCadImob.dbCNPJEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImob.dbCNPJExit(Sender: TObject);
Var
Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbImob.DatabaseName;
  Tabela.TableName := dmDados.TbImob.TableName;
  Tabela.Open;
  If NovoItem Then
    If dbCNPJ.Text = '              ' Then
      Begin
      ShowMessage('� necess�rio Informar o CNPJ');
      dbCNPJ.setfocus;
      end
    Else
      Begin
      VerCnpj1.NumCnpj:= dbCNPJ.text;
      If not VerCnpj1.valid Then
        Begin
        Showmessage('CNPJ inv�lido');
        dbCNPJ.Clear;
        dbCNPJ.setfocus;
        End
      Else
        Begin
        If Tabela.Locate('CNPJ',dbCNPJ.Text,[]) Then
          If (DmDados.tbImob.State=dsEdit) And (dmDados.tbImob.RecNo = Tabela.RecNo) Then
            (Sender as TDbEdit).Color:=clwindow
          Else
            Begin
            Showmessage('CNPJ j� Cadastrado');
            dbCNPJ.Clear;
            dbCNPJ.setfocus;
            End;
        End;
      End
  Else
    (Sender as TDbEdit).Color:=clwindow;
    (Sender as TDbEdit).Color:=clwindow;
  Tabela.Free;
 end;

procedure TFrmCadImob.dbCreciEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImob.dbCreciExit(Sender: TObject);
Var
Tabela: TTable;
begin
If NovoItem Then
Begin
Tabela := TTable.Create(Application);
Tabela.DatabaseName := dmDados.tbImob.DatabaseName;
Tabela.TableName := dmDados.tbImob.TableName;
Tabela.Open;
If DBcreci.Text= '' then
begin
ShowMessage('� obrigat�rio informar o CRECI');
DBCreci.SetFocus;
end
else
Begin
      If Tabela.Locate('RazaoSocial',DBRazSocial.Text,[]) Then
        If (DmDados.tbImob.State=dsEdit) And (dmDados.tbImob.RecNo = Tabela.RecNo) Then
          (Sender as TDbEdit).Color:=clwindow
        Else
          Begin
          Showmessage('CRECI j� Cadastrada');
          DBCreci.Clear;
          DBCreci.setfocus;
          End
      Else
        (Sender as TDbEdit).Color:=clwindow;
      End;
    Tabela.Free;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;

end;

procedure TFrmCadImob.dbInsMunEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImob.dbInsMunExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmCadImob.dbContatoEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImob.dbContatoExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmCadImob.cmbForPgtoEnter(Sender: TObject);
begin
(Sender as TDBComboBox).color:=$00d2e2ff;
end;

procedure TFrmCadImob.cmbForPgtoExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If NovoItem Then
    Begin
    If cmbForPgto.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar a FORMA DE PAGAMENTO');
      cmbForPgto.SetFocus;
      End
    Else
      Begin
      Flag:=True;
      For x:=0 to cmbForPgto.Items.Count-1 Do
        If cmbForPgto.Text=cmbForPgto.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor FORMA DE PAGAMENTO inv�lido');
        cmbForPgto.SetFocus;
        End
      Else
        (Sender as TDBComboBox).color:=clWindow;
      End;
    End
  Else
    (Sender as TDBComboBox).color:=clWindow;
end;


procedure TFrmCadImob.dbEmailEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImob.dbEmailExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
pgcimob.ActivePage:=pgLogra;
end;

procedure TFrmCadImob.dbDataCadEnter(Sender: TObject);
begin
(Sender as TDBDateEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImob.dbDataCadExit(Sender: TObject);
begin
(Sender as TDBDateEdit).color:=clwindow;
end;

procedure TFrmCadImob.dbEndEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImob.dbEndExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmCadImob.dbNumEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImob.dbNumExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmCadImob.dbComplEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImob.dbComplExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmCadImob.dbBairroEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImob.dbBairroExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmCadImob.dbCepEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImob.dbCepExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmCadImob.dbUfEnter(Sender: TObject);
begin
(Sender as TDBComboBox).color:=$00d2e2ff;
end;

procedure TFrmCadImob.dbCidadeEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmCadImob.dbCidadeExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmCadImob.dbMemoRefEnter(Sender: TObject);
begin
(Sender as TDBMemo).color:=$00d2e2ff;
end;

procedure TFrmCadImob.dbMemoRefExit(Sender: TObject);
begin
(Sender as TDBMemo).color:=clwindow;
pgcImob.ActivePage:=pgDados;
end;

procedure TFrmCadImob.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.TbImob.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
end;

procedure TFrmCadImob.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.TbImob.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.TbImob.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
end;

procedure TFrmCadImob.BtnProximoClick(Sender: TObject);
begin
  dmdados.TbImob.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.TbImob.Eof Then
  Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
  End;
end;

procedure TFrmCadImob.BtnUltimoClick(Sender: TObject);
begin
  dmdados.TbImob.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
end;

procedure TFrmCadImob.BtnNovoClick(Sender: TObject);
begin
 NovoItem:=True;
 DMDados.tbImob.Append;
{habilitando os bot�es}
 BtnGravar.Enabled:= True;
 BtnCancelar.Enabled := True;
 BtnAlterar.Enabled:=False;
 BtnDeletar.Enabled:=False;
 BtnNovo.Enabled:=False;
{habilitando os componentes}
  DBRazSocial.Enabled:=True;
  DBTel1.Enabled:= True;
  DbTel2.Enabled:= True;
  DbFax.Enabled:= True;
  DbCel.Enabled:= True;
  DbCNPJ.Enabled:= True;
  DbCreci.Enabled:= True;
  DbInsMun.Enabled:= True;
  DbContato.Enabled:= True;
  cmbForPgto.Enabled:= True;
  DbEmail.Enabled:= True;
  DbEnd.Enabled:= True;
  DbNum.Enabled:= True;
  DbCompl.Enabled:= True;
  DbBairro.Enabled:= True;
  DbCEP.Enabled:= True;
  DbUF.Enabled:= True;
  DbCidade.Enabled:= True;
  DbMemoRef.Enabled:= True;
  DBRazSocial.SetFocus;
end;

procedure TFrmCadImob.BtnCancelarClick(Sender: TObject);
begin
NovoItem:=False;
dmdados.tbImob.cancel;
{Desabilitando os bot�es}
BtnCancelar.Enabled := false;
BtnAlterar.Enabled:=True;
BtnDeletar.Enabled:=True;
BtnNovo.Enabled:=True;
{desabilitando os componentes}
DBRazSocial.Enabled:=False;
DBTel1.Enabled:= False;
DbTel2.Enabled:= False;
DbFax.Enabled:= False;
DbCel.Enabled:= False;
DbCNPJ.Enabled:= False;
DbCreci.Enabled:= False;
DbInsMun.Enabled:= False;
DbContato.Enabled:= False;
cmbForPgto.Enabled:= False;
DbEmail.Enabled:= False;
DbEnd.Enabled:= False;
DbNum.Enabled:= False;
DbCompl.Enabled:= False;
DbBairro.Enabled:= False;
DbCEP.Enabled:= False;
DbUF.Enabled:= False;
DbCidade.Enabled:= False;
DbMemoRef.Enabled:= False;
SpeedBar1.SetFocus;
end;

procedure TFrmCadImob.BtnAlterarClick(Sender: TObject);
begin
novoitem:=true;
dmdados.tbImob.Edit;
{Habilitando os Componentes}
DBRazSocial.Enabled:=True;
DBTel1.Enabled:= True;
DbTel2.Enabled:= True;
DbFax.Enabled:= True;
DbCel.Enabled:= True;
DbCNPJ.Enabled:= True;
DbCreci.Enabled:= True;
DbInsMun.Enabled:= True;
DbContato.Enabled:= True;
cmbForPgto.Enabled:= True;
DbEmail.Enabled:= True;
DbEnd.Enabled:= True;
DbNum.Enabled:= True;
DbCompl.Enabled:= True;
DbBairro.Enabled:= True;
DbCEP.Enabled:= True;
DbUF.Enabled:= True;
DbCidade.Enabled:= True;
DbMemoRef.Enabled:= True;
DbRazSocial.SetFocus;
end;

procedure TFrmCadImob.BtnDeletarClick(Sender: TObject);
begin
NovoItem:=False;
if dmdados.tbImob.RecordCount=0 then
begin
ShowMessage('Tabela sem registro');
end
else
If application.MessageBox('Tem certeza que deseja exluir esse registro?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
   dmdados.tbImob.Delete;
end;

procedure TFrmCadImob.BtnGravarClick(Sender: TObject);
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
  Tabela.DatabaseName := dmDados.tbImob.DatabaseName;
  Tabela.TableName := dmDados.tbImob.TableName;
  Tabela.Open;
  If dbRazSocial.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Raz�o Social';
    Gravar:=False;
    Vazio:=True;
    end
  else
    If Tabela.Locate('RazaoSocial',dbRazSocial.Text,[]) Then
      If Not((DmDados.tbImob.State=dsEdit) And (dmDados.TbImob.RecNo = Tabela.RecNo)) Then
        Begin
       	Gravar:=False;
        Showmessage('RAZ�O SOCIAL j� Cadastrada');
        End;

  If dbUF.Text= '' then
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
    For x:=0 to dbuf.Items.Count-1 Do
      If DBUf.Text=DbUf.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Campo ESTADO inv�lido');
      Gravar:=False;
      End;
    End;

  If Gravar Then
    Begin
    DMDados.TbImob.Post;
    NovoItem:=False;
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
    DBRazSocial.Enabled:=False;
    DBTel1.Enabled:= False;
    DbTel2.Enabled:= False;
    DbFax.Enabled:= False;
    DbCel.Enabled:= False;
    DbCNPJ.Enabled:= False;
    DbCreci.Enabled:= False;
    DbInsMun.Enabled:= False;
    DbContato.Enabled:= False;
    cmbForPgto.Enabled:= False;
    DbEmail.Enabled:= False;
    DbEnd.Enabled:= False;
    DbNum.Enabled:= False;
    DbCompl.Enabled:= False;
    DbBairro.Enabled:= False;
    DbCEP.Enabled:= False;
    DbUF.Enabled:= False;
    DbCidade.Enabled:= False;
    DbMemoRef.Enabled:= False;
    ShowMessage ('Dados gravados com sucesso!');
    End
  Else
    Begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbRazSocial.SetFocus;
    end;
  Tabela.Free;
end;

procedure TFrmCadImob.BtnEmailClick(Sender: TObject);
var
 url : string;
begin
url :='mailto:'+dmdados.tbImobEmail.Value;
shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;

procedure TFrmCadImob.dbUfExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
 Flag:=True;
 For x:=0 to dbUf.Items.Count-1 Do
 If dbuf.Text=dbuf.Items[x] Then
    Flag:=False;
    If Flag Then
        Begin
        ShowMessage('Valor ESTADO inv�lido');
        dbuf.SetFocus;
        End
      Else
        (Sender as TDBComboBox).color:=clWindow;


end;

end.
