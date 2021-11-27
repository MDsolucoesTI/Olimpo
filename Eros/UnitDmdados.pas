//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Base de Dados - Acesso aos Arquivos (Paradox)
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitDmDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables,dbiProcs, QuickRpt, QRCtrls;

type
  Tdmdados = class(TDataModule)
    dsParametro: TDataSource;
    TbParametro: TTable;
    TbParametroCodPar: TAutoIncField;
    TbParametroEmpresa: TStringField;
    TbParametroCNPJ: TStringField;
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
    tbCReceber: TTable;
    dsCReceber: TDataSource;
    tbCPagar: TTable;
    dsCPagar: TDataSource;
    DsCCorrente: TDataSource;
    TbCCorrente: TTable;
    DsMovConta: TDataSource;
    TbMovConta: TTable;
    tbLibCredito: TTable;
    dsLibCredito: TDataSource;
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
    TbMovContaDosNumero: TStringField;
    TbMovContaNumAgencia: TStringField;
    TbMovContaConta: TStringField;
    TbMovContaValor: TCurrencyField;
    TbMovContaComplHist: TStringField;
    TbMovContaDataReg: TDateField;
    TbMovContaHoraReg: TTimeField;
    TbMovContaUserName: TStringField;
    tbCPagarCodCPagar: TAutoIncField;
    tbCPagarNumDoc: TStringField;
    tbCPagarCodFor: TIntegerField;
    tbCPagarDataEmis: TDateField;
    tbCPagarDataVenc: TDateField;
    tbCPagarCompHist: TStringField;
    tbCPagarValor: TCurrencyField;
    tbCPagarDataPaga: TDateField;
    tbCPagarValorPago: TCurrencyField;
    tbCPagarPago: TStringField;
    tbCPagarCodCCusto: TStringField;
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
    tbCReceberCodCli: TIntegerField;
    tbCReceberCodVen: TSmallintField;
    tbCReceberDataVen: TDateField;
    tbCReceberCodCServ: TIntegerField;
    tbCReceberDataEmis: TDateField;
    tbCReceberDataVenc: TDateField;
    tbCReceberValor: TCurrencyField;
    tbCReceberValorMulta: TCurrencyField;
    tbCReceberValorDesc: TCurrencyField;
    tbCReceberValorJuros: TCurrencyField;
    tbCReceberDataPaga: TDateField;
    tbCReceberValorPago: TCurrencyField;
    tbCReceberPago: TStringField;
    tbCReceberCodCCusto: TStringField;
    tbCReceberMultaDia: TDateField;
    tbCReceberPercMulta: TFloatField;
    tbCReceberDescDia: TDateField;
    tbCReceberPercDesc: TFloatField;
    tbCReceberJurosDia: TDateField;
    tbCReceberPercJuros: TFloatField;
    tbCReceberlkCliente: TStringField;
    tbVendas: TTable;
    tbVendasCodVen: TSmallintField;
    tbVendasDataven: TDateField;
    tbVendasHoraVen: TTimeField;
    tbVendasCodCli: TIntegerField;
    tbVendasValor: TCurrencyField;
    tbVendasDesconto: TCurrencyField;
    tbVendasCodFunc: TIntegerField;
    tbVendasUserName: TStringField;
    tbVendasCodIndex: TIntegerField;
    tbVendasLkNomeCli: TStringField;
    tbVendasValorFinal: TCurrencyField;
    dsVendas: TDataSource;
    dsDetVendas: TDataSource;
    tbDetVendas: TTable;
    tbDetVendasCodVen: TSmallintField;
    tbDetVendasCodMerc: TStringField;
    tbDetVendasDataVen: TDateField;
    tbDetVendasCustoUnit: TCurrencyField;
    tbDetVendasPrecoUnit: TCurrencyField;
    tbDetVendasNomeProduto: TStringField;
    tbDetVendasComissao: TFloatField;
    tbDetVendasTotal: TFloatField;
    dsFaturamento: TDataSource;
    tbFaturamento: TTable;
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
    tbClienteCodCli: TAutoIncField;
    tbClienteNome: TStringField;
    tbClienteNascimento: TDateField;
    tbClienteTel1: TStringField;
    tbClienteTel2: TStringField;
    tbClienteCelular: TStringField;
    tbClienteCNPJ: TStringField;
    tbClienteCPF: TStringField;
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
    tbUnidadeSigla: TStringField;
    tbUnidadeDescricao: TStringField;
    dsUnidade: TDataSource;
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
    tbEstoquePrSoma: TCurrencyField;
    tbEstoquePrMedio: TCurrencyField;
    TbParametroDecoEntra: TStringField;
    TbParametroMensPromo: TStringField;
    TbParametroMensRodape: TStringField;
    tbClienteCodRota: TStringField;
    tbClienteFantasia: TStringField;
    tbClientePrazoPagto: TFloatField;
    tbCReceberCompHist: TStringField;
    tbLibCreditoRespon: TStringField;
    tbVendasEntrega: TDateField;
    tbEstoqueQuantidade: TFloatField;
    tbMovEstoqueQuant: TFloatField;
    tbDetVendasQuant: TFloatField;
    tbEstoqueEstoqueMin: TFloatField;
    tbEstoqueEstoqueMax: TFloatField;
    tbEstoqueCodIndex: TIntegerField;
    TbMovContaCodBanco: TIntegerField;
    tbNF: TTable;
    dsNF: TDataSource;
    tbNFCodNF: TAutoIncField;
    tbNFCodCli: TIntegerField;
    tbNFCodVen: TIntegerField;
    tbNFDataVen: TDateField;
    tbNFEntrada: TBooleanField;
    tbNFSaida: TBooleanField;
    tbNFNaturaOper: TStringField;
    tbNFCFOP: TStringField;
    tbNFBCalcICMS: TCurrencyField;
    tbNFVlICMS: TCurrencyField;
    tbNFBCalcICMSSub: TCurrencyField;
    tbNFVlICMSSub: TCurrencyField;
    tbNFVlTotalProd: TCurrencyField;
    tbNFVlFrete: TCurrencyField;
    tbNFVlSeguro: TCurrencyField;
    tbNFOutrasDep: TCurrencyField;
    tbNFVlIPI: TCurrencyField;
    tbNFVlTotNF: TCurrencyField;
    tbNFTNome: TStringField;
    tbNFPorConta: TStringField;
    tbNFPlacaVei: TStringField;
    tbNFUF1: TStringField;
    tbNFCNPJ: TStringField;
    tbNFEnder: TStringField;
    tbNFCidade: TStringField;
    tbNFUF2: TStringField;
    tbNFIE: TStringField;
    tbNFQuant: TFloatField;
    tbNFEspecie: TStringField;
    tbNFMarca: TStringField;
    tbNFNumero: TFloatField;
    tbNFPesoBruto: TFloatField;
    tbNFPesoLiqui: TFloatField;
    tbNFNumPed: TIntegerField;
    tbNFSPed: TStringField;
    tbNFVende: TStringField;
    tbNFImpresso: TStringField;
    tbNFDet: TTable;
    tbNFCli: TTable;
    dsNFDet: TDataSource;
    dsNFCli: TDataSource;
    tbNFDetNada: TAutoIncField;
    tbNFDetCodNF: TIntegerField;
    tbNFDetDMerc1: TStringField;
    tbNFDetCLF1: TStringField;
    tbNFDetSitTrib1: TStringField;
    tbNFDetPUnit1: TCurrencyField;
    tbNFDetQt1: TFloatField;
    tbNFDetUnid1: TStringField;
    tbNFDetICMS1: TStringField;
    tbNFDetIPI1: TStringField;
    tbNFDetDMerc2: TStringField;
    tbNFDetCLF2: TStringField;
    tbNFDetSitTrib2: TStringField;
    tbNFDetPUnit2: TCurrencyField;
    tbNFDetQt2: TFloatField;
    tbNFDetUnid2: TStringField;
    tbNFDetICMS2: TStringField;
    tbNFDetIPI2: TStringField;
    tbNFDetDMerc3: TStringField;
    tbNFDetCLF3: TStringField;
    tbNFDetSitTrib3: TStringField;
    tbNFDetPUnit3: TCurrencyField;
    tbNFDetQt3: TFloatField;
    tbNFDetUnid3: TStringField;
    tbNFDetICMS3: TStringField;
    tbNFDetIPI3: TStringField;
    tbNFDetDMerc4: TStringField;
    tbNFDetCLF4: TStringField;
    tbNFDetSitTrib4: TStringField;
    tbNFDetPUnit4: TCurrencyField;
    tbNFDetQt4: TFloatField;
    tbNFDetUnid4: TStringField;
    tbNFDetICMS4: TStringField;
    tbNFDetIPI4: TStringField;
    tbNFDetDMerc5: TStringField;
    tbNFDetCLF5: TStringField;
    tbNFDetSitTrib5: TStringField;
    tbNFDetPUnit5: TCurrencyField;
    tbNFDetQt5: TFloatField;
    tbNFDetUnid5: TStringField;
    tbNFDetICMS5: TStringField;
    tbNFDetIPI5: TStringField;
    tbNFDetDMerc6: TStringField;
    tbNFDetCLF6: TStringField;
    tbNFDetSitTrib6: TStringField;
    tbNFDetPUnit6: TCurrencyField;
    tbNFDetQt6: TFloatField;
    tbNFDetUnid6: TStringField;
    tbNFDetICMS6: TStringField;
    tbNFDetIPI6: TStringField;
    tbNFDetDMerc7: TStringField;
    tbNFDetCLF7: TStringField;
    tbNFDetSitTrib7: TStringField;
    tbNFDetPUnit7: TCurrencyField;
    tbNFDetQt7: TFloatField;
    tbNFDetUnid7: TStringField;
    tbNFDetICMS7: TStringField;
    tbNFDetIPI7: TStringField;
    tbNFDetDMerc8: TStringField;
    tbNFDetCLF8: TStringField;
    tbNFDetSitTrib8: TStringField;
    tbNFDetPUnit8: TCurrencyField;
    tbNFDetQt8: TFloatField;
    tbNFDetUnid8: TStringField;
    tbNFDetICMS8: TStringField;
    tbNFDetIPI8: TStringField;
    tbNFDetDMerc9: TStringField;
    tbNFDetCLF9: TStringField;
    tbNFDetSitTrib9: TStringField;
    tbNFDetPUnit9: TCurrencyField;
    tbNFDetQt9: TFloatField;
    tbNFDetUnid9: TStringField;
    tbNFDetICMS9: TStringField;
    tbNFDetIPI9: TStringField;
    tbNFDetDMerc10: TStringField;
    tbNFDetCLF10: TStringField;
    tbNFDetSitTrib10: TStringField;
    tbNFDetPUnit10: TCurrencyField;
    tbNFDetQt10: TFloatField;
    tbNFDetUnid10: TStringField;
    tbNFDetICMS10: TStringField;
    tbNFDetIPI10: TStringField;
    tbNFDetvrTot1: TCurrencyField;
    tbNFDetVrIPI1: TCurrencyField;
    tbNFDetvrTot2: TCurrencyField;
    tbNFDetvrIPI2: TCurrencyField;
    tbNFDetvrTot3: TCurrencyField;
    tbNFDetvrIPI3: TCurrencyField;
    tbNFDetvrTot4: TCurrencyField;
    tbNFDetvrIPI4: TCurrencyField;
    tbNFDetvrTot5: TCurrencyField;
    tbNFDetvrIPI5: TCurrencyField;
    tbNFDetvrTot6: TCurrencyField;
    tbNFDetvrIPI6: TCurrencyField;
    tbNFDetvrTot7: TCurrencyField;
    tbNFDetvrIPI7: TCurrencyField;
    tbNFDetvrTot8: TCurrencyField;
    tbNFDetvrIPI8: TCurrencyField;
    tbNFDetvrTot9: TCurrencyField;
    tbNFDetvrIPI9: TCurrencyField;
    tbNFDetvrTot10: TCurrencyField;
    tbNFDetvrIPI10: TCurrencyField;
    tbNFCliCodCli: TAutoIncField;
    tbNFCliTipo: TStringField;
    tbNFCliNome: TStringField;
    tbNFCliFantasia: TStringField;
    tbNFCliNascimento: TDateField;
    tbNFCliTel1: TStringField;
    tbNFCliTel2: TStringField;
    tbNFCliCelular: TStringField;
    tbNFCliCnpj: TStringField;
    tbNFCliCpf: TStringField;
    tbNFCliInsEstado: TStringField;
    tbNFCliRg: TStringField;
    tbNFCliEndereco: TStringField;
    tbNFCliNumero: TSmallintField;
    tbNFCliComplemento: TStringField;
    tbNFCliBairro: TStringField;
    tbNFCliCep: TStringField;
    tbNFCliCidade: TStringField;
    tbNFCliUf: TStringField;
    tbNFCliEmail: TStringField;
    tbNFCliUltimaCompra: TDateField;
    tbNFCliCodRota: TStringField;
    tbNFCliObs: TMemoField;
    tbNFCliDataCad: TDateField;
    tbNFCliPrazoPagto: TFloatField;
    tbNFDtEmissao: TDateField;
    tbNFDtSaiEnt: TDateField;
    tbNFHoraSaiEnt: TTimeField;
    tbNFObs: TMemoField;
    tbNFDetNufa1: TStringField;
    tbNFDetValor1: TCurrencyField;
    tbNFDetVenc1: TDateField;
    tbNFDetNufa2: TStringField;
    tbNFDetValor2: TCurrencyField;
    tbNFDetVenc2: TDateField;
    tbNFDetNufa3: TStringField;
    tbNFDetValor3: TCurrencyField;
    tbNFDetVenc3: TDateField;
    tbNFIESubst: TStringField;
    tbNFlkTotalProd: TFloatField;
    tbNFlkVlTotalNota: TFloatField;
    tbNFlkVlIPI: TFloatField;
    tbVenCli: TTable;
    dsVenCli: TDataSource;
    dsDetVenCli: TDataSource;
    tbDetvenCli: TTable;
    tbVenCliNada: TAutoIncField;
    tbVenCliCodVen: TSmallintField;
    tbVenCliDataven: TDateField;
    tbVenCliHoraVen: TTimeField;
    tbVenCliCodCli: TIntegerField;
    tbVenCliValor: TCurrencyField;
    tbVenCliDesconto: TCurrencyField;
    tbVenCliCodFunc: TIntegerField;
    tbVenCliUserName: TStringField;
    tbVenCliCodIndex: TIntegerField;
    tbVenCliEntrega: TDateField;
    tbDetvenCliCodVen: TSmallintField;
    tbDetvenCliCodMerc: TStringField;
    tbDetvenCliDataVen: TDateField;
    tbDetvenCliCustoUnit: TCurrencyField;
    tbDetvenCliPrecoUnit: TCurrencyField;
    tbDetvenCliQuant: TFloatField;
    tbDetvenCliComissao: TFloatField;
    tbRecVenCli: TTable;
    dsRecVenCli: TDataSource;
    tbRecVenCliCodCRec: TAutoIncField;
    tbRecVenCliNumDoc: TStringField;
    tbRecVenCliCodCli: TIntegerField;
    tbRecVenCliCodVen: TSmallintField;
    tbRecVenCliDataVen: TDateField;
    tbRecVenCliCodCServ: TIntegerField;
    tbRecVenCliDataEmis: TDateField;
    tbRecVenCliDataVenc: TDateField;
    tbRecVenCliCompHist: TStringField;
    tbRecVenCliValor: TCurrencyField;
    tbRecVenCliMultaDia: TDateField;
    tbRecVenCliValorMulta: TCurrencyField;
    tbRecVenCliPercMulta: TFloatField;
    tbRecVenCliDescDia: TDateField;
    tbRecVenCliValorDesc: TCurrencyField;
    tbRecVenCliPercDesc: TFloatField;
    tbRecVenCliJurosDia: TDateField;
    tbRecVenCliValorJuros: TCurrencyField;
    tbRecVenCliPercJuros: TFloatField;
    tbRecVenCliDataPaga: TDateField;
    tbRecVenCliValorPago: TCurrencyField;
    tbRecVenCliPago: TStringField;
    tbRecVenCliCodCCusto: TStringField;
    tbVenClilkNomeFunc: TStringField;
    tbVenCliValorFinal: TCurrencyField;
    tbDetvenClilkUnidade: TStringField;
    tbFuncVendas: TTable;
    dsFuncVendas: TDataSource;
    tbFuncVendasCodVen: TSmallintField;
    tbFuncVendasDataven: TDateField;
    tbFuncVendasHoraVen: TTimeField;
    tbFuncVendasCodCli: TIntegerField;
    tbFuncVendasValor: TCurrencyField;
    tbFuncVendasDesconto: TCurrencyField;
    tbFuncVendasCodFunc: TIntegerField;
    tbFuncVendasUserName: TStringField;
    tbFuncVendasCodIndex: TIntegerField;
    tbFuncVendasEntrega: TDateField;
    tbFuncUltimaVenda: TDateField;
    tbEstoqueQtVenda: TSmallintField;
    dsOrc: TDataSource;
    tbOrc: TTable;
    tbDetOrc: TTable;
    dsdetOrc: TDataSource;
    tbFaturamentoDataVen: TDateField;
    tbFaturamentoTotalVenda: TCurrencyField;
    tbFaturamentoTotalDesc: TCurrencyField;
    tbFaturamentoTotalCom: TCurrencyField;
    tbFaturamentoTotalCusto: TCurrencyField;
    TbParametroPis: TFloatField;
    TbParametroCofins: TFloatField;
    TbParametroCS: TFloatField;
    tbDetVendasNF: TStringField;
    tbDetvenCliNF: TStringField;
    tbDetvenClilkDescr: TStringField;
    TbParametroInsEstado: TStringField;
    tbClienteInsEstado: TStringField;
    tbVisDetVen: TTable;
    tbVisDetOrc: TTable;
    tbVisDetVenDataVen: TDateField;
    tbVisDetVenCodVen: TSmallintField;
    tbVisDetVenCodMerc: TStringField;
    tbVisDetVenCustoUnit: TCurrencyField;
    tbVisDetVenPrecoUnit: TCurrencyField;
    tbVisDetVenQuant: TFloatField;
    tbVisDetVenComissao: TFloatField;
    tbVisDetVenNF: TStringField;
    dsVisDetVen: TDataSource;
    dsVisDetOrc: TDataSource;
    tbClinota: TTable;
    dsCliNota: TDataSource;
    tbClinotaCodCli: TAutoIncField;
    tbClinotaTipo: TStringField;
    tbClinotaNome: TStringField;
    tbClinotaFantasia: TStringField;
    tbClinotaNascimento: TDateField;
    tbClinotaTel1: TStringField;
    tbClinotaTel2: TStringField;
    tbClinotaCelular: TStringField;
    tbClinotaCnpj: TStringField;
    tbClinotaCpf: TStringField;
    tbClinotaInsEstado: TStringField;
    tbClinotaRg: TStringField;
    tbClinotaEndereco: TStringField;
    tbClinotaNumero: TSmallintField;
    tbClinotaComplemento: TStringField;
    tbClinotaBairro: TStringField;
    tbClinotaCep: TStringField;
    tbClinotaCidade: TStringField;
    tbClinotaUf: TStringField;
    tbClinotaEmail: TStringField;
    tbClinotaUltimaCompra: TDateField;
    tbClinotaCodRota: TStringField;
    tbClinotaObs: TMemoField;
    tbClinotaDataCad: TDateField;
    tbClinotaPrazoPagto: TFloatField;
    dsICMS: TDataSource;
    tbICMS: TTable;
    tbICMSNADA: TAutoIncField;
    tbICMSESTADO: TStringField;
    tbICMSICMS: TFloatField;
    tbVisDetVenLKnome: TStringField;
    tbSenha: TTable;
    tbSenhaSenha: TStringField;
    dsSenha: TDataSource;
    tbNFDetCodM1: TStringField;
    tbNFDetCodM2: TStringField;
    tbNFDetCodM3: TStringField;
    tbNFDetCodM4: TStringField;
    tbNFDetCodM5: TStringField;
    tbNFDetCodM6: TStringField;
    tbNFDetCodM7: TStringField;
    tbNFDetCodM8: TStringField;
    tbNFDetCodM9: TStringField;
    tbNFDetCodM10: TStringField;
    dsVisNF: TDataSource;
    tbVisNF: TTable;
    tbVisNFCodNF: TAutoIncField;
    tbVisNFCodCli: TIntegerField;
    tbVisNFCodVen: TIntegerField;
    tbVisNFDataVen: TDateField;
    tbVisNFEntrada: TBooleanField;
    tbVisNFSaida: TBooleanField;
    tbVisNFNaturaOper: TStringField;
    tbVisNFDtEmissao: TDateField;
    tbVisNFDtSaiEnt: TDateField;
    tbVisNFHoraSaiEnt: TTimeField;
    tbVisNFCFOP: TStringField;
    tbVisNFIESubst: TStringField;
    tbVisNFBCalcICMS: TCurrencyField;
    tbVisNFVlICMS: TCurrencyField;
    tbVisNFBCalcICMSSub: TCurrencyField;
    tbVisNFVlICMSSub: TCurrencyField;
    tbVisNFVlTotalProd: TCurrencyField;
    tbVisNFVlFrete: TCurrencyField;
    tbVisNFVlSeguro: TCurrencyField;
    tbVisNFOutrasDep: TCurrencyField;
    tbVisNFVlIPI: TCurrencyField;
    tbVisNFVlTotNF: TCurrencyField;
    tbVisNFTNome: TStringField;
    tbVisNFPorConta: TStringField;
    tbVisNFPlacaVei: TStringField;
    tbVisNFUF1: TStringField;
    tbVisNFCNPJ: TStringField;
    tbVisNFEnder: TStringField;
    tbVisNFCidade: TStringField;
    tbVisNFUF2: TStringField;
    tbVisNFIE: TStringField;
    tbVisNFQuant: TFloatField;
    tbVisNFEspecie: TStringField;
    tbVisNFMarca: TStringField;
    tbVisNFNumero: TFloatField;
    tbVisNFPesoBruto: TFloatField;
    tbVisNFPesoLiqui: TFloatField;
    tbVisNFNumPed: TIntegerField;
    tbVisNFSPed: TStringField;
    tbVisNFVende: TStringField;
    tbVisNFObs: TMemoField;
    tbVisNFImpresso: TStringField;
    dsVisDetNF: TDataSource;
    tbVisDetNF: TTable;
    tbVisDetNFNada: TAutoIncField;
    tbVisDetNFCodNF: TIntegerField;
    tbVisDetNFCodM1: TStringField;
    tbVisDetNFDMerc1: TStringField;
    tbVisDetNFCLF1: TStringField;
    tbVisDetNFSitTrib1: TStringField;
    tbVisDetNFPUnit1: TCurrencyField;
    tbVisDetNFQt1: TFloatField;
    tbVisDetNFUnid1: TStringField;
    tbVisDetNFICMS1: TStringField;
    tbVisDetNFIPI1: TStringField;
    tbVisDetNFCodM2: TStringField;
    tbVisDetNFDMerc2: TStringField;
    tbVisDetNFCLF2: TStringField;
    tbVisDetNFSitTrib2: TStringField;
    tbVisDetNFPUnit2: TCurrencyField;
    tbVisDetNFQt2: TFloatField;
    tbVisDetNFUnid2: TStringField;
    tbVisDetNFICMS2: TStringField;
    tbVisDetNFIPI2: TStringField;
    tbVisDetNFCodM3: TStringField;
    tbVisDetNFDMerc3: TStringField;
    tbVisDetNFCLF3: TStringField;
    tbVisDetNFSitTrib3: TStringField;
    tbVisDetNFPUnit3: TCurrencyField;
    tbVisDetNFQt3: TFloatField;
    tbVisDetNFUnid3: TStringField;
    tbVisDetNFICMS3: TStringField;
    tbVisDetNFIPI3: TStringField;
    tbVisDetNFCodM4: TStringField;
    tbVisDetNFDMerc4: TStringField;
    tbVisDetNFCLF4: TStringField;
    tbVisDetNFSitTrib4: TStringField;
    tbVisDetNFPUnit4: TCurrencyField;
    tbVisDetNFQt4: TFloatField;
    tbVisDetNFUnid4: TStringField;
    tbVisDetNFICMS4: TStringField;
    tbVisDetNFIPI4: TStringField;
    tbVisDetNFCodM5: TStringField;
    tbVisDetNFDMerc5: TStringField;
    tbVisDetNFCLF5: TStringField;
    tbVisDetNFSitTrib5: TStringField;
    tbVisDetNFPUnit5: TCurrencyField;
    tbVisDetNFQt5: TFloatField;
    tbVisDetNFUnid5: TStringField;
    tbVisDetNFICMS5: TStringField;
    tbVisDetNFIPI5: TStringField;
    tbVisDetNFCodM6: TStringField;
    tbVisDetNFDMerc6: TStringField;
    tbVisDetNFCLF6: TStringField;
    tbVisDetNFSitTrib6: TStringField;
    tbVisDetNFPUnit6: TCurrencyField;
    tbVisDetNFQt6: TFloatField;
    tbVisDetNFUnid6: TStringField;
    tbVisDetNFICMS6: TStringField;
    tbVisDetNFIPI6: TStringField;
    tbVisDetNFCodM7: TStringField;
    tbVisDetNFDMerc7: TStringField;
    tbVisDetNFCLF7: TStringField;
    tbVisDetNFSitTrib7: TStringField;
    tbVisDetNFPUnit7: TCurrencyField;
    tbVisDetNFQt7: TFloatField;
    tbVisDetNFUnid7: TStringField;
    tbVisDetNFICMS7: TStringField;
    tbVisDetNFIPI7: TStringField;
    tbVisDetNFCodM8: TStringField;
    tbVisDetNFDMerc8: TStringField;
    tbVisDetNFCLF8: TStringField;
    tbVisDetNFSitTrib8: TStringField;
    tbVisDetNFPUnit8: TCurrencyField;
    tbVisDetNFQt8: TFloatField;
    tbVisDetNFUnid8: TStringField;
    tbVisDetNFICMS8: TStringField;
    tbVisDetNFIPI8: TStringField;
    tbVisDetNFCodM9: TStringField;
    tbVisDetNFDMerc9: TStringField;
    tbVisDetNFCLF9: TStringField;
    tbVisDetNFSitTrib9: TStringField;
    tbVisDetNFPUnit9: TCurrencyField;
    tbVisDetNFQt9: TFloatField;
    tbVisDetNFUnid9: TStringField;
    tbVisDetNFICMS9: TStringField;
    tbVisDetNFIPI9: TStringField;
    tbVisDetNFCodM10: TStringField;
    tbVisDetNFDMerc10: TStringField;
    tbVisDetNFCLF10: TStringField;
    tbVisDetNFSitTrib10: TStringField;
    tbVisDetNFPUnit10: TCurrencyField;
    tbVisDetNFQt10: TFloatField;
    tbVisDetNFUnid10: TStringField;
    tbVisDetNFICMS10: TStringField;
    tbVisDetNFIPI10: TStringField;
    tbVisDetNFNufa1: TStringField;
    tbVisDetNFValor1: TCurrencyField;
    tbVisDetNFVenc1: TDateField;
    tbVisDetNFNufa2: TStringField;
    tbVisDetNFValor2: TCurrencyField;
    tbVisDetNFVenc2: TDateField;
    tbVisDetNFNufa3: TStringField;
    tbVisDetNFValor3: TCurrencyField;
    tbVisDetNFVenc3: TDateField;
    tbVisDetNFvrTot1: TFloatField;
    tbVisDetNFvrTot2: TFloatField;
    tbVisDetNFvrTot3: TFloatField;
    tbVisDetNFvrTot4: TFloatField;
    tbVisDetNFvrTot5: TFloatField;
    tbVisDetNFvrTot6: TFloatField;
    tbVisDetNFvrTot7: TFloatField;
    tbVisDetNFvrTot8: TFloatField;
    tbVisDetNFvrTot9: TFloatField;
    tbVisDetNFvrTot10: TFloatField;
    tbCReceberLkEndereco: TStringField;
    qrdbPedido: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    qedbValor: TQRDBText;
    QRDBText3: TQRDBText;
    qrdbPagto: TQRDBText;
    tbVendaslknomefunc: TStringField;
    tbCCusto: TTable;
    tbCCustoCodCCusto: TStringField;
    tbCCustoDescricao: TStringField;
    dsCCusto: TDataSource;
    tbFornecedor: TTable;
    tbFornecedorCodFor: TAutoIncField;
    tbFornecedorTipo: TStringField;
    tbFornecedorNome: TStringField;
    tbFornecedorTel1: TStringField;
    tbFornecedorTel2: TStringField;
    tbFornecedorCelular: TStringField;
    tbFornecedorCNPJ: TStringField;
    tbFornecedorCPF: TStringField;
    tbFornecedorInsEstado: TStringField;
    tbFornecedorRG: TStringField;
    tbFornecedorEndereco: TStringField;
    tbFornecedorNumero: TSmallintField;
    tbFornecedorComplemento: TStringField;
    tbFornecedorBairro: TStringField;
    tbFornecedorCep: TStringField;
    tbFornecedorCidade: TStringField;
    tbFornecedorUF: TStringField;
    tbFornecedorEMail: TStringField;
    tbFornecedorDataCad: TDateField;
    tbFornecedorObs: TMemoField;
    tbFornecedorRazSocial: TStringField;
    tbFornecedorFantasia: TStringField;
    dsFornecedor: TDataSource;
    tbBalCusto: TTable;
    tbBalCustoCodCcusto: TStringField;
    tbBalCustoMes: TStringField;
    tbBalCustoAno: TStringField;
    tbBalCustoReceitas: TCurrencyField;
    tbBalCustoDespesas: TCurrencyField;
    dsBalCusto: TDataSource;
    tbCargo: TTable;
    tbCargoCodCargo: TAutoIncField;
    tbCargoCargo: TStringField;
    tbCargoComissao: TSmallintField;
    dsCargo: TDataSource;
    tbHistorico: TTable;
    tbHistoricoDescricao: TStringField;
    dsHistorico: TDataSource;
    dsIndexador: TDataSource;
    TbIndexador: TTable;
    TbIndexadorCodIndex: TAutoIncField;
    TbIndexadorDescricao: TStringField;
    TbIndexadorDataCad: TDateField;
    dsBanco: TDataSource;
    tbBanco: TTable;
    tbBancoNumBanco: TStringField;
    tbBancoNomeBanco: TStringField;
    tbTipoDoc: TTable;
    tbTipoDocDescricao: TStringField;
    dsTipoDoc: TDataSource;
    dsFormaPaga: TDataSource;
    tbFormaPaga: TTable;
    tbFormaPagaNada: TAutoIncField;
    tbFormaPagaCodForPag: TStringField;
    tbFormaPagaFormaPag: TStringField;
    dsCheque: TDataSource;
    tbCheque: TTable;
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
    tbChequeNomeBanco: TStringField;
    tbChequeJuros: TFloatField;
    tbChequeValorJuros: TCurrencyField;
    tbChequeNovoVenc: TDateField;
    tbChequeValorTotal: TCurrencyField;
    dsPromocao: TDataSource;
    tbPromocao: TTable;
    tbPromocaoCodPromo: TAutoIncField;
    tbPromocaoCodMerc: TStringField;
    tbPromocaoValorPromo: TCurrencyField;
    tbPromocaoInicioPer: TDateField;
    tbPromocaoFinalPer: TDateField;
    tbValIndex: TTable;
    tbValIndexNada: TAutoIncField;
    tbValIndexCodIndex: TIntegerField;
    tbValIndexDataVal: TDateField;
    tbValIndexValor: TCurrencyField;
    tbValIndexlkDescIndex: TStringField;
    dsValIndex: TDataSource;
    tbRelEsto: TTable;
    tbRelEstoCodMerc: TStringField;
    tbRelEstoDescricao: TStringField;
    tbRelEstoCodMarca: TIntegerField;
    tbRelEstoCodSubGrupo: TIntegerField;
    tbRelEstoQuantidade: TFloatField;
    tbRelEstoSigla: TStringField;
    tbRelEstoEstoqueMin: TFloatField;
    tbRelEstoEstoqueMax: TFloatField;
    tbRelEstoUltimaCompra: TDateField;
    tbRelEstoPrecoCompra: TCurrencyField;
    tbRelEstoCodIndex: TIntegerField;
    tbRelEstoMargem: TSmallintField;
    tbRelEstoPrecoVenda: TCurrencyField;
    tbRelEstoUltimaVenda: TDateField;
    tbRelEstoFoto: TGraphicField;
    tbRelEstoComponente: TStringField;
    tbRelEstoPrSoma: TCurrencyField;
    tbRelEstoQtVenda: TSmallintField;
    tbRelEstoPrecoVendaAt: TCurrencyField;
    dsRelEsto: TDataSource;
    dsEtiqueta: TDataSource;
    tbEtiqueta: TTable;
    tbEtiquetaDataVen: TDateField;
    tbEtiquetaCodVen: TSmallintField;
    tbEtiquetaCodMerc: TStringField;
    tbEtiquetaCustoUnit: TCurrencyField;
    tbEtiquetaPrecoUnit: TCurrencyField;
    tbEtiquetaQuant: TFloatField;
    tbEtiquetaComissao: TFloatField;
    tbEtiquetaNF: TStringField;
    tbEtiquetaLkCliente: TStringField;
    tbEtiquetaLkTrans: TStringField;
    tbEtiquetaLkNF: TIntegerField;
    tbEtiquetaLKProduto: TStringField;
    tbDepende: TTable;
    tbDependeCodDep: TAutoIncField;
    tbDependeCodCli: TIntegerField;
    tbDependeNomeDep: TStringField;
    tbDependeNascDep: TDateField;
    tbDependeParentesco: TStringField;
    dsDepende: TDataSource;
    tbSalMes: TTable;
    tbSalMesNada: TAutoIncField;
    tbSalMesCodFunc: TIntegerField;
    tbSalMesMes: TStringField;
    tbSalMesAno: TStringField;
    tbSalMesVlSalario: TCurrencyField;
    tbSalMesVlComissao: TCurrencyField;
    tbSalMesVlINSS: TCurrencyField;
    tbSalMesVlTrans: TCurrencyField;
    tbSalMesVlRef: TCurrencyField;
    dsSalMes: TDataSource;
    tbChequeStatus: TStringField;
    tbCaixa: TTable;
    tbCaixaDataMov: TDateField;
    tbCaixaHora: TTimeField;
    tbCaixaCodFunc: TIntegerField;
    tbCaixaTrocoIni: TCurrencyField;
    tbCaixaVales: TCurrencyField;
    tbCaixaSaida: TCurrencyField;
    tbCaixaTrocoFim: TCurrencyField;
    tbCaixaDiferenca: TCurrencyField;
    dsCaixa: TDataSource;
    tbPlanos: TTable;
    tbPlanosCodPlano: TAutoIncField;
    tbPlanosDescricao: TStringField;
    tbPlanosEntrada: TStringField;
    tbPlanosNumPresta: TSmallintField;
    tbPlanosPrimeira: TSmallintField;
    tbPlanosIntervalo: TSmallintField;
    tbPlanosJuros: TFloatField;
    dsPlanos: TDataSource;
    tbSenhaTipoAcesso: TStringField;
    tbSenhaUsuario: TStringField;
    tbFuncLimDesc: TFloatField;
    tbPlanosDtEntrada: TSmallintField;
    tbVendasCaixa: TStringField;
    tbVenCliCaixa: TStringField;
    tbFuncVendasCaixa: TStringField;
    TbParametroPosCx: TStringField;
    tbSenhaCodFunc: TIntegerField;
    tbSenhalkNomeFunc: TStringField;
    BaseDados: TDatabase;
    tbOrcCodOrca: TSmallintField;
    tbOrcDataOrca: TDateField;
    tbOrcCodCli: TIntegerField;
    tbOrcValor: TCurrencyField;
    tbOrcDesconto: TFloatField;
    tbOrcCodFunc: TIntegerField;
    tbOrcUserName: TStringField;
    tbOrcCodIndex: TIntegerField;
    tbOrcEntrega: TDateField;
    tbOrcCaixa: TStringField;
    tbOrcLkNomeCli: TStringField;
    tbOrclknomefunc: TStringField;
    tbVisDetOrcDataOrca: TDateField;
    tbVisDetOrcCodOrca: TSmallintField;
    tbVisDetOrcCodMerc: TStringField;
    tbVisDetOrcCustoUnit: TCurrencyField;
    tbVisDetOrcPrecoUnit: TCurrencyField;
    tbVisDetOrcQuant: TFloatField;
    tbVisDetOrcComissao: TFloatField;
    tbVisDetOrcNomeProduto: TStringField;
    tbOrcReserva: TStringField;
    tbDetOrcDataOrca: TDateField;
    tbDetOrcCodOrca: TSmallintField;
    tbDetOrcCodMerc: TStringField;
    tbDetOrcCustoUnit: TCurrencyField;
    tbDetOrcPrecoUnit: TCurrencyField;
    tbDetOrcQuant: TFloatField;
    tbDetOrcComissao: TFloatField;
    tbDetOrcTotal: TFloatField;
    tbVisDetOrcTotal: TFloatField;
    tbDetOrcNomeProduto: TStringField;
    tbVendasCodForPag: TStringField;
    tbChequePre: TStringField;
    TbCCorrenteLkNomeBanco: TStringField;
    TbMovContalkBanco: TStringField;
    tbCReceberDescPago: TCurrencyField;
    tbCReceberMuJuPago: TCurrencyField;
    tbCReceberPortador: TStringField;
    tbCReceberTipoPago: TStringField;
    tbCReceberNumBanco: TStringField;
    tbCReceberLkTipoDoc: TStringField;
    tbCReceberlknome: TStringField;
    tbCReceberlkcpf: TStringField;
    tbCReceberlkcnpj: TStringField;
    tbCReceberlknumero: TStringField;
    tbCReceberlkbairro: TStringField;
    tbCReceberlkcidade: TStringField;
    tbCReceberlkuf: TStringField;
    tbCReceberlkcep: TStringField;
    tbCPagarCodComp: TIntegerField;
    tbCPagarDescPago: TCurrencyField;
    tbCPagarMuJuPago: TCurrencyField;
    tbCPagarTipoPago: TStringField;
    tbCPagarNomeFornec: TStringField;
    tbCPagarLkTipoDoc: TStringField;
    tbCPagarLkHistorico: TStringField;
    tbConvenio: TTable;
    tbConvenioCodConv: TStringField;
    tbConvenioDescricao: TStringField;
    tbConvenioDiaRec: TStringField;
    tbConvenioCarencia: TStringField;
    tbConvenioCodcli: TIntegerField;
    tbConveniolkNomeCli: TStringField;
    dsConvenio: TDataSource;
    tbLibCred: TTable;
    tbLibCredNada: TAutoIncField;
    tbLibCredCodcli: TIntegerField;
    tbLibCredUltCompra: TDateField;
    tbLibCredRenda: TCurrencyField;
    tbLibCredLimite: TSmallintField;
    tbLibCredRestricao: TStringField;
    tbLibCredBanco1: TStringField;
    tbLibCredBanco2: TStringField;
    tbLibCredNome1: TStringField;
    tbLibCredNome2: TStringField;
    tbLibCredEmpresa: TStringField;
    tbLibCredCargo: TStringField;
    tbLibCredTel: TStringField;
    tbLibCredRespon: TStringField;
    tbRecVenCliDescPago: TCurrencyField;
    tbRecVenCliMuJuPago: TCurrencyField;
    tbRecVenCliPortador: TStringField;
    tbRecVenCliTipoPago: TStringField;
    tbRecVenCliNumBanco: TStringField;
    tbVenCliCodForPag: TStringField;
    tbOrcCodForPag: TStringField;
    tbFuncEsto: TTable;
    tbFuncEstoCodFunc: TIntegerField;
    tbFuncEstoCodMerc: TStringField;
    tbFuncEstoComissao: TCurrencyField;
    tbFuncEstolkNomeFunc: TStringField;
    tbFuncEstolkDescProd: TStringField;
    dsFuncEsto: TDataSource;
    tbEstoquePrecoVendaAt: TCurrencyField;
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
    tbEntradaQuant: TFloatField;
    dsEntrada: TDataSource;
    dsSaida: TDataSource;
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
    tbSaidaQuant: TFloatField;
    tbCompras: TTable;
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
    tbComprasPedidoPen: TStringField;
    tbComprasLkFornec: TStringField;
    dsCompras: TDataSource;
    tbVisDetCompra: TTable;
    tbVisDetCompraLkProduto: TStringField;
    tbVisDetCompraCodMerc: TStringField;
    tbVisDetCompraCodComp: TIntegerField;
    tbVisDetCompraPrecoUnit: TCurrencyField;
    tbVisDetCompraQuant: TFloatField;
    tbVisDetCompraTotal: TFloatField;
    tbVisDetCompraDataComp: TDateField;
    tbVisDetCompraLknomeforc: TStringField;
    dsVisDetCompra: TDataSource;
    tbOrcLkCliente: TStringField;
    tbDetCompras: TTable;
    tbDetComprasCodMerc: TStringField;
    tbDetComprasCodComp: TIntegerField;
    tbDetComprasPrecoUnit: TCurrencyField;
    tbDetComprasQuant: TFloatField;
    tbDetComprasTotal: TFloatField;
    tbDetComprasLkProduto: TStringField;
    tbDetComprasDataComp: TDateField;
    dsDetCompras: TDataSource;
    tbDetVendasLkTrans: TStringField;
    tbDetVendasLkNF: TIntegerField;
    tbDetOrcLkProduto: TStringField;
    dsLibCred: TDataSource;
    tbCaixalkNomeFunc: TStringField;
    tbCaixaRDin: TCurrencyField;
    tbCaixaRCheque: TCurrencyField;
    tbCaixaRValeRefe: TCurrencyField;
    tbCaixaRConVale: TCurrencyField;
    tbCaixaRCCliente: TCurrencyField;
    tbCaixaReforco: TCurrencyField;
    tbCaixaPagto: TCurrencyField;
    tbCaixaSContra: TCurrencyField;
    tbCaixaSCredito: TCurrencyField;
    tbCaixaStatus: TStringField;
    tbClienteRazaoSocial: TStringField;
    tbClienteTipo: TStringField;
    tbCReceberNumParcela: TStringField;
    tbCReceberFormaPagto: TStringField;
    tbCReceberCodIndex: TIntegerField;
    tbCReceberCodEmpre: TIntegerField;
    tbCReceberCodDoc: TIntegerField;
    tbCReceberCodHist: TIntegerField;
    tbTipoDocCodDoc: TAutoIncField;
    tbRecVenCliCodDoc: TIntegerField;
    tbRecVenCliNumParcela: TStringField;
    tbRecVenCliFormaPagto: TStringField;
    tbRecVenCliCodIndex: TIntegerField;
    tbRecVenCliCodEmpre: TIntegerField;
    tbRecVenCliCodHist: TIntegerField;
    TbMovContaCodDoc: TIntegerField;
    TbMovContaCodHist: TIntegerField;
    tbCPagarCodDoc: TIntegerField;
    tbCPagarCodHist: TIntegerField;
    tbCPagarNumParcela: TStringField;
    tbCPagarMultaDia: TDateField;
    tbCPagarValorMulta: TCurrencyField;
    tbCPagarPercMulta: TFloatField;
    tbCPagarDescDia: TDateField;
    tbCPagarValorDesc: TCurrencyField;
    tbCPagarPercDesc: TFloatField;
    tbCPagarJurosDia: TDateField;
    tbCPagarValorJuros: TCurrencyField;
    tbCPagarPercJuros: TFloatField;
    tbCPagarFormaPagto: TStringField;
    tbCPagarCodIndex: TIntegerField;
    tbHistoricoCodHist: TAutoIncField;
    tbOrcObs: TMemoField;
    tbMovCaixa: TTable;
    dsMovCaixa: TDataSource;
    tbMovCaixaCodMov: TAutoIncField;
    tbMovCaixaTipoOper: TStringField;
    tbMovCaixaDataMov: TDateField;
    tbMovCaixaCodDoc: TIntegerField;
    tbMovCaixaDosNumero: TStringField;
    tbMovCaixaNumAgencia: TStringField;
    tbMovCaixaConta: TStringField;
    tbMovCaixaValor: TCurrencyField;
    tbMovCaixaCodHist: TIntegerField;
    tbMovCaixaComplHist: TStringField;
    tbMovCaixaDataReg: TDateField;
    tbMovCaixaHoraReg: TTimeField;
    tbMovCaixaUserName: TStringField;
    procedure tbFuncCalcFields(DataSet: TDataSet);
    procedure tbDetVendasCalcFields(DataSet: TDataSet);
    procedure TbParametroAfterPost(DataSet: TDataSet);
    procedure TbParametroAfterDelete(DataSet: TDataSet);
    procedure tbClienteAfterDelete(DataSet: TDataSet);
    procedure tbClienteAfterPost(DataSet: TDataSet);
    procedure tbCPagarAfterPost(DataSet: TDataSet);
    procedure tbCPagarAfterDelete(DataSet: TDataSet);
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
    procedure TbCCorrenteAfterPost(DataSet: TDataSet);
    procedure TbCCorrenteAfterDelete(DataSet: TDataSet);
    procedure TbMovContaAfterPost(DataSet: TDataSet);
    procedure TbMovContaAfterDelete(DataSet: TDataSet);
    procedure tbDetVendasAfterDelete(DataSet: TDataSet);
    procedure tbDetVendasAfterPost(DataSet: TDataSet);
    procedure tbDepenFuncAfterDelete(DataSet: TDataSet);
    procedure tbDepenFuncAfterPost(DataSet: TDataSet);
    procedure tbFuncEstoAfterPost(DataSet: TDataSet);
    procedure tbFuncEstoAfterDelete(DataSet: TDataSet);
    procedure tbCReceberAfterDelete(DataSet: TDataSet);
    procedure tbCReceberAfterPost(DataSet: TDataSet);
    procedure tbFuncAfterPost(DataSet: TDataSet);
    procedure tbFuncAfterDelete(DataSet: TDataSet);
    procedure tbCargoFuncAfterDelete(DataSet: TDataSet);
    procedure tbCargoFuncAfterPost(DataSet: TDataSet);
    procedure tbGrupoAfterDelete(DataSet: TDataSet);
    procedure tbGrupoAfterPost(DataSet: TDataSet);
    procedure tbSubGrupoAfterPost(DataSet: TDataSet);
    procedure tbSubGrupoAfterDelete(DataSet: TDataSet);
    procedure tbRotaDetVendasAfterPost(DataSet: TDataSet);
    procedure tbRotaDetVendasAfterDelete(DataSet: TDataSet);
    procedure tbMovEstoqueAfterDelete(DataSet: TDataSet);
    procedure tbUnidadeAfterDelete(DataSet: TDataSet);
    procedure tbMovEstoqueAfterPost(DataSet: TDataSet);
    procedure tbUnidadeAfterPost(DataSet: TDataSet);
    procedure tbEstoqueCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure tbNFDetCalcFields(DataSet: TDataSet);
    procedure tbNFCalcFields(DataSet: TDataSet);
    procedure tbVendasCalcFields(DataSet: TDataSet);
    procedure tbVenCliCalcFields(DataSet: TDataSet);
    procedure tbDetOrcCalcFields(DataSet: TDataSet);
    procedure tbVisDetNFCalcFields(DataSet: TDataSet);
    procedure tbVisDetOrcCalcFields(DataSet: TDataSet);
    procedure tbChequeAfterDelete(DataSet: TDataSet);
    procedure tbChequeAfterPost(DataSet: TDataSet);
    procedure tbChequeCalcFields(DataSet: TDataSet);
    procedure tbCCustoAfterDelete(DataSet: TDataSet);
    procedure tbCCustoAfterPost(DataSet: TDataSet);
    procedure tbBancoAfterDelete(DataSet: TDataSet);
    procedure tbBancoAfterPost(DataSet: TDataSet);
    procedure tbTipoDocAfterDelete(DataSet: TDataSet);
    procedure tbTipoDocAfterPost(DataSet: TDataSet);
    procedure tbSenhaAfterDelete(DataSet: TDataSet);
    procedure tbSenhaAfterPost(DataSet: TDataSet);
    procedure tbComprasAfterDelete(DataSet: TDataSet);
    procedure tbComprasAfterPost(DataSet: TDataSet);
    procedure tbConvenioAfterDelete(DataSet: TDataSet);
    procedure tbConvenioAfterPost(DataSet: TDataSet);
    procedure tbRelEstoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tbVisDetCompraCalcFields(DataSet: TDataSet);
    procedure tbDetComprasCalcFields(DataSet: TDataSet);
    procedure tbFuncVendasAfterDelete(DataSet: TDataSet);
    procedure tbFuncVendasAfterPost(DataSet: TDataSet);
    procedure tbRecVenCliAfterPost(DataSet: TDataSet);
    procedure tbRecVenCliAfterDelete(DataSet: TDataSet);
    procedure tbICMSAfterDelete(DataSet: TDataSet);
    procedure tbICMSAfterPost(DataSet: TDataSet);
    procedure tbVenCliAfterPost(DataSet: TDataSet);
    procedure tbVenCliAfterDelete(DataSet: TDataSet);
    procedure tbDetvenCliAfterDelete(DataSet: TDataSet);
    procedure tbDetvenCliAfterPost(DataSet: TDataSet);
    procedure tbVisDetNFAfterPost(DataSet: TDataSet);
    procedure tbVisDetNFAfterDelete(DataSet: TDataSet);
    procedure tbVisDetVenAfterDelete(DataSet: TDataSet);
    procedure tbVisDetVenAfterPost(DataSet: TDataSet);
    procedure tbVisDetOrcAfterPost(DataSet: TDataSet);
    procedure tbVisDetOrcAfterDelete(DataSet: TDataSet);
    procedure tbOrcAfterDelete(DataSet: TDataSet);
    procedure tbOrcAfterPost(DataSet: TDataSet);
    procedure tbDetOrcAfterPost(DataSet: TDataSet);
    procedure tbDetOrcAfterDelete(DataSet: TDataSet);
    procedure tbNFAfterDelete(DataSet: TDataSet);
    procedure tbNFAfterPost(DataSet: TDataSet);
    procedure tbNFDetAfterPost(DataSet: TDataSet);
    procedure tbNFDetAfterDelete(DataSet: TDataSet);
    procedure tbNFCliAfterDelete(DataSet: TDataSet);
    procedure tbNFCliAfterPost(DataSet: TDataSet);
    procedure tbVisNFAfterPost(DataSet: TDataSet);
    procedure tbVisNFAfterDelete(DataSet: TDataSet);
    procedure tbCargoAfterDelete(DataSet: TDataSet);
    procedure tbCargoAfterPost(DataSet: TDataSet);
    procedure tbVisDetCompraAfterDelete(DataSet: TDataSet);
    procedure tbVisDetCompraAfterPost(DataSet: TDataSet);
    procedure tbDependeAfterPost(DataSet: TDataSet);
    procedure tbDependeAfterDelete(DataSet: TDataSet);
    procedure tbSalMesAfterDelete(DataSet: TDataSet);
    procedure tbSalMesAfterPost(DataSet: TDataSet);
    procedure tbCaixaAfterPost(DataSet: TDataSet);
    procedure tbCaixaAfterDelete(DataSet: TDataSet);
    procedure tbPlanosAfterDelete(DataSet: TDataSet);
    procedure tbPlanosAfterPost(DataSet: TDataSet);
    procedure tbLibCredAfterPost(DataSet: TDataSet);
    procedure tbLibCredAfterDelete(DataSet: TDataSet);
    procedure tbFornecedorAfterDelete(DataSet: TDataSet);
    procedure tbFornecedorAfterPost(DataSet: TDataSet);
    procedure tbBalCustoAfterDelete(DataSet: TDataSet);
    procedure tbBalCustoAfterPost(DataSet: TDataSet);
    procedure tbEntradaAfterDelete(DataSet: TDataSet);
    procedure tbEntradaAfterPost(DataSet: TDataSet);
    procedure tbSaidaAfterPost(DataSet: TDataSet);
    procedure tbSaidaAfterDelete(DataSet: TDataSet);
    procedure tbEtiquetaAfterDelete(DataSet: TDataSet);
    procedure tbEtiquetaAfterPost(DataSet: TDataSet);
    procedure tbDetComprasAfterDelete(DataSet: TDataSet);
    procedure tbDetComprasAfterPost(DataSet: TDataSet);
    procedure tbFormaPagaAfterPost(DataSet: TDataSet);
    procedure tbFormaPagaAfterDelete(DataSet: TDataSet);
    procedure tbValIndexAfterDelete(DataSet: TDataSet);
    procedure tbValIndexAfterPost(DataSet: TDataSet);
    procedure tbHistoricoAfterPost(DataSet: TDataSet);
    procedure tbHistoricoAfterDelete(DataSet: TDataSet);
    procedure TbIndexadorAfterDelete(DataSet: TDataSet);
    procedure TbIndexadorAfterPost(DataSet: TDataSet);
    procedure tbRelEstoAfterPost(DataSet: TDataSet);
    procedure tbRelEstoAfterDelete(DataSet: TDataSet);
    procedure tbPromocaoAfterDelete(DataSet: TDataSet);
    procedure tbPromocaoAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    fRelEstoque : string;
    fHabilitaTeclado : Boolean;
    fvTabStt:Boolean;
  public
    { Public declarations }
    property HabilitaTeclado : Boolean read  fHabilitaTeclado write fHabilitaTeclado;
    property vTabStt : Boolean read  fvTabStt write fvTabStt;
    property RelEstoque : string read fRelEstoque write fRelEstoque;
  end;

var
  dmdados: Tdmdados;

implementation

 

{$R *.DFM}

procedure Tdmdados.tbFuncCalcFields(DataSet: TDataSet);
begin
  if tbFuncSalario.Value > 0 then
    begin
    if tbFuncINSS.Value > 0 then
      tbFuncVlINSS.Value:=TbFuncSalario.Value*(tbFuncINSS.Value/100)
    else
      tbFuncVlINSS.Value:=0;
    if tbFuncValeTrans.Value > 0 then
      tbFuncVlValeTrans.Value:=tbFuncSalario.Value*(tbFuncValeTrans.Value/100)
    else
      tbFuncVlValeTrans.Value:=0;
    if tbFuncValeRef.Value > 0 then
      tbFuncVlValeRef.Value:=tbFuncSalario.Value*(tbFuncValeTrans.Value/100)
    else
      tbFuncVlValeRef.Value:=0;
    tbFuncVl13.Value:=tbFuncSalario.Value*(1/12);
    tbFuncVlFerias.Value:=tbFuncSalario.Value*(1/12);
    tbFuncAbonoFerias.Value:=tbFuncVlFerias.Value*(1/3);
    tbFuncFGTS.Value:=tbFuncSalario.Value*0.08;
    tbFuncMultaFGTS.Value:=tbFuncFGTS.Value*0.40;
    tbFuncCusto.Value:=tbFuncVlINSS.Value+tbFuncVlValeTrans.Value+tbFuncVlValeRef.Value+
                       tbFuncVl13.Value+tbFuncVlFerias.Value+tbFuncAbonoFerias.Value+
                       tbFuncFGTS.Value+tbFuncMultaFGTS.Value;
    end;
end;

procedure Tdmdados.tbDetVendasCalcFields(DataSet: TDataSet);
begin
  dmdados.tbDetVendasTotal.Value:=dmdados.tbDetVendasQuant.value*dmdados.tbDetVendasPrecoUnit.Value;
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

procedure Tdmdados.TbCCorrenteAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbCCorrente.Handle);
end;

procedure Tdmdados.TbCCorrenteAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbCCorrente.Handle);
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

procedure Tdmdados.tbRotaDetVendasAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbDetVendas.Handle);
end;

procedure Tdmdados.tbRotaDetVendasAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbDetVendas.Handle);
end;

procedure Tdmdados.tbMovEstoqueAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbMovEstoque.Handle);
end;

procedure Tdmdados.tbUnidadeAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbUnidade.Handle);
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

procedure Tdmdados.tbNFDetCalcFields(DataSet: TDataSet);
begin
  tbNFDetvrTot1.Value:=tbNFDetPUnit1.Value*tbNFDetQt1.Value;
  tbNFDetvrTot2.Value:=tbNFDetPUnit2.Value*tbNFDetQt2.Value;
  tbNFDetvrTot3.Value:=tbNFDetPUnit3.Value*tbNFDetQt3.Value;
  tbNFDetvrTot4.Value:=tbNFDetPUnit4.Value*tbNFDetQt4.Value;
  tbNFDetvrTot5.Value:=tbNFDetPUnit5.Value*tbNFDetQt5.Value;
  tbNFDetvrTot6.Value:=tbNFDetPUnit6.Value*tbNFDetQt6.Value;
  tbNFDetvrTot7.Value:=tbNFDetPUnit7.Value*tbNFDetQt7.Value;
  tbNFDetvrTot8.Value:=tbNFDetPUnit8.Value*tbNFDetQt8.Value;
  tbNFDetvrTot9.Value:=tbNFDetPUnit9.Value*tbNFDetQt9.Value;
  tbNFDetvrTot10.Value:=tbNFDetPUnit10.Value*tbNFDetQt10.Value;
  if tbNFDetIPI1.Value<>'' then
    tbNFDetVrIPI1.Value:=tbNFDetvrTot1.Value*(StrToInt(tbNFDetIPI1.Value)/100);
  if tbNFDetIPI2.Value<>'' then
    tbNFDetVrIPI2.Value:=tbNFDetvrTot2.Value*(StrToInt(tbNFDetIPI2.Value)/100);
  if tbNFDetIPI3.Value<>'' then
    tbNFDetVrIPI3.Value:=tbNFDetvrTot3.Value*(StrToInt(tbNFDetIPI3.Value)/100);
  if tbNFDetIPI4.Value<>'' then
    tbNFDetVrIPI4.Value:=tbNFDetvrTot4.Value*(StrToInt(tbNFDetIPI4.Value)/100);
  if tbNFDetIPI5.Value<>'' then
    tbNFDetVrIPI5.Value:=tbNFDetvrTot5.Value*(StrToInt(tbNFDetIPI5.Value)/100);
  if tbNFDetIPI6.Value<>'' then
    tbNFDetVrIPI6.Value:=tbNFDetvrTot6.Value*(StrToInt(tbNFDetIPI6.Value)/100);
  if tbNFDetIPI7.Value<>'' then
    tbNFDetVrIPI7.Value:=tbNFDetvrTot7.Value*(StrToInt(tbNFDetIPI7.Value)/100);
  if tbNFDetIPI8.Value<>'' then
    tbNFDetVrIPI8.Value:=tbNFDetvrTot8.Value*(StrToInt(tbNFDetIPI8.Value)/100);
  if tbNFDetIPI9.Value<>'' then
    tbNFDetVrIPI9.Value:=tbNFDetvrTot9.Value*(StrToInt(tbNFDetIPI9.Value)/100);
  if tbNFDetIPI10.Value<>'' then
    tbNFDetVrIPI10.Value:=tbNFDetvrTot10.Value*(StrToInt(tbNFDetIPI10.Value)/100);
end;

procedure Tdmdados.tbNFCalcFields(DataSet: TDataSet);
begin
  tbNFLkTotalProd.Value:=tbNFDetvrTot1.Value+tbNFDetvrTot2.Value+tbNFDetvrTot3.Value+tbNFDetvrTot4.Value+
                         tbNFDetvrTot5.Value+tbNFDetvrTot6.Value+tbNFDetvrTot7.Value+tbNFDetvrTot8.Value+
                         tbNFDetvrTot9.Value+tbNFDetvrTot10.Value;

  tbNFLkVlIpi.Value:=tbNFDetVrIPI1.Value+tbNFDetVrIPI2.Value+tbNFDetVrIPI3.Value+tbNFDetVrIPI4.Value+tbNFDetVrIPI5.Value+
                     tbNFDetVrIPI6.Value+tbNFDetVrIPI7.Value+tbNFDetVrIPI8.Value+tbNFDetVrIPI9.Value+tbNFDetVrIPI10.Value;

  tbNFLkVlTotalNota.Value:= tbNFLkTotalProd.Value+tbNFVlFrete.Value+tbNFVlSeguro.Value+tbNFOutrasDep.Value+tbNFlkVlIPI.Value;
end;

procedure Tdmdados.tbVendasCalcFields(DataSet: TDataSet);
begin
  tbVendasValorFinal.Value:=tbVendasValor.Value-(tbVendasValor.Value*(tbVendasDesconto.Value/100));
end;

procedure Tdmdados.tbVenCliCalcFields(DataSet: TDataSet);
begin
  tbVenCliValorFinal.Value:=tbVenCliValor.Value-tbVenCliDesconto.Value;
end;

procedure Tdmdados.tbDetOrcCalcFields(DataSet: TDataSet);
begin
  dmdados.tbDetOrcTotal.value:=dmdados.tbDetOrcQuant.value*dmdados.tbDetOrcPrecoUnit.Value;
end;

procedure Tdmdados.tbVisDetNFCalcFields(DataSet: TDataSet);
begin
  tbVisDetNFvrTot1.Value:=tbVisDetNFPUnit1.Value*tbVisDetNFQt1.Value;
  tbVisDetNFvrTot2.Value:=tbVisDetNFPUnit2.Value*tbVisDetNFQt2.Value;
  tbVisDetNFvrTot3.Value:=tbVisDetNFPUnit3.Value*tbVisDetNFQt3.Value;
  tbVisDetNFvrTot4.Value:=tbVisDetNFPUnit4.Value*tbVisDetNFQt4.Value;
  tbVisDetNFvrTot5.Value:=tbVisDetNFPUnit5.Value*tbVisDetNFQt5.Value;
  tbVisDetNFvrTot6.Value:=tbVisDetNFPUnit6.Value*tbVisDetNFQt6.Value;
  tbVisDetNFvrTot7.Value:=tbVisDetNFPUnit7.Value*tbVisDetNFQt7.Value;
  tbVisDetNFvrTot8.Value:=tbVisDetNFPUnit8.Value*tbVisDetNFQt8.Value;
  tbVisDetNFvrTot9.Value:=tbVisDetNFPUnit9.Value*tbVisDetNFQt9.Value;
  tbVisDetNFvrTot10.Value:=tbVisDetNFPUnit10.Value*tbVisDetNFQt10.Value;
end;

procedure Tdmdados.tbVisDetOrcCalcFields(DataSet: TDataSet);
begin
  dmdados.tbVisDetOrcTotal.value:=dmdados.tbVisDetOrcQuant.value*dmdados.tbVisDetOrcPrecoUnit.Value;
end;

procedure Tdmdados.tbChequeAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbCheque.Handle);
end;

procedure Tdmdados.tbChequeAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbCheque.Handle);
end;

procedure Tdmdados.tbChequeCalcFields(DataSet: TDataSet);
begin
  dmdados.tbChequeValorTotal.Value:=dmdados.tbChequeValorJuros.Value+dmdados.tbChequeValor.Value;
end;

procedure Tdmdados.tbCCustoAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbCCusto.Handle);
end;

procedure Tdmdados.tbCCustoAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbCCusto.Handle);
end;

procedure Tdmdados.tbBancoAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbBanco.Handle);
end;

procedure Tdmdados.tbBancoAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbBanco.Handle);
end;

procedure Tdmdados.tbTipoDocAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbTipoDoc.Handle);
end;

procedure Tdmdados.tbTipoDocAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbTipoDoc.Handle);
end;

procedure Tdmdados.tbSenhaAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbSenha.Handle);
end;

procedure Tdmdados.tbSenhaAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbSenha.Handle);
end;

procedure Tdmdados.tbComprasAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbCompras.Handle);
end;

procedure Tdmdados.tbComprasAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbCompras.Handle);
end;

procedure Tdmdados.tbConvenioAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbConvenio.Handle);
end;

procedure Tdmdados.tbConvenioAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbConvenio.Handle);
end;

procedure Tdmdados.tbRelEstoFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if RelEstoque='Abaixo do M�nimo' then
    if tbRelEstoQuantidade.Value < tbRelEstoEstoqueMin.Value then
      Accept:=True
    else
      Accept:=False;
  if RelEstoque='Acima do M�ximo' then
    if tbRelEstoQuantidade.Value > tbRelEstoEstoqueMax.Value then
      Accept:=True
    else
      Accept:=False;
end;

procedure Tdmdados.tbVisDetCompraCalcFields(DataSet: TDataSet);
begin
  tbVisDetCompraTotal.Value:=tbVisDetCompraPrecoUnit.Value*tbVisDetCompraQuant.Value;
end;

procedure Tdmdados.tbDetComprasCalcFields(DataSet: TDataSet);
begin
dmdados.tbDetComprasTotal.Value:=dmdados.tbDetComprasPrecoUnit.Value*dmdados.tbDetComprasQuant.Value;
end;

procedure Tdmdados.tbFuncVendasAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbFuncVendas.Handle);
end;

procedure Tdmdados.tbFuncVendasAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbFuncVendas.Handle);
end;

procedure Tdmdados.tbRecVenCliAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbRecVenCli.Handle);
end;

procedure Tdmdados.tbRecVenCliAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbRecVenCli.Handle);
end;

procedure Tdmdados.tbICMSAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbICMS.Handle);
end;

procedure Tdmdados.tbICMSAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbICMS.Handle);
end;

procedure Tdmdados.tbVenCliAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbVenCli.Handle);
end;

procedure Tdmdados.tbVenCliAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbVenCli.Handle);
end;

procedure Tdmdados.tbDetvenCliAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbDetVenCli.Handle);
end;

procedure Tdmdados.tbDetvenCliAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbDetVenCli.Handle);
end;

procedure Tdmdados.tbVisDetNFAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbVisDetNF.Handle);
end;

procedure Tdmdados.tbVisDetNFAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbVisDetNF.Handle);
end;

procedure Tdmdados.tbVisDetVenAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbVisDetVen.Handle);
end;

procedure Tdmdados.tbVisDetVenAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbVisDetVen.Handle);
end;

procedure Tdmdados.tbVisDetOrcAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbVisDetOrc.Handle);
end;

procedure Tdmdados.tbVisDetOrcAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbVisDetOrc.Handle);
end;

procedure Tdmdados.tbOrcAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbOrc.Handle);
end;

procedure Tdmdados.tbOrcAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbOrc.Handle);
end;

procedure Tdmdados.tbDetOrcAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbDetOrc.Handle);
end;

procedure Tdmdados.tbDetOrcAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbDetOrc.Handle);
end;

procedure Tdmdados.tbNFAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbNF.Handle);
end;

procedure Tdmdados.tbNFAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbNF.Handle);
end;

procedure Tdmdados.tbNFDetAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbNFDet.Handle);
end;

procedure Tdmdados.tbNFDetAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbNFDet.Handle);
end;

procedure Tdmdados.tbNFCliAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbNFCli.Handle);
end;

procedure Tdmdados.tbNFCliAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbNFCli.Handle);
end;

procedure Tdmdados.tbVisNFAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbVisNF.Handle);
end;

procedure Tdmdados.tbVisNFAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbVisNF.Handle);
end;

procedure Tdmdados.tbCargoAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbCargo.Handle);
end;

procedure Tdmdados.tbCargoAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbCargo.Handle);
end;

procedure Tdmdados.tbVisDetCompraAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbVisDetCompra.Handle);
end;

procedure Tdmdados.tbVisDetCompraAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbVisDetCompra.Handle);
end;

procedure Tdmdados.tbDependeAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbDepende.Handle);
end;

procedure Tdmdados.tbDependeAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbDepende.Handle);
end;

procedure Tdmdados.tbSalMesAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbSalMes.Handle);
end;

procedure Tdmdados.tbSalMesAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbSalMes.Handle);
end;

procedure Tdmdados.tbCaixaAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbCaixa.Handle);
end;

procedure Tdmdados.tbCaixaAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbCaixa.Handle);
end;

procedure Tdmdados.tbPlanosAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbPlanos.Handle);
end;

procedure Tdmdados.tbPlanosAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbPlanos.Handle);
end;

procedure Tdmdados.tbLibCredAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbLibCred.Handle);
end;

procedure Tdmdados.tbLibCredAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbLibCred.Handle);
end;

procedure Tdmdados.tbFornecedorAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbFornecedor.Handle);
end;

procedure Tdmdados.tbFornecedorAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbFornecedor.Handle);
end;

procedure Tdmdados.tbBalCustoAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbBalCusto.Handle);
end;

procedure Tdmdados.tbBalCustoAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbBalCusto.Handle);
end;

procedure Tdmdados.tbEntradaAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbEntrada.Handle);
end;

procedure Tdmdados.tbEntradaAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbEntrada.Handle);
end;

procedure Tdmdados.tbSaidaAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbSaida.Handle);
end;

procedure Tdmdados.tbSaidaAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbSaida.Handle);
end;

procedure Tdmdados.tbEtiquetaAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbEtiqueta.Handle);
end;

procedure Tdmdados.tbEtiquetaAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbEtiqueta.Handle);
end;

procedure Tdmdados.tbDetComprasAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbDetCompras.Handle);
end;

procedure Tdmdados.tbDetComprasAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbDetCompras.Handle);
end;

procedure Tdmdados.tbFormaPagaAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbFormaPaga.Handle);
end;

procedure Tdmdados.tbFormaPagaAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbFormaPaga.Handle);
end;

procedure Tdmdados.tbValIndexAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbValIndex.Handle);
end;

procedure Tdmdados.tbValIndexAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbValIndex.Handle);
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
  dbisaveChanges(TbIndexador.Handle);
end;

procedure Tdmdados.TbIndexadorAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(TbIndexador.Handle);
end;

procedure Tdmdados.tbRelEstoAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbRelEsto.Handle);
end;

procedure Tdmdados.tbRelEstoAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbRelEsto.Handle);
end;

procedure Tdmdados.tbPromocaoAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbPromocao.Handle);
end;

procedure Tdmdados.tbPromocaoAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbPromocao.Handle);
end;

end.
