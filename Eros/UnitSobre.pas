/////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Sobre
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RxGrdCpt, fcButton, fcImgBtn, SRLabel, fcLabel,
  RXCtrls, jpeg, StdCtrls;

type
  TFrmSobre = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    RxLabel4: TRxLabel;
    RxLabel1: TRxLabel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnSair: TfcImageBtn;
    SRLabel3: TSRLabel;
    SRLabel1: TSRLabel;
    Image2: TImage;
    Label7: TLabel;
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
