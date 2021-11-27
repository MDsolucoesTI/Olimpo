//////////////////////////////////////////////////////////////////////////
// Criacao...........: 05/2002
// Sistema...........: Ciclope - Controle de Funcionarios
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitDmDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdmdados = class(TDataModule)
    dsServicos: TDataSource;
    tbServicos: TTable;
    tbServicosCodServ: TAutoIncField;
    tbServicosDescricao: TStringField;
    tbServicosVlServico: TCurrencyField;
    tbServicosUsaEquip: TStringField;
    tbServicosNumMinFunc: TSmallintField;
    tbServicosNumMaxFunc: TSmallintField;
    tbServicosPeriodo: TStringField;
    dsContrato: TDataSource;
    tbContrato: TTable;
    tbContratoCodCServ: TAutoIncField;
    tbContratoCodCli: TIntegerField;
    tbContratoCodServ: TIntegerField;
    tbContratoDataIni: TDateField;
    tbContratoDataFim: TDateField;
    tbContratoVlPaga: TCurrencyField;
    tbContratoPeriodo: TStringField;
    dsCliente: TDataSource;
    tbCliente: TTable;
    tbContratoLkServico: TStringField;
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
    tbLibCredito: TTable;
    dsLibCredito: TDataSource;
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
    tbLibCreditoRespon: TStringField;
    tbParametro: TTable;
    dsParametro: TDataSource;
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
    tbParametroPis: TFloatField;
    tbParametroCofins: TFloatField;
    tbParametroCS: TFloatField;
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
    dsCargoFunc: TDataSource;
    tbCargoFunc: TTable;
    tbCargoFuncCargo: TStringField;
    tbCargoFuncComissao: TSmallintField;
    tbCargoFuncCodCargo: TAutoIncField;
    tbDepenFunc: TTable;
    tbDepenFuncCodDep: TAutoIncField;
    tbDepenFuncCodFunc: TIntegerField;
    tbDepenFuncNomeDep: TStringField;
    tbDepenFuncNascDep: TDateField;
    tbDepenFuncParentesco: TStringField;
    dsDepenFunc: TDataSource;
    dsServFunc: TDataSource;
    tbServFunc: TTable;
    tbServFuncCodCServ: TIntegerField;
    tbServFuncCodFunc: TIntegerField;
    tbServFuncLknomeFunc: TStringField;
    tbContratoLkCliente: TStringField;
    dsservpatri: TDataSource;
    tbservpatri: TTable;
    tbservpatriCodCServ: TIntegerField;
    tbservpatriNumPatri: TIntegerField;
    dspatrimonio: TDataSource;
    tbpatrimonio: TTable;
    tbpatrimonioNumPatri: TAutoIncField;
    tbpatrimonioPlaqueta: TStringField;
    tbpatrimonioTipo: TStringField;
    tbpatrimonioDescricao: TStringField;
    tbpatrimonioNumNF: TStringField;
    tbpatrimonioQuant: TSmallintField;
    tbpatrimonioCodFor: TIntegerField;
    tbpatrimonioEstCons: TStringField;
    tbpatrimonioDtAquisicao: TDateField;
    tbpatrimonioVlAquisicao: TCurrencyField;
    tbpatrimonioCodCCusto: TStringField;
    tbpatrimonioVlMercado: TCurrencyField;
    tbpatrimonioCodSeg: TIntegerField;
    tbpatrimonioVencSeg: TDateField;
    tbpatrimonioVlSeg: TCurrencyField;
    tbpatrimonioDetalhes: TMemoField;
    tbpatrimonioCodCompra: TIntegerField;
    tbpatrimonioVlVenda: TCurrencyField;
    tbpatrimonioDataCad: TDateField;
    tbservpatrilkpatrimonio: TStringField;
    tbServFuncPeriodo: TStringField;
    tbContratolktipo: TStringField;
    dsvendas: TDataSource;
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
    tbVendasStatus: TStringField;
    tbVendasEntrega: TDateField;
    tbCreceber: TTable;
    dsCreceber: TDataSource;
    tbCreceberCodCRec: TAutoIncField;
    tbCreceberNumDoc: TStringField;
    tbCreceberCodDoc: TIntegerField;
    tbCreceberCodCli: TIntegerField;
    tbCreceberCodVen: TSmallintField;
    tbCreceberDataVen: TDateField;
    tbCreceberCodCServ: TIntegerField;
    tbCreceberDataEmis: TDateField;
    tbCreceberDataVenc: TDateField;
    tbCreceberCodHist: TIntegerField;
    tbCreceberCompHist: TStringField;
    tbCreceberNumParcela: TStringField;
    tbCreceberValor: TCurrencyField;
    tbCreceberMultaDia: TDateField;
    tbCreceberValorMulta: TCurrencyField;
    tbCreceberPercMulta: TFloatField;
    tbCreceberDescDia: TDateField;
    tbCreceberValorDesc: TCurrencyField;
    tbCreceberPercDesc: TFloatField;
    tbCreceberJurosDia: TDateField;
    tbCreceberValorJuros: TCurrencyField;
    tbCreceberPercJuros: TFloatField;
    tbCreceberDataPaga: TDateField;
    tbCreceberValorPago: TCurrencyField;
    tbCreceberFormaPagto: TStringField;
    tbCreceberPago: TStringField;
    tbCreceberCodCCusto: TStringField;
    tbCreceberCodIndex: TIntegerField;
    dsMovEstoque: TDataSource;
    tbMovEstoque: TTable;
    procedure dmdadosCreate(Sender: TObject);
    procedure tbFuncCalcFields(DataSet: TDataSet);
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

procedure Tdmdados.dmdadosCreate(Sender: TObject);
begin
  HabilitaTeclado:=True;
  vTabStt:=True;

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

end.
