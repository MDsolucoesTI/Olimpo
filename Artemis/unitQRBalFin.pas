//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitQRBalFin;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrBalFin = class(TQuickRep)
    TitleBand1: TQRBand;
    QRDBImage1: TQRDBImage;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrData1: TQRLabel;
    qrData2: TQRLabel;
    DetailBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    vrCaixa: TQRLabel;
    NumConta2: TQRLabel;
    vrConta2: TQRLabel;
    NumConta3: TQRLabel;
    NumConta4: TQRLabel;
    NumConta5: TQRLabel;
    NumConta6: TQRLabel;
    NumConta7: TQRLabel;
    NumConta8: TQRLabel;
    NumConta9: TQRLabel;
    NumConta10: TQRLabel;
    NumConta11: TQRLabel;
    vrConta3: TQRLabel;
    vrConta4: TQRLabel;
    vrConta5: TQRLabel;
    vrConta6: TQRLabel;
    vrConta7: TQRLabel;
    vrConta9: TQRLabel;
    vrConta8: TQRLabel;
    vrConta10: TQRLabel;
    vrConta11: TQRLabel;
    QRLabel11: TQRLabel;
    qrTotDisponivel: TQRLabel;
    QRLabel12: TQRLabel;
    qrValReceberMes: TQRLabel;
    QRLabel13: TQRLabel;
    qrCheReceberMes: TQRLabel;
    QRLabel14: TQRLabel;
    qrValInad: TQRLabel;
    QRLabel15: TQRLabel;
    qrTotPrevista: TQRLabel;
    QRLabel16: TQRLabel;
    qrTotReceita: TQRLabel;
    qrValPagarMes: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    qrValFuncio: TQRLabel;
    QRLabel19: TQRLabel;
    qrTotDespesa: TQRLabel;
    QRLabel20: TQRLabel;
    qrLucroMes: TQRLabel;
    QRLabel21: TQRLabel;
    qrValPenPagar: TQRLabel;
    QRLabel22: TQRLabel;
    qrLucroReal: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    qrValPenReceber: TQRLabel;
    QRLabel25: TQRLabel;
    qrValPenCheque: TQRLabel;
    QRLabel26: TQRLabel;
    qrTotPend: TQRLabel;
    QRLabel27: TQRLabel;
    qrLucroPoss: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    qrValReceberFut: TQRLabel;
    QRLabel30: TQRLabel;
    qrCheRecebeFut: TQRLabel;
    QRLabel31: TQRLabel;
    qrTotFut: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    qrValPagarFut: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    qrValPerdaRec: TQRLabel;
    QRLabel36: TQRLabel;
    qrValPerdaChe: TQRLabel;
    QRLabel37: TQRLabel;
    qrTotPerda: TQRLabel;
    QRLabel5: TQRLabel;
    qrData3: TQRLabel;
  private

  public

  end;

var
  qrBalFin: TqrBalFin;

implementation

uses unitDmDados;

{$R *.DFM}

end.
