//////////////////////////////////////////////////////////////////////////
// Criacao...........: 05/2002
// Sistema...........: Ciclope - Controle de Funcionarios
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitAtSalario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, SpeedBar, jpeg, ExtCtrls, StdCtrls, RackCtls,
  fcButton, fcImgBtn, RXSplit, Mask, DBCtrls, RXCtrls, ToolEdit, CurrEdit,
  RXDBCtrl, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  LMDShapeHint, EFocCol;

type
  TFrmAtualSalario = class(TForm)
    Panel1: TPanel;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    Panel2: TPanel;
    RxLabel6: TRxLabel;
    Perc: TRxCalcEdit;
    RxLabel4: TRxLabel;
    Image2: TImage;
    Label2: TLabel;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    btnGravar: TSpeedItem;
    BtnSair: TSpeedItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAtualSalario: TFrmAtualSalario;


implementation

uses UnitDmDados, unitPrincipal;

{$R *.DFM}

procedure TFrmAtualSalario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FrmPrincipal.StatusTeclas(False,'');
dmDados.HabilitaTeclado:=True;
Action:= Cafree;
end;

procedure TFrmAtualSalario.BtnSairClick(Sender: TObject);
begin
Close;
end;

procedure TFrmAtualSalario.btnGravarClick(Sender: TObject);
begin
  dmDados.tbFunc.First;
  While Not dmDados.tbFunc.Eof Do
    Begin
    dmDados.tbFunc.Edit;
    dmDados.tbFuncSalario.Value:=dmDados.tbFuncSalario.Value*(1+(Perc.Value/100));
    dmDados.tbFunc.Next;
    End;
  Close;
end;

procedure TFrmAtualSalario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dmDados.HabilitaTeclado then
    Case (key) of
      VK_End : BtnGravar.Click;
      VK_ESCAPE : BtnSair.Click;
    end;
end;
procedure TFrmAtualSalario.FormShow(Sender: TObject);
begin
dmDados.vTabStt:=True;
FrmPrincipal.StatusTeclas(True,'[End] Gravar [Esc] Cancelar ou Sair');
end;

end.
