//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
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
    Bevel1: TBevel;
    Image1: TImage;
    RxLabel1: TRxLabel;
    fcLabel1: TfcLabel;
    SRLabel1: TSRLabel;
    RxLabel2: TRxLabel;
    Bevel2: TBevel;
    btnSair: TfcImageBtn;
    RxGradientCaption1: TRxGradientCaption;
    SRLabel2: TSRLabel;
    SRLabel3: TSRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSobre: TFrmSobre;

implementation

{$R *.dfm}

procedure TFrmSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        Action:= Cafree;
end;

procedure TFrmSobre.btnSairClick(Sender: TObject);
begin
        Close;
end;

end.
