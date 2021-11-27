//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitDmDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables,dbiProcs;

type
  Tdmdados = class(TDataModule)
    Base: TDatabase;
    dsParametro: TDataSource;
    TbParametro: TTable;
    TbParametroCodPar: TAutoIncField;
    TbParametroEmpresa: TStringField;
    TbParametroCNPJ: TStringField;
    TbParametroInsEstado: TStringField;
    TbParametroProprietario: TStringField;
    TbParametroCPF: TStringField;
    TbParametroEndereco: TStringField;
    TbParametroNumero: TSmallintField;
    TbParametroComplemento: TStringField;
    TbParametroBairro: TStringField;
    TbParametroCEP: TStringField;
    TbParametroCidade: TStringField;
    TbParametroUF: TStringField;
    TbParametroTel1: TStringField;
    TbParametroTel2: TStringField;
    TbParametroCelular: TStringField;
    TbParametroICMS: TFloatField;
    TbParametroLogo: TGraphicField;
    TbParametroCredRenda: TFloatField;
    TbParametroComissao: TFloatField;
    TbParametroCPMF: TFloatField;
    TbParametroMultaDia: TSmallintField;
    TbParametroValorMulta: TCurrencyField;
    TbParametroPercMulta: TFloatField;
    TbParametroDescDia: TSmallintField;
    TbParametroValorDesc: TCurrencyField;
    TbParametroPercDesc: TFloatField;
    TbParametroJurosDia: TSmallintField;
    TbParametroValorJuros: TCurrencyField;
    TbParametroPercJuros: TFloatField;
    tbCliente: TTable;
    dsCliente: TDataSource;
    tbfornecedor: TTable;
    tbfornecedorCodFor: TAutoIncField;
    tbfornecedorTipo: TStringField;
    tbfornecedorNome: TStringField;
    tbfornecedorTel1: TStringField;
    tbfornecedorTel2: TStringField;
    tbfornecedorCelular: TStringField;
    tbfornecedorCNPJ: TStringField;
    tbfornecedorCPF: TStringField;
    tbfornecedorInsEstado: TStringField;
    tbfornecedorRG: TStringField;
    tbfornecedorEndereco: TStringField;
    tbfornecedorNumero: TSmallintField;
    tbfornecedorComplemento: TStringField;
    tbfornecedorBairro: TStringField;
    tbfornecedorCep: TStringField;
    tbfornecedorCidade: TStringField;
    tbfornecedorUF: TStringField;
    tbfornecedorEMail: TStringField;
    tbfornecedorDataCad: TDateField;
    tbfornecedorObs: TMemoField;
    dsfornecedor: TDataSource;
    tbCReceber: TTable;
    dsCReceber: TDataSource;
    tbCPagar: TTable;
    dsCPagar: TDataSource;
    tbHistorico: TTable;
    tbHistoricoCodHist: TAutoIncField;
    tbHistoricoDescricao: TStringField;
    dsHistorico: TDataSource;
    dsIndexador: TDataSource;
    TbIndexador: TTable;
    TbIndexadorCodIndex: TAutoIncField;
    TbIndexadorDescricao: TStringField;
    TbIndexadorDataCad: TDateField;
    DsCCorrente: TDataSource;
    TbCCorrente: TTable;
    dsBanco: TDataSource;
    tbBanco: TTable;
    tbBancoNada: TAutoIncField;
    tbBancoNumBanco: TStringField;
    tbBancoNomeBanco: TStringField;
    tbTipoDoc: TTable;
    tbTipoDocCodDoc: TAutoIncField;
    tbTipoDocDescricao: TStringField;
    dsTipoDoc: TDataSource;
    TbCCusto: TTable;
    TbCCustoNada: TAutoIncField;
    TbCCustoCodCCusto: TStringField;
    TbCCustoDescricao: TStringField;
    dsCCusto: TDataSource;
    dsFormaPaga: TDataSource;
    tbFormaPaga: TTable;
    tbFormaPagaNada: TAutoIncField;
    tbFormaPagaCodForPag: TStringField;
    tbFormaPagaFormaPag: TStringField;
    dsCheque: TDataSource;
    tbCheque: TTable;
    tbChequeNada: TAutoIncField;
    tbChequeNumBanco: TStringField;
    tbChequeNumCheque: TFloatField;
    tbChequeAgencia: TStringField;
    tbChequeValor: TCurrencyField;
    tbChequeVencimento: TDateField;
    tbChequeDataVen: TDateField;
    tbChequeCodVen: TIntegerField;
    tbChequeCodCli: TIntegerField;
    tbChequeConta: TStringField;
    tbChequeNomeCli: TStringField;
    tbChequeObs: TMemoField;
    tbChequeStatus: TStringField;
    tbChequeNomeBanco: TStringField;
    tbChequeJuros: TFloatField;
    tbChequeValorJuros: TCurrencyField;
    tbChequeNovoVenc: TDateField;
    tbChequeValorTotal: TCurrencyField;
    DsMovConta: TDataSource;
    TbMovConta: TTable;
    tbLibCredito: TTable;
    dsLibCredito: TDataSource;
    dsBalCusto: TDataSource;
    tbBalCusto: TTable;
    tbBalCustoNada: TAutoIncField;
    tbBalCustoMes: TStringField;
    tbBalCustoAno: TStringField;
    tbBalCustoReceitas: TCurrencyField;
    tbBalCustoDespesas: TCurrencyField;
    TbCCorrenteNada: TAutoIncField;
    TbCCorrenteConta: TStringField;
    TbCCorrenteDataAbert: TDateField;
    TbCCorrenteDescricao: TStringField;
    TbCCorrenteNumBanco: TStringField;
    TbCCorrenteNumAgencia: TStringField;
    TbCCorrenteTel1: TStringField;
    TbCCorrenteFax: TStringField;
    TbCCorrenteGerente: TStringField;
    TbCCorrenteTitular: TStringField;
    TbCCorrenteLimite: TCurrencyField;
    TbCCorrenteSaldo: TCurrencyField;
    TbCCorrenteUltMov: TDateField;
    TbCCorrenteHoraMov: TTimeField;
    TbCCorrenteEMail: TStringField;
    TbCCorrenteDataCad: TDateField;
    TbMovContaCodMov: TAutoIncField;
    TbMovContaTipoOper: TStringField;
    TbMovContaDataMov: TDateField;
    TbMovContaCodDoc: TIntegerField;
    TbMovContaDosNumero: TStringField;
    TbMovContaNumAgencia: TStringField;
    TbMovContaConta: TStringField;
    TbMovContaValor: TCurrencyField;
    TbMovContaCodHist: TIntegerField;
    TbMovContaComplHist: TStringField;
    TbMovContaDataReg: TDateField;
    TbMovContaHoraReg: TTimeField;
    TbMovContaUserName: TStringField;
    tbCPagarCodCPagar: TAutoIncField;
    tbCPagarNumDoc: TStringField;
    tbCPagarCodDoc: TIntegerField;
    tbCPagarCodFor: TIntegerField;
    tbCPagarCodComp: TIntegerField;
    tbCPagarDataEmis: TDateField;
    tbCPagarDataVenc: TDateField;
    tbCPagarCodHist: TIntegerField;
    tbCPagarCompHist: TStringField;
    tbCPagarNumParcela: TStringField;
    tbCPagarValor: TCurrencyField;
    tbCPagarMultaDia: TDateField;
    tbCPagarValorMulta: TCurrencyField;
    tbCPagarPercMulta: TFloatField;
    tbCPagarDescDia: TDateField;
    tbCPagarValorDesc: TCurrencyField;
    tbCPagarPercDesc: TFloatField;
    tbCPagarJurosDia: TDateField;
    tbCPagarValorJuros: TCurrencyField;
    tbCPagarPercJuros: TFloatField;
    tbCPagarDataPaga: TDateField;
    tbCPagarValorPago: TCurrencyField;
    tbCPagarPago: TStringField;
    tbCPagarCodCCusto: TStringField;
    tbCPagarCodIndex: TIntegerField;
    tbLibCreditoNada: TAutoIncField;
    tbLibCreditoCodcli: TIntegerField;
    tbLibCreditoUltCompra: TDateField;
    tbLibCreditoRenda: TCurrencyField;
    tbLibCreditoLimite: TSmallintField;
    tbLibCreditoRestricao: TStringField;
    tbLibCreditoBanco1: TStringField;
    tbLibCreditoBanco2: TStringField;
    tbLibCreditoNome1: TStringField;
    tbLibCreditoNome2: TStringField;
    tbLibCreditoEmpresa: TStringField;
    tbLibCreditoCargo: TStringField;
    tbLibCreditoTel: TStringField;
    tbCReceberCodCRec: TAutoIncField;
    tbCReceberNumDoc: TStringField;
    tbCReceberCodDoc: TIntegerField;
    tbCReceberCodCli: TIntegerField;
    tbCReceberCodVen: TSmallintField;
    tbCReceberDataVen: TDateField;
    tbCReceberCodCServ: TIntegerField;
    tbCReceberDataEmis: TDateField;
    tbCReceberDataVenc: TDateField;
    tbCReceberCodHist: TIntegerField;
    tbCReceberNumParcela: TStringField;
    tbCReceberValor: TCurrencyField;
    tbCReceberValorMulta: TCurrencyField;
    tbCReceberValorDesc: TCurrencyField;
    tbCReceberValorJuros: TCurrencyField;
    tbCReceberDataPaga: TDateField;
    tbCReceberValorPago: TCurrencyField;
    tbCReceberPago: TStringField;
    tbCReceberCodCCusto: TStringField;
    tbCReceberCodIndex: TIntegerField;
    tbCPagarFormaPagto: TStringField;
    tbCPagarNomeFornec: TStringField;
    tbCReceberMultaDia: TDateField;
    tbCReceberPercMulta: TFloatField;
    tbCReceberDescDia: TDateField;
    tbCReceberPercDesc: TFloatField;
    tbCReceberJurosDia: TDateField;
    tbCReceberPercJuros: TFloatField;
    tbCReceberFormaPagto: TStringField;
    tbCReceberlkCliente: TStringField;
    tbCReceberLkTipoDoc: TStringField;
    tbVendas: TTable;
    tbVendasNada: TAutoIncField;
    tbVendasCodVen: TSmallintField;
    tbVendasDataven: TDateField;
    tbVendasHoraVen: TTimeField;
    tbVendasCodCli: TIntegerField;
    tbVendasValor: TCurrencyField;
    tbVendasDesconto: TCurrencyField;
    tbVendasCodForPag: TStringField;
    tbVendasNumParcelas: TSmallintField;
    tbVendasCodFunc: TIntegerField;
    tbVendasUserName: TStringField;
    tbVendasCodIndex: TIntegerField;
    tbVendasLkNomeCli: TStringField;
    tbVendasValorFinal: TCurrencyField;
    tbVendasStatus: TStringField;
    tbVendasLkNomeFunc: TStringField;
    dsVendas: TDataSource;
    dsDetVendas: TDataSource;
    tbDetVendas: TTable;
    tbDetVendasNada: TAutoIncField;
    tbDetVendasCodVen: TSmallintField;
    tbDetVendasCodMerc: TStringField;
    tbDetVendasDataVen: TDateField;
    tbDetVendasCustoUnit: TCurrencyField;
    tbDetVendasPrecoUnit: TCurrencyField;
    tbDetVendasNomeProduto: TStringField;
    tbDetVendasComissao: TFloatField;
    tbDetVendasTotal: TFloatField;
    dsPromocao: TDataSource;
    tbPromocao: TTable;
    tbPromocaoCodPromo: TAutoIncField;
    tbPromocaoCodMerc: TStringField;
    tbPromocaoValorPromo: TCurrencyField;
    tbPromocaoInicioPer: TDateField;
    tbPromocaoFinalPer: TDateField;
    dsCliEsto: TDataSource;
    tbCliEsto: TTable;
    tbCliEstoNada: TAutoIncField;
    tbCliEstoCodCli: TIntegerField;
    tbCliEstoCodMerc: TStringField;
    tbCliEstoValor: TCurrencyField;
    tbCliEstoLkNomeCli: TStringField;
    tbCliEstoLkNomeProd: TStringField;
    dsFaturamento: TDataSource;
    tbFaturamento: TTable;
    tbFaturamentoDataVen: TDateField;
    tbFaturamentoTotalVenda: TCurrencyField;
    tbFaturamentoTotalDesc: TCurrencyField;
    tbFaturamentoTotalCom: TCurrencyField;
    tbFaturamentoTotalCusto: TCurrencyField;
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
    tbFunclkCargo: TStringField;
    dsFunc: TDataSource;
    tbCargoFunc: TTable;
    tbCargoFuncCargo: TStringField;
    tbCargoFuncComissao: TSmallintField;
    tbCargoFuncCodCargo: TAutoIncField;
    dsCargoFunc: TDataSource;
    dsDepenFunc: TDataSource;
    tbDepenFunc: TTable;
    tbDepenFuncCodDep: TAutoIncField;
    tbDepenFuncCodFunc: TIntegerField;
    tbDepenFuncNomeDep: TStringField;
    tbDepenFuncNascDep: TDateField;
    tbDepenFuncParentesco: TStringField;
    tbFuncEsto: TTable;
    tbFuncEstoCodFunc: TIntegerField;
    tbFuncEstoCodMerc: TStringField;
    tbFuncEstoComissao: TCurrencyField;
    tbFuncEstolkNomeFunc: TStringField;
    tbFuncEstolkDescProd: TStringField;
    dsFuncEsto: TDataSource;
    tbGrupo: TTable;
    tbGrupoCodGrupo: TAutoIncField;
    tbGrupoGrupo: TStringField;
    dsGrupo: TDataSource;
    tbSubGrupo: TTable;
    tbSubGrupoCodSubGrupo: TAutoIncField;
    tbSubGrupoSubGrupo: TStringField;
    tbSubGrupoCodGrupo: TIntegerField;
    tbSubGrupolkGrupo: TStringField;
    dsSubGrupo: TDataSource;
    tbMarca: TTable;
    tbMarcaCodMarca: TAutoIncField;
    tbMarcaMarca: TStringField;
    dsMarca: TDataSource;
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
    tbEstoqueFoto: TGraphicField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    tbEstoqueComponente: TStringField;
    dsEstoque: TDataSource;
    dsRotaDetVendas: TDataSource;
    tbRotaDetVendas: TTable;
    dsRotaVendas: TDataSource;
    tbRotaVendas: TTable;
    tbClienteCodCli: TAutoIncField;
    tbClienteTipo: TStringField;
    tbClienteNome: TStringField;
    tbClienteNascimento: TDateField;
    tbClienteTel1: TStringField;
    tbClienteTel2: TStringField;
    tbClienteCelular: TStringField;
    tbClienteCNPJ: TStringField;
    tbClienteCPF: TStringField;
    tbClienteInsEstado: TStringField;
    tbClienteRG: TStringField;
    tbClienteEndereco: TStringField;
    tbClienteNumero: TSmallintField;
    tbClienteComplemento: TStringField;
    tbClienteBairro: TStringField;
    tbClienteCep: TStringField;
    tbClienteCidade: TStringField;
    tbClienteUF: TStringField;
    tbClienteEMail: TStringField;
    tbClienteUltimaCompra: TDateField;
    tbClienteObs: TMemoField;
    tbClienteDataCad: TDateField;
    tbUnidade: TTable;
    tbUnidadeNada: TAutoIncField;
    tbUnidadeSigla: TStringField;
    tbUnidadeDescricao: TStringField;
    dsUnidade: TDataSource;
    tbEntrada: TTable;
    tbEntradaCodMov: TAutoIncField;
    tbEntradaCodFunc: TIntegerField;
    tbEntradaTipo: TStringField;
    tbEntradaMotivo: TMemoField;
    tbEntradaData: TDateField;
    tbEntradaHora: TTimeField;
    tbEntradaUserName: TStringField;
    tbEntradalkDescriProd: TStringField;
    tbEntradaCodMerc: TStringField;
    dsEntrada: TDataSource;
    dsSaida: TDataSource;
    tbMovEstoque: TTable;
    tbMovEstoqueCodMov: TAutoIncField;
    tbMovEstoqueCodMerc: TStringField;
    tbMovEstoqueCodFunc: TIntegerField;
    tbMovEstoqueTipo: TStringField;
    tbMovEstoqueMotivo: TMemoField;
    tbMovEstoqueData: TDateField;
    tbMovEstoqueHora: TTimeField;
    tbMovEstoqueUserName: TStringField;
    tbMovEstoquelkDescriProd: TStringField;
    dsMovEstoque: TDataSource;
    tbSaida: TTable;
    tbSaidaCodMov: TAutoIncField;
    tbSaidaCodMerc: TStringField;
    tbSaidaCodFunc: TIntegerField;
    tbSaidaTipo: TStringField;
    tbSaidaMotivo: TMemoField;
    tbSaidaData: TDateField;
    tbSaidaHora: TTimeField;
    tbSaidaUserName: TStringField;
    tbSaidalkDescriProd: TStringField;
    tbEstoquePrSoma: TCurrencyField;
    tbEstoquePrMedio: TCurrencyField;
    TbParametroDecoEntra: TStringField;
    TbParametroMensPromo: TStringField;
    TbParametroMensRodape: TStringField;
    tbDecompo: TTable;
    tbDecompoNada: TAutoIncField;
    tbDecompoCodMercPri: TStringField;
    tbDecompoCodMercCom: TStringField;
    tbDecompolkProduto: TStringField;
    tbDecompolkSubProduto: TStringField;
    dsDecompo: TDataSource;
    tbProdComp: TTable;
    tbProdCompNada: TAutoIncField;
    tbProdCompCodMerc: TStringField;
    tbProdCompDescricao: TStringField;
    tbProdCompCodMarca: TIntegerField;
    tbProdCompCodSubGrupo: TIntegerField;
    tbProdCompSigla: TStringField;
    tbProdCompUltimaCompra: TDateField;
    tbProdCompPrecoCompra: TCurrencyField;
    tbProdCompMargem: TSmallintField;
    tbProdCompPrecoVenda: TCurrencyField;
    tbProdCompUltimaVenda: TDateField;
    tbProdCompFoto: TGraphicField;
    tbProdCompComponente: TStringField;
    dsProdComp: TDataSource;
    dsProdPrinc: TDataSource;
    tbProdPrinc: TTable;
    tbProdPrincNada: TAutoIncField;
    tbProdPrincCodMerc: TStringField;
    tbProdPrincDescricao: TStringField;
    tbProdPrincCodMarca: TIntegerField;
    tbProdPrincCodSubGrupo: TIntegerField;
    tbProdPrincSigla: TStringField;
    tbProdPrincUltimaCompra: TDateField;
    tbProdPrincPrecoCompra: TCurrencyField;
    tbProdPrincMargem: TSmallintField;
    tbProdPrincPrecoVenda: TCurrencyField;
    tbProdPrincUltimaVenda: TDateField;
    tbProdPrincFoto: TGraphicField;
    tbProdPrincComponente: TStringField;
    tbRota: TTable;
    tbRotaNada: TAutoIncField;
    tbRotaCodRota: TStringField;
    tbRotaDescricao: TStringField;
    dsRota: TDataSource;
    tbClienteCodRota: TStringField;
    tbClienteFantasia: TStringField;
    tbClientePrazoPagto: TFloatField;
    tbCReceberCompHist: TStringField;
    tbProdPrincPrSoma: TCurrencyField;
    tbProdCompPrSoma: TCurrencyField;
    tbLibCreditoRespon: TStringField;
    tbVendasEntrega: TDateField;
    tbEstoqueQuantidade: TFloatField;
    tbMovEstoqueQuant: TFloatField;
    tbEntradaQuant: TFloatField;
    tbSaidaQuant: TFloatField;
    tbProdPrincQuantidade: TFloatField;
    tbProdCompQuantidade: TFloatField;
    tbRotaVendasNada: TAutoIncField;
    tbRotaVendasCodVen: TSmallintField;
    tbRotaVendasDataven: TDateField;
    tbRotaVendasHoraVen: TTimeField;
    tbRotaVendasCodCli: TIntegerField;
    tbRotaVendasValor: TCurrencyField;
    tbRotaVendasDesconto: TCurrencyField;
    tbRotaVendasCodForPag: TStringField;
    tbRotaVendasNumParcelas: TSmallintField;
    tbRotaVendasCodFunc: TIntegerField;
    tbRotaVendasUserName: TStringField;
    tbRotaVendasCodIndex: TIntegerField;
    tbRotaVendasStatus: TStringField;
    tbRotaVendasEntrega: TDateField;
    tbRotaDetVendasNada: TAutoIncField;
    tbRotaDetVendasCodVen: TSmallintField;
    tbRotaDetVendasCodMerc: TStringField;
    tbRotaDetVendasDataVen: TDateField;
    tbRotaDetVendasCustoUnit: TCurrencyField;
    tbRotaDetVendasPrecoUnit: TCurrencyField;
    tbRotaDetVendasQuant: TFloatField;
    tbRotaDetVendasComissao: TFloatField;
    tbDetVendasQuant: TFloatField;
    tbDecompoQuant: TFloatField;
    tbBalCustoCodCcusto: TStringField;
    tbValIndex: TTable;
    tbValIndexNada: TAutoIncField;
    tbValIndexCodIndex: TIntegerField;
    tbValIndexDataVal: TDateField;
    tbValIndexValor: TCurrencyField;
    dsValIndex: TDataSource;
    tbEstoqueEstoqueMin: TFloatField;
    tbEstoqueEstoqueMax: TFloatField;
    tbEstoqueCodIndex: TIntegerField;
    tbEstoqueQtVenda: TFloatField;
    tbProdPrincEstoqueMin: TFloatField;
    tbProdPrincEstoqueMax: TFloatField;
    tbProdPrincCodIndex: TIntegerField;
    tbProdPrincQtVenda: TFloatField;
    tbProdCompEstoqueMin: TFloatField;
    tbProdCompEstoqueMax: TFloatField;
    tbProdCompCodIndex: TIntegerField;
    tbProdCompQtVenda: TFloatField;
    tbCompras: TTable;
    tbDetCompra: TTable;
    dsCompras: TDataSource;
    dsDetCompra: TDataSource;
    tbDetCompraCodMerc: TStringField;
    tbDetCompraCodComp: TIntegerField;
    tbDetCompraPrecoUnit: TCurrencyField;
    tbDetCompraQuant: TFloatField;
    tbComprasCodComp: TAutoIncField;
    tbComprasDataComp: TDateField;
    tbComprasHoraComp: TTimeField;
    tbComprasCodFor: TIntegerField;
    tbComprasValor: TCurrencyField;
    tbComprasDesconto: TCurrencyField;
    tbComprasCodForPag: TStringField;
    tbComprasNumParcelas: TSmallintField;
    tbComprasUserName: TStringField;
    tbComprasCodIndex: TIntegerField;
    TbMovContaCodBanco: TIntegerField;
    TbMovContaLkBanco: TStringField;
    tbCPagarlkFornec: TStringField;
    tbCPagarlkHistorico: TStringField;
    tbCReceberlkHistorico: TStringField;
    dsAluguel: TDataSource;
    TbAluguel: TTable;
    TbAluguelCodAlu: TAutoIncField;
    TbAluguelCodImo: TStringField;
    TbAluguelValorAlu: TCurrencyField;
    TbAluguelComiss: TFloatField;
    TbAluguelCodImob: TIntegerField;
    TbAluguelCodFiador: TIntegerField;
    TbAluguelCodCCusto: TStringField;
    TbAluguelDataInicio: TDateField;
    TbAluguelDataTermino: TDateField;
    TbAluguelProrroga: TStringField;
    TbAluguelDiaVenc: TStringField;
    TbAluguelAntecipado: TStringField;
    TbAluguelReajuste: TStringField;
    TbAluguelNumRecib: TStringField;
    TbAluguelDataRecib: TDateField;
    TbAluguelCodPes: TIntegerField;
    TbCadImovel: TTable;
    TbCadImovelCodImo: TStringField;
    TbCadImovelTipoOper: TStringField;
    TbCadImovelValorOper: TCurrencyField;
    TbCadImovelCodTipo: TIntegerField;
    TbCadImovelCodProp: TIntegerField;
    TbCadImovelCadPref: TStringField;
    TbCadImovelEscritura: TStringField;
    TbCadImovelAreaTer: TFloatField;
    TbCadImovelAreaCons: TFloatField;
    TbCadImovelOpcOper: TStringField;
    TbCadImovelValorOpc: TCurrencyField;
    TbCadImovelEndereco: TStringField;
    TbCadImovelNumero: TSmallintField;
    TbCadImovelComplemento: TStringField;
    TbCadImovelBairro: TStringField;
    TbCadImovelCEP: TStringField;
    TbCadImovelCidade: TStringField;
    TbCadImovelEstado: TStringField;
    TbCadImovelReferencia: TMemoField;
    TbCadImovelDormitorio: TSmallintField;
    TbCadImovelBanheiro: TSmallintField;
    TbCadImovelLavabo: TSmallintField;
    TbCadImovelHall: TSmallintField;
    TbCadImovelEscritorio: TSmallintField;
    TbCadImovelSuite: TSmallintField;
    TbCadImovelSalaTV: TSmallintField;
    TbCadImovelLiving: TSmallintField;
    TbCadImovelSalaJantar: TSmallintField;
    TbCadImovelCopa: TSmallintField;
    TbCadImovelCozinha: TSmallintField;
    TbCadImovelAreaServ: TSmallintField;
    TbCadImovelDespensa: TSmallintField;
    TbCadImovelGaragem: TSmallintField;
    TbCadImovelDormEmpre: TSmallintField;
    TbCadImovelBanheEmpre: TSmallintField;
    TbCadImovelRancho: TSmallintField;
    TbCadImovelPicina: TSmallintField;
    TbCadImovelDataCad: TDateField;
    TbCadImovellkProprietario: TStringField;
    TbCadImovellkTipoImovel: TStringField;
    TbCadImovelObs: TMemoField;
    dsCadImovel: TDataSource;
    dsImob: TDataSource;
    TbImob: TTable;
    TbImobCodImob: TAutoIncField;
    TbImobRazaoSocial: TStringField;
    TbImobTel1: TStringField;
    TbImobTel2: TStringField;
    TbImobFax: TStringField;
    TbImobCelular: TStringField;
    TbImobCNPJ: TStringField;
    TbImobInsMunic: TStringField;
    TbImobCreci: TStringField;
    TbImobContato: TStringField;
    TbImobFormaPgto: TStringField;
    TbImobEndereco: TStringField;
    TbImobNumero: TSmallintField;
    TbImobComplemento: TStringField;
    TbImobBairro: TStringField;
    TbImobCep: TStringField;
    TbImobCidade: TStringField;
    TbImobUF: TStringField;
    TbImobEMail: TStringField;
    TbImobDataCad: TDateField;
    TbImobReferencia: TMemoField;
    TbDespImov: TTable;
    TbDespImovCodImo: TStringField;
    TbDespImovAno: TStringField;
    TbDespImovIPTU: TStringField;
    TbDespImovSeguro: TStringField;
    TbDespImovCondominio: TStringField;
    TbDespImovAgua: TStringField;
    TbDespImovLuz: TStringField;
    TbDespImovLkImovel: TStringField;
    TbDespImovLkPropr: TStringField;
    TbDespImovObs: TMemoField;
    TbDespImovLkNum: TStringField;
    dsDespImov: TDataSource;
    dsTipoImov: TDataSource;
    TbTipoImov: TTable;
    TbTipoImovCodTipo: TAutoIncField;
    TbTipoImovDescricao: TStringField;
    TbIndiceAtu: TTable;
    TbIndiceAtuCodIndece: TAutoIncField;
    TbIndiceAtuData: TDateField;
    TbIndiceAtuReajuste: TFloatField;
    dsIndiceAtu: TDataSource;
    TbPessoas: TTable;
    dsPessoas: TDataSource;
    TbPessoasCodCli: TAutoIncField;
    TbPessoasTipo: TStringField;
    TbPessoasNome: TStringField;
    TbPessoasFantasia: TStringField;
    TbPessoasNascimento: TDateField;
    TbPessoasTel1: TStringField;
    TbPessoasTel2: TStringField;
    TbPessoasCelular: TStringField;
    TbPessoasCnpj: TStringField;
    TbPessoasCpf: TStringField;
    TbPessoasInsEstado: TStringField;
    TbPessoasRg: TStringField;
    TbPessoasEndereco: TStringField;
    TbPessoasNumero: TSmallintField;
    TbPessoasComplemento: TStringField;
    TbPessoasBairro: TStringField;
    TbPessoasCep: TStringField;
    TbPessoasCidade: TStringField;
    TbPessoasUf: TStringField;
    TbPessoasEmail: TStringField;
    TbPessoasUltimaCompra: TDateField;
    TbPessoasCodRota: TStringField;
    TbPessoasObs: TMemoField;
    TbPessoasDataCad: TDateField;
    TbPessoasPrazoPagto: TFloatField;
    tbfornecedorRazSocial: TStringField;
    tbfornecedorFantasia: TStringField;
    procedure tbChequeCalcFields(DataSet: TDataSet);
    procedure tbFuncCalcFields(DataSet: TDataSet);
    procedure tbDetVendasCalcFields(DataSet: TDataSet);
    procedure TbParametroAfterPost(DataSet: TDataSet);
    procedure TbParametroAfterDelete(DataSet: TDataSet);
    procedure tbClienteAfterDelete(DataSet: TDataSet);
    procedure tbClienteAfterPost(DataSet: TDataSet);
    procedure tbCPagarAfterPost(DataSet: TDataSet);
    procedure tbCPagarAfterDelete(DataSet: TDataSet);
    procedure tbBancoAfterDelete(DataSet: TDataSet);
    procedure tbBancoAfterPost(DataSet: TDataSet);
    procedure tbTipoDocAfterPost(DataSet: TDataSet);
    procedure tbTipoDocAfterDelete(DataSet: TDataSet);
    procedure tbLibCreditoAfterDelete(DataSet: TDataSet);
    procedure tbLibCreditoAfterPost(DataSet: TDataSet);
    procedure tbVendasAfterPost(DataSet: TDataSet);
    procedure tbVendasAfterDelete(DataSet: TDataSet);
    procedure tbFaturamentoAfterDelete(DataSet: TDataSet);
    procedure tbFaturamentoAfterPost(DataSet: TDataSet);
    procedure tbEstoqueAfterPost(DataSet: TDataSet);
    procedure tbEstoqueAfterDelete(DataSet: TDataSet);
    procedure tbMarcaAfterDelete(DataSet: TDataSet);
    procedure tbMarcaAfterPost(DataSet: TDataSet);
    procedure tbBalCustoAfterPost(DataSet: TDataSet);
    procedure tbBalCustoAfterDelete(DataSet: TDataSet);
    procedure tbfornecedorAfterPost(DataSet: TDataSet);
    procedure tbfornecedorAfterDelete(DataSet: TDataSet);
    procedure TbCCorrenteAfterPost(DataSet: TDataSet);
    procedure TbCCorrenteAfterDelete(DataSet: TDataSet);
    procedure TbCCustoAfterDelete(DataSet: TDataSet);
    procedure TbCCustoAfterPost(DataSet: TDataSet);
    procedure TbMovContaAfterPost(DataSet: TDataSet);
    procedure TbMovContaAfterDelete(DataSet: TDataSet);
    procedure tbDetVendasAfterDelete(DataSet: TDataSet);
    procedure tbDetVendasAfterPost(DataSet: TDataSet);
    procedure tbPromocaoAfterPost(DataSet: TDataSet);
    procedure tbPromocaoAfterDelete(DataSet: TDataSet);
    procedure tbDepenFuncAfterDelete(DataSet: TDataSet);
    procedure tbDepenFuncAfterPost(DataSet: TDataSet);
    procedure tbFuncEstoAfterPost(DataSet: TDataSet);
    procedure tbFuncEstoAfterDelete(DataSet: TDataSet);
    procedure tbCReceberAfterDelete(DataSet: TDataSet);
    procedure tbCReceberAfterPost(DataSet: TDataSet);
    procedure tbHistoricoAfterPost(DataSet: TDataSet);
    procedure tbHistoricoAfterDelete(DataSet: TDataSet);
    procedure TbIndexadorAfterDelete(DataSet: TDataSet);
    procedure TbIndexadorAfterPost(DataSet: TDataSet);
    procedure tbFormaPagaAfterPost(DataSet: TDataSet);
    procedure tbFormaPagaAfterDelete(DataSet: TDataSet);
    procedure tbChequeAfterDelete(DataSet: TDataSet);
    procedure tbChequeAfterPost(DataSet: TDataSet);
    procedure tbFuncAfterPost(DataSet: TDataSet);
    procedure tbFuncAfterDelete(DataSet: TDataSet);
    procedure tbCargoFuncAfterDelete(DataSet: TDataSet);
    procedure tbCargoFuncAfterPost(DataSet: TDataSet);
    procedure tbCliEstoAfterPost(DataSet: TDataSet);
    procedure tbCliEstoAfterDelete(DataSet: TDataSet);
    procedure tbGrupoAfterDelete(DataSet: TDataSet);
    procedure tbGrupoAfterPost(DataSet: TDataSet);
    procedure tbSubGrupoAfterPost(DataSet: TDataSet);
    procedure tbSubGrupoAfterDelete(DataSet: TDataSet);
    procedure tbRotaVendasAfterDelete(DataSet: TDataSet);
    procedure tbRotaVendasAfterPost(DataSet: TDataSet);
    procedure tbRotaDetVendasAfterPost(DataSet: TDataSet);
    procedure tbRotaDetVendasAfterDelete(DataSet: TDataSet);
    procedure tbEntradaAfterDelete(DataSet: TDataSet);
    procedure tbSaidaAfterDelete(DataSet: TDataSet);
    procedure tbMovEstoqueAfterDelete(DataSet: TDataSet);
    procedure tbUnidadeAfterDelete(DataSet: TDataSet);
    procedure tbEntradaAfterPost(DataSet: TDataSet);
    procedure tbSaidaAfterPost(DataSet: TDataSet);
    procedure tbMovEstoqueAfterPost(DataSet: TDataSet);
    procedure tbUnidadeAfterPost(DataSet: TDataSet);
    procedure tbEstoqueCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure tbDecompoAfterDelete(DataSet: TDataSet);
    procedure tbDecompoAfterPost(DataSet: TDataSet);
    procedure tbProdPrincAfterDelete(DataSet: TDataSet);
    procedure tbProdPrincAfterPost(DataSet: TDataSet);
    procedure tbProdCompAfterDelete(DataSet: TDataSet);
    procedure tbProdCompAfterPost(DataSet: TDataSet);
    procedure tbRotaAfterDelete(DataSet: TDataSet);
    procedure tbRotaAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    fHabilitaTeclado : Boolean;
    fvTabStt:Boolean;
  public
    { Public declarations }
    Property HabilitaTeclado : Boolean Read  fHabilitaTeclado Write fHabilitaTeclado;
    Property vTabStt : Boolean Read  fvTabStt Write fvTabStt;
  end;

var
  dmdados: Tdmdados;

implementation

 

{$R *.DFM}

procedure Tdmdados.tbChequeCalcFields(DataSet: TDataSet);
begin
dmdados.tbChequeValorTotal.Value:=
dmdados.tbChequeValorJuros.Value+
dmdados.tbChequeValor.Value;
end;

procedure Tdmdados.tbFuncCalcFields(DataSet: TDataSet);
begin
  If tbFuncSalario.Value > 0 Then
    Begin
    If tbFuncINSS.Value > 0 Then
      tbFuncVlINSS.Value:=TbFuncSalario.Value*(tbFuncINSS.Value/100)
    Else
      tbFuncVlINSS.Value:=0;
    If tbFuncValeTrans.Value > 0 Then
      tbFuncVlValeTrans.Value:=tbFuncSalario.Value*(tbFuncValeTrans.Value/100)
    Else
      tbFuncVlValeTrans.Value:=0;
    If tbFuncValeRef.Value > 0 Then
      tbFuncVlValeRef.Value:=tbFuncSalario.Value*(tbFuncValeTrans.Value/100)
    Else
      tbFuncVlValeRef.Value:=0;
    tbFuncVl13.Value:=tbFuncSalario.Value*(1/12);
    tbFuncVlFerias.Value:=tbFuncSalario.Value*(1/12);
    tbFuncAbonoFerias.Value:=tbFuncVlFerias.Value*(1/3);
    tbFuncFGTS.Value:=tbFuncSalario.Value*0.08;
    tbFuncMultaFGTS.Value:=tbFuncFGTS.Value*0.40;
    tbFuncCusto.Value:=tbFuncVlINSS.Value+tbFuncVlValeTrans.Value+tbFuncVlValeRef.Value+
                       tbFuncVl13.Value+tbFuncVlFerias.Value+tbFuncAbonoFerias.Value+
                       tbFuncFGTS.Value+tbFuncMultaFGTS.Value;
    End;
end;

procedure Tdmdados.tbDetVendasCalcFields(DataSet: TDataSet);
begin
dmdados.tbDetVendasTotal.Value:=
dmdados.tbDetVendasQuant.value*dmdados.tbDetVendasPrecoUnit.Value;
end;

procedure Tdmdados.TbParametroAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbParametro.Handle);
end;

procedure Tdmdados.TbParametroAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbParametro.Handle);
end;

procedure Tdmdados.tbClienteAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbCliente.Handle);
end;

procedure Tdmdados.tbClienteAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbCliente.Handle);
end;

procedure Tdmdados.tbCPagarAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbCpagar.Handle);
end;

procedure Tdmdados.tbCPagarAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbCpagar.Handle);
end;

procedure Tdmdados.tbBancoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbBanco.Handle);
end;

procedure Tdmdados.tbBancoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbBanco.Handle);
end;

procedure Tdmdados.tbTipoDocAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbTipoDoc.Handle);
end;

procedure Tdmdados.tbTipoDocAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbTipoDoc.Handle);
end;

procedure Tdmdados.tbLibCreditoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbLibCredito.Handle);
end;

procedure Tdmdados.tbLibCreditoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbLibCredito.Handle);
end;

procedure Tdmdados.tbVendasAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbVendas.Handle);
end;

procedure Tdmdados.tbVendasAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbVendas.Handle);
end;

procedure Tdmdados.tbFaturamentoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbFaturamento.Handle);
end;

procedure Tdmdados.tbFaturamentoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbFaturamento.Handle);
end;

procedure Tdmdados.tbEstoqueAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbEstoque.Handle);
end;

procedure Tdmdados.tbEstoqueAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbEstoque.Handle);
end;

procedure Tdmdados.tbMarcaAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbMarca.Handle);
end;

procedure Tdmdados.tbMarcaAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbMarca.Handle);
end;

procedure Tdmdados.tbBalCustoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbBalCusto.Handle);
end;

procedure Tdmdados.tbBalCustoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbBalCusto.Handle);
end;

procedure Tdmdados.tbfornecedorAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbFornecedor.Handle);
end;

procedure Tdmdados.tbfornecedorAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbFornecedor.Handle);
end;

procedure Tdmdados.TbCCorrenteAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbCCorrente.Handle);
end;

procedure Tdmdados.TbCCorrenteAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbCCorrente.Handle);
end;

procedure Tdmdados.TbCCustoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbCCusto.Handle);
end;

procedure Tdmdados.TbCCustoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbCCusto.Handle);
end;

procedure Tdmdados.TbMovContaAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbMovConta.Handle);
end;

procedure Tdmdados.TbMovContaAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbMovConta.Handle);
end;

procedure Tdmdados.tbDetVendasAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbDetVendas.Handle);
end;

procedure Tdmdados.tbDetVendasAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbDetVendas.Handle);
end;

procedure Tdmdados.tbPromocaoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbPromocao.Handle);
end;

procedure Tdmdados.tbPromocaoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbPromocao.Handle);
end;

procedure Tdmdados.tbDepenFuncAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbDepenFunc.Handle);
end;

procedure Tdmdados.tbDepenFuncAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbDepenFunc.Handle);
end;

procedure Tdmdados.tbFuncEstoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbFuncEsto.Handle);
end;

procedure Tdmdados.tbFuncEstoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbFuncEsto.Handle);
end;

procedure Tdmdados.tbCReceberAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbCreceber.Handle);
end;

procedure Tdmdados.tbCReceberAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbCreceber.Handle);
end;

procedure Tdmdados.tbHistoricoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbHistorico.Handle);
end;

procedure Tdmdados.tbHistoricoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbHistorico.Handle);
end;

procedure Tdmdados.TbIndexadorAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbIndexador.Handle);
end;

procedure Tdmdados.TbIndexadorAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbIndexador.Handle);
end;

procedure Tdmdados.tbFormaPagaAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbFormaPaga.Handle);
end;

procedure Tdmdados.tbFormaPagaAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbFormaPaga.Handle);
end;

procedure Tdmdados.tbChequeAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbCheque.Handle);
end;

procedure Tdmdados.tbChequeAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbCheque.Handle);
end;

procedure Tdmdados.tbFuncAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbFunc.Handle);
end;

procedure Tdmdados.tbFuncAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbFunc.Handle);
end;

procedure Tdmdados.tbCargoFuncAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbCargoFunc.Handle);
end;

procedure Tdmdados.tbCargoFuncAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbCargoFunc.Handle);
end;

procedure Tdmdados.tbCliEstoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbCliEsto.Handle);
end;

procedure Tdmdados.tbCliEstoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbCliEsto.Handle);
end;

procedure Tdmdados.tbGrupoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbGrupo.Handle);
end;

procedure Tdmdados.tbGrupoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbGrupo.Handle);
end;

procedure Tdmdados.tbSubGrupoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbSubGrupo.Handle);
end;

procedure Tdmdados.tbSubGrupoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbSubGrupo.Handle);
end;

procedure Tdmdados.tbRotaVendasAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbRotaVendas.Handle);
end;

procedure Tdmdados.tbRotaVendasAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbRotaVendas.Handle);
end;

procedure Tdmdados.tbRotaDetVendasAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbDetVendas.Handle);
end;

procedure Tdmdados.tbRotaDetVendasAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbDetVendas.Handle);
end;

procedure Tdmdados.tbEntradaAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbEntrada.Handle);
end;

procedure Tdmdados.tbSaidaAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbSaida.Handle);
end;

procedure Tdmdados.tbMovEstoqueAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbMovEstoque.Handle);
end;

procedure Tdmdados.tbUnidadeAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbUnidade.Handle);
end;

procedure Tdmdados.tbEntradaAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbEntrada.Handle);
end;

procedure Tdmdados.tbSaidaAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbSaida.Handle);
end;

procedure Tdmdados.tbMovEstoqueAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbMovEstoque.Handle);
end;

procedure Tdmdados.tbUnidadeAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbUnidade.Handle);
end;

procedure Tdmdados.tbEstoqueCalcFields(DataSet: TDataSet);
begin
  if tbEstoqueQtVenda.Value <> 0 Then
    tbEstoquePrMedio.Value:=tbEstoquePrSoma.Value/tbEstoqueQtVenda.Value;
end;

procedure Tdmdados.DataModuleCreate(Sender: TObject);
begin
  HabilitaTeclado:=True;
  vTabStt:=True;
end;

procedure Tdmdados.tbDecompoAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbDecompo.Handle);
end;

procedure Tdmdados.tbDecompoAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbDecompo.Handle);
end;

procedure Tdmdados.tbProdPrincAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbProdPrinc.Handle);
end;

procedure Tdmdados.tbProdPrincAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbProdPrinc.Handle);
end;

procedure Tdmdados.tbProdCompAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbProdComp.Handle);
end;

procedure Tdmdados.tbProdCompAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbProdComp.Handle);
end;

procedure Tdmdados.tbRotaAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbRota.Handle);
end;

procedure Tdmdados.tbRotaAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbRota.Handle);
end;

end.
