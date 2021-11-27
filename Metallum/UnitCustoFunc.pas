//////////////////////////////////////////////////////////////////////////
// Criacao...........: 05/2002
// Sistema...........: Metallum - Controle de Serviços
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCustoFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SpeedBar, jpeg, ToolEdit, RXDBCtrl, CurrEdit, fcButton, fcImgBtn,
  StdCtrls, Mask, DBCtrls, ExtCtrls, RackCtls, RXSplit, RXCtrls;

type
  TFrmCustoFunc = class(TForm)
    Panel1: TPanel;
    RxLabel5: TRxLabel;
    RxLabel7: TRxLabel;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    Panel2: TPanel;
    RxLabel8: TRxLabel;
    RxLabel9: TRxLabel;
    RxLabel10: TRxLabel;
    RxLabel11: TRxLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit6: TCurrencyEdit;
    CurrencyEdit7: TCurrencyEdit;
    CurrencyEdit8: TCurrencyEdit;
    CurrencyEdit9: TCurrencyEdit;
    RxSplitter2: TRxSplitter;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    RxLabel4: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel1: TRxLabel;
    Image2: TImage;
    Label2: TLabel;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbCodFuncEnter(Sender: TObject);
    procedure dbCodFuncExit(Sender: TObject);
    procedure dbNomeEnter(Sender: TObject);
    procedure dbNomeExit(Sender: TObject);
    procedure RxDBsalEnter(Sender: TObject);
    procedure RxDBsalExit(Sender: TObject);
    Procedure AtuaValor;
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
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

procedure TFrmCustoFunc.BtnLocalizarClick(Sender: TObject);
begin
FrmLocFunc:=TFrmLocFunc.Create(Application);
FrmlocFunc.Showmodal;
end;

procedure TFrmCustoFunc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFrmCustoFunc.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
  Begin
  Key:=#0;
  Perform(wm_nextdlgctl,0,0);
  End;
end;

procedure TFrmCustoFunc.dbCodFuncEnter(Sender: TObject);
begin
(Sender as TDBedit).color:=$00d2e2ff;
end;

procedure TFrmCustoFunc.dbCodFuncExit(Sender: TObject);
begin
(Sender as TDBedit).color:=clwindow;
end;

procedure TFrmCustoFunc.dbNomeEnter(Sender: TObject);
begin
(Sender as TDBedit).color:=$00d2e2ff;
end;

procedure TFrmCustoFunc.dbNomeExit(Sender: TObject);
begin
(Sender as TDBedit).color:=clwindow;
end;

procedure TFrmCustoFunc.RxDBsalEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmCustoFunc.RxDBsalExit(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=clwindow;
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
  Close;
end;

end.
