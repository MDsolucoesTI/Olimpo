//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitLocImov;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TFlatHintUnit, jpeg, Grids, DBGrids, RXDBCtrl, StdCtrls,
  ExtCtrls, RackCtls, fcButton, fcImgBtn, RXCtrls, LMDCustomComponent,
  LMDCustomHint, LMDCustomShapeHint, LMDShapeHint;

type
  TFrmLocImov = class(TForm)
    Panel1: TPanel;
    RxLabel3: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel7: TRxLabel;
    LEDButton1: TLEDButton;
    LEDButton2: TLEDButton;
    fclSair: TfcImageBtn;
    EdtValor: TEdit;
    EdtCampo: TEdit;
    fclLocImov: TfcImageBtn;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    cmbCampo: TComboBox;
    dbGridImov: TRxDBGrid;
    Panel2: TPanel;
    Image2: TImage;
    Label2: TLabel;
    LMDShapeHint1: TLMDShapeHint;
    RxLabel15: TRxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fclSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cmbCampoEnter(Sender: TObject);
    procedure cmbCampoExit(Sender: TObject);
    procedure EdtValorEnter(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure fclLocImovClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLocImov: TFrmLocImov;

implementation

{$R *.dfm}

procedure TFrmLocImov.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= Cafree;
end;

procedure TFrmLocImov.fclSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLocImov.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmLocImov.cmbCampoEnter(Sender: TObject);
begin
(Sender as TComboBox).color:=$00d2e2ff;
end;

procedure TFrmLocImov.cmbCampoExit(Sender: TObject);
begin
(Sender as TComboBox).color:=clwindow;
end;

procedure TFrmLocImov.EdtValorEnter(Sender: TObject);
begin
(Sender as TEdit).color:=$00d2e2ff;
end;

procedure TFrmLocImov.EdtValorExit(Sender: TObject);
begin
(Sender as TEdit).color:=clwindow;
end;

procedure TFrmLocImov.fclLocImovClick(Sender: TObject);
begin
FrmLocImov:=TFrmLocImov.create(application);
FrmLocImov.Showmodal;
end;

end.
