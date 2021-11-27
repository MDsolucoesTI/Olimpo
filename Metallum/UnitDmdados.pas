//////////////////////////////////////////////////////////////////////////
// Criacao...........: 05/2002
// Sistema...........: Metallum - Controle de Serviços
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
    tbCliente: TTable;
    dsCliente: TDataSource;
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
    tbClienteCodRota: TStringField;
    tbClienteFantasia: TStringField;
    tbClientePrazoPagto: TFloatField;
    tbLibCreditoRespon: TStringField;
    tbFuncUltimaVenda: TDateField;
    tbOs: TTable;
    tbOsNumero: TStringField;
    tbOsTipo: TStringField;
    tbOsDiaEntrada: TDateField;
    tbOsHoraEntrada: TTimeField;
    tbOsPrevEntrega: TDateField;
    tbOsDefeitoCli: TMemoField;
    tbOsDefeitoEnc: TMemoField;
    tbOsValorPre: TCurrencyField;
    tbOsAprovOrc: TDateField;
    tbOsSolucao: TMemoField;
    tbOsObs: TMemoField;
    tbOsDiaEntrega: TDateField;
    tbOsHoraEntrega: TTimeField;
    tbOsValor: TCurrencyField;
    tbOsComissao: TSmallintField;
    tbOsAberto: TStringField;
    DSOs: TDataSource;
    tbOsCodCli: TIntegerField;
    tbAgenda: TTable;
    DSAgenda: TDataSource;
    tbOsCodOs: TAutoIncField;
    tbOsCodFunc: TIntegerField;
    tbOslknomefunc: TStringField;
    tbAgendaCodigo: TAutoIncField;
    tbAgendaCodOs: TIntegerField;
    tbAgendaCodCli: TIntegerField;
    tbAgendaDia: TDateField;
    tbAgendaHora: TTimeField;
    tbAgendaHoraSaida: TTimeField;
    tbAgendaAberto: TStringField;
    tbAgendaPrioridade: TStringField;
    tbAgendaEnderCli: TStringField;
    tbAgendaNomeCli: TStringField;
    tbAgendaNumCli: TIntegerField;
    tbAgendaCompleCli: TStringField;
    tbAgendaBairCli: TStringField;
    tbAgendaCidCli: TStringField;
    tbAgendaTelcli: TStringField;
    tbAgendaLkNumOs: TStringField;
    tbAgendaCodFunc: TIntegerField;
    tbAgendaLkFuncOs: TStringField;
    tbAgeVisual: TTable;
    dsAgeVisual: TDataSource;
    tbOsVisual: TTable;
    StringField11: TStringField;
    StringField12: TStringField;
    DateField2: TDateField;
    TimeField3: TTimeField;
    DateField3: TDateField;
    MemoField1: TMemoField;
    MemoField2: TMemoField;
    CurrencyField1: TCurrencyField;
    DateField4: TDateField;
    MemoField3: TMemoField;
    MemoField4: TMemoField;
    DateField5: TDateField;
    TimeField4: TTimeField;
    CurrencyField2: TCurrencyField;
    SmallintField1: TSmallintField;
    StringField13: TStringField;
    IntegerField5: TIntegerField;
    AutoIncField2: TAutoIncField;
    IntegerField6: TIntegerField;
    dsOsVisual: TDataSource;
    tbAgeVisualCodigo: TAutoIncField;
    tbAgeVisualCodOs: TIntegerField;
    tbAgeVisualCodCli: TIntegerField;
    tbAgeVisualCodFunc: TIntegerField;
    tbAgeVisualDia: TDateField;
    tbAgeVisualHora: TTimeField;
    tbAgeVisualHoraSaida: TTimeField;
    tbAgeVisualAberto: TStringField;
    tbAgeVisualPrioridade: TStringField;
    tbAgeVisualEnderCli: TStringField;
    tbAgeVisualNomeCli: TStringField;
    tbAgeVisualNumCli: TIntegerField;
    tbAgeVisualCompleCli: TStringField;
    tbAgeVisualBairCli: TStringField;
    tbAgeVisualCidCli: TStringField;
    tbAgeVisualTelCli: TStringField;
    tbAgeVisualLkNumOs: TStringField;
    tbAgeVisualLkFuncOs: TStringField;
    tbOsVisualLkNomeFunc: TStringField;
    tbVendas: TTable;
    dsVendas: TDataSource;
    tbCreceber: TTable;
    dsCreceber: TDataSource;
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
    TbParametroDecoEntra: TStringField;
    TbParametroMensPromo: TStringField;
    TbParametroMensRodape: TStringField;
    TbParametroPis: TFloatField;
    TbParametroCofins: TFloatField;
    TbParametroCS: TFloatField;
    TbParametroInsEstado: TStringField;
    dsParametro: TDataSource;
    tbOslkNomeCli: TStringField;

    procedure tbFuncCalcFields(DataSet: TDataSet);
    procedure tbClienteAfterDelete(DataSet: TDataSet);
    procedure tbClienteAfterPost(DataSet: TDataSet);
    procedure tbLibCreditoAfterDelete(DataSet: TDataSet);
    procedure tbLibCreditoAfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure tbAgeVisualFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
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

uses UnitAgenda;

 

{$R *.DFM}


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

procedure Tdmdados.tbClienteAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbCliente.Handle);
end;

procedure Tdmdados.tbClienteAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbCliente.Handle);
end;

procedure Tdmdados.tbLibCreditoAfterDelete(DataSet: TDataSet);
begin
dbisaveChanges(tbLibCredito.Handle);
end;

procedure Tdmdados.tbLibCreditoAfterPost(DataSet: TDataSet);
begin
dbisaveChanges(tbLibCredito.Handle);
end;

procedure Tdmdados.DataModuleCreate(Sender: TObject);
begin
  HabilitaTeclado:=True;
  vTabStt:=True;
end;

procedure Tdmdados.tbAgeVisualFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
Var
  Tempo,Agora:TDateTime;
begin
  Agora:=Now;
  If frmAgenda.cbTempo.Text = '1:00' Then
    Tempo:=(3600*(1/24/60/60));
  If frmAgenda.cbTempo.Text = '1:30' Then
    Tempo:=(5400*(1/24/60/60));
  If frmAgenda.cbTempo.Text = '2:00' Then
    Tempo:=(7200*(1/24/60/60));
  If frmAgenda.cbTempo.Text = '2:30' Then
    Tempo:=(9000*(1/24/60/60));
  If frmAgenda.cbTempo.Text = '3:00' Then
    Tempo:=(10800*(1/24/60/60));
  Agora:=Agora-tbAgeVisualHora.Value;
  If (Agora>=Tempo) and (tbAgeVisualAberto.Value = 'A') Then
    Accept:=True
  Else
    Accept:=False;
end;

end.
