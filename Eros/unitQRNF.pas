//////////////////////////////////////////////////////////////////////////
// Criação...........: 02/2001
// Ultima modificação: 08/2004
// Módulo............: Relatório - Nota Fiscal
// Sistema...........: Eros - Controle de Vendas
// Integração........: Olimpo - Automação Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitQRNF;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrNF = class(TQuickRep)
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    qrCod1: TQRDBText;
    qrCod3: TQRDBText;
    qrCod2: TQRDBText;
    qrCod4: TQRDBText;
    qrCod5: TQRDBText;
    qrCod6: TQRDBText;
    qrCod7: TQRDBText;
    qrCod8: TQRDBText;
    qrCod9: TQRDBText;
    qrCod10: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    qrMerc1: TQRDBText;
    qrMerc2: TQRDBText;
    qrMerc3: TQRDBText;
    qrMerc4: TQRDBText;
    qrMerc5: TQRDBText;
    qrMerc6: TQRDBText;
    qrMerc7: TQRDBText;
    qrMerc8: TQRDBText;
    qrMerc9: TQRDBText;
    qrMerc10: TQRDBText;
    rQt1: TQRDBText;
    rQt2: TQRDBText;
    rQt3: TQRDBText;
    rQt4: TQRDBText;
    rQt5: TQRDBText;
    rQt6: TQRDBText;
    rQt7: TQRDBText;
    rQt8: TQRDBText;
    rQt9: TQRDBText;
    rQt10: TQRDBText;
    rU1: TQRDBText;
    qrUnid1: TQRDBText;
    qrUnid2: TQRDBText;
    qrUnid3: TQRDBText;
    qrUnid4: TQRDBText;
    qrUnid5: TQRDBText;
    qrUnid6: TQRDBText;
    qrUnid7: TQRDBText;
    qrUnid8: TQRDBText;
    qrUnid9: TQRDBText;
    qrUnid10: TQRDBText;
    rU2: TQRDBText;
    rU3: TQRDBText;
    rU4: TQRDBText;
    rU5: TQRDBText;
    rU6: TQRDBText;
    rU7: TQRDBText;
    rU8: TQRDBText;
    rU9: TQRDBText;
    rU10: TQRDBText;
    rT1: TQRDBText;
    rT2: TQRDBText;
    rT3: TQRDBText;
    rT4: TQRDBText;
    rT5: TQRDBText;
    rT6: TQRDBText;
    rT7: TQRDBText;
    rT8: TQRDBText;
    rT9: TQRDBText;
    rT10: TQRDBText;
    qrIcm1: TQRDBText;
    qrIcm2: TQRDBText;
    qrIcm3: TQRDBText;
    qrIcm4: TQRDBText;
    qrIcm5: TQRDBText;
    qrIcm6: TQRDBText;
    qrIcm7: TQRDBText;
    qrIcm8: TQRDBText;
    qrIcm9: TQRDBText;
    qrIcm10: TQRDBText;
    QRDBText116: TQRDBText;
    QRDBText117: TQRDBText;
    QRDBText118: TQRDBText;
    QRDBText119: TQRDBText;
    QRDBText120: TQRDBText;
    QRDBText121: TQRDBText;
    QRDBText122: TQRDBText;
    QRDBText123: TQRDBText;
    QRDBText124: TQRDBText;
    QRDBText125: TQRDBText;
    rI1: TQRDBText;
    rI2: TQRDBText;
    rI3: TQRDBText;
    rI4: TQRDBText;
    rI5: TQRDBText;
    rI6: TQRDBText;
    rI7: TQRDBText;
    rI8: TQRDBText;
    rI9: TQRDBText;
    rI10: TQRDBText;
    QRDBText136: TQRDBText;
    QRDBText137: TQRDBText;
    QRDBText138: TQRDBText;
    QRDBText139: TQRDBText;
    QRDBText140: TQRDBText;
    QRDBText141: TQRDBText;
    QRDBText142: TQRDBText;
    QRDBText143: TQRDBText;
    QRDBText144: TQRDBText;
    QRDBText145: TQRDBText;
    QRDBText146: TQRDBText;
    QRDBText147: TQRDBText;
    QRDBText148: TQRDBText;
    QRDBText149: TQRDBText;
    QRDBText150: TQRDBText;
    QRDBText151: TQRDBText;
    QRDBText152: TQRDBText;
    QRDBText153: TQRDBText;
    QRDBText154: TQRDBText;
    QRDBText155: TQRDBText;
    QRDBText156: TQRDBText;
    QRDBText157: TQRDBText;
    QRDBText158: TQRDBText;
    QRDBText159: TQRDBText;
    QRDBText160: TQRDBText;
    QRDBText161: TQRDBText;
    QRDBText162: TQRDBText;
    QRDBText163: TQRDBText;
    QRDBRichText1: TQRDBRichText;
    qrSaida: TQRLabel;
    qrEntrada: TQRLabel;
    QRDBText66: TQRDBText;
  private

  public

  end;

var
  qrNF: TqrNF;

implementation

uses unitDmDados;

{$R *.DFM}

end.
