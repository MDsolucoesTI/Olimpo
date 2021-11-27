//////////////////////////////////////////////////////////////////////////
// Criacao...........: 05/2002
// Sistema...........: Metallum - Controle de Serviços
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

program Metallum;

uses
  Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FrmPrincipal},
  UnitOS in 'UnitOS.pas' {FrmOS},
  UnitAgenda in 'UnitAgenda.pas' {FrmAgenda},
  unitDmDados in 'UnitDmdados.pas' {dmdados: TDataModule},
  unitLocCliente in 'unitLocCliente.pas' {frmLocCliente},
  UnitLocFunc in 'UnitLocFunc.pas' {FrmLocFunc},
  UnitlocOS in 'UnitlocOS.pas' {frmLocOS},
  untVisualOS in 'untVisualOS.pas' {frmVisualOS},
  UnitAtSalario in 'UnitAtSalario.pas' {FrmAtualSalario},
  UnitCadClientes in 'UnitCadClientes.pas' {FrmCadCliente},
  UnitCargos in 'UnitCargos.pas' {FrmCargos},
  UnitCustoFunc in 'UnitCustoFunc.pas' {FrmCustoFunc},
  unitFunc in 'unitFunc.pas' {FrmFuncionario},
  unitLibCredito in 'unitLibCredito.pas' {FrmLibCred},
  unitParametro in 'unitParametro.pas' {FrmParametro},
  UnitSobre in 'UnitSobre.pas' {FrmSobre},
  UnitRelCliente in 'UnitRelCliente.pas' {FrmRelCliente},
  UnitRelFunc in 'UnitRelFunc.pas' {FrmRelFunc},
  untQROSAberta in 'untQROSAberta.pas' {qrOsAberta: TQuickRep};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(Tdmdados, dmdados);
  Application.Run;
end.
