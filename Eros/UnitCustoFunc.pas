//////////////////////////////////////////////////////////////////////////
// Criação...........: 02/2001
// Ultima modificação: 08/2004
// Módulo............: Calculo de Custo dos Funcionários
// Sistema...........: Eros - Controle de Vendas
// Integração........: Olimpo - Automação Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCustoFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SpeedBar, jpeg, ToolEdit, RXDBCtrl, CurrEdit, fcButton, fcImgBtn,
  StdCtrls, Mask, DBCtrls, ExtCtrls, RackCtls, RXSplit, RXCtrls, RxGrdCpt,
  fcImager, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmCustoFunc = class(TForm)
    RxLabel2: TRxLabel;
    Image1: TImage;
    RxLabel5: TRxLabel;
    DBEdit1: TDBEdit;
    RxLabel1: TRxLabel;
    CurrencyEdit1: TCurrencyEdit;
    RxLabel7: TRxLabel;
    DBEdit2: TDBEdit;
    RxLabel12: TRxLabel;
    CurrencyEdit2: TCurrencyEdit;
    RxLabel8: TRxLabel;
    DBEdit3: TDBEdit;
    RxLabel13: TRxLabel;
    CurrencyEdit3: TCurrencyEdit;
    RxLabel4: TRxLabel;
    CurrencyEdit4: TCurrencyEdit;
    RxLabel3: TRxLabel;
    CurrencyEdit5: TCurrencyEdit;
    RxLabel6: TRxLabel;
    CurrencyEdit6: TCurrencyEdit;
    RxLabel9: TRxLabel;
    CurrencyEdit7: TCurrencyEdit;
    CurrencyEdit8: TCurrencyEdit;
    RxLabel10: TRxLabel;
    RxLabel11: TRxLabel;
    CurrencyEdit9: TCurrencyEdit;
    LMDBackPanel2: TPanel;
    LMDBackPanel1: TPanel;
    LMDBackPanel3: TPanel;
    btnCancelar: TfcImageBtn;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    Procedure AtuaValor;
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCustoFunc: TFrmCustoFunc;

implementation

uses UnitLocFunc, UnitDmDados;

{$R *.DFM}

Procedure TFrmCustoFunc.AtuaValor;
Begin
  CurrencyEdit1.Value:=dmDados.tbFuncVlINSS.Value;
  CurrencyEdit2.Value:=dmDados.tbFuncVlValeTrans.Value;
  CurrencyEdit3.Value:=dmDados.tbFuncVlValeRef.Value;
  CurrencyEdit4.Value:=dmDados.tbFuncVl13.Value;
  CurrencyEdit5.Value:=dmDados.tbFuncVlFerias.Value;
  CurrencyEdit6.Value:=dmDados.tbFuncAbonoFerias.Value;
  CurrencyEdit7.Value:=dmDados.tbFuncFGTS.Value;
  CurrencyEdit8.Value:=dmDados.tbFuncMultaFGTS.Value;
  CurrencyEdit9.Value:=dmDados.tbFuncCusto.Value;
End;

procedure TFrmCustoFunc.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TFrmCustoFunc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFrmCustoFunc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    end;
end;

procedure TFrmCustoFunc.DBEdit1Exit(Sender: TObject);
begin
  AtuaValor;
end;

procedure TFrmCustoFunc.FormShow(Sender: TObject);
begin
  AtuaValor;
  dbedit1.SetFocus;
end;

procedure TFrmCustoFunc.DBEdit2Exit(Sender: TObject);
begin
  AtuaValor;
end;

procedure TFrmCustoFunc.DBEdit3Exit(Sender: TObject);
begin
  AtuaValor;
end;

procedure TFrmCustoFunc.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
