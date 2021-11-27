//////////////////////////////////////////////////////////////////////////
// Criação...........: 02/2001
// Ultima modificação: 08/2004
// Módulo............: Relatório Comissão
// Sistema...........: Eros - Controle de Vendas
// Integração........: Olimpo - Automação Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitQrComissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, DB, DBTables;

type
  TQrComissao = class(TForm)
    qrpComissao: TQuickRep;
    DetailBand1: TQRBand;
    qrdbCod: TQRDBText;
    qrdbNome: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    TitleBand1: TQRBand;
    qrlTitulo: TQRLabel;
    QRDBImage1: TQRDBImage;
    qrsubdet: TQRSubDetail;
    qrdbPedido: TQRDBText;
    QRDBText1: TQRDBText;
    qedbValor: TQRDBText;
    qrdbPagto: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    GroupFooterBand1: TQRBand;
    GroupHeaderBand1: TQRBand;
    qrlPedido: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    qrlValor: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    qrlNome: TQRLabel;
    qrlCod: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRExpr1: TQRExpr;
    tbDetVendas: TTable;
    tbDetVendasCodVen: TSmallintField;
    tbDetVendasCodMerc: TStringField;
    tbDetVendasDataVen: TDateField;
    tbDetVendasCustoUnit: TCurrencyField;
    tbDetVendasPrecoUnit: TCurrencyField;
    tbDetVendasQuant: TFloatField;
    tbDetVendasComissao: TFloatField;
    tbDetVendasNF: TStringField;
    dsVendas: TDataSource;
    QRDBText4: TQRDBText;
    tbVendas: TTable;
    tbVendasCodVen: TSmallintField;
    tbVendasDataven: TDateField;
    tbVendasHoraVen: TTimeField;
    tbVendasCodCli: TIntegerField;
    tbVendasValor: TCurrencyField;
    tbVendasDesconto: TCurrencyField;
    tbVendasCodFunc: TIntegerField;
    tbVendasUserName: TStringField;
    tbVendasValorFinal: TCurrencyField;
    tbVendasEntrega: TDateField;
    tbFunc: TTable;
    tbFuncCodFunc: TAutoIncField;
    tbFuncNome: TStringField;
    tbFuncCodCargo: TIntegerField;
    tbFuncComissao: TFloatField;
    tbFuncDataAdim: TDateField;
    tbFuncRG: TStringField;
    tbFuncCPF: TStringField;
    tbFuncEndereco: TStringField;
    tbFuncNumero: TSmallintField;
    tbFuncComplemento: TStringField;
    tbFuncBairro: TStringField;
    tbFuncCEP: TStringField;
    tbFuncCidade: TStringField;
    tbFuncTel1: TStringField;
    tbFuncTel2: TStringField;
    tbFuncCelular: TStringField;
    tbFuncNascimento: TDateField;
    tbFuncEMail: TStringField;
    tbFuncSalario: TCurrencyField;
    tbFuncSituacao: TStringField;
    tbFuncDataCad: TDateField;
    tbFuncINSS: TFloatField;
    tbFuncValeTrans: TFloatField;
    tbFuncValeRef: TFloatField;
    tbFuncCusto: TFloatField;
    tbFuncVl13: TFloatField;
    tbFuncVlFerias: TFloatField;
    tbFuncAbonoFerias: TFloatField;
    tbFuncFGTS: TFloatField;
    tbFuncMultaFGTS: TFloatField;
    tbFuncVlINSS: TFloatField;
    tbFuncVlValeTrans: TFloatField;
    tbFuncVlValeRef: TFloatField;
    tbFuncValorComi: TCurrencyField;
    tbFuncUF: TStringField;
    tbFuncObs: TMemoField;
    tbFuncUltimaVenda: TDateField;
    tbVendaslknomefunc: TStringField;
    tbVendasCodForPag: TStringField;
    tbVendasCodIndex: TIntegerField;
    tbVendasCaixa: TStringField;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QrComissao: TQrComissao;

implementation


{$R *.DFM}


end.
