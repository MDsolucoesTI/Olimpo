//////////////////////////////////////////////////////////////////////////
// Criação...........: 02/2001
// Ultima modificação: 08/2004
// Módulo............: Relatório de Orçamento
// Sistema...........: Eros - Controle de Vendas
// Integração........: Olimpo - Automação Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitQrOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TQrOrcamento = class(TForm)
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBImage1: TQRDBImage;
    QRDBText1: TQRDBText;
    qrlTitulo: TQRLabel;
    qrlCod: TQRLabel;
    qrlNome: TQRLabel;
    qrdbNome: TQRDBText;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRSubDetail1: TQRSubDetail;
    GroupHeaderBand1: TQRBand;
    qrlValor: TQRLabel;
    qrlData: TQRLabel;
    qrlPagto: TQRLabel;
    qrlPedido: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrdbPedido: TQRDBText;
    qedbValor: TQRDBText;
    qrdbData: TQRDBText;
    qrdbPagto: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QrOrcamento: TQrOrcamento;

implementation

uses unitDmDados;

{$R *.dfm}

end.
