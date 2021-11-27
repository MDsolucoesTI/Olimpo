//////////////////////////////////////////////////////////////////////////////
// Criação...........: 17-01-2001
// Ultima modificação: 04-07-2005
// Módulo............: Relatório de Compras (Mercadoris/Produtos) - Relatório
// Sistema...........: Pegasus - Controle de Estoque
// Integração........: Olimpo - Automação Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////////

unit Unitqrcompra1;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBTables;

type
  Tqrcompra1 = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRDBImage1: TQRDBImage;
    QRDBText1: TQRDBText;
    qrlTitulo: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRSysData2: TQRSysData;
    QRShape4: TQRShape;
    QRSysData1: TQRSysData;
    tbdetcompra: TTable;
    tbdetcompraCodMerc: TStringField;
    tbdetcompraCodComp: TIntegerField;
    tbdetcompraPrecoUnit: TCurrencyField;
    tbdetcompraQuant: TFloatField;
    tbdetcompraDataComp: TDateField;
    tbdetcompralkproduto: TStringField;
    tbdetcompraTotal: TFloatField;
    tbEstoque: TTable;
    tbEstoqueNada: TAutoIncField;
    tbEstoqueCodMerc: TStringField;
    tbEstoqueDescricao: TStringField;
    tbEstoqueCodMarca: TIntegerField;
    tbEstoqueCodSubGrupo: TIntegerField;
    tbEstoqueSigla: TStringField;
    tbEstoqueUltimaCompra: TDateField;
    tbEstoquePrecoCompra: TCurrencyField;
    tbEstoqueMargem: TSmallintField;
    tbEstoquePrecoVenda: TCurrencyField;
    tbEstoqueUltimaVenda: TDateField;
    tbEstoqueComponente: TStringField;
    tbEstoquePrSoma: TCurrencyField;
    tbEstoquePrMedio: TCurrencyField;
    tbEstoqueQuantidade: TFloatField;
    tbEstoqueEstoqueMin: TFloatField;
    tbEstoqueEstoqueMax: TFloatField;
    tbEstoqueCodIndex: TIntegerField;
    tbEstoqueQtVenda: TSmallintField;
    tbEstoquePrecoVendaAt: TCurrencyField;
    tbEstoqueFoto: TGraphicField;
    QRLabel2: TQRLabel;
    QRDBText8: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WinControlFormClose(Sender: TObject;
      var Action: TCloseAction);
    procedure tbdetcompraCalcFields(DataSet: TDataSet);
  private

  public

  end;

var
  qrcompra1: Tqrcompra1;

implementation

uses unitDmDados;

{$R *.DFM}

procedure Tqrcompra1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure Tqrcompra1.WinControlFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;

procedure Tqrcompra1.tbdetcompraCalcFields(DataSet: TDataSet);
begin
tbDetCompraTotal.Value:=tbDetCompraPrecoUnit.Value*tbDetCompraQuant.Value;
end;

end.
