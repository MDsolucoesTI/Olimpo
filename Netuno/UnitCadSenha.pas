//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCadSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, SpeedBar, jpeg, Mask, DBCtrls, RXCtrls,
  Grids, DBGrids, ECripto;

type
  TFrmCadSenha = class(TForm)
    gridSenha: TDBGrid;
    Panel2: TPanel;
    RxLabel3: TRxLabel;
    RxLabel2: TRxLabel;
    dbsenha: TDBEdit;
    dbUsuario: TDBEdit;
    SpeedBar1: TSpeedBar;
    SpeedbarSection2: TSpeedbarSection;
    btnPrimeiro: TSpeedItem;
    BtnAnterior: TSpeedItem;
    BtnProximo: TSpeedItem;
    BtnUltimo: TSpeedItem;
    BtnNovo: TSpeedItem;
    BtnGravar: TSpeedItem;
    BtnCancelar: TSpeedItem;
    BtnAlterar: TSpeedItem;
    BtnExcluir: TSpeedItem;
    SpeedItem10: TSpeedItem;
    BtnSair: TSpeedItem;
    DBGrid1: TDBGrid;
    Image2: TImage;
    db: TLabel;
    EvCriptografa1: TEvCriptografa;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadSenha: TFrmCadSenha;

implementation

uses UnitDMDados;

{$R *.dfm}

procedure TFrmCadSenha.btnPrimeiroClick(Sender: TObject);
begin
dmdados.tbSenha.First;
btnPrimeiro.Enabled:=False;
btnAnterior.Enabled:=False;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;

end;

procedure TFrmCadSenha.BtnNovoClick(Sender: TObject);
begin
dmdados.tbSenha.Append;
BtnGravar.Enabled := true;
BtnCancelar.Enabled:=true;
BtnNovo.Enabled:=False;
BtnPrimeiro.Enabled:=False;
BtnAnterior.Enabled:=False;
BtnProximo.Enabled:=False;
BtnUltimo.Enabled:=False;
BtnAlterar.Enabled:=False;
BtnExcluir.Enabled:=False;
dbUsuario.Enabled:=true;
dbSenha.Enabled:=true;
dbUsuario.SetFocus;
end;

procedure TFrmCadSenha.BtnAnteriorClick(Sender: TObject);
begin
dmdados.tbSenha.Prior;
btnProximo.Enabled:=True;
btnUltimo.Enabled:=True;
If dmdados.tbSenha.Bof Then
 Begin
  btnPrimeiro.Enabled:=False;
  btnAnterior.Enabled:=False;
  End;
end;

procedure TFrmCadSenha.BtnProximoClick(Sender: TObject);
begin
dmdados.tbSenha.Next;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
If dmdados.tbSenha.Eof Then
 Begin
 btnProximo.Enabled:=False;
 btnUltimo.Enabled:=False;
 end;
end;

procedure TFrmCadSenha.BtnUltimoClick(Sender: TObject);
begin
dmdados.tbSenha.Last;
btnPrimeiro.Enabled:=True;
btnAnterior.Enabled:=True;
btnProximo.Enabled:=False;
btnUltimo.Enabled:=False;
end;

procedure TFrmCadSenha.BtnGravarClick(Sender: TObject);
var campos:string;
begin
 If (dbUsuario.Text = 'Gensys') then
  begin
    ShowMessage('Palavra Reservada!  Por favor utilize outra.');
    dbUsuario.SetFocus;
  end else
 begin
  if (dbUsuario.Text='') then campos:='USUARIO';
  if (dbSenha.Text='') then campos:=campos+'  SENHA';
  If Length(campos)=0 then
  begin
   dbSenha.Text:= EvCriptografa1.TextToCriptoBin(dbSenha.Text);
   dmdados.tbSenha.Post;
   BtnGravar.enabled := False;
   BtnCancelar.Enabled := False;
   BtnNovo.Enabled:=True;
   BtnPrimeiro.Enabled:=True;
   BtnAnterior.Enabled:=True;
   BtnProximo.Enabled:=True;
   BtnUltimo.Enabled:=True;
   BtnAlterar.Enabled:=True;
   BtnExcluir.Enabled:=True;
   dbUsuario.Enabled:=false;
   dbSenha.Enabled:=true;
   showmessage('Dados gravados com sucesso!');
   speedbar1.SetFocus;
  end else
  Showmessage('O(s) campo(s)  '+campos+'  n�o foram preenchidos');
 end;
end;

procedure TFrmCadSenha.BtnCancelarClick(Sender: TObject);
begin
dmdados.tbSenha.cancel;
BtnGravar.enabled := false;
BtnCancelar.Enabled := false;
BtnNovo.Enabled:=True;
BtnPrimeiro.Enabled:=True;
BtnAnterior.Enabled:=True;
Btnproximo.Enabled:=True;
BtnUltimo.Enabled:=True;
BtnAlterar.Enabled:=True;
BtnExcluir.Enabled:=True;
dbUsuario.Enabled:=false;
dbSenha.Enabled:=false;
speedBar1.SetFocus
end;

procedure TFrmCadSenha.BtnAlterarClick(Sender: TObject);
begin
if dmdados.tbSenhaUsuario.Value='Gensys' then
   ShowMessage('Senha de seguran�a.'+#13+'N�o pode ser alterada.')
 else
 begin
  dmdados.tbSenha.Edit;
   BtnCancelar.enabled:= true;
   BtnGravar.Enabled:= true;
   BtnNovo.Enabled:=False;
   BtnPrimeiro.Enabled:=False;
   BtnAnterior.Enabled:=False;
   BtnProximo.Enabled:=False;
   BtnUltimo.Enabled:=False;
   BtnAlterar.Enabled:=False;
   Btnexcluir.Enabled:=False;
   dbUsuario.Enabled:=true;
   dbSenha.Enabled:=true;
   dbUsuario.SetFocus;
 end;
end;

procedure TFrmCadSenha.BtnExcluirClick(Sender: TObject);
begin
if dmdados.tbSenhaUsuario.Value='Gensys' then
   ShowMessage('Senha de seguran�a.'+#13+'N�o pode ser exclu�da.')
 else
  begin
   If application.MessageBox('Tem certeza que deseja excluir este registro?','Aten��o', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
    begin
     dmdados.tbSenha.Delete;
    end
   else
    dmdados.tbSenha.Cancel;
  end;
end;

procedure TFrmCadSenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TFrmCadSenha.FormShow(Sender: TObject);
begin
 dmDados.tbSenha.Filtered:=false;
 dmDados.tbSenha.Filter:='(usuario <> '''+'Gensys'+''')';
 dmDados.tbSenha.Filtered:=true;
end;

procedure TFrmCadSenha.BtnSairClick(Sender: TObject);
begin
Close;
end;

end.
