//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untFechaCx;

interface

uses
  Windows, Messages, SysUtils, Variants,DB, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, fcButton, fcImgBtn, Mask, DBCtrls, ExtCtrls, RXCtrls,
  JvComponent, JvTransBtn, fcLabel, EGrad, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel,
  EMsgDlg, JvToolEdit, JvEdit, JvTypedEdit, JvLabel, JvDBCtrl;

type
  TFrmFechaCx = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    Panel3: TLMDBackPanel;
    btnSair: TJvTransparentButton;
    btnAbrirCx: TJvTransparentButton;
    LMDBackPanel1: TLMDBackPanel;
    MsgDlg: TEvMsgDlg;
    edtTroco: TJvCurrencyEdit;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    fcLabel1: TfcLabel;
    edtData: TJvDBDateEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnAbrirCxClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtTrocoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFechaCx: TFrmFechaCx;

implementation

uses unitDmDados, UnitPrincipal;

{$R *.dfm}

procedure TFrmFechaCx.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmFechaCx.btnAbrirCxClick(Sender: TObject);
begin
  dmDados.tbCaixa.First;
  if (dmdados.tbCaixa.Locate('DataMov',edtData.Text,[])) Then
    begin
    if dmDados.tbCaixaStatus.Value = 'A' then
      MsgDlg.MsgInformation('J� existe Caixa Aberto nesta DATA!!!')
    else
      MsgDlg.MsgInformation('J� existe Caixa Fechado nesta DATA!!!');
    end
  else
    begin
    dmDados.tbCaixa.Append;
    dmDados.tbCaixaDataMov.Value  := StrToDate(edtData.Text);
    dmDados.tbCaixaTrocoIni.Value := edtTroco.Value         ;
    dmDados.tbCaixaStatus.Value   := 'A'                    ;
    dmDados.tbCaixa.Post;
    MsgDlg.MsgInformation('Caixa do dia ' + DateToStr(Date) + ' -> ABERTO!!!');
    Close;
    end;
end;

procedure TFrmFechaCx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.tbCaixa.Close;
  Action := caFree;
end;

procedure TFrmFechaCx.edtTrocoExit(Sender: TObject);
begin
  Panel3.SetFocus;
end;

procedure TFrmFechaCx.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (dmDados.HabilitaTeclado) then
    case (key) of
      // Teclas de navega��o
      VK_END    : btnAbrirCx.Click;
      VK_ESCAPE : btnSair.Click   ;
    end;
end;

procedure TFrmFechaCx.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmFechaCx.FormActivate(Sender: TObject);
begin
  dmDados.HabilitaTeclado := True;
  dmDados.vTabStt:=True;
  FrmPrincipal.StatusTeclas(True,'[End] Abre o Caixa [Esc] Cancelar ou Sair');
    if dmDados.tbCaixa.State = dsInactive then
      dmDados.tbCaixa.Open;
      edtTroco.SetFocus;
end;

end.
