//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2002
// Sistema...........: Ceres - Controle de Cheques
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untQRelCheAberto;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  TqrRelCheAberto = class(TQuickRep)
    QRBand1: TQRBand;
    logo: TQRDBImage;
    qrlempresa: TQRDBText;
    qrlTitulo: TQRLabel;
    QRShape2: TQRShape;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    qrDataInicial: TQRLabel;
    qrDataFinal: TQRLabel;
    QRLabel3: TQRLabel;
    tbCheque: TTable;
    tbChequeNumBanco: TStringField;
    tbChequeNomeBanco: TStringField;
    tbChequeNumCheque: TFloatField;
    tbChequeAgencia: TStringField;
    tbChequeValor: TCurrencyField;
    tbChequeVencimento: TDateField;
    tbChequeDataVen: TDateField;
    tbChequeCodVen: TIntegerField;
    tbChequeCodCli: TIntegerField;
    tbChequeConta: TStringField;
    tbChequeObs: TMemoField;
    tbChequeStatus: TStringField;
    tbChequeJuros: TFloatField;
    tbChequeValorJuros: TCurrencyField;
    tbChequeNovoVenc: TDateField;
    tbChequelkNomeCli: TStringField;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    tbChequePre: TStringField;
  private

  public

  end;

var
  qrRelCheAberto: TqrRelCheAberto;

implementation

uses unitDmDados;

{$R *.DFM}

end.
