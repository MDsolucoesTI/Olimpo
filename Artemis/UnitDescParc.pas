//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitDescParc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, ExtCtrls, RXCtrls, jpeg, fcImager, RxGrdCpt,
  StdCtrls, Mask, ToolEdit, CurrEdit, RXDBCtrl, DBCtrls;

type
  TFrmDescParc = class(TForm)
    Panel3: TPanel;
    RxLabel4: TRxLabel;
    Image1: TImage;
    Panel4: TPanel;
    btnConfirmar: TfcImageBtn;
    btnSair: TfcImageBtn;
    Panel1: TPanel;
    RxGradientCaption2: TRxGradientCaption;
    RxLabel7: TRxLabel;
    Bevel1: TBevel;
    PanelParcial: TPanel;
    RadioButton1: TRadioButton;
    RxLabel10: TRxLabel;
    RxLabel9: TRxLabel;
    RadioButton2: TRadioButton;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDescParc: TFrmDescParc;

implementation

{$R *.dfm}

procedure TFrmDescParc.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
