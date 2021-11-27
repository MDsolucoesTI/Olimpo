//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

program Triton;

uses
  Forms,
  UnitCadImovel in 'UnitCadImovel.pas' {FrmCadImovel},
  UnitCadImob in 'UnitCadImob.pas' {FrmCadImob},
  UnitEfAluguel in 'UnitEfAluguel.pas' {FrmEfAluguel},
  UnitIndiceAt in 'UnitIndiceAt.pas' {FrmIndiceAt},
  UnitDespImov in 'UnitDespImov.pas' {FrmDespImov},
  UnitPrincipal in 'UnitPrincipal.pas' {FrmPrincipal},
  UnitDmdados in 'UnitDmdados.pas' {DMdados: TDataModule},
  unitCadHist in 'unitCadHist.pas' {frmCadHist},
  unitCadTipoImovel in 'unitCadTipoImovel.pas' {frmCadTipoImovel},
  unitCadTipoDoc in 'unitCadTipoDoc.pas' {FrmCadTipoDoc},
  unitCadCcusto in 'unitCadCcusto.pas' {FrmCadCusto},
  unitCadBancos in 'unitCadBancos.pas' {FrmCadBancos},
  UnitLocImovel in 'UnitLocImovel.pas' {FrmLocImov},
  unitLocPes in 'unitLocPes.pas' {frmLocPes},
  UnitCadClientes in 'UnitCadClientes.pas' {FrmCadCliente},
  UnitFornec in 'UnitFornec.pas' {FrmCadFornec},
  unitCcorrente in 'unitCcorrente.pas' {FrmCCorrente},
  unitCpagar in 'unitCpagar.pas' {frmCpagar},
  UnitMovCaixa in 'UnitMovCaixa.pas' {FrmMovCaixa},
  unitLocCcusto in 'UnitLocCCusto.pas' {FrmLocCCusto},
  unitLocCliente in 'unitLocCliente.pas' {frmLocClientes},
  unitLocCreceber in 'UnitLocCReceber.pas' {FrmLocCReceber},
  unitLocFornec in 'UnitLocFornec.pas' {FrmLocFornec},
  unitQrReciboCpag in 'unitQrReciboCpag.pas' {QrReciboCP},
  unitQrCrec in 'unitQrCrec.pas' {QrReciboCrec},
  unitLibCredito in 'unitLibCredito.pas' {FrmLibCred},
  unitLocTipoDoc in 'UnitLocTipoDoc.pas' {FrmLocTipoDoc},
  unitCreceber in 'UnitCReceber.pas' {FrmCReceber},
  unitLocHistorico in 'UnitLocHistorico.pas' {FrmLocHistorico},
  unitBaixaCreceber in 'unitBaixaCreceber.pas' {FrmBaixaCReceber},
  unitBaixaCpagar in 'UnitBaixaCPagar.pas' {FrmBaixaCPagar},
  unitConfPagtoCP in 'unitConfPagtoCP.pas' {FrmConfPgtoCP},
  unitConfReceb in 'unitConfReceb.pas' {FrmConfReceb},
  UnitSobre in 'UnitSobre.pas' {FrmSobre},
  UnirFechCaixa in 'UnirFechCaixa.pas' {FrmFechCaixa},
  UnitIndexadores in 'UnitIndexadores.pas' {FrmCadIndex};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDMdados, DMdados);
  Application.CreateForm(TFrmSobre, FrmSobre);
  Application.CreateForm(TFrmFechCaixa, FrmFechCaixa);
  Application.CreateForm(TFrmCadIndex, FrmCadIndex);
  Application.Run;
end.
