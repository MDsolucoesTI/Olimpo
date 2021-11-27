//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitDefContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, ExtCtrls, RXCtrls, jpeg, fcImager, RxGrdCpt,
  StdCtrls, Mask, ToolEdit, CurrEdit, RXDBCtrl, DBCtrls;

type
  TFrmDescParc = class(TForm)
    Panel3: TPanel;
    fcImager1: TfcImager;
    RxLabel4: TRxLabel;
    Image1: TImage;
    Panel4: TPanel;
    fcImager3: TfcImager;
    btnConfirmar: TfcImageBtn;
    btnSair: TfcImageBtn;
    Panel1: TPanel;
    fcImager2: TfcImager;
    RxGradientCaption2: TRxGradientCaption;
    RxLabel7: TRxLabel;
    Bevel1: TBevel;
    PanelParcial: TPanel;
    rdbPgParc: TRadioButton;
    RxLabel10: TRxLabel;
    RxLabel9: TRxLabel;
    rdbDesc: TRadioButton;
    procedure btnSairClick(Sender: TObject);
    procedure rdbPgParcClick(Sender: TObject);
    procedure rdbDescClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDescParc: TFrmDescParc;

implementation

uses UnitBaixaLoteCR, UnitTipoReceb;

{$R *.dfm}

procedure TFrmDescParc.btnSairClick(Sender: TObject);
begin
  FrmBaixaLoteCR.ForPag:='N';
  Close;
end;

procedure TFrmDescParc.rdbPgParcClick(Sender: TObject);
begin
  FrmBaixaLoteCR.ForPag:='P';
end;

procedure TFrmDescParc.rdbDescClick(Sender: TObject);
begin
  FrmBaixaLoteCR.ForPag:='D';
end;

procedure TFrmDescParc.btnConfirmarClick(Sender: TObject);
begin
  FrmTipoReceb:=TFrmTipoReceb.create(application);
  FrmTipoReceb.edtVlTotal.Value:=FrmBaixaLoteCR.dbVlPg.Value;
  FrmTipoReceb.vlConvenio.Value:=FrmBaixaLoteCR.dbVlPg.Value;
  FrmTipoReceb.edtValor.Value:=FrmBaixaLoteCR.dbVlPg.Value;
  FrmTipoReceb.edtVlReceb.Value:=FrmBaixaLoteCR.dbVlPg.Value;
  FrmTipoReceb.ShowModal;
  if FrmTipoReceb.PagoStt='N' then
    FrmBaixaLoteCR.ForPag:='N';
  Close;
end;

procedure TFrmDescParc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
