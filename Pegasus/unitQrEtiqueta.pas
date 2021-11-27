///////////////////////////////////////////////////////////////////////////////////
// Criação...........: 18-01-2001
// Ultima modificação: 04-07-2005
// Módulo............: Relatório de Etiquetas das Mercadorias/Produtos - Relatório
// Sistema...........: Pegasus - Controle de Estoque
// Integração........: Olimpo - Automação Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
///////////////////////////////////////////////////////////////////////////////////

unit unitQrEtiqueta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, QUICKRPT, QRCTRLS, ExtCtrls;

type
  TQrEtiqueta = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QrEtiqueta: TQrEtiqueta;

implementation

uses unitDmDados;

{$R *.dfm}

end.
