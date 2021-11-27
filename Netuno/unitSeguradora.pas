//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitSeguradora;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, fcButton, fcImgBtn, RXSplit, ToolEdit, Mask, RXCtrls,
  ExtCtrls, SpeedBar, jpeg, RackCtls, RXDBCtrl, ShellApi, DBTables, DB,
  VerCNPJ, VerCPF;

type
  TfrmSeguradora = class(TForm)
    Image6: TImage;
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
    Panel1: TPanel;
    Panel2: TPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel11: TRxLabel;
    RxLabel17: TRxLabel;
    RxLabel18: TRxLabel;
    RxLabel12: TRxLabel;
    RxLabel13: TRxLabel;
    DBECod: TDBEdit;
    DBEnome: TDBEdit;
    RxSplitter2: TRxSplitter;
    DBEtel1: TDBEdit;
    DBETel2: TDBEdit;
    DBEcel: TDBEdit;
    DBEemail: TDBEdit;
    RxLabelcnpj: TRxLabel;
    DBEcnpj: TDBEdit;
    RxLabel5: TRxLabel;
    DBEend: TDBEdit;
    RxLabel21: TRxLabel;
    DBEnum: TDBEdit;
    RxLabel10: TRxLabel;
    DBEcompl: TDBEdit;
    RxLabel6: TRxLabel;
    DBEbairro: TDBEdit;
    RxLabel7: TRxLabel;
    DBEcidade: TDBEdit;
    RxLabel9: TRxLabel;
    DBEcep: TDBEdit;
    RxLabel8: TRxLabel;
    DBCBoxUF: TDBComboBox;
    fcImageBtn1: TfcImageBtn;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    DbeEdtCad: TDBDateEdit;
    VerCPF1: TVerCPF;
    VerCNPJ1: TVerCNPJ;
    Image2: TImage;
    Label2: TLabel;
    RxLabel15: TRxLabel;
    RxSplitter1: TRxSplitter;
    RxSplitter4: TRxSplitter;
    procedure BtnSairClick(Sender: TObject);
    procedure DBEnomeExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fcImageBtn1Click(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure DBEcnpjExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSeguradora: TfrmSeguradora;
  NovoItem: boolean;

implementation

uses UnitDmdados, untLocSegura, UnitPrincipal;

{$R *.DFM}

procedure TfrmSeguradora.BtnSairClick(Sender: TObject);
begin
     Close;
end;


procedure TfrmSeguradora.DBEnomeExit(Sender: TObject);
begin
 If NovoItem Then
    If dbeNome.Text = '' Then
      Begin
      ShowMessage('� necess�rio Informar o NOME');
      dbeNome.setfocus;
      end;
end;


procedure TfrmSeguradora.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TfrmSeguradora.BtnLocalizarClick(Sender: TObject);
begin
  FrmLocSegura:=TFrmLocSegura.Create(Application);
  FrmLocSegura.showmodal;
  frmLocSegura.Free;
end;

procedure TfrmSeguradora.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.TbSeguradora.Close;
  Action:= Cafree;
end;

procedure TfrmSeguradora.fcImageBtn1Click(Sender: TObject);
var
 url : string;
begin
url :='mailto:'+dmdados.TbSeguradoraEMail.Value;
shellexecute(0, 'open',Pchar(url), nil, nil, sw_showNormal);
end;

procedure TfrmSeguradora.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbSeguradora.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
end;

procedure TfrmSeguradora.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.tbSeguradora.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.tbSeguradora.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
end;

procedure TfrmSeguradora.BtnProximoClick(Sender: TObject);
begin
  dmdados.tbSeguradora.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.tbSeguradora.Eof Then
  Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
  End;
end;

procedure TfrmSeguradora.BtnUltimoClick(Sender: TObject);
begin
  dmdados.tbSeguradora.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
end;

procedure TfrmSeguradora.BtnNovoClick(Sender: TObject);
begin
novoitem:=true;
dmdados.Vtabstt:=false;
dmdados.tbSeguradora.Append;
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
Dbenome.Enabled:=true;
DbeCNPJ.Enabled:=true;
DbeTel1.Enabled:=true;
dbeTel2.Enabled:=true;
dbecel.Enabled:=true;
dbecnpj.Enabled:=true;
dbeEnd.Enabled:=true;
dbenum.Enabled:=true;
Dbecompl.Enabled:=true;
DbeBairro.Enabled:=true;
dbeCidade.Enabled:=true;
dbecep.Enabled:=true;
DBCBoxUF.Enabled:=true;
dbeemail.Enabled:=true;
Dbenome.setfocus;
end;

procedure TfrmSeguradora.BtnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
  Tabela: TTable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbSeguradora.DatabaseName;
  Tabela.TableName := dmDados.tbSeguradora.TableName;
  Tabela.Open;
  If dbeNome.Text='' Then
    Begin
    Campos:=' Nome ';
    Gravar:=False;
    Vazio:=True;
    End;
  If dbeCNPJ.Text='              ' Then
    Begin
    Campos:=Campos+' CNPJ ';
    Gravar:=False;
    Vazio:=True;
    End
  Else
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
        If Not((DmDados.tbSeguradora.State=dsEdit) And (dmDados.tbSeguradora.RecNo = Tabela.RecNo)) Then
          Begin
          Gravar:=False;
          End;
      End;
    end;
  If Gravar Then
    Begin
    NovoItem:= False;
    dmdados.Vtabstt:=true;
    dmdados.tbSeguradora.Post;
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
    Dbenome.Enabled:=false;
    DbeCNPJ.Enabled:=False;
    DbeTel1.Enabled:=false;
    dbeTel2.Enabled:=false;
    dbecel.Enabled:=false;
    dbeEnd.Enabled:=false;
    dbenum.Enabled:=false;
    Dbecompl.Enabled:=false;
    DbeBairro.Enabled:=false;
    dbeCidade.Enabled:=false;
    dbecep.Enabled:=false;
    dbcBoxUF.Enabled:=false;
    dbeemail.Enabled:=false;
    DbeEdtCad.enabled:=false;
    showmessage('Dados gravados com sucesso!');
    SpeedBar1.SetFocus;
    End
  Else
    Begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbeNome.SetFocus;
    end;
end;
procedure TfrmSeguradora.BtnCancelarClick(Sender: TObject);
begin
dmdados.tbSeguradora.cancel;
NovoItem:= False;
dmdados.Vtabstt:=true;
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
Dbenome.Enabled:=false;
DbeCNPJ.Enabled:=False;
DbeTel1.Enabled:=false;
dbeTel2.Enabled:=false;
dbecel.Enabled:=false;
dbeEnd.Enabled:=false;
dbenum.Enabled:=false;
Dbecompl.Enabled:=false;
DbeBairro.Enabled:=false;
dbeCidade.Enabled:=false;
dbecep.Enabled:=false;
dbcBoxUF.Enabled:=false;
dbeemail.Enabled:=false;
DbeEdtCad.enabled:=false;
speedbar1.SetFocus;
end;

procedure TfrmSeguradora.BtnAlterarClick(Sender: TObject);
begin
    if dmdados.TbSeguradora.RecordCount=0 then
      showmessage('Tabela Vazia')
    else
    begin
     dmdados.tbSeguradora.Edit;
     NovoItem:= True;
     dmdados.Vtabstt:=false;
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
     Dbenome.Enabled:=True;
     DbeCNPJ.Enabled:=true;
     DbeTel1.Enabled:=True;
     dbeTel2.Enabled:=True;
     dbecel.Enabled:=True;
     dbeEnd.Enabled:=True;
     dbenum.Enabled:=True;
     Dbecompl.Enabled:=True;
     DbeBairro.Enabled:=True;
     dbeCidade.Enabled:=True;
     dbecep.Enabled:=True;
     DBCBoxUF.Enabled:=True;
     dbeemail.Enabled:=True;
     DbeEdtCad.enabled:=True;
     dbenome.SetFocus;
    end;
end;

procedure TfrmSeguradora.BtnDeletarClick(Sender: TObject);
begin
    if dmdados.TbSeguradora.RecordCount=0 then
      showmessage('Tabela Vazia')
    else
      begin
        If application.MessageBox('Tem certeza que deseja excluir este registro?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
          dmdados.tbSeguradora.Delete
        else
          dmdados.tbSeguradora.cancel;
      end;
end;


procedure TfrmSeguradora.DBEcnpjExit(Sender: TObject);
Var
Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbSeguradora.DatabaseName;
  Tabela.TableName := dmDados.tbSeguradora.TableName;
  Tabela.indexName:= dmdados.tbSeguradora.indexName;
  Tabela.Open;
  If NovoItem Then
    If dbeCNPJ.Text = '           ' Then
      Begin
      ShowMessage('� necess�rio Informar o CNPJ');
      DbeCNPJ.setfocus;
      end
    Else
      Begin
      VerCNPJ1.NumCNPJ:= dbeCNPJ.text;
      If not VerCnpj1.valid Then
        Begin
        Showmessage('CNPJ inv�lido');
        dbecnpj.Clear;
        dbecnpj.setfocus;
        End
      Else
        Begin
        If Tabela.Locate('CNPJ',dbeCNPJ.Text,[]) Then
          If not ((DmDados.tbSeguradora.State=dsEdit) And (dmDados.tbSeguradora.RecNo = Tabela.RecNo)) Then
            Begin
            Showmessage('CNPJ j� Cadastrado');
            dbecnpj.Clear;
            dbecnpj.setfocus;
            End;
        End;
      End;

  Tabela.Free;
end;
procedure TfrmSeguradora.FormShow(Sender: TObject);
begin
     NovoItem:= false;
     FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [Delete] Excluir [End] Gravar [F9] Localizar [Esc] Cancelar ou Sair');
     dmDados.vTabStt:=True;

end;

procedure TfrmSeguradora.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmSeguradora.FormCreate(Sender: TObject);
begin
  dmdados.TbSeguradora.Open;
end;

end.
