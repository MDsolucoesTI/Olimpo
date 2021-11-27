//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit Unitcadequipamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EFocCol, ToolEdit, RXDBCtrl, StdCtrls, Mask, DBCtrls, RXCtrls,
  SpeedBar, RackCtls, ExtCtrls, jpeg;

type
  TFrmequipamento = class(TForm)
    Image2: TImage;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnGravar: TSpeedItem;
    BtnCancelar: TSpeedItem;
    Label1: TLabel;
    RxLabel9: TRxLabel;
    Panel2: TPanel;
    RxLabel3: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    DBnumpatrimonio: TDBEdit;
    DBnumser: TDBEdit;
    DBmarca: TDBEdit;
    DBfimgaran: TDBDateEdit;
    procedure BtnGravarClick(Sender: TObject);
    procedure DBnumserExit(Sender: TObject);
    procedure DBmarcaExit(Sender: TObject);
    procedure DBfimgaranExit(Sender: TObject);
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
  Frmequipamento: TFrmequipamento;
  novoitem:boolean;

implementation

uses UnitDMDados, UnitPrincipal;

{$R *.dfm}

procedure TFrmequipamento.BtnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar,Flag:Boolean;
  x:Integer;
begin
	Campos:='';
	Gravar:=True;
	Vazio:=False;

  If DBnumser.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'N�MERO DE S�RIE';
    Gravar:=False;
    Vazio:=True;
    end;

  If DBmarca.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'MARCA';
    Gravar:=False;
    Vazio:=True;
    end;

  If DBfimgaran.Text= '  /  /    ' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'FIM DA GARANTIA';
    Gravar:=False;
    Vazio:=True;
    End;

  If Gravar Then
    Begin
    DMDados.tbEquipamento.Post;
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
    DBnumser.SetFocus;
    end;



end;

procedure TFrmequipamento.DBnumserExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbnumser.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o N�MERO DE S�RIE');
      dbnumser.SetFocus;
      End;
    end;
end;

procedure TFrmequipamento.DBmarcaExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbmarca.Text= '' then
      Begin
      ShowMessage('� obrigat�rio a MARCA');
      dbmarca.SetFocus;
      End;
    end;
end;

procedure TFrmequipamento.DBfimgaranExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBfimgaran.Text= '  /  /    ' then
      Begin
      ShowMessage('� obrigat�rio o FIM DA GARANTIA');
      DBfimgaran.SetFocus;
      End;
    end;
end;

procedure TFrmequipamento.BtnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFrmequipamento.BtnAlterarClick(Sender: TObject);
begin
NovoItem:=True;
DMDados.tbEquipamento.Edit;
{habilitando os bot�es}
BtnCancelar.Enabled:=True;
BtnGravar.Enabled:=True;

dbnumpatrimonio.SetFocus;

end;

procedure TFrmequipamento.BtnDeletarClick(Sender: TObject);
begin
If Application.MessageBox('Tem certeza que deseja excluir este equipamento ?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
   begin
   DMDados.tbEquipamento.Delete;
   end
   else
   DMDados.tbEquipamento.Cancel;
end;

procedure TFrmequipamento.BtnSairClick(Sender: TObject);
begin
    close;
end;

procedure TFrmequipamento.FormShow(Sender: TObject);
begin
    dmdados.tbEquipamento.Append;
    dmdados.tbEquipamentoNumPatri.Value:=dmdados.TbPatrimonioNumPatri.Value;
    dbnumser.SetFocus;
    FrmPrincipal.StatusTeclas(True,'[End] Gravar [Esc] Cancelar ou Sair');
end;

procedure TFrmequipamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     FrmPrincipal.StatusTeclas(False,'');
     Action:= Cafree;
end;

procedure TFrmequipamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmequipamento.FormKeyDown(Sender: TObject; var Key: Word;
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
