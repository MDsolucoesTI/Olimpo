/////////////////////////////////////////////////////////////////////////
// Criação...........: 02/2001
// Ultima modificação: 08/2004
// Módulo............: Relatório Vendas - Funcionários
// Sistema...........: Eros - Controle de Vendas
// Integração........: Olimpo - Automação Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitQrPedidosFunc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls;

type
  TQrPedidosFunc = class(TForm)
    qrpPedidosFunc: TQuickRep;
    DetailBand1: TQRBand;
    qrdbCod: TQRDBText;
    qrdbNome: TQRDBText;
    qrlCod: TQRLabel;
    qrlNome: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    TitleBand1: TQRBand;
    qrlTitulo: TQRLabel;
    QRDBImage1: TQRDBImage;
    QRSubDetail1: TQRSubDetail;
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
  QrPedidosFunc: TQrPedidosFunc;

implementation

uses unitDmDados;

{$R *.dfm}

end.
