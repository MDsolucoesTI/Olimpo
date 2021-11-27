//////////////////////////////////////////////////////////////////////////
// Criacao...........: 05/2002
// Sistema...........: Ciclope - Controle de Funcionarios
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unServFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, fcdbtreeview, jpeg, ExtCtrls, SpeedBar, RxLookup,
  ToolEdit, RXDBCtrl, fcButton, fcImgBtn, RXSplit, Mask, CurrEdit, RXCtrls,
  RackCtls;

type
  TfrmServFunc = class(TForm)
    imgTop: TImage;
    lbTop: TLabel;
    spBarBotoes: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnPrimeiro: TSpeedItem;
    BtnAnterior: TSpeedItem;
    BtnProximo: TSpeedItem;
    BtnUltimo: TSpeedItem;
    BtnNovo: TSpeedItem;
    BtnGravar: TSpeedItem;
    BtnCancelar: TSpeedItem;
    BtnAlterar: TSpeedItem;
    BtnDeletar: TSpeedItem;
    BtnLocalizar: TSpeedItem;
    BtnSair: TSpeedItem;
    pnCentro: TPanel;
    rxLbPeriodo: TRxLabel;
    rxLbValor: TRxLabel;
    dbevalor: TRxDBCalcEdit;
    RxSplitter1: TRxSplitter;
    btLocCli: TfcImageBtn;
    btLocServ: TfcImageBtn;
    RxSplitter5: TRxSplitter;
    RxSplitter2: TRxSplitter;
    RxSplitter3: TRxSplitter;
    dbeInicio: TDBDateEdit;
    dbeTermino: TDBDateEdit;
    dbcPeriodo: TRxDBLookupCombo;
    rxLbinicio: TRxLabel;
    spnTop: TScrewPanel;
    img: TImage;
    RxLabel15: TRxLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServFunc: TfrmServFunc;

implementation

uses unitDmDados;

{$R *.DFM}

end.
