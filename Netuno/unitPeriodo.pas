//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitPeriodo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SpeedBar, jpeg, ExtCtrls, StdCtrls, Mask, DBCtrls, RXCtrls, RxGrdCpt,
  fcButton, fcImgBtn, RXSplit, Grids, DBGrids, RackCtls, DBTables, DB,
  RXDBCtrl, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  LMDShapeHint, EFocCol;

type
  TfrmPeriodo = class(TForm)
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
    RxLabel2: TRxLabel;
    RxSplitter1: TRxSplitter;
    DBEdesc: TDBEdit;
    Panel2: TPanel;
    RxLabel1: TRxLabel;
    DBEcod: TDBEdit;
    gridCusto: TRxDBGrid;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    RxLabel4: TRxLabel;
    Image2: TImage;
    Label2: TLabel;
    btnGravar: TSpeedItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure DBEdescExit(Sender: TObject);
    procedure DBEcodExit(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure DBGridCCustoEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPeriodo : TfrmPeriodo;
  NovoItem, Mudar : Boolean;

implementation

uses UnitDmdados, unitPrincipal;

{$R *.DFM}

procedure TfrmPeriodo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.HabilitaTeclado:=True;
  dmdados.tbPeriodo.Close;
  dmdados.TbEmprestimo.Close;
  dmdados.tbServicos.Close;
  dmdados.tbContrato.Close;
  Action:= Cafree;
end;

procedure TfrmPeriodo.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmPeriodo.DBEdescExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbPeriodo.DatabaseName;
  Tabela.TableName := dmDados.tbPeriodo.TableName;
  Tabela.IndexName := dmdados.tbPeriodo.IndexName;
  Tabela.Open;
If NovoItem Then
begin
  If dbeDesc.Text = '' Then
     Begin
     ShowMessage('� necess�rio Informar o CENTRO DE CUSTO');
     DbeDesc.setfocus;
     end
  Else
     Begin
     If Tabela.Locate('Periodo',dbeDesc.Text,[]) Then
       begin
       If not ((DmDados.tbPeriodo.State=dsEdit) And (dmDados.tbPeriodo.RecNo = Tabela.RecNo)) Then
         begin
         Showmessage('PER�ODO j� cadastrado');
         dbeDesc.Clear;
         dbeDesc.setfocus;
         End
       else
       speedbar1.SetFocus;
       end
     else
       Tabela.Free;
    end;
end;
end;

procedure TfrmPeriodo.DBEcodExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbPeriodo.DatabaseName;
  Tabela.TableName := dmDados.tbPeriodo.TableName;
  Tabela.IndexName := dmdados.tbPeriodo.IndexName;
  Tabela.Open;
If NovoItem Then
begin
  If dbecod.Text = '' Then
     Begin
     ShowMessage('� necess�rio Informar o C�digo');
     Dbecod.setfocus;
     end
  Else
     Begin
     If Tabela.Locate('Codigo',dbecod.Text,[]) Then
        begin
        If not ((DmDados.tbPeriodo.State=dsEdit) And (dmDados.tbPeriodo.RecNo = Tabela.RecNo)) Then
           begin
           Showmessage('C�DIGO j� cadastrado');
           dbecod.Clear;
           dbecod.setfocus;
           End;
         end;
      End;
  Tabela.Free;
end;
end;

procedure TfrmPeriodo.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbPeriodo.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmdados.vTabStt:=true;
end;

procedure TfrmPeriodo.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.tbPeriodo.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.tbPeriodo.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
  dmdados.vTabStt:=true;
end;

procedure TfrmPeriodo.BtnProximoClick(Sender: TObject);
begin
  dmdados.tbPeriodo.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.tbPeriodo.Eof Then
  Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
  End;
  dmdados.vTabStt:=true;
end;

procedure TfrmPeriodo.BtnUltimoClick(Sender: TObject);
begin
  dmdados.tbPeriodo.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmdados.vTabStt:=true;
end;

procedure TfrmPeriodo.BtnNovoClick(Sender: TObject);
begin
  DMDados.tbPeriodo.Append;
  NovoItem:=True;
  dmdados.vTabStt:=false;
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
//BtnLocalizar.Enabled:=False;
  {habilitando os componentes}
  dbeCod.Enabled:=True;
  dbeDesc.Enabled:= True;
  gridcusto.Enabled:=true;
  dbeCod.SetFocus;
end;

procedure TfrmPeriodo.BtnCancelarClick(Sender: TObject);
begin
 dmdados.tbPeriodo.cancel;
 NovoItem:= False;
 dmdados.vTabStt:=true;
 {Desabilitando os bot�es}
 BtnGravar.enabled := false;
 BtnCancelar.Enabled := false;
 BtnNovo.Enabled:=True;
 btnPrimeiro.Enabled:=True;
 BtnAnterior.Enabled:=True;
 Btnproximo.Enabled:=True;
 BtnUltimo.Enabled:=True;
 BtnAlterar.Enabled:=True;
 BtnDeletar.Enabled:=True;
//  BtnLocalizar.Enabled:=True;
 {Habilitando os componentes}
 gridcusto.Enabled:=false;
 DbeCod.Enabled:=False;
 DbeDesc.enabled:=false;
 SpeedBar1.SetFocus;
end;

procedure TfrmPeriodo.BtnAlterarClick(Sender: TObject);
begin
if dmdados.tbPeriodo.RecordCount=0 then
  ShowMessage('Tabela vazia')
else
  begin
  novoitem:=true;
  dmdados.vTabStt:=false;
  dmdados.tbPeriodo.Edit;
  //habilitar bot�es
  BtnCancelar.enabled:= true;
  BtnGravar.Enabled:= true;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  Btndeletar.Enabled:=False;
//  BtnLocalizar.Enabled:=False;
  //habilitar objetos
  gridcusto.Enabled:=true;
  DbeCod.Enabled:=True;
  dbeDesc.Enabled:=True;
  DbeCod.SetFocus;
  end;
end;

procedure TfrmPeriodo.BtnDeletarClick(Sender: TObject);
var
   flag : boolean;
Begin
  NovoItem:=False;
  flag := false;
  if dmdados.tbPeriodo.RecordCount=0 then
    ShowMessage('Tabela vazia')
  else
    If application.MessageBox('Tem certeza que deseja exluir esse registro?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      begin
      if dmdados.TbEmprestimo.Locate('Periodo',dmdados.tbPeriodoCodigo.Value,[]) then
        flag:=true;
      if dmdados.tbServicos.Locate('Periodo',dmdados.tbPeriodoCodigo.Value,[] ) then
        flag:=true;
      if dmdados.tbContrato.Locate('Periodo',dmdados.tbPeriodoCodigo.Value,[]) then
        flag:=True;
      if flag then
        ShowMessage('Periodo ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
      else
        dmdados.tbPeriodo.Delete;
      end
    else
      dmdados.tbPeriodo.cancel;
end;

procedure TfrmPeriodo.DBGridCCustoEnter(Sender: TObject);
begin
  NovoItem:=False;
end;

procedure TfrmPeriodo.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  NovoItem:= false;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
  if dmdados.tbPeriodo.RecordCount=0 then
    begin
    Btnprimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=false;
    BtnUltimo.Enabled:=false;
    btnGravar.Enabled:=false;
    btnAlterar.Enabled:=false;
    btnCancelar.Enabled:=false;
    btnDeletar.Enabled:=false;
    end;
end;

procedure TfrmPeriodo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;

end;

procedure TfrmPeriodo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_Home   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_Delete : if (dmDados.vTabStt) then BtnDeletar.Click;
      VK_End    : if not(dmDados.vTabStt) then btnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
    end;
end;

procedure TfrmPeriodo.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
  tabela: ttable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbPeriodo.DatabaseName;
  Tabela.TableName := dmDados.tbPeriodo.TableName;
  Tabela.IndexName := dmdados.tbPeriodo.IndexName;
  Tabela.Open;

	If dbeCod.Text='' Then
  	Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'C�digo';
    Gravar:=False;
    Vazio:=True;
    end
  else
     begin
     If Tabela.Locate('Codigo',dbeCod.Text,[]) Then
       If not((DmDados.tbPeriodo.State=dsEdit) And (dmDados.tbPeriodo.RecNo = Tabela.RecNo)) Then
          Begin
          Gravar:=False;
          Showmessage('C�DIGO j� cadastrado');
          dbeCod.SetFocus;
          End;
     end;

	If dbeDesc.Text='' Then
  	Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Per�odo';
    Gravar:=False;
    Vazio:=True;
  	End
   else
     begin
     If Tabela.Locate('Periodo',dbeDesc.Text,[]) Then
       If not((DmDados.tbPeriodo.State=dsEdit) And (dmDados.tbPeriodo.RecNo = Tabela.RecNo)) Then
          Begin
          Gravar:=False;
          Showmessage('PER�ODO j� cadastrado');
          dbeDesc.SetFocus;
          End;
     end;

if gravar then
 begin
 NovoItem:= False;
 dmdados.tbPeriodo.Post;
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
//  BtnLocalizar.enabled:=true;
 dbeCod.Enabled:=false;
 dbeDesc.Enabled:=false;
 gridcusto.Enabled:=false;
 showmessage('Dados gravados com sucesso!');
 speedBar1.SetFocus;
 end
else
 begin
 If Vazio Then
   begin
   ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
   dbeCod.Enabled:=true;
   end;
end;

end;

procedure TfrmPeriodo.FormCreate(Sender: TObject);
begin
  dmdados.tbPeriodo.Open;
  dmdados.tbServicos.Open;
  dmdados.TbEmprestimo.Open;
  dmdados.tbContrato.Open;
end;

end.
