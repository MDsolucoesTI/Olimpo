//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit Unitcadveiculo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, RXCtrls, ExtCtrls, SpeedBar, RackCtls,
  jpeg, EFocCol;

type
  TFrmcadveiculo = class(TForm)
    Image2: TImage;
    Label1: TLabel;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnGravar: TSpeedItem;
    BtnCancelar: TSpeedItem;
    RxLabel9: TRxLabel;
    Panel1: TPanel;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel8: TRxLabel;
    DBchassi: TDBEdit;
    DBnumpatr: TDBEdit;
    DBplaca: TDBEdit;
    DBanofabr: TDBEdit;
    DBanomodelo: TDBEdit;
    DBcor: TDBEdit;
    procedure DBchassiExit(Sender: TObject);
    procedure DBplacaexit(Sender:TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
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
  Frmcadveiculo: TFrmcadveiculo;
  novoitem:boolean;

implementation

uses UnitDMDados, DB, UnitPrincipal;

{$R *.dfm}

procedure TFrmcadveiculo.DBchassiExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbchassi.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o CHASSI');
      dbchassi.SetFocus;
      End;
    end;

end;

procedure TFrmcadveiculo.DBplacaExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbchassi.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o CHASSI');
      dbchassi.SetFocus;
      End;
    end;

end;



procedure TFrmcadveiculo.BtnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar,Flag:Boolean;
  x:Integer;
begin
	Campos:='';
	Gravar:=True;
	Vazio:=False;

  If DBchassi.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'CHASSI';
    Gravar:=False;
    Vazio:=True;
    end;

  If DBplaca.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'PLACA';
    Gravar:=False;
    Vazio:=True;
    end;

  If Gravar Then
    Begin
    DMDados.tbVeiculo.Post;
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
    DBchassi.SetFocus;
    end;
end;

procedure TFrmcadveiculo.BtnCancelarClick(Sender: TObject);
begin
close;

end;

procedure TFrmcadveiculo.BtnAlterarClick(Sender: TObject);
begin
NovoItem:=True;
DMDados.tbVeiculo.Edit;
{habilitando os bot�es}
BtnCancelar.Enabled:=True;
BtnGravar.Enabled:=True;

end;

procedure TFrmcadveiculo.BtnDeletarClick(Sender: TObject);
begin
If Application.MessageBox('Tem certeza que deseja excluir este ve�culo ?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
   begin
   DMDados.tbVeiculo.Delete;
   end
   else
   DMDados.tbVeiculo.Cancel;
end;

procedure TFrmcadveiculo.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmcadveiculo.FormShow(Sender: TObject);
begin
dmdados.tbVeiculo.Append;
dmdados.tbVeiculoNumPatri.Value:=dmdados.TbPatrimonioNumPatri.Value;
dbChassi.SetFocus;
FrmPrincipal.StatusTeclas(True,'[End] Gravar [Esc] Cancelar ou Sair');

end;

procedure TFrmcadveiculo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     FrmPrincipal.StatusTeclas(False,'');
     Action:= Cafree;
end;

procedure TFrmcadveiculo.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmcadveiculo.FormKeyDown(Sender: TObject; var Key: Word;
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
