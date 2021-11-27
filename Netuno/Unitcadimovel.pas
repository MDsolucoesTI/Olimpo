//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit Unitcadimovel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SpeedBar, ExtCtrls, RXCtrls, RackCtls, jpeg, Mask,
  DBCtrls, RxLookup, EFocCol;

type
  TFrmcadimovel = class(TForm)
    Image2: TImage;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    RxLabel9: TRxLabel;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnGravar: TSpeedItem;
    BtnCancelar: TSpeedItem;
    Label1: TLabel;
    Panel1: TPanel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel8: TRxLabel;
    RxLabel10: TRxLabel;
    RxLabel11: TRxLabel;
    RxLabel12: TRxLabel;
    RxLabel13: TRxLabel;
    DBnumpatrimonio: TDBEdit;
    DBnumescritura: TDBEdit;
    DBEndereco: TDBEdit;
    DBNum: TDBEdit;
    DBComplemento: TDBEdit;
    DBBairro: TDBEdit;
    DBCep: TDBEdit;
    RxLabel1: TRxLabel;
    DBCidade: TDBEdit;
    RxLabel2: TRxLabel;
    DBuf: TDBEdit;
    RxLabel3: TRxLabel;
    DBAreaTerr: TDBEdit;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    DBAreaconstru: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure DBnumescrituraExit(Sender: TObject);
    procedure DBEnderecoExit(Sender: TObject);
    procedure DBNumExit(Sender: TObject);
    procedure DBBairroExit(Sender: TObject);
    procedure DBCidadeExit(Sender: TObject);
    procedure DBufExit(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmcadimovel: TFrmcadimovel;
  novoitem:boolean;

implementation

uses UnitDMDados, UnitPrincipal;

{$R *.dfm}

procedure TFrmcadimovel.BtnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar,Flag:Boolean;
  x:Integer;
begin
	Campos:='';
	Gravar:=True;
	Vazio:=False;

  If DBnumescritura.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'ESCRITURA';
    Gravar:=False;
    Vazio:=True;
    end;

  If DBEndereco.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'ENDERE�O';
    Gravar:=False;
    Vazio:=True;
    end;

  If DBnum.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'N�MERO';
    Gravar:=False;
    Vazio:=True;
    end;

  If DBbairro.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'BAIRRO';
    Gravar:=False;
    Vazio:=True;
    end;

  If DBCidade.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'CIDADE';
    Gravar:=False;
    Vazio:=True;
    end;

  If DBuf.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'ESTADO';
    Gravar:=False;
    Vazio:=True;
    end;

  If Gravar Then
    Begin
    DMDados.tbImovel.Post;
    NovoItem:=False;
    BtnGravar.Enabled:=False;
    BtnCancelar.Enabled:=False;
    SpeedBar1.SetFocus;

    ShowMessage ('Dados gravados com sucesso!');
    close;
    End
  Else
    Begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      DBnumescritura.SetFocus;
    end;
end;

procedure TFrmcadimovel.BtnDeletarClick(Sender: TObject);
begin
If Application.MessageBox('Tem certeza que deseja excluir este im�vel ?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
   begin
   DMDados.tbImovel.Delete;
   end
   else
   DMDados.tbImovel.Cancel;
end;

procedure TFrmcadimovel.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmcadimovel.DBnumescrituraExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbnumescritura.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o N�MERO DA ESCRITURA');
      dbnumescritura.SetFocus;
      End;
    end;
end;

procedure TFrmcadimovel.DBEnderecoExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbendereco.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o ENDERE�O');
      dbendereco.SetFocus;
      End;
    end;

end;

procedure TFrmcadimovel.DBNumExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbnum.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o N�MERO');
      dbnum.SetFocus;
      End;
    end;

end;

procedure TFrmcadimovel.DBBairroExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbbairro.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o BAIRRO');
      dbbairro.SetFocus;
      End;
    end;

end;

procedure TFrmcadimovel.DBCidadeExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbcidade.Text= '' then
      Begin
      ShowMessage('� obrigat�rio a CIDADE');
      dbcidade.SetFocus;
      End;
    end;

end;

procedure TFrmcadimovel.DBufExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbuf.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o ESTADO');
      dbuf.SetFocus;
      End;
    end;

end;

procedure TFrmcadimovel.BtnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFrmcadimovel.BtnAlterarClick(Sender: TObject);
begin
NovoItem:=True;
DMDados.tbImovel.Edit;
{habilitando os bot�es}
BtnCancelar.Enabled:=True;
BtnGravar.Enabled:=True;

end;

procedure TFrmcadimovel.FormShow(Sender: TObject);
begin
  dmdados.tbImovel.Append;
  dmdados.tbImovelNumPatri.Value:=dmdados.TbPatrimonioNumPatri.Value;
  dbnumescritura.SetFocus;
  FrmPrincipal.StatusTeclas(True,'[End] Gravar [Esc] Cancelar ou Sair');
end;

procedure TFrmcadimovel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     FrmPrincipal.StatusTeclas(False,'');
     Action:= Cafree;
end;

procedure TFrmcadimovel.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmcadimovel.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_END    : if btngravar.Enabled then Btngravar.Click;
      VK_ESCAPE : BtnCancelar.Click;
    end;
end;

end.
