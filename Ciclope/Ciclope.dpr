//////////////////////////////////////////////////////////////////////////
// Criacao...........: 05/2002
// Sistema...........: Ciclope - Controle de Funcionarios
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

program Servicos;

uses
  Forms,
  unServicos in 'unServicos.pas' {frmCadServicos},
  unitDmDados in 'unitDmDados.pas' {dmdados: TDataModule},
  unContraServ in 'unContraServ.pas' {frmContraServ},
  unitLocCliente in 'unitLocCliente.pas' {frmLocCliente},
  UnitLocServ in 'UnitLocServ.pas' {FrmLocServ},
  UnitServPatri in 'UnitServPatri.pas' {frmServpatri},
  UnitRelContrato in 'UnitRelContrato.pas' {FrmRelContrato},
  UnitQRContrato in 'UnitQRContrato.pas' {QRContrato: TQuickRep},
  UnitCargos in 'UnitCargos.pas' {FrmCargos},
  UnitCustoFunc in 'UnitCustoFunc.pas' {FrmCustoFunc},
  unitFunc in 'unitFunc.pas' {FrmFuncionario},
  unitLibCredito in 'unitLibCredito.pas' {FrmLibCred},
  UnitLocFunc in 'UnitLocFunc.pas' {FrmLocFunc},
  UntLocPatrimonio in 'UntLocPatrimonio.pas' {FrmLocPatrimonio},
  unitParametro in 'unitParametro.pas' {FrmParametro},
  UnitRelCliente in 'UnitRelCliente.pas' {FrmRelCliente},
  UnitRelFunc in 'UnitRelFunc.pas' {FrmRelFunc},
  UnitServFunc in 'UnitServFunc.pas' {frmServFunc},
  UnitSobre in 'UnitSobre.pas' {FrmSobre},
  UnitQRCliente in 'UnitQRCliente.pas' {QRCliente: TQuickRep},
  UnitQRFunc in 'UnitQRFunc.pas' {QRFunc: TQuickRep},
  UnitAtSalario in 'UnitAtSalario.pas' {FrmAtualSalario},
  UnitCadClientes in 'UnitCadClientes.pas' {FrmCadCliente},
  unitPrincipal in 'unitPrincipal.pas' {FrmPrincipal};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Ciclope';
  Application.CreateForm(Tdmdados, dmdados);
  Application.CreateForm(TFrmCargos, FrmCargos);
  Application.CreateForm(TFrmCustoFunc, FrmCustoFunc);
  Application.CreateForm(TFrmFuncionario, FrmFuncionario);
  Application.CreateForm(TFrmLibCred, FrmLibCred);
  Application.CreateForm(TFrmLocFunc, FrmLocFunc);
  Application.CreateForm(TFrmLocPatrimonio, FrmLocPatrimonio);
  Application.CreateForm(TFrmParametro, FrmParametro);
  Application.CreateForm(TFrmRelCliente, FrmRelCliente);
  Application.CreateForm(TFrmRelFunc, FrmRelFunc);
  Application.CreateForm(TfrmServFunc, frmServFunc);
  Application.CreateForm(TFrmSobre, FrmSobre);
  Application.CreateForm(TQRCliente, QRCliente);
  Application.CreateForm(TQRFunc, QRFunc);
  Application.Run;
end.
