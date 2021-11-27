//////////////////////////////////////////////////////////////////////////
// Criacao...........: 05/2002
// Sistema...........: Metallum - Controle de Serviços
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitLocalOs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ROClass, ROFormA, fcButton, fcImgBtn, StdCtrls, Grids, DBGrids, RackCtls,
  SRLabel, DB;

type
  TfrmLocalOs = class(TForm)
    labelEnd: TSRLabel;
    SRLabel1: TSRLabel;
    SRLabel2: TSRLabel;
    SRLabel3: TSRLabel;
    LEDButton1: TLEDButton;
    LEDButton2: TLEDButton;
    DBGridLocalizar: TDBGrid;
    edtValor: TEdit;
    cmbCampo: TComboBox;
    BtnPesquisar: TfcImageBtn;
    BtnSair: TfcImageBtn;
    edtCampo: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
    fResultado:LongInt;
  public
    { Public declarations }
    Property Resultado:LongInt Read fResultado Write fResultado;
  end;

var
  frmLocalOs: TfrmLocalOs;

implementation

uses unitDmdados, UnitAgenda;

{$R *.DFM}

procedure TfrmLocalOs.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TfrmLocalOs.BtnPesquisarClick(Sender: TObject);
 Var
  LocOpts : TLocateOptions;
begin
  LocOpts := [ ];
  If cmbCampo.Text='C�digo' Then
    edtCampo.Text:='Codigo';
  If cmbCampo.Text='N�mero' Then
    edtCampo.Text:='Numero';
  If cmbCampo.Text='C�digo Equipamento' Then
    edtCampo.Text:='CodEquip';
  If cmbCampo.Text='T�cnico Respons�vel' Then
    edtCampo.Text:='TecResp';
  If LedButton2.stateon Then
    LocOpts := LocOpts + [loCaseInsensitive];
  If LedButton1.stateon Then
  LocOpts := LocOpts + [loPartialKey];
  If not dmdados.tbOs.locate (edtCampo.text, edtValor.text,LocOpts) Then
    ShowMessage ('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '
                  + cmbCampo.text);
end;

procedure TfrmLocalOs.BtnSairClick(Sender: TObject);
begin
  Resultado:=dmDados.tbOsCodigo.Value;
  Close;
end;

end.
