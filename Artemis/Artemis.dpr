//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Ultima modificacao: 03/2007
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

program Artemis;

uses
  Forms,
  UnitPrincipal in 'unitPrincipal.pas' {FrmPrincipal},
  unitDmDados in 'UnitDmdados.pas' {dmdados: TDataModule},
  unitCadCcusto in 'unitCadCcusto.pas' {FrmCCusto},
  UnitHistorico in 'UnitHistorico.pas' {FrmHistorico},
  unitCadBancos in 'unitCadBancos.pas' {FrmCadBancos},
  unitCadTipoDoc in 'unitCadTipoDoc.pas' {FrmTipoDoc},
  unitCcorrente in 'UnitCCorrente.pas' {FrmCCorrente},
  unitCreceber in 'UnitCReceber.pas' {FrmCReceber},
  unitSelecCR in 'unitSelecCR.pas' {FrmSelecCR},
  UnitCancelCR in 'UnitCancelCR.pas' {FrmCancelCR},
  unitLocHistorico in 'UnitLocHistorico.pas' {FrmLocHistorico},
  unitLocCcusto in 'UnitLocCCusto.pas' {FrmLocCCusto},
  unitLocTipoDoc in 'UnitLocTipoDoc.pas' {FrmLocTipoDoc},
  UnitTipoReceb in 'UnitTipoReceb.pas' {FrmTipoReceb},
  unitCpagar in 'unitCpagar.pas' {frmCpagar},
  unitLocCpagar in 'unitLocCpagar.pas' {FrmLocCpagar},
  UnitSelecCP in 'UnitSelecCP.pas' {FrmSelecCP},
  unitLocCreceber in 'UnitLocCReceber.pas' {FrmLocCReceber},
  UnitMovCaixa in 'UnitMovCaixa.pas' {FrmMovCaixa},
  UnitFechCC in 'UnitFechCC.pas' {FrmFechCC},
  UnitQRCliente in 'UnitQRCliente.pas' {QRCliente: TQuickRep},
  UnitRelFornec in 'UnitRelFornec.pas' {FrmRelFornec},
  UnitQRFornec in 'UnitQRFornec.pas' {QRFornec: TQuickRep},
  UnitRelCReceber in 'UnitRelCReceber.pas' {FrmRelCReceber},
  UnitQRCReceber in 'UnitQRCReceber.pas' {QRCreceber: TQuickRep},
  unitRelCpagar in 'unitRelCpagar.pas' {frmRelCpagar},
  unitQrCpagar in 'unitQrCpagar.pas' {QrCpagar},
  unitQrImposto in 'unitQrImposto.pas' {QrImposto},
  unitBalFin in 'unitBalFin.pas' {FrmBalFin},
  unitQRBalFin in 'unitQRBalFin.pas' {qrBalFin: TQuickRep},
  uitQrSaExtratos in 'uitQrSaExtratos.pas' {QrSaExtrato},
  unitRelMovConta in 'unitRelMovConta.pas' {frmRelMovConta},
  UnitCancelCP in 'UnitCancelCP.pas' {FrmCancelCP},
  UnitSobre in 'UnitSobre.pas' {FrmSobre},
  UnitRelCliente in 'UnitRelCliente.pas' {FrmRelCliente},
  Unitbolbbv in 'Unitbolbbv.pas' {QRBOLETO},
  UnitRelBoletoBBV in 'UnitRelBoletoBBV.pas' {FrmRelBoletoBBV},
  Unitbolreal in 'Unitbolreal.pas' {QRBoleto1},
  UnitRelBoletoReal in 'UnitRelBoletoReal.pas' {FrmRelBoletoReal},
  UnitRelBoletoBBTXT in 'UnitRelBoletoBBTXT.pas' {FrmRelBoletoBBTXT},
  UnitCadSenha in 'UnitCadSenha.pas' {frmCadSenha},
  UnitCadCliente in 'UnitCadCliente.pas' {FrmCadCliente},
  UnitCadFornec in 'UnitCadFornec.pas' {FrmCadFornec},
  UnitLocFornec in 'unitLocFornec.pas' {FrmLocFornec},
  unitParametro in 'unitParametro.pas' {FrmParametro},
  unitLocCliente in 'unitLocCliente.pas' {frmLocCliente},
  unitLibCredito in 'unitLibCredito.pas' {frmLibCred},
  UnitBaixaLoteCR in 'UnitBaixaLoteCR.pas' {FrmBaixaLoteCR},
  UnitDescParc in 'UnitDescParc.pas' {FrmDescParc},
  UnitBaixaLoteCP in 'UnitBaixaLoteCP.pas' {FrmBaixaLoteCP},
  UnitTipoPagto in 'UnitTipoPagto.pas' {FrmTipoPgto},
  UnitCadCartao in 'UnitCadCartao.pas' {FrmCadCartao},
  UnitFechCaixa in 'UnitFechCaixa.pas' {FrmFechCaixa};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Artemis Vers�o 1.0';
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(Tdmdados, dmdados);
  Application.CreateForm(TFrmFechCaixa, FrmFechCaixa);
  Application.Run;
end.
