//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

program Netuno;

uses
  Forms,
  UnitPatri in 'UnitPatri.pas' {FrmPatri},
  UnitDMDados in 'UnitDMDados.pas' {DMDados: TDataModule},
  UnitLocComprador in 'UnitLocComprador.pas' {frmLocComprador},
  UnitLocFornec in 'UnitLocFornec.pas' {FrmLocFornec},
  unitSeguradora in 'unitSeguradora.pas' {frmSeguradora},
  untLocSegura in 'untLocSegura.pas' {frmLocSegura},
  UntLocPatrimonio in 'UntLocPatrimonio.pas' {FrmLocPatrimonio},
  UnitPrincipal in 'unitPrincipal.pas' {FrmPrincipal},
  UnitRelCliente in 'UnitRelCliente.pas' {FrmRelCliente},
  UnitQRCliente in 'UnitQRCliente.pas' {QRCliente: TQuickRep},
  UnitSobre in 'UnitSobre.pas' {FrmSobre},
  UnitLocEmprestimo in 'UnitLocEmprestimo.pas' {FrmLocEmprestimo},
  UnitRelSeg in 'UnitRelSeg.pas' {FrmRelSeg},
  UnitRelEmprestimo in 'UnitRelEmprestimo.pas' {FrmRelEmprestimo},
  UnitRelPatrimonio in 'UnitRelPatrimonio.pas' {FrmRelPatrimonio},
  UnitQREmprestimo in 'UnitQREmprestimo.pas' {QREmprestimo},
  UnitQRSeg in 'UnitQRSeg.pas' {QRSeguradora},
  UnitQRPatri in 'UnitQRPatri.pas' {QRPatrimonio},
  UnitQRVendidos in 'UnitQRVendidos.pas' {QRVendidos},
  unitParametro in 'UnitParametro.pas' {FrmParametro},
  unitCliente in 'unitCliente.pas' {FrmCadCliente},
  unitLocCliente in 'unitLocCliente.pas' {frmLocCliente},
  UnitCompra in 'UnitCompra.pas' {FrmCadComprador},
  UnitFornec in 'UnitFornec.pas' {FrmCadFornec},
  Unitcademprestimo in 'Unitcademprestimo.pas' {Frmcademprestimo},
  unitCadCcusto in 'unitCadCcusto.pas' {FrmCCusto},
  unitLocCcusto in 'UnitLocCCusto.pas' {FrmLocCCusto},
  unContraServ in 'unContraServ.pas' {frmContraServ},
  unServicos in 'unServicos.pas' {frmCadServicos},
  UnitLocServ in 'UnitLocServ.pas' {FrmLocServ},
  unitPeriodo in 'unitPeriodo.pas' {frmPeriodo},
  UnitMaoObra in 'UnitMaoObra.pas' {frmMaoObra},
  UnitLocFunc in 'UnitLocFunc.pas' {frmLocfunc},
  UnitLocContrato in 'UnitLocContrato.pas' {frmLocContrato},
  UnitServPatri in 'UnitServPatri.pas' {frmServpatri},
  UnitRelContrato in 'UnitRelContrato.pas' {FrmRelContrato},
  UnitQRContrato in 'UnitQRContrato.pas' {QRContrato: TQuickRep},
  UnitEntrega in 'UnitEntrega.pas' {FrmEntrega},
  UnitCadSenha in 'UnitCadSenha.pas' {FrmCadSenha};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDMDados, DMDados);
  Application.Run;
end.
