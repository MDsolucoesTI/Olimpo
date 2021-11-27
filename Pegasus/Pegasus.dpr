//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 08-01-2001
// Ultima modifica��o: 06-07-2005
// Sistema...........: Pegasus - Controle de Estoque
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

program Pegasus;

uses
  Forms,
  UnitPrincipal in 'unitPrincipal.pas' {FrmPrincipal},
  unitDmDados in 'UnitDmdados.pas' {dmdados: TDataModule},
  unitParametro in 'unitParametro.pas' {FrmParametro},
  unitRelEtiqueta in 'unitRelEtiqueta.pas' {frmRelEtiqueta},
  unitCadMaterial in 'unitCadMaterial.pas' {frmCadMaterial},
  UnitSaidaMat in 'unitSaidaMat.pas' {FrmSaidaMat},
  UnitCadGrupo in 'unitCadGrupo.pas' {FrmCadGrupo},
  UnitCadMarca in 'unitCadMarca.pas' {FrmCadMarca},
  UnitEntradaMat in 'unitEntradaMat.pas' {FrmEntradaMat},
  UnitRelEstoque in 'UnitRelEstoque.pas' {FrmRelEstoque},
  UnitCadUnidade in 'unitCadUnidade.pas' {FrmCadUnidades},
  UnitLocProd in 'UnitLocProd.pas' {FrmLocProd},
  UnitRelFornec in 'UnitRelFornec.pas' {FrmRelFornec},
  UnitQRFornec in 'UnitQRFornec.pas' {QRFornec: TQuickRep},
  UnitQREstoque in 'UnitQREstoque.pas' {QREstoque: TQuickRep},
  unitQrEtiqueta in 'unitQrEtiqueta.pas' {QrEtiqueta},
  unitCompras in 'unitCompras.pas' {frmCompras},
  unitRelCompras in 'unitRelCompras.pas' {FrmRelCompPer},
  unitQrCompra in 'unitQrCompra.pas' {QrCompra},
  UnitCadSubgrupo in 'unitCadSubgrupo.pas' {FrmCadSubgrupo},
  UnitSobre in 'UnitSobre.pas' {FrmSobre},
  UnitCadSenha in 'UnitCadSenha.pas' {frmCadSenha},
  Unitqrcompra1 in 'Unitqrcompra1.pas' {qrcompra1: TQuickRep},
  Unitcompra1 in 'Unitcompra1.pas' {FrmRelCompras},
  UnitCadFornec in 'UnitCadFornec.pas' {FrmCadFornec},
  UnitLocFornec in 'UnitLocFornec.pas' {FrmLocFornec},
  unitPagaPedido in 'unitPagaPedido.pas' {frmPagaPedido};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Pegasus Vers�o 1.0';
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(Tdmdados, dmdados);
  Application.Run;
end.
