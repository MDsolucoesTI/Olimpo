//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitDMDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables ,dbiProcs;

type
  TDMDados = class(TDataModule)
    DtPatrimonio: TDataSource;
    TbPatrimonio: TTable;
    TbPatrimonioPlaqueta: TStringField;
    TbPatrimonioTipo: TStringField;
    TbPatrimonioDescricao: TStringField;
    TbPatrimonioNumNF: TStringField;
    TbPatrimonioEstCons: TStringField;
    TbPatrimonioDtAquisicao: TDateField;
    TbPatrimonioVlAquisicao: TCurrencyField;
    TbPatrimonioCodCCusto: TStringField;
    TbPatrimonioVlMercado: TCurrencyField;
    TbPatrimonioCodSeg: TIntegerField;
    TbPatrimonioVencSeg: TDateField;
    TbPatrimonioVlSeg: TCurrencyField;
    TbPatrimonioDetalhes: TMemoField;
    TbPatrimonioCodCompra: TIntegerField;
    TbPatrimonioVlVenda: TCurrencyField;
    TbPatrimonioDataCad: TDateField;
    DtComprador: TDataSource;
    TbComprador: TTable;
    DtSegurdora: TDataSource;
    TbSeguradora: TTable;
    TbSeguradoraNome: TStringField;
    TbSeguradoraTel1: TStringField;
    TbSeguradoraTel2: TStringField;
    TbSeguradoraCelular: TStringField;
    TbSeguradoraCNPJ: TStringField;
    TbSeguradoraInsEstado: TStringField;
    TbSeguradoraEndereco: TStringField;
    TbSeguradoraNumero: TSmallintField;
    TbSeguradoraComplemento: TStringField;
    TbSeguradoraBairro: TStringField;
    TbSeguradoraCep: TStringField;
    TbSeguradoraCidade: TStringField;
    TbSeguradoraUF: TStringField;
    TbSeguradoraEMail: TStringField;
    TbSeguradoraDataCad: TDateField;
    TbSeguradoraObs: TMemoField;
    TbCompradorTipo: TStringField;
    TbCompradorNome: TStringField;
    TbCompradorTel1: TStringField;
    TbCompradorTel2: TStringField;
    TbCompradorCelular: TStringField;
    TbCompradorCNPJ: TStringField;
    TbCompradorCPF: TStringField;
    TbCompradorInsEstado: TStringField;
    TbCompradorRG: TStringField;
    TbCompradorEndereco: TStringField;
    TbCompradorNumero: TSmallintField;
    TbCompradorComplemento: TStringField;
    TbCompradorBairro: TStringField;
    TbCompradorCep: TStringField;
    TbCompradorCidade: TStringField;
    TbCompradorUF: TStringField;
    TbCompradorEMail: TStringField;
    TbCompradorDataCad: TDateField;
    TbCompradorObs: TMemoField;
    tbEquipamento: TTable;
    tbEquipamentoNada: TAutoIncField;
    tbEquipamentoNumSerie: TStringField;
    tbEquipamentoMarca: TStringField;
    tbEquipamentoFimGaran: TDateField;
    dsEquipamento: TDataSource;
    tbVeiculo: TTable;
    dsVeiculo: TDataSource;
    tbImovel: TTable;
    tbVeiculoNada: TAutoIncField;
    tbVeiculoChassi: TStringField;
    tbVeiculoPlaca: TStringField;
    tbVeiculoCor: TStringField;
    dsImovel: TDataSource;
    tbCCusto: TTable;
    dsCCusto: TDataSource;
    tbCCustoNada: TAutoIncField;
    tbCCustoCodCCusto: TStringField;
    tbCCustoDescricao: TStringField;
    tbFornecedor: TTable;
    dsFornecedor: TDataSource;
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
    TbPatrimonioNomeCompra: TStringField;
    TbTipoArea: TTable;
    dsTipoarea: TDataSource;
    TbTipoAreaCodTarea: TAutoIncField;
    TbTipoAreaTipoArea: TStringField;
    tbImovelNumEscritura: TStringField;
    tbImovelAreaTer: TFloatField;
    tbImovelAreaCons: TFloatField;
    tbImovelEndereco: TStringField;
    tbImovelNumero: TSmallintField;
    tbImovelComplemento: TStringField;
    tbImovelBairro: TStringField;
    tbImovelCEP: TStringField;
    tbImovelCidade: TStringField;
    tbImovelEstado: TStringField;
    TbPatrimonioCodFor: TIntegerField;
    TbPatrimonioLkNomeFornec: TStringField;
    TbEmprestimo: TTable;
    dsEmprestimo: TDataSource;
    TbEmprestimoCodEmpre: TAutoIncField;
    TbEmprestimoCodCli: TIntegerField;
    TbEmprestimoIniEmpre: TDateField;
    TbEmprestimoVlPag: TCurrencyField;
    tbVeiculoAnoFab: TStringField;

    tbVeiculoAnoModelo: TStringField;
    TbCompradorCodCompra: TAutoIncField;
    dsParametro: TDataSource;
    tbParametro: TTable;
    tbParametroCodPar: TAutoIncField;
    tbParametroEmpresa: TStringField;
    tbParametroCNPJ: TStringField;
    tbParametroInsEstado: TStringField;
    tbParametroProprietario: TStringField;
    tbParametroCPF: TStringField;
    tbParametroEndereco: TStringField;
    tbParametroNumero: TSmallintField;
    tbParametroComplemento: TStringField;
    tbParametroBairro: TStringField;
    tbParametroCEP: TStringField;
    tbParametroCidade: TStringField;
    tbParametroUF: TStringField;
    tbParametroTel1: TStringField;
    tbParametroTel2: TStringField;
    tbParametroCelular: TStringField;
    tbParametroICMS: TFloatField;
    tbParametroMensPromo: TStringField;
    tbParametroMensRodape: TStringField;
    tbParametroLogo: TGraphicField;
    tbParametroCredRenda: TFloatField;
    tbParametroComissao: TFloatField;
    tbParametroCPMF: TFloatField;
    tbParametroMultaDia: TSmallintField;
    tbParametroValorMulta: TCurrencyField;
    tbParametroPercMulta: TFloatField;
    tbParametroDescDia: TSmallintField;
    tbParametroValorDesc: TCurrencyField;
    tbParametroPercDesc: TFloatField;
    tbParametroJurosDia: TSmallintField;
    tbParametroValorJuros: TCurrencyField;
    tbParametroPercJuros: TFloatField;
    tbParametroDecoEntra: TStringField;
    TbSeguradoraCodSeg: TAutoIncField;
    tbCliente: TTable;
    dsCliente: TDataSource;
    tbImovelNada: TAutoIncField;
    tbImovelTipoArea: TStringField;
    tbImovelNumPatri: TStringField;
    TbPatrimonioNada: TAutoIncField;
    tbVeiculoNumPatri: TStringField;
    tbEquipamentoNumPatri: TStringField;
    tbClienteCodCli: TAutoIncField;
    tbClienteTipo: TStringField;
    tbClienteNome: TStringField;
    tbClienteFantasia: TStringField;
    tbClienteNascimento: TDateField;
    tbClienteTel1: TStringField;
    tbClienteTel2: TStringField;
    tbClienteCelular: TStringField;
    tbClienteCnpj: TStringField;
    tbClienteCpf: TStringField;
    tbClienteInsEstado: TStringField;
    tbClienteRg: TStringField;
    tbClienteEndereco: TStringField;
    tbClienteNumero: TSmallintField;
    tbClienteComplemento: TStringField;
    tbClienteBairro: TStringField;
    tbClienteCep: TStringField;
    tbClienteCidade: TStringField;
    tbClienteUf: TStringField;
    tbClienteEmail: TStringField;
    tbClienteUltimaCompra: TDateField;
    tbClienteCodRota: TStringField;
    tbClienteObs: TMemoField;
    tbClienteDataCad: TDateField;
    tbClientePrazoPagto: TFloatField;
    tbVendas: TTable;
    tbCReceber: TTable;
    dsVendas: TDataSource;
    dsCReceber: TDataSource;
    tbVendasNada: TAutoIncField;
    tbVendasCodVen: TSmallintField;
    tbVendasDataven: TDateField;
    tbVendasHoraVen: TTimeField;
    tbVendasCodCli: TIntegerField;
    tbVendasValor: TCurrencyField;
    tbVendasDesconto: TCurrencyField;
    tbVendasNumParcelas: TSmallintField;
    tbVendasCodFunc: TIntegerField;
    tbVendasUserName: TStringField;
    tbVendasCodIndex: TIntegerField;
    tbVendasStatus: TStringField;
    tbVendasEntrega: TDateField;
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
    tbCReceberCompHist: TStringField;
    tbCReceberNumParcela: TStringField;
    tbCReceberValor: TCurrencyField;
    tbCReceberMultaDia: TDateField;
    tbCReceberValorMulta: TCurrencyField;
    tbCReceberPercMulta: TFloatField;
    tbCReceberDescDia: TDateField;
    tbCReceberValorDesc: TCurrencyField;
    tbCReceberPercDesc: TFloatField;
    tbCReceberJurosDia: TDateField;
    tbCReceberValorJuros: TCurrencyField;
    tbCReceberPercJuros: TFloatField;
    tbCReceberDataPaga: TDateField;
    tbCReceberValorPago: TCurrencyField;
    tbCReceberFormaPagto: TStringField;
    tbCReceberPago: TStringField;
    tbCReceberCodCCusto: TStringField;
    tbCReceberCodIndex: TIntegerField;
    TbEmprestimolkDescPatri: TStringField;
    TbEmprestimolkNomeCli: TStringField;
    TbEmprestimoNumPatri: TStringField;
    TbCompradorFantasia: TStringField;
    TbCompradorNascimento: TDateField;
    TbCompradorUltimaCompra: TDateField;
    TbCompradorCodRota: TStringField;
    TbCompradorPrazoPagto: TFloatField;
    tbBalCusto: TTable;
    dsBalCusto: TDataSource;
    tbBalCustoNada: TAutoIncField;
    tbBalCustoCodCcusto: TStringField;
    tbBalCustoMes: TStringField;
    tbBalCustoAno: TStringField;
    tbBalCustoReceitas: TCurrencyField;
    tbBalCustoDespesas: TCurrencyField;
    tbFornecedorRazSocial: TStringField;
    tbFornecedorFantasia: TStringField;
    tbServicos: TTable;
    tbServicosCodServ: TAutoIncField;
    tbServicosDescricao: TStringField;
    tbServicosVlServico: TCurrencyField;
    tbServicosUsaEquip: TStringField;
    tbServicosNumMinFunc: TSmallintField;
    tbServicosNumMaxFunc: TSmallintField;
    dsServicos: TDataSource;
    tbContrato: TTable;
    tbContratoCodCServ: TAutoIncField;
    tbContratoCodCli: TIntegerField;
    tbContratoDataIni: TDateField;
    tbContratoDataFim: TDateField;
    tbContratoVlPaga: TCurrencyField;
    tbContratoLkCliente: TStringField;
    dsContrato: TDataSource;
    tbPeriodo: TTable;
    dsPeriodo: TDataSource;
    tbPeriodoNada: TAutoIncField;
    tbPeriodoCodigo: TStringField;
    tbPeriodoPeriodo: TStringField;
    tbServicosPeriodo: TStringField;
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
    tbFuncUltimaVenda: TDateField;
    dsFunc: TDataSource;
    TbEmprestimoPeriodo: TStringField;
    tbCServFunc: TTable;
    tbCServFuncCodCServ: TIntegerField;
    tbCServFuncCodFunc: TIntegerField;
    dsCServFunc: TDataSource;
    tbCargo: TTable;
    tbCargoCodCargo: TAutoIncField;
    tbCargoCargo: TStringField;
    tbCargoComissao: TSmallintField;
    dsCargo: TDataSource;
    tbCServFunclkPeriodo: TStringField;
    tbContratolkPeriodo: TStringField;
    tbCServPatri: TTable;
    tbCServPatriCodCServ: TIntegerField;
    dsCServPatri: TDataSource;
    tbCServPatrilkPeriodo: TStringField;
    tbContratoNotafiscal: TIntegerField;
    tbContratoDatacad: TDateField;
    tbCReceberCodEmpre: TIntegerField;
    TbPatrimonioEmprestado: TStringField;
    dsCServServ: TDataSource;
    tbCServServ: TTable;
    tbCServServCodServ: TIntegerField;
    tbCServServVLPagar: TCurrencyField;
    tbCServServDataCad: TDateField;
    tbContratoPeriodo: TStringField;
    tbCServServlkservico: TStringField;
    tbPesContra: TTable;
    tbCServServCodCServ: TIntegerField;
    tbContratoFechado: TStringField;
    tbCServPatriQuantidade: TStringField;
    tbCServServQuantidade: TIntegerField;
    tbCServServNada: TAutoIncField;
    tbCServFunclknome: TStringField;
    TbEmprestimoPrevEntrega: TDateField;
    TbEmprestimoFimEmpre: TDateField;
    TbEmprestimoQuantidade: TFloatField;
    TbPatrimonioQuant: TFloatField;
    TbPatrimonioQuantUso: TFloatField;
    TbEmprestimoFechado: TStringField;
    tbCServPatriLkDescricao: TStringField;
    tbCServPatriNumPatri: TStringField;
    TbPatrimonioNumPatri: TStringField;
    tbCServPatriLkQuantuso: TIntegerField;
    tbServicosCodCServ: TIntegerField;
    dsSenha: TDataSource;
    tbSenha: TTable;
    tbSenhaUsuario: TStringField;
    tbSenhaSenha: TStringField;
    tbContratoLkServico: TStringField;
    tbCServFuncLkServico: TStringField;
    tbCServFuncLkCliente: TStringField;
    tbCServFuncLkCodCli: TIntegerField;
    tbPesContraCodCServ: TAutoIncField;
    tbPesContraCodCli: TIntegerField;
    tbPesContraDataIni: TDateField;
    tbPesContraDataFim: TDateField;
    tbPesContraVlPaga: TCurrencyField;
    tbPesContraFechado: TStringField;
    tbPesContraNotafiscal: TIntegerField;
    tbPesContraDatacad: TDateField;
    tbPesContraPeriodo: TStringField;
    tbCServPatriLkServico: TStringField;
    tbCServPatriLkCliente: TStringField;
    tbCServPatriLkCodCli: TStringField;
    tbContratoLkTipo: TStringField;
    tbVendasNumDoc: TStringField;
    tbVendasCaixa: TStringField;
    tbVendasCodForPag: TIntegerField;
    procedure TbPatrimonioAfterDelete(DataSet: TDataSet);
    procedure TbPatrimonioAfterPost(DataSet: TDataSet);
    procedure TbCompradorAfterDelete(DataSet: TDataSet);
    procedure TbCompradorAfterPost(DataSet: TDataSet);
    procedure TbSeguradoraAfterDelete(DataSet: TDataSet);
    procedure TbSeguradoraAfterPost(DataSet: TDataSet);
    procedure tbEquipamentoAfterDelete(DataSet: TDataSet);
    procedure tbEquipamentoAfterPost(DataSet: TDataSet);
    procedure tbVeiculoAfterDelete(DataSet: TDataSet);
    procedure tbVeiculoAfterPost(DataSet: TDataSet);
    procedure tbImovelAfterDelete(DataSet: TDataSet);
    procedure tbImovelAfterPost(DataSet: TDataSet);
    procedure tbCCustoAfterDelete(DataSet: TDataSet);
    procedure tbCCustoAfterPost(DataSet: TDataSet);
    procedure tbFornecedorAfterDelete(DataSet: TDataSet);
    procedure tbFornecedorAfterPost(DataSet: TDataSet);
    procedure TbTipoAreaAfterDelete(DataSet: TDataSet);
    procedure TbTipoAreaAfterPost(DataSet: TDataSet);
    procedure TbEmprestimoAfterDelete(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure TbEmprestimoAfterPost(DataSet: TDataSet);
    procedure tbParametroAfterDelete(DataSet: TDataSet);
    procedure tbParametroAfterPost(DataSet: TDataSet);
    procedure tbClienteAfterDelete(DataSet: TDataSet);
    procedure tbClienteAfterPost(DataSet: TDataSet);
    procedure tbVendasAfterDelete(DataSet: TDataSet);
    procedure tbVendasAfterPost(DataSet: TDataSet);
    procedure tbCReceberAfterDelete(DataSet: TDataSet);
    procedure tbCReceberAfterPost(DataSet: TDataSet);
    procedure tbBalCustoAfterDelete(DataSet: TDataSet);
    procedure tbBalCustoAfterPost(DataSet: TDataSet);
    procedure tbServicosAfterDelete(DataSet: TDataSet);
    procedure tbServicosAfterPost(DataSet: TDataSet);
    procedure tbContratoAfterDelete(DataSet: TDataSet);
    procedure tbContratoAfterPost(DataSet: TDataSet);
    procedure tbPeriodoAfterDelete(DataSet: TDataSet);
    procedure tbPeriodoAfterPost(DataSet: TDataSet);
    procedure tbFuncAfterDelete(DataSet: TDataSet);
    procedure tbFuncAfterPost(DataSet: TDataSet);
    procedure tbCServFuncAfterDelete(DataSet: TDataSet);
    procedure tbCServFuncAfterPost(DataSet: TDataSet);
    procedure tbCServServAfterPost(DataSet: TDataSet);
    procedure tbCServServAfterDelete(DataSet: TDataSet);
    procedure tbSenhaAfterDelete(DataSet: TDataSet);
    procedure tbSenhaAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    fhabilitateclado:boolean;
    fvtabstt:boolean;
  public
    { Public declarations }
    Property Habilitateclado : boolean read fhabilitateclado write fhabilitateclado;
    Property Vtabstt : boolean read fvtabstt write fvtabstt;

  end;

var
  DMDados: TDMDados;

implementation


{$R *.DFM}

procedure TDMDados.TbPatrimonioAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(TbPatrimonio.Handle);
end;

procedure TDMDados.TbPatrimonioAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(TbPatrimonio.Handle);
end;

procedure TDMDados.TbCompradorAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(TbComprador.Handle);
end;

procedure TDMDados.TbCompradorAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(TbComprador.Handle);
end;

procedure TDMDados.TbSeguradoraAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(TbSeguradora.Handle);
end;

procedure TDMDados.TbSeguradoraAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(TbSeguradora.Handle);
end;

procedure TDMDados.tbEquipamentoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbEquipamento.Handle);
end;

procedure TDMDados.tbEquipamentoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbEquipamento.Handle);
end;

procedure TDMDados.tbVeiculoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbVeiculo.Handle);
end;

procedure TDMDados.tbVeiculoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbVeiculo.Handle);
end;

procedure TDMDados.tbImovelAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbImovel.Handle);
end;

procedure TDMDados.tbImovelAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbImovel.Handle);
end;

procedure TDMDados.tbCCustoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbCCusto.Handle);
end;

procedure TDMDados.tbCCustoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbCCusto.Handle);
end;

procedure TDMDados.tbFornecedorAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbFornecedor.Handle);
end;

procedure TDMDados.tbFornecedorAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbFornecedor.Handle);
end;

procedure TDMDados.TbTipoAreaAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(TbTipoArea.Handle);
end;

procedure TDMDados.TbTipoAreaAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(TbTipoArea.Handle);
end;

procedure TDMDados.TbEmprestimoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(TbEmprestimo.Handle);
end;

procedure TDMDados.DataModuleCreate(Sender: TObject);
begin
  habilitateclado:=true;
  vtabstt:=true;
end;

procedure TDMDados.TbEmprestimoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(TbEmprestimo.Handle);
end;

procedure TDMDados.tbParametroAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(TbParametro.Handle);
end;

procedure TDMDados.tbParametroAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(TbParametro.Handle);
end;

procedure TDMDados.tbClienteAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(TbCliente.Handle);
end;

procedure TDMDados.tbClienteAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(TbCliente.Handle);
end;

procedure TDMDados.tbVendasAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(TbVendas.Handle);
end;

procedure TDMDados.tbVendasAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(TbVendas.Handle);
end;

procedure TDMDados.tbCReceberAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(TbCReceber.Handle);
end;

procedure TDMDados.tbCReceberAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(TbCReceber.Handle);
end;

procedure TDMDados.tbBalCustoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(TbBalCusto.Handle);
end;

procedure TDMDados.tbBalCustoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(TbBalCusto.Handle);
end;

procedure TDMDados.tbServicosAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(TbServicos.Handle);
end;

procedure TDMDados.tbServicosAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(TbServicos.Handle);
end;

procedure TDMDados.tbContratoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(TbContrato.Handle);
end;

procedure TDMDados.tbContratoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(TbContrato.Handle);
end;

procedure TDMDados.tbPeriodoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(TbPeriodo.Handle);
end;

procedure TDMDados.tbPeriodoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(TbPeriodo.Handle);
end;

procedure TDMDados.tbFuncAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(TbFunc.Handle);
end;

procedure TDMDados.tbFuncAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(TbFunc.Handle);
end;

procedure TDMDados.tbCServFuncAfterDelete(DataSet: TDataSet);
begin
  dbisaveChanges(tbCServFunc.Handle);
end;

procedure TDMDados.tbCServFuncAfterPost(DataSet: TDataSet);
begin
  dbisaveChanges(tbCServFunc.Handle);
end;

procedure TDMDados.tbCServServAfterPost(DataSet: TDataSet);
begin
 dbisaveChanges(tbCServServ.Handle);
end;

procedure TDMDados.tbCServServAfterDelete(DataSet: TDataSet);
begin
 dbisaveChanges(tbCServServ.Handle);
end;

procedure TDMDados.tbSenhaAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbSenha.Handle);
end;

procedure TDMDados.tbSenhaAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbSenha.Handle);
end;

end.
