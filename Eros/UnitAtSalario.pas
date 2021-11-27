//////////////////////////////////////////////////////////////////////////
// Criação...........: 02/2001
// Ultima modificação: 08/2004
// Módulo............: Atualização Salarial
// Sistema...........: Eros - Controle de Vendas
// Integração........: Olimpo - Automação Comercial
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
  LMDShapeHint, EFocCol, RxGrdCpt, fcImager, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmAtualSalario = class(TForm)
    Image1: TImage;
    RxLabel2: TRxLabel;
    RxLabel6: TRxLabel;
    Perc: TRxCalcEdit;
    btnGravar: TfcImageBtn;
    btnSair: TfcImageBtn;
    LMDBackPanel2: TPanel;
    Panel3: TPanel;
    LMDBackPanel1: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure PercExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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
  dmdados.tbFunc.Close;
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
  dmdados.tbFunc.Open;
  FrmPrincipal.StatusTeclas(True,'[End] Gravar [Esc] Cancelar ou Sair');
end;

procedure TFrmAtualSalario.btnDeletarClick(Sender: TObject);
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

procedure TFrmAtualSalario.PercExit(Sender: TObject);
begin
  Panel3.SetFocus;
end;

procedure TFrmAtualSalario.FormActivate(Sender: TObject);
begin
  dmdados.tbFunc.Open
end;

end.
