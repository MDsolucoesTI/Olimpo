//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitOutRenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolEdit, CurrEdit, RXDBCtrl, jpeg, StdCtrls, Mask, DBCtrls,
  ExtCtrls, RackCtls, RXCtrls;

type
  TFrmOutRenda = class(TForm)
    Panel1: TPanel;
    RxLabel22: TRxLabel;
    RxLabel30: TRxLabel;
    ScrewPanel1: TScrewPanel;
    Label1: TLabel;
    Image1: TImage;
    DBEdit4: TDBEdit;
    Panel2: TPanel;
    Image2: TImage;
    Label2: TLabel;
    dbSalConj: TRxDBCalcEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOutRenda: TFrmOutRenda;

implementation

{$R *.dfm}

end.
