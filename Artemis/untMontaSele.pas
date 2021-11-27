//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untMontaSele;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, RXSplit, fcButton, fcImgBtn, RXCtrls,
  SpeedBar, jpeg, DBCtrls, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint, DCChoice, RxGrdCpt, fcImager, EMsgDlg,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDGraphicControl, LMDBaseMeter,
  LMDCustomProgressFill, LMDProgressFill, RxGIF, Variants, ELibFnc;

type
  TfrmMontaSele = class(TForm)
    RxGradientCaption1: TRxGradientCaption;
    MsgDlg: TEvMsgDlg;
    LMDBackPanel2: TLMDBackPanel;
    fcImager4: TfcImager;
    RxLabel2: TRxLabel;
    Image1: TImage;
    LMDBackPanel1: TLMDBackPanel;
    fcImager1: TfcImager;
    RxLabel4: TRxLabel;
    Panel3: TLMDBackPanel;
    fcImager2: TfcImager;
    Progressao: TLMDProgressFill;
    EvLibFunctions1: TEvLibFunctions;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMontaSele: TfrmMontaSele;

implementation

uses unitDmDados, UnitPrincipal, unitSelecCR;


{$R *.DFM}

procedure TfrmMontaSele.FormActivate(Sender: TObject);
var
  i,c,c1,r,r1 : Integer;
  Val,Qt,Spc : string;
  Tam : integer;
  Flag : boolean;
begin
  c:=100 div frmSelecCR.dbgridBaixa.SelectedRows.Count;
  r:=100 mod frmSelecCR.dbgridBaixa.SelectedRows.Count;
  c1:=c div 3;
  r1:=c mod 3;
  with dmDados do
    begin
    //Abrir tabelas secund�rias
    tbVendas.Open;
    tbVisDetVen.Open;
    tbEstoque.Open;
    tbFunc.Open;
    //Utiliza o grid como controle dos dados
    for i:=0 to frmSelecCR.dbgridBaixa.SelectedRows.Count-1 do
      begin
      tbCReceber.GotoBookmark(pointer(frmSelecCR.dbgridBaixa.SelectedRows.Items[i]));
      tbCRecSele.Append;
      //inclus�o dos dados b�sicos
      tbCRecSeleCodRec.Value:=tbCReceberCodCRec.Value;
      tbCRecSeleNumDoc.Value:=tbCReceberNumDoc.Value;
      tbCRecSeleCliente.Value:=tbCReceberlkCliente.Value;
      tbCRecSeleDataVenc.Value:=tbCReceberDataVenc.Value;
      tbCRecSeleValor.Value:=tbCReceberValor.Value;
      tbCRecSeleMultaDia.Value:=tbCReceberMultaDia.Value;
      tbCRecSeleValorMulta.Value:=tbCReceberValorMulta.Value;
      tbCRecSelePercMulta.Value:=tbCReceberPercMulta.Value;
      tbCRecSeleDescDia.Value:=tbCReceberDescDia.Value;
      tbCRecSeleValorDesc.Value:=tbCReceberValorDesc.Value;
      tbCRecSelePercDesc.Value:=tbCReceberPercDesc.Value;
      tbCRecSeleJurosDia.Value:=tbCReceberJurosDia.Value;
      tbCRecSeleValorJuros.Value:=tbCReceberValorJuros.Value;
      tbCRecSelePercJuros.Value:=tbCReceberPercJuros.Value;
      //mover a 1� parte da barra
      Progressao.UserValue:=Progressao.UserValue+c1;
      //Localizar dados de Vendas
      Flag:=tbVendas.Locate('DataVen;CodVen',VarArrayOf([tbCReceberDataVen.Value,tbCReceberCodVen.Value]),[]);
      if Flag then
        begin
        tbCRecSeleDetalhe.Value:='Vendas do dia : '+DateToStr(tbVendasDataven.Value)+#13;
        tbCRecSeleDetalhe.Value:=tbCRecSeleDetalhe.Value+'Vendedor : '+tbVendaslknomefunc.Value+#13+#13;
        tbCRecSeleDetalhe.Value:=tbCRecSeleDetalhe.Value+'Valor Produto   Qtd.   Produto';
        tbVisDetVen.First;
        while not (tbVisDetVen.Eof) do
          begin
          Val:=FloatToStrF(tbVisDetVenPrecoUnit.Value,ffNumber,10,2);
          Tam:=length(Val);
          if Tam <= 4 then
            Spc:=StrSpace(13-Tam)
          else
            if Tam <=6 then
              Spc:=StrSpace(9-(Tam-4+1))
            else
              Spc:=StrSpace(9-((Tam-6)*2));
          tbCRecSeleDetalhe.Value:=tbCRecSeleDetalhe.Value+Spc+Val;
          Qt:=FloatToStr(tbVisDetVenQuant.Value);
          Tam:=length(Qt);
          Spc:=StrSpace(4-Tam);
          tbCRecSeleDetalhe.Value:=tbCRecSeleDetalhe.Value+Spc+Qt;
          tbCRecSeleDetalhe.Value:=tbCRecSeleDetalhe.Value+tbVisDetVenLKnome.Value+#13;
          tbVisDetVen.Next;
          end;
        end;
      //mover a 2� parte da barra
      Progressao.UserValue:=Progressao.UserValue+c1;
      if Not Flag then
        begin
        tbCRecSeleDetalhe.Value:='Documento : '+tbCReceberLkTipoDoc.Value+#13;
        tbCRecSeleDetalhe.Value:=tbCRecSeleDetalhe.Value+'N� Documento : '+tbCReceberNumDoc.Value+#13;
        tbCRecSeleDetalhe.Value:=tbCRecSeleDetalhe.Value+'Cliente : '+tbCReceberlkCliente.Value+#13;
        end;
      //mover a 3� parte da barra
      Progressao.UserValue:=Progressao.UserValue+c1;
      //Ajuste da barra de progress�o - partes
      Progressao.UserValue:=Progressao.UserValue+r1;
      tbCRecSele.Post;
      //Ajuste da barra de progress�o - passo
      Progressao.UserValue:=Progressao.UserValue+r;
      end;
    end;
  FrmSelecCR.SetFocus;
end;

end.
