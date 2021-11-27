//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitEntrega;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, RXDBCtrl, ExtCtrls, SpeedBar, jpeg,
  RXSplit, fcButton, fcImgBtn, RXCtrls;

type
  TFrmEntrega = class(TForm)
    Panel1: TPanel;
    RxLabel3: TRxLabel;
    Label1: TLabel;
    fclGravar: TfcImageBtn;
    RxSplitter1: TRxSplitter;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnGravar: TSpeedItem;
    BtnCancelar: TSpeedItem;
    Image1: TImage;
    Label2: TLabel;
    dbfimEmpre: TDBDateEdit;
    RxLabel10: TRxLabel;
    BtnSair: TSpeedItem;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEntrega: TFrmEntrega;
  NovoItem:Boolean;

implementation

uses UnitDMDados, DB;

{$R *.dfm}

procedure TFrmEntrega.BtnCancelarClick(Sender: TObject);
begin
   DMDados.TbEmprestimo.Cancel;
   BtnGravar.Enabled:=false;
  {desabilitando os componentes}
   dbfimEmpre.clear;
   BtnGravar.Enabled:=true;
   dbfimEmpre.SetFocus;
end;

procedure TFrmEntrega.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmEntrega.BtnGravarClick(Sender: TObject);
 Begin
    dmdados.TbEmprestimoFechado.Value:='S';
    DMDados.TbEmprestimo.Post;
    dmdados.TbPatrimonio.Locate('NumPatri',dmdados.TbEmprestimoNumPatri.Value,[]);
    dmdados.TbPatrimonio.Edit;
    dmdados.TbPatrimonioQuantUso.Value:=dmdados.TbPatrimonioQuantUso.Value - dmdados.TbEmprestimoQuantidade.Value;
    if dmdados.TbPatrimonioQuantUso.Value = 0 then
      DMDados.TbPatrimonioEmprestado.Value:='N';
    DMDados.TbPatrimonio.Post;
    NovoItem:=False;
    dmdados.Vtabstt:=true;
    BtnGravar.Enabled:=False;
    BtnCancelar.Enabled:=False;
    {desabilitando os componentes}
    dbfimEmpre.Enabled :=false;
    ShowMessage ('Dados gravados com sucesso!');
    SpeedBar1.SetFocus;
end;
end.
