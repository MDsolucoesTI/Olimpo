//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit Unitcademprestimo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, SpeedBar, RXCtrls, RackCtls, StdCtrls, Mask,
  DBCtrls, EFocCol, ToolEdit, RXDBCtrl, CurrEdit, RXSplit, fcButton,
  fcImgBtn,db, dbTables, RxLookup;

type
  TFrmcademprestimo = class(TForm)
    Image2: TImage;
    Label1: TLabel;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    RxLabel9: TRxLabel;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnPrimeiro: TSpeedItem;
    BtnAnterior: TSpeedItem;
    BtnProximo: TSpeedItem;
    BtnUltimo: TSpeedItem;
    BtnNovo: TSpeedItem;
    BtnGravar: TSpeedItem;
    BtnCancelar: TSpeedItem;
    BtnEntrega: TSpeedItem;
    BtnLocalizar: TSpeedItem;
    BtnSair: TSpeedItem;
    Panel1: TPanel;
    RxLabel6: TRxLabel;
    DBnumpatrimonio: TDBEdit;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel7: TRxLabel;
    DBcodempre: TDBEdit;
    DBcodcli: TDBEdit;
    RxDBvipag: TRxDBCalcEdit;
    DBiniempre: TDBDateEdit;
    DBPrevEntrega: TDBDateEdit;
    RxSplitter1: TRxSplitter;
    RxSplitter2: TRxSplitter;
    btnLocPatri: TfcImageBtn;
    btnLocCli: TfcImageBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    dbPeriodo: TRxDBLookupCombo;
    RxLabel8: TRxLabel;
    dbQuantEmprest: TDBEdit;
    RxLabel10: TRxLabel;
    DBEdit3: TDBEdit;
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure DBnumpatrimonioExit(Sender: TObject);
    procedure DBcodcliExit(Sender: TObject);
    procedure RxDBvipagExit(Sender: TObject);
    procedure DBiniempreExit(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnEntregaClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnLocPatriClick(Sender: TObject);
    procedure btnLocCliClick(Sender: TObject);
    procedure dbPeriodoExit(Sender: TObject);
    procedure dbPrevEntregaExit(Sender: TObject);
    procedure dbQuantEmprestExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmcademprestimo: TFrmcademprestimo;
  novoitem:boolean;
  Emprestado:String;

implementation

uses UnitDMDados, UnitLocEmprestimo, UnitPrincipal, UntLocPatrimonio,
  unitLocCliente, UnitEntrega;

{$R *.dfm}

procedure TFrmcademprestimo.BtnPrimeiroClick(Sender: TObject);
begin
DMDados.TbEmprestimo.First;
BtnPrimeiro.Enabled:=False;
BtnAnterior.Enabled:=False;
BtnProximo.Enabled:=True;
BtnUltimo.Enabled:=True;
end;


procedure TFrmcademprestimo.BtnAnteriorClick(Sender: TObject);
begin
DMDados.TbEmprestimo.Prior;
BtnProximo.Enabled:=True;
BtnUltimo.Enabled:=True;
If DMDados.TbEmprestimo.Bof Then
    Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    End;
end;

procedure TFrmcademprestimo.BtnProximoClick(Sender: TObject);
begin
DMDados.TbEmprestimo.Next;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
If DMDados.TbEmprestimo.Eof Then
    Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    End;

end;

procedure TFrmcademprestimo.BtnUltimoClick(Sender: TObject);
begin
DMDados.TbEmprestimo.Last;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
BtnProximo.Enabled:=False;
BtnUltimo.Enabled:=False;
end;

procedure TFrmcademprestimo.DBnumpatrimonioExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbnumpatrimonio.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o N�MERO DO PATRIM�NIO');
      dbnumpatrimonio.SetFocus;
      End
    else
      Begin
      If dmdados.TbPatrimonio.Locate('NumPatri',DBnumpatrimonio.Text,[]) Then
        begin
        if dmdados.TbPatrimonioEmprestado.Value='S' then
          if dmdados.TbPatrimonioQuant.Value = dmdados.TbPatrimonioQuantUso.Value then
            begin
            Showmessage('Patrimonio j� Emprestado');
            DBnumpatrimonio.Clear;
            DBnumpatrimonio.setfocus;
            End
        end
      else
        begin
        Showmessage('N�mero de Patrimonio n�o Cadastrado');
        DBnumpatrimonio.Clear;
        DBnumpatrimonio.setfocus;
        end;
    end;
end;
end;

procedure TFrmcademprestimo.DBcodcliExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbcodcli.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o C�DIGO DO CLIENTE');
      dbcodcli.SetFocus;
      End;
    end;
end;

procedure TFrmcademprestimo.RxDBvipagExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If rxdbvipag.Value = 0 then
      Begin
      ShowMessage('� obrigat�rio o VALOR DO EMPR�STIMO');
      RxDBvipag.SetFocus;
      End;
      SpeedBar1.SetFocus;
    end;
end;


procedure TFrmcademprestimo.DBiniempreExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBiniempre.Text= '  /  /    ' then
      Begin
      ShowMessage('� obrigat�rio a DATA DE IN�CIO DO EMPR�STIMO');
      DBiniempre.SetFocus;
      End;
      DBPrevEntrega.SetFocus;
    end;
end;

procedure TFrmcademprestimo.BtnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
begin
	Campos:='';
	Gravar:=True;
	Vazio:=False;

  If DBnumpatrimonio.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
      Campos:=Campos+'N�MERO DO PATRIMONIO';
      Gravar:=False;
      Vazio:=True;
    end;
  If DBcodcli.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
      Campos:=Campos+'C�DIGO DO CLIENTE';
      Gravar:=False;
      Vazio:=True;
    end;

  If DBiniempre.Text= '  /  /    ' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
      Campos:=Campos+'IN�CIO DO EMPR�STIMO';
      Gravar:=False;
      Vazio:=True;
    End;

  If DBPrevEntrega.Text= '  /  /    ' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
      Campos:=Campos+'PREVIS�O DE ENTREGA';
      Gravar:=False;
      Vazio:=True;
    End;

 If RxDBvipag.Text= '' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
      Campos:=Campos+'VALOR DE EMPR�STIMO';
      Gravar:=False;
      Vazio:=True;
    End;

  If Gravar Then
    Begin
    DMDados.TbEmprestimo.Post;
    dmdados.TbPatrimonio.Locate('NumPatri',DBnumpatrimonio.Text,[]);
    dmdados.TbPatrimonio.Edit;
    DMDados.TbPatrimonioEmprestado.Value:='S';
    dmdados.TbPatrimonioQuantUso.Value:=dmdados.TbPatrimonioQuantUso.Value+dmdados.TbEmprestimoQuantidade.Value;
    DMDados.TbPatrimonio.Post;
    NovoItem:=False;
    dmdados.Vtabstt:=true;
    Btnnovo.Enabled:=true;
    BtnGravar.Enabled:=False;
    BtnCancelar.Enabled:=False;
    BtnPrimeiro.Enabled:=True;
    BtnAnterior.Enabled:=True;
    BtnProximo.Enabled:=True;
    BtnUltimo.Enabled:=True;
    BtnEntrega.Enabled:=True;
    BtnLocalizar.Enabled:=True;
    SpeedBar1.SetFocus;
   {desabilitando os componentes}
   dbnumpatrimonio.Enabled :=false;
   dbcodcli.Enabled :=false;
   dbperiodo.Enabled :=false;
   dbiniempre.Enabled :=false;
   DBPrevEntrega.Enabled :=false;
   dbQuantEmprest.Enabled:=false;
   RxDBvipag.Enabled :=false;
   ShowMessage ('Dados gravados com sucesso!');
    End
  Else
    Begin
    If Vazio Then
     begin
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      DBnumpatrimonio.SetFocus;
     end;
    end;
end;


procedure TFrmcademprestimo.BtnCancelarClick(Sender: TObject);
begin
   NovoItem:=False;
   dmdados.Vtabstt:=true;
   DMDados.TbEmprestimo.Cancel;
   BtnNovo.Enabled :=true;
   BtnGravar.Enabled:=False;
   BtnCancelar.Enabled:=False;
   BtnPrimeiro.Enabled:=True;
   BtnAnterior.Enabled:=True;
   BtnProximo.Enabled:=True;
   BtnUltimo.Enabled:=True;
   BtnEntrega.Enabled:=True;
   BtnLocalizar.Enabled:=True;
   SpeedBar1.SetFocus;
   {desabilitando os componentes}
   dbnumpatrimonio.Enabled :=false;
   dbcodcli.Enabled :=false;
   dbperiodo.Enabled :=false;
   dbiniempre.Enabled :=false;
   DBPrevEntrega.Enabled :=false;
   dbQuantEmprest.Enabled:=false;
   RxDBvipag.Enabled :=false;
end;

procedure TFrmcademprestimo.BtnEntregaClick(Sender: TObject);
begin
  if dmdados.TbEmprestimoFechado.Value<>'S' then
    begin
     dmdados.TbEmprestimo.Edit;
     // dmdados.TbEmprestimo.Append;
     FrmEntrega:=TFrmEntrega.create(application);
     FrmEntrega.showmodal;
     FrmEntrega.Free;
     //dmdados.Vtabstt:=false;
    end
  else
    begin
      ShowMessage('J� foi feita a Entrega!');
      SpeedBar1.SetFocus;
    end;
end;

procedure TFrmcademprestimo.BtnSairClick(Sender: TObject);
begin
    close;
end;

procedure TFrmcademprestimo.BtnLocalizarClick(Sender: TObject);
begin
  FrmLocPatrimonio:=TFrmLocPatrimonio.Create(Application);
  FrmLocPatrimonio.showmodal;
  FrmLocPatrimonio.Free;
end;

procedure TFrmcademprestimo.BtnNovoClick(Sender: TObject);
begin
novoitem:=true;
dmdados.Vtabstt:=false;
dmdados.tbemprestimo.Append;
{habilitando os bot�es}
BtnGravar.Enabled := true;
Btncancelar.Enabled  := true;
BtnNovo.Enabled:=False;
BtnPrimeiro.Enabled:=False;
BtnAnterior.Enabled:=False;
BtnProximo.Enabled:=False;
BtnUltimo.Enabled:=False;
BtnEntrega.Enabled:=False;
BtnLocalizar.Enabled:=False;
{habilitando os componentes}
dbnumpatrimonio.Enabled :=true;
dbcodcli.Enabled :=true;
dbperiodo.Enabled :=true;
dbiniempre.Enabled :=true;
DBPrevEntrega.Enabled :=true;
dbQuantEmprest.Enabled:=true;
RxDBvipag.Enabled :=true;
dbnumpatrimonio.SetFocus;

end;

procedure TFrmcademprestimo.FormShow(Sender: TObject);
begin
     NovoItem:= false;
     FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [Delete] Excluir [End] Gravar [F9] Localizar [Esc] Cancelar ou Sair');
     dmDados.vTabStt:=True;
end;

procedure TFrmcademprestimo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.tbCliente.Close;
  dmdados.TbPatrimonio.Close;
  dmdados.tbFornecedor.Close;
  dmdados.TbComprador.Close;
  dmdados.TbEmprestimo.Close;
  Action:= Cafree;
end;

procedure TFrmcademprestimo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmcademprestimo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_Home   : if (dmDados.vTabStt) then BtnEntrega.Click;
      VK_End    : if not(dmDados.vTabStt) then BtnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
      VK_F9     : btnLocalizar.Click;
    end;
end;

procedure TFrmcademprestimo.FormCreate(Sender: TObject);
begin
  dmdados.tbFornecedor.Open;
  dmdados.TbComprador.Open;
  dmdados.TbPatrimonio.Open;
  dmdados.tbCliente.Open;
  dmdados.TbEmprestimo.Open;
end;

procedure TFrmcademprestimo.btnLocPatriClick(Sender: TObject);
begin
  if (dmdados.TbEmprestimo.State=dsInsert)or(dmdados.TbEmprestimo.State=dsEdit) then
    begin
    frmLocPatrimonio:=tfrmLocPatrimonio.create(application);
    frmLocPatrimonio.showmodal;
    dmDados.TbEmprestimoNumPatri.Value:=frmLocPatrimonio.Resultado;
    frmlocPatrimonio.Free;
end;
end;

procedure TFrmcademprestimo.btnLocCliClick(Sender: TObject);
begin
  if (dmdados.TbEmprestimo.State=dsInsert)or(dmdados.TbEmprestimo.State=dsEdit) then
    begin
    frmLocCliente:=tfrmLocCliente.create(application);
    frmLocCliente.showmodal;
    dmDados.TbEmprestimoCodCli.Value:=frmLocCliente.Resultado;
    frmlocCliente.Free;
    dbPeriodo.SetFocus;
    end;
end;

procedure TFrmcademprestimo.dbPeriodoExit(Sender: TObject);
begin
 DBiniempre.SetFocus;
end;

procedure TFrmcademprestimo.dbPrevEntregaExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBPrevEntrega.Text= '  /  /    ' then
      Begin
      ShowMessage('� obrigat�rio a DATA DE  PREVIS�O DE ENTREGA');
      DBPrevEntrega.SetFocus;
      End;
      dbQuantEmprest.SetFocus;
   end;
end;

procedure TFrmcademprestimo.dbQuantEmprestExit(Sender: TObject);
begin
 If NovoItem Then
   begin
     If dbQuantEmprest.Text= '' then
    Begin
     ShowMessage('Informar � QUANTIDADE EMPRESTADA');
     dbQuantEmprest.SetFocus;
    End
   else
   IF ((DMDados.TbEmprestimoQuantidade.Value + DMDados.TbPatrimonioQuantUso.Value) > DMDados.TbPatrimonioQuant.Value) THEN
    begin
     ShowMessage('Emprestimo NEGADO!');
     dbQuantEmprest.SetFocus;
     dbQuantEmprest.Clear;
    end
    else
   RxDBvipag.SetFocus
    end;
end;
end.
