//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RxGrdCpt, fcButton, fcImgBtn, SRLabel, fcLabel,
  RXCtrls;

type
  TFrmSobre = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    RxLabel1: TRxLabel;
    SRLabel1: TSRLabel;
    RxLabel2: TRxLabel;
    SRLabel3: TSRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSobre: TFrmSobre;

implementation

uses UnitPrincipal, unitDmDados;

{$R *.dfm}

procedure TFrmSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 FrmPrincipal.StatusTeclas(False,'');
 Action:= Cafree;
end;

procedure TFrmSobre.btnSairClick(Sender: TObject);
begin
        Close;
end;

procedure TFrmSobre.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmDados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : close;
    end;
end;

procedure TFrmSobre.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[Esc] Sair');
end;

end.
