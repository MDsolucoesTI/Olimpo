//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitQRPatri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TQRPatrimonio = class(TForm)
    RPPatrimonio: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    TitleBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRSysData2: TQRSysData;
    QRDBImage1: TQRDBImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QRPatrimonio: TQRPatrimonio;

implementation

uses UnitDMDados;

{$R *.dfm}

end.
