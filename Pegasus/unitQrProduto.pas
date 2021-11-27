/////////////////////////////////////////////////////////////////////////
// Criação...........: 17-01-2001
// Ultima modificação: 04-07-2005
// Módulo............: Relatório de Compras (Fornecedores) - Relatório
// Sistema...........: Pegasus - Controle de Estoque
// Integração........: Olimpo - Automação Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitQrProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TQrProduto = class(TForm)
    qrpProduto: TQuickRep;
    DetailBand1: TQRBand;
    qrdbCod: TQRDBText;
    qrdbNome: TQRDBText;
    qrdbPedido: TQRDBText;
    qedbValor: TQRDBText;
    qrdbData: TQRDBText;
    qrdbPagto: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    TitleBand1: TQRBand;
    qrlTitulo: TQRLabel;
    QRDBImage1: TQRDBImage;
    QRDBText1: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    qrlCod: TQRLabel;
    qrlNome: TQRLabel;
    qrlPedido: TQRLabel;
    QRLabel2: TQRLabel;
    qrlValor: TQRLabel;
    qrlData: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRDBText2: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QrProduto: TQrProduto;

implementation

uses unitDmDados;

{$R *.DFM}

end.
