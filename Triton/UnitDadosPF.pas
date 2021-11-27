//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitDadosPF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, ToolEdit, RXDBCtrl, RXCtrls, jpeg,
  ExtCtrls, RackCtls;

type
  TFrmDadosPF = class(TForm)
    Panel1: TPanel;
    ScrewPanel1: TScrewPanel;
    Label1: TLabel;
    Image1: TImage;
    Panel2: TPanel;
    Image2: TImage;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDadosPF: TFrmDadosPF;

implementation

{$R *.dfm}

end.
