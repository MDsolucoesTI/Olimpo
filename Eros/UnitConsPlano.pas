//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 02/2001
// Ultima modifica��o: 08/2004
// M�dulo............: Consulta de Planos de Pagamento
// Sistema...........: Eros - Controle de Vendas
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitConsPlano;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxGrdCpt, fcButton, fcImgBtn, ExtCtrls, RXCtrls, Grids,
  BaseGrid, AdvGrid, fcImager, StdCtrls, Mask, DBCtrls, EMsgDlg, jpeg,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel;

type
  TFrmConsPlano = class(TForm)
    MsgDlg: TEvMsgDlg;
    RxLabel2: TRxLabel;
    Image2: TImage;
    RxLabel6: TRxLabel;
    dbVu: TDBEdit;
    RxLabel1: TRxLabel;
    dbDesc: TDBEdit;
    RxLabel8: TRxLabel;
    dbTotVen: TDBEdit;
    PlanoGrid: TAdvStringGrid;
    btnOk: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    LMDBackPanel2: TPanel;
    LMDBackPanel3: TPanel;
    LMDBackPanel1: TPanel;
    procedure btnCancelarClick(Sender: TObject);
    procedure dbDescExit(Sender: TObject);
    function GeraData(iData:TdateTime;iDias:integer):TDateTime;
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    fPagStt : char;
  public
    { Public declarations }
    Property PagStt:char Read fPagStt Write fPagStt;
  end;

var
  FrmConsPlano: TFrmConsPlano;

implementation

uses unitDmDados;

{$R *.dfm}

function TfrmConsPlano.GeraData(iData:TdateTime;iDias:integer):TDateTime;
var
  vVenc,vDia,vMes,vAno:Word;
  iDia,iMes,iAno:string;
  x:integer;
begin
  decodedate(iData,vAno,vMes,vDia);
  vVenc:=vDia;
  if iDias >= 30 then
    begin
    For x:=1 to (iDias div 30) do
      begin
      vMes:=vMes+1;
      if vMes=13 Then
        Begin
        vAno:=vAno+1;
        vMes:=1;
        End;
      End;
    if ((vDia<=31)and(vDia>=29))and(vMes=2) then
      begin
      if (vAno mod 4)=0 then
        vDia:=29
      else
        vDia:=28;
      end;
    if (vDia=31)and((vMes=4)or(vMes=6)or(vMes=9)or(vMes=11)) then
      vDia:=30;
    if vDia < vVenc then
      if vMes <> 2 Then
        if (vMes=4)or(vMes=6)or(vMes=9)or(vMes=11) then
          if vVenc=31 Then
            vDia:=30
          else
            vDia:=vVenc
        else
          vDia:=vVenc;
    iDia:=IntToStr(vDia);
    iMes:=IntToStr(vMes);
    iAno:=IntToStr(vAno);
    GeraData:=StrToDate(iDia+'/'+iMes+'/'+iAno);
    end
  else
    GeraData:=iData+iDias;
end;

procedure TFrmConsPlano.btnCancelarClick(Sender: TObject);
begin
  PagStt:='N';
  Close;
end;

procedure TFrmConsPlano.dbDescExit(Sender: TObject);
var
  NPresta,Linha,NMeses,NDias : integer;
  VlPresta : Real;
begin
  //Verifica limite do vendedor para desconto
  dmDados.tbFunc.Locate('CodFunc',dmDados.tbVendasCodFunc.Value,[]);
  if dmDados.tbFuncLimDesc.Value < StrToFloat(dbDesc.Text) then
    begin
    MsgDlg.MsgWarning('Voc� ultrapassou o limite de|desconto PERMITIDO!!!|Corrija o valor fornecido.....');
    dbDesc.SetFocus;
    Exit;
    end;
  //Gera Linhas do Grid
  if PlanoGrid.RowCount <= 2 then
    begin
    dmDados.tbPlanos.First;
    while not dmDados.tbPlanos.Eof do
      begin
      PlanoGrid.AddRow;
      dmDados.tbPlanos.Next;
      end;
    end;
  //Preenche os dados do Grid
  Linha:=1;
  dmDados.tbPlanos.First;
  while not dmDados.tbPlanos.Eof do
    begin
    PlanoGrid.Cells[0,Linha]:=IntToStr(dmDados.tbPlanosNumPresta.Value);
    //Calcula os valores a pagar
    NPresta:=dmDados.tbPlanosNumPresta.Value;
    if dmDados.tbPlanosEntrada.Value='S' then
      NPresta:=NPresta+1;
    //Verificando o n�mero de meses para calcular juros
    NDias:=dmDados.tbPlanosPrimeira.Value+(dmDados.tbPlanosIntervalo.Value*(dmDados.tbPlanosNumPresta.Value-1));
    NMeses:=NDias div 30;
    If (NDias Mod 30) >= 15 then NMeses:=NMeses+1; 
    VlPresta:=(StrToFloat(dbTotVen.Text)*(1+((dmDados.tbPlanosJuros.Value*NMeses)/100)))/NPresta;
    //Verifica se tem entrada
    if dmDados.tbPlanosEntrada.Value='S' then
      begin
      PlanoGrid.Cells[1,Linha]:=FloatToStrF(VlPresta,ffFixed,10,2);
      PlanoGrid.Cells[2,Linha]:=DateToStr(GeraData(dmDados.tbVendasDataven.Value,dmDados.tbPlanosDtEntrada.Value));
      end;
    PlanoGrid.Cells[3,Linha]:=FloatToStrF(VlPresta,ffFixed,10,2);
    PlanoGrid.Cells[4,Linha]:=DateToStr(GeraData(dmDados.tbVendasDataven.Value,dmDados.tbPlanosPrimeira.Value));
    PlanoGrid.Cells[5,Linha]:=IntToStr(dmDados.tbPlanosIntervalo.Value);
    PLanoGrid.Cells[6,Linha]:=IntToStr(dmDados.tbPlanosCodPlano.Value);
    dmDados.tbPlanos.Next;
    Linha:=Linha+1;
    end;
end;

procedure TFrmConsPlano.btnOkClick(Sender: TObject);
begin
  dmDados.tbVendasCodForPag.Value:=PlanoGrid.Cells[6,PlanoGrid.Row];
  dmDados.tbVendasEntrega.Value:=dmdados.tbVendasDataven.Value+1;
  dmDados.tbVendasCaixa.Value:='N';
  dmdados.tbVendas.Post;
  PagStt:='S';
  Close;
end;

procedure TFrmConsPlano.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=caFree;
end;

end.
