//////////////////////////////////////////////////////////////////////////
// Criação...........: 02/2001
// Ultima modificação: 08/2004
// Módulo............: Relatório de Vendas
// Sistema...........: Eros - Controle de Vendas
// Integração........: Olimpo - Automação Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitQrPedidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ExtCtrls, Qrctrls;

type
  TQrPedidosCli = class(TForm)
    qrpPedidos: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    TitleBand1: TQRBand;
    qrdbCod: TQRDBText;
    qrdbNome: TQRDBText;
    qrlTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBImage1: TQRDBImage;
    QRSubDetail1: TQRSubDetail;
    qrlCod: TQRLabel;
    qrlNome: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrdbPedido: TQRDBText;
    qedbValor: TQRDBText;
    qrdbData: TQRDBText;
    qrdbPagto: TQRDBText;
    GroupHeaderBand1: TQRBand;
    qrlPedido: TQRLabel;
    qrlValor: TQRLabel;
    qrlData: TQRLabel;
    qrlPagto: TQRLabel;
    QRDBText1: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QrPedidosCli: TQrPedidosCli;

implementation

uses unitDmDados;

{$R *.DFM}

end.
