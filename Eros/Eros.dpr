//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

program Eros;

uses
  Forms,
  unitDmDados in 'UnitDmdados.pas' {dmdados: TDataModule},
  unitLibCredito in 'unitLibCredito.pas' {FrmLibCred},
  unitLocCliente in 'unitLocCliente.pas' {FrmLocCliente},
  UnitAtSalario in 'UnitAtSalario.pas' {FrmAtualSalario},
  UnitPrincipal in 'unitPrincipal.pas' {FrmPrincipal},
  UnitSobre in 'UnitSobre.pas' {FrmSobre},
  unitFunc in 'unitFunc.pas' {FrmFuncionario},
  UnitCargos in 'UnitCargos.pas' {FrmCargos},
  UnitProduto in 'UnitProduto.pas' {frmProduto},
  UnitVendas in 'UnitVendas.pas' {FrmVendas},
  unitOrcamento in 'unitOrcamento.pas' {FrmOrcamento},
  unitParametro in 'unitParametro.pas' {FrmParametro},
  UnitRelCliente in 'UnitRelCliente.pas' {FrmRelCliente},
  UnitQRCliente in 'UnitQRCliente.pas' {QRCliente: TQuickRep},
  unitQrPedidos in 'unitQrPedidos.pas' {QrPedidosCli},
  unitRelPedidos in 'unitRelPedidos.pas' {frmRelPedidos},
  UnitCustoFunc in 'UnitCustoFunc.pas' {FrmCustoFunc},
  unitQRVendas in 'unitQRVendas.pas' {QrVenda},
  unitQrVendasCli in 'unitQrVendasCli.pas' {QrVendaCli},
  unitQrProduto in 'unitQrProduto.pas' {QrProduto},
  unitQrPedidosFunc in 'unitQrPedidosFunc.pas' {QrPedidosFunc},
  unitQrComissao in 'unitQrComissao.pas' {QrComissao},
  UnitLocProd in 'UnitLocProd.pas' {FrmLocProd},
  unitEmitirNF in 'unitEmitirNF.pas' {frmEmitirNF},
  UnitNF in 'UnitNF.pas' {FrmNF},
  unitQRNF in 'unitQRNF.pas' {qrNF: TQuickRep},
  UnitDescProd in 'UnitDescProd.pas' {FrmDescProd},
  UnitQRFunc in 'UnitQRFunc.pas' {QRFunc: TQuickRep},
  UnitRelFunc in 'UnitRelFunc.pas' {FrmRelFunc},
  UnitCadGrupo in 'unitCadGrupo.pas' {FrmCadGrupo},
  UnitCadSubgrupo in 'unitCadSubgrupo.pas' {FrmCadSubgrupo},
  UnitCadMarca in 'unitCadMarca.pas' {FrmCadMarca},
  UnitCadUnidade in 'unitCadUnidade.pas' {FrmCadUnidades},
  UniCadICMS in 'UniCadICMS.pas' {FrmCadICMS},
  UnitCadSenha in 'UnitCadSenha.pas' {frmCadSenha},
  unitVerNF in 'unitVerNF.pas' {frmVerNF},
  unitQrOrcamento in 'unitQrOrcamento.pas' {QrOrcamento},
  UnitLocFunc in 'UnitLocFunc.pas' {FrmLocFunc},
  UnitQRNFServ in 'UnitQRNFServ.pas' {qrNFServ: TQuickRep},
  UnitCadCliente in 'UnitCadCliente.pas' {FrmCadCliente},
  UnitCadPlanos in 'UnitCadPlanos.pas' {FrmCadPlanos},
  UnitConsPlano in 'UnitConsPlano.pas' {FrmConsPlano},
  untDepende in 'untDepende.pas' {frmDependentes},
  unitCadMaterial in 'unitCadMaterial.pas' {frmCadMaterial},
  unitPagaVenda in 'unitPagaVenda.pas' {frmPagaVenda},
  UnitCarne in 'UnitCarne.pas' {QRCarne: TQuickRep},
  unitPreco in 'unitPreco.pas' {FrmLocPreco},
  unitCancelVenda in 'unitCancelVenda.pas' {frmCancelVenda},
  UnitLocVenda in 'UnitLocVenda.pas' {FrmLocVenda},
  unitQrFatura in 'unitQrFatura.pas' {QrFatura},
  unitRelFatura in 'unitRelFatura.pas' {frmRelFatura},
  untOrca in 'untOrca.pas' {frmOrca},
  unitPagaPedido in 'unitPagaPedido.pas' {frmPagaPedido},
  UnitCadDepFunc in 'UnitCadDepFunc.pas' {FrmCadDepFunc},
  UnitAbreCx in 'UnitAbreCx.pas' {FrmAbreCx},
  UnitLanCaixa in 'UnitLanCaixa.pas' {FrmLanCaixa},
  UnitFechCaixa in 'UnitFechCaixa.pas' {FrmFechCaixa},
  untRelFechaCaixa in 'untRelFechaCaixa.pas' {qrFechaCaixa: TQuickRep},
  UnitEntMat in 'UnitEntMat.pas' {FrmEntrMat},
  UnitLocCaixa in 'UnitLocCaixa.pas' {FrmLocCaixa};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Eros Vers�o 1.0';
  Application.CreateForm(Tdmdados, dmdados);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
