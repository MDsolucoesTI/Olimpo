///////////////////////////////////////////////////////////////////////////
// Criação...........: 02/2001
// Ultima modificação: 08/2004
// Módulo............: Relatório do Fechamento de Caixa
// Sistema...........: Eros - Controle de Vendas
// Integração........: Olimpo - Automação Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untRelFechaCaixa;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrFechaCaixa = class(TQuickRep)
    QRBand1: TQRBand;
    QRDBImage1: TQRDBImage;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand2: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape1: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape2: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText16: TQRDBText;
    QRShape4: TQRShape;
    QRLabel21: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText21: TQRDBText;
    QRShape5: TQRShape;
    QRLabel27: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText23: TQRDBText;
  private

  public

  end;

var
  qrFechaCaixa: TqrFechaCaixa;

implementation

uses unitDmDados;

{$R *.DFM}

end.
