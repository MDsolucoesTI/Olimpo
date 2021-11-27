//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitQrReciboCpag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TQrReciboCP = class(TForm)
    Pag: TQuickRep;
    DetailBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel6: TQRLabel;
    TitleBand1: TQRBand;
    QRDBImage1: TQRDBImage;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape1: TQRShape;
    PageFooterBand1: TQRBand;
    QRShape2: TQRShape;
    QRDBText6: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRDBText2: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QrReciboCP: TQrReciboCP;

implementation

uses unitDmDados;

{$R *.dfm}

end.
