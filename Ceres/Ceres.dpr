//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2002
// Sistema...........: Ceres - Controle de Cheques
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

program Ceres;

uses
  Forms,
  UnitPrincipal in 'unitPrincipal.pas' {FrmPrincipal},
  unitLanCheque in 'UnitLanCheque.pas' {FrmLanCheque},
  unitCadBancos in 'unitCadBancos.pas' {FrmCadBancos},
  unitLibCredito in 'unitLibCredito.pas' {FrmLibCred},
  unitLocCliente in 'unitLocCliente.pas' {frmLocCliente},
  unitDmDados in 'UnitDmdados.pas' {dmdados: TDataModule},
  unitBaixaCheque in 'unitBaixaCheque.pas' {FrmBaixaCheque},
  unitLanChequeSF in 'unitLanChequeSF.pas' {frmLanChequeSF},
  unitRenCheque in 'unitRenCheque.pas' {FrmRengCheque},
  unitConsultaCPF in 'unitConsultaCPF.pas' {FrmConsultaCPF},
  UnitSobre in 'UnitSobre.pas' {FrmSobre},
  UnitCadSenha in 'UnitCadSenha.pas' {frmCadSenha},
  unitRelCheAberto in 'unitRelCheAberto.pas' {frmRelCheAberto},
  untQRelCheAberto in 'untQRelCheAberto.pas' {qrRelCheAberto: TQuickRep},
  untRelCheAbreCli in 'untRelCheAbreCli.pas' {frmRelCheAbreCli},
  untRelCheDev in 'untRelCheDev.pas' {frmRelCheDev},
  untRelCheDevCli in 'untRelCheDevCli.pas' {frmRelCheDevCli},
  UnitCadCliente in 'UnitCadCliente.pas' {FrmCadCliente},
  unitParametro in 'unitParametro.pas' {FrmParametro};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Ceres Vers�o 1.0';
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(Tdmdados, dmdados);
  Application.Run;
end.
