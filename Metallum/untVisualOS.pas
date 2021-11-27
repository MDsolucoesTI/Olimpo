//////////////////////////////////////////////////////////////////////////
// Criacao...........: 05/2002
// Sistema...........: Metallum - Controle de Serviços
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untVisualOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcButton, fcImgBtn, ToolEdit, RXDBCtrl, Mask,
  CurrEdit, StdCtrls, DBCtrls, ExtCtrls, SRLabel, RXCtrls, RxGIF, RackCtls,
  jpeg, SpeedBar;

type
  TfrmVisualOS = class(TForm)
    DBText2: TDBText;
    DBText1: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    dbCodRespEx: TDBText;
    DBText6: TDBText;
    b: TBevel;
    DBMemo1: TDBMemo;
    dbDefEnc: TDBMemo;
    dbOBS: TDBMemo;
    DBMemo2: TDBMemo;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel8: TRxLabel;
    RxLabel9: TRxLabel;
    RxLabel10: TRxLabel;
    RxLabel11: TRxLabel;
    Image2: TImage;
    Label1: TLabel;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    RxLabel12: TRxLabel;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnSair: TSpeedItem;
    btAnterior: TSpeedItem;
    btPrimeiro: TSpeedItem;
    btUltimo: TSpeedItem;
    btProximo: TSpeedItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btPrimeiroClick(Sender: TObject);
    procedure btAnteriorClick(Sender: TObject);
    procedure btProximoClick(Sender: TObject);
    procedure btUltimoClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisualOS: TfrmVisualOS;

implementation

uses unitDmdados;

{$R *.DFM}

procedure TfrmVisualOS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmVisualOS.btPrimeiroClick(Sender: TObject);
begin
dmdados.tbOSVisual.First;
  BtPrimeiro.Enabled:=False;
  BtAnterior.Enabled:=False;
  BtProximo.Enabled:=True;
  BtUltimo.Enabled:=True;
end;

procedure TfrmVisualOS.btAnteriorClick(Sender: TObject);
begin
 dmDados.tbOSVisual.Prior;
  btProximo.Enabled:=True;
  btUltimo.Enabled:=True;
  If dmdados.TbOSVisual.Bof Then
    Begin
    btPrimeiro.Enabled:=False;
    btAnterior.Enabled:=False;
    End;
end;

procedure TfrmVisualOS.btProximoClick(Sender: TObject);
begin
 dmDados.tbOSVisual.Next;
  btPrimeiro.Enabled:=True;
  btAnterior.Enabled:=True;
  If dmdados.tbOSVisual.Eof Then
    Begin
    btProximo.Enabled:=False;
    btUltimo.Enabled:=False;
    End;
end;

procedure TfrmVisualOS.btUltimoClick(Sender: TObject);
begin
  dmDados.tbOSVisual.Last;
  btPrimeiro.Enabled:=True;
  btAnterior.Enabled:=True;
  btProximo.Enabled:=False;
  btUltimo.Enabled:=False;
end;

procedure TfrmVisualOS.BtnSairClick(Sender: TObject);
begin
close;
end;

end.
