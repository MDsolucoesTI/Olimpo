//////////////////////////////////////////////////////////////////////////
// Criacao...........: 05/2002
// Sistema...........: Ciclope - Controle de Funcionarios
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unServicos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, SpeedBar, jpeg, Menus, RxMenus, Grids, DBGrids, RXCtrls,
  StdCtrls, Mask, DBCtrls, RackCtls, RXSplit, ToolEdit, CurrEdit, RXDBCtrl,
  RxDBComb;

type
  TfrmCadServicos = class(TForm)
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
    Panel2: TPanel;
    dbedescricao: TDBEdit;
    rxLbDescv: TRxLabel;
    rxlbCodigo: TRxLabel;
    rxLbPeriodo: TRxLabel;
    rxLbValor: TRxLabel;
    dbecodigo: TDBEdit;
    rxLbMinFunc: TRxLabel;
    dbeMinFunc: TDBEdit;
    Image1: TImage;
    Label1: TLabel;
    dbevalor: TRxDBCalcEdit;
    rxLbFunc: TRxLabel;
    dbeMaxfunc: TDBEdit;
    dbcEquip: TRxDBComboBox;
    rxLbEquip: TRxLabel;
    dbcPeriodo: TDBComboBox;
    ScrewPanel1: TScrewPanel;
    Image2: TImage;
    RxLabel15: TRxLabel;
    RxSplitter1: TRxSplitter;
    RxDBGrid1: TRxDBGrid;
    procedure CadastrodeServios1Click(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure dbedescricaoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbcEquipExit(Sender: TObject);
    procedure dbcPeriodoExit(Sender: TObject);
    procedure dbevalorExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadServicos: TfrmCadServicos;
  NovoItem:Boolean;
implementation

uses UnitDmdados,UnitLocServ, unitPrincipal;

{$R *.DFM}

procedure TfrmCadServicos.CadastrodeServios1Click(Sender: TObject);
begin
frmCadServicos.show;
end;

procedure TfrmCadServicos.BtnSairClick(Sender: TObject);
begin
close;
end;


procedure TfrmCadServicos.BtnPrimeiroClick(Sender: TObject);
begin
dmdados.tbServicos.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
end;

procedure TfrmCadServicos.BtnAnteriorClick(Sender: TObject);
begin
dmdados.tbServicos.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
If dmdados.TbServicos.Bof Then
 Begin
  btnPrimeiro.Enabled:=False;
  btnAnterior.Enabled:=False;
end;
end;

procedure TfrmCadServicos.BtnProximoClick(Sender: TObject);
begin
dmdados.tbServicos.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
If dmdados.tbServicos.Eof Then
 Begin
 btnProximo.Enabled:=False;
 btnUltimo.Enabled:=False;
 end;
end;

procedure TfrmCadServicos.BtnUltimoClick(Sender: TObject);
begin
dmdados.tbServicos.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TfrmCadServicos.BtnNovoClick(Sender: TObject);
begin
novoitem:=true;
dmDados.vTabStt:=False;
dmdados.tbServicos.Append;
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
{habilitar os objetos}
dbeDescricao.Enabled:=true;
dbeMinFunc.Enabled:=true;
dbeMaxFunc.Enabled:=true;
dbcEquip.Enabled:=true;
dbcPERIODO.Enabled:=TRUE;
dbevalor.Enabled:=true;
dbeDescricao.SetFocus;
end;

procedure TfrmCadServicos.BtnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar,Flag:Boolean;
  x:Integer;

begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;

  If dbeDescricao.Text= '' then
     begin
     If Length(Campos)>0 Then
        Campos:=Campos+', ';
     Campos:=Campos+'Descri��o';
     Gravar:=False;
     Vazio:=True;
     end;

  If dbcEquip.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Equipamento';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to dbcEquip.Items.Count-1 Do
      If dbcEquip.Text=dbcEquip.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor inv�lido');
      Gravar:=False;
      End;
    End;


  If dbcPeriodo.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Per�odo';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to dbcPeriodo.Items.Count-1 Do
      If dbcPeriodo.Text=dbcPeriodo.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor inv�lido');
      Gravar:=False;
      End;
    End;

   If dbeValor.Text= '' then
     begin
     If Length(Campos)>0 Then
        Campos:=Campos+', ';
     Campos:=Campos+'Valor';
     Gravar:=False;
     Vazio:=True;
     end;

If Gravar Then
    Begin
    dmdados.tbServicos.Post;
    NovoItem:=False;
    dmDados.vTabStt:=true;
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
    showmessage('Dados gravados com sucesso!');
    {habilitar os objetos}
    dbecodigo.Enabled:=false;
    dbeDescricao.Enabled:=false;
    dbeMinFunc.Enabled:=false;
    dbeMaxFunc.Enabled:=false;
    dbcEquip.Enabled:=false;
    dbcPERIODO.Enabled:=false;
    dbevalor.Enabled:=false;
    end
else
    Begin
    If Vazio Then
      begin
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbeDescricao.SetFocus;
      end;
   end;
end;

procedure TfrmCadServicos.BtnCancelarClick(Sender: TObject);
begin
NovoItem:= False;
dmDados.vTabStt:=true;
dmdados.tbServicos.Cancel;
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
{desabilitar os objetos}
dbeDescricao.Enabled:=false;
dbeMinFunc.Enabled:=false;
dbeMaxFunc.Enabled:=false;
dbcEquip.Enabled:=false;
dbcPERIODO.Enabled:=false;
dbevalor.Enabled:=false;
end;

procedure TfrmCadServicos.BtnAlterarClick(Sender: TObject);
begin
novoitem:=true;
dmDados.vTabStt:=false;
dmdados.tbServicos.edit;
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
{habilitando os objetos}
dbeDescricao.Enabled:=true;
dbeMinFunc.Enabled:=true;
dbeMaxFunc.Enabled:=true;
dbcEquip.Enabled:=true;
dbcPERIODO.Enabled:=TRUE;
dbevalor.Enabled:=true;
dbeDescricao.SetFocus;
end;

procedure TfrmCadServicos.BtnDeletarClick(Sender: TObject);
begin
  if dmdados.tbservicos.RecordCount=0 then
    begin
    ShowMessage('Tabela vazia');
    end
  else
    if application.MessageBox('Tem certeza que deseja encerrar este tipo de servi�o ?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
    begin
     dmdados.tbServicos.Delete;
    end
    else
    dmdados.tbServicos.Cancel;
end;

procedure TfrmCadServicos.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TfrmCadServicos.BtnLocalizarClick(Sender: TObject);
begin
frmLocServ:=TfrmLocServ.create(application);
frmLocServ.show;
end;

procedure TfrmCadServicos.dbedescricaoExit(Sender: TObject);
begin
If dbeDescricao.text = '' then
 Begin
 showmessage (' Obrigat�rio informar a descri��o do servi�o ');
 dbeDescricao.SetFocus
 end ;
end;

procedure TfrmCadServicos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  Action:= Cafree;
end;

procedure TfrmCadServicos.dbcEquipExit(Sender: TObject);
begin
if dbcEquip.Text = ' ' then
   begin
   ShowMessage('Necess�rio informar a utiliza��o do EQUIPAMENTO');
   dbcEquip.SetFocus;
   end;
end;

procedure TfrmCadServicos.dbcPeriodoExit(Sender: TObject);
begin
if dbcPeriodo.Text = ' ' then
   begin
   ShowMessage('Necess�rio informar o per�odo para realiza��o do servi�o');
   dbcPeriodo.SetFocus;
   end;
end;

procedure TfrmCadServicos.dbevalorExit(Sender: TObject);
begin
if dbevalor.text = '' then
   begin
   ShowMessage('Necess�rio informar o VALOR do servi�o');
   dbevalor.SetFocus;
   end;
end;

procedure TfrmCadServicos.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [F9] Localizar [Esc] Cancelar ou Sair');
  dmDados.vTabStt:=True;
end;

procedure TfrmCadServicos.FormKeyDown(Sender: TObject; var Key: Word;
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

end.
