//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitCancelCP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, SpeedBar, jpeg, ExtCtrls, StdCtrls, RackCtls, RXSplit,db,
  Mask, DBCtrls, RXCtrls, ToolEdit, RXDBCtrl, fcButton, fcImgBtn, ComCtrls,
  dbtables,variants, RxLookup, RxGrdCpt, fcImager, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel,
  fcLabel, EMsgDlg, LMDCustomComponent, lmdcont, JvLookup, JvLabel,
  LMDCustomGroupBox, LMDCustomButtonGroup, LMDCustomRadioGroup,
  LMDRadioGroup, LMDControl, LMDBaseControl, LMDBaseGraphicControl,
  LMDBaseShape, LMDShapeControl, JvComponent, JvTransBtn;

type
  TFrmCancelCP = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    LMDBackPanel1: TLMDBackPanel;
    edcodigo: TEdit;
    ednome: TEdit;
    GridCPgto: TRxDBGrid;
    data: TDateEdit;
    Edit1: TEdit;
    edConta: TRxLookupEdit;
    edDoc: TEdit;
    Panel4: TLMDBackPanel;
    Label2: TLabel;
    Label1: TLabel;
    fcLabel2: TfcLabel;
    LMDShapeControl1: TLMDShapeControl;
    LMDBitmapList1: TLMDBitmapList;
    EvMsgDlg1: TEvMsgDlg;
    JvLabel2: TJvLabel;
    JvLabel1: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    btnBuscar: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    btnRestaurar: TJvTransparentButton;
    btnLocFor: TfcImageBtn;
    procedure BtnSairClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure edcodigoExit(Sender: TObject);
    procedure edDocExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnRestaurarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edContaExit(Sender: TObject);
    procedure btnLocForClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCancelCP: TFrmCancelCP;
  rest : boolean;

implementation

uses unitDmDados, unitLocFornec, UnitPrincipal;

{$R *.DFM}

procedure TFrmCancelCP.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCancelCP.btnBuscarClick(Sender: TObject);
var
  Campos:String;
  Vazio,Gravar:Boolean;
  s : string;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;

  If edcodigo.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
      Campos:=Campos+'C�digo do Cliente';
      Gravar:=False;
      Vazio:=True;
    end;

  If edDoc.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
      Campos:=Campos+'N� DOC';
      Gravar:=False;
      Vazio:=True;
    end;

If Gravar Then
    Begin
    s := trim(edDoc.text)+'*';{tira os espa�os em branco}
    dmdados.tbCpagar.Filtered:=False;
    dmdados.tbCpagar.Filter:='(NumDoc = '''+s+''' )and' +
                               '(codFor = '''+edcodigo.Text+''')';
    dmdados.tbCpagar.Filtered:=True;
    btnBuscar.Enabled:=false;
    if (dmDados.tbCPagar.RecordCount=0) then
       btnRestaurar.Enabled:=false
    else
       btnRestaurar.Enabled:=true;
    end
else
Begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      edcodigo.SetFocus;
    end;

end;

procedure TFrmCancelCP.edcodigoExit(Sender: TObject);
begin
if rest then
begin
   if edcodigo.Text='' then
       begin
       ShowMessage('Obrigat�rio o C�DIGO DO FORNECEDOR');
       edcodigo.SetFocus;
       end
   else
   BEGIN
    if dmdados.tbFornecedor.Locate('CodFor',StrToInt(edcodigo.text),[]) then
      begin
      ednome.Text:=dmdados.tbFornecedorNome.Value;
      edcodigo.text:=IntToStr(dmdados.tbFornecedorCodFor.Value);
      end
    else
      begin
      ShowMessage('Fornecedor n�o cadastrado');
      edcodigo.SetFocus;
      end;
   END;
end;
end;

procedure TFrmCancelCP.edDocExit(Sender: TObject);
begin
if rest then
begin
 if edDoc.Text='' then
    begin
    ShowMessage('Obrigat�rio o N�MERO do documento') ;
    edDoc.SetFocus;
    end
 else
    begin
    Panel4.SetFocus;
    btnBuscar.Enabled:=true;
    end;
end;
end;

procedure TFrmCancelCP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FrmPrincipal.StatusTeclas(False,'');
rest:=false;
dmdados.tbCpagar.Filtered:=false;
action:=cafree;
end;

procedure TFrmCancelCP.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;

end;

procedure TFrmCancelCP.FormShow(Sender: TObject);
begin
FrmPrincipal.StatusTeclas(True,'[F2] Localizar Cliente [F3] Localizar Doc [F4] Restaurar [Esc] Sair');
rest:=true;
edcodigo.SetFocus;
end;

procedure TFrmCancelCP.btnRestaurarClick(Sender: TObject);
var
  custo : string;
  ano,mes,dia : word;
  mesCusto,anoCusto:string;
  PosReg:array[1..20] of integer;
  c,c1 : integer;

begin
  dmdados.tbCpagar.First;
  c:=0;
  While not dmdados.tbCpagar.Eof do
    begin
    c:=c+1;
    PosReg[c]:=dmDados.tbCpagar.RecNo;
    dmdados.tbCpagar.Next;
    end;

  for c1:=1 to c do
       begin
       if dmdados.tbCpagarNumDoc.Value=edDoc.Text then
          begin
          dmdados.tbCpagar.RecNo:=PosReg[c1];
          dmdados.tbCpagar.Edit;
          dmdados.tbCpagarDataPaga.value:=data.Date;
          dmdados.tbCpagarValorPago.Value:=0;
          dmdados.tbCpagarPago.Value:='ABERTO';
          dmdados.tbCpagar.Post;
          {inserir inf de estorno no movimento de conta}
          dmdados.TbMovConta.Append;
          dmdados.TbMovContaDosNumero.Value:=dmdados.tbCPagarNumDoc.Value;
          dmdados.TbMovContaConta.Value:=edit1.Text;
          dmdados.TbMovContaDataMov.Value:=date;
          dmdados.tbMovContaDataReg.value:=date;
          dmdados.TbMovContaHoraReg.Value:=time;
          dmdados.TbMovContaTipoOper.Value:='E';
          dmdados.TbMovContaCodHist.Value:=dmdados.tbCpagarCodHist.Value;
          dmdados.TbMovContaCodDoc.Value:=dmdados.tbCpagarCodDoc.Value;
          dmdados.TbMovContaComplHist.Value:='Estorno do Documento N�'+' '+edDoc.Text;
          dmdados.TbMovContaValor.Value:=dmdados.tbCpagarValor.Value;
          dmdados.TbMovConta.Post;
          {atualizar conta corrente}
          if dmdados.TbCCorrente.Locate('Conta',edConta.Text,[]) then
            begin
            dmdados.TbCCorrente.Edit;
            dmdados.TbCCorrenteSaldo.Value:=
            dmdados.TbCCorrenteSaldo.Value+dmdados.tbCpagarValor.Value;
            dmdados.tbccorrenteUltMov.value:=date;
            dmdados.TbCCorrente.post;
            end;
          {atualizar centro de custo}
          decodedate(now,ano,mes,dia);
          mesCusto:=IntToStr(mes);
          anoCusto:=IntTostr(ano);
          custo:=dmdados.tbCpagarCodCCusto.Value;
          if dmdados.TbBalCusto.Locate('CodCcusto;Mes;Ano',VarArrayOf([Custo,mesCusto,anoCusto]),[]) then
            begin
            dmdados.tbBalcusto.edit;
            dmdados.tbBalCustoDespesas.value:=
            dmdados.tbBalCustoDespesas.value-dmdados.tbCpagarValor.Value;
            dmdados.tbBalCustoReceitas.Value:=0;
            dmdados.tbBalCusto.Post;
            end;
          end
          else {se o doc n~ = ao edDoc}
            begin
            dmdados.tbCpagar.Delete;
            dmdados.tbCpagar.Next;
            end;
       end;
ShowMessage('Baixa restaurada com sucesso');
btnRestaurar.Enabled:=false;
end;

procedure TFrmCancelCP.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : if dmDados.vTabStt then BtnSair.Click;
      VK_F2     : btnLocFor.Click;
      VK_F3     : btnBuscar.Click;
      VK_F4     : btnRestaurar.Click;
end;
    end;

procedure TFrmCancelCP.edContaExit(Sender: TObject);
begin
if edconta.Text='' then
   begin
   ShowMessage('Obrigat�rio informar a CONTA');
   edconta.SetFocus;
   end
else
   begin
   If Not(dmDados.TbCcorrente.Locate('Descricao',edconta.Text,[])) Then
        Begin
        Showmessage('CONTA n�o Cadastrada');
        edconta.Clear;
        edconta.setfocus;
        End
   else
       begin
       if dmdados.tbCcorrente.Locate('Descricao',edconta.Text,[]) then
       edit1.Text:=dmdados.tbCcorrenteConta.Value;
       Panel4.SetFocus;
       end;
end;
end;

procedure TFrmCancelCP.btnLocForClick(Sender: TObject);
begin
  frmLocFornec:=tfrmLocFornec.create(application);
  frmLocFornec.showModal;
  edcodigo.Text:=IntToStr(frmLocFornec.resultado);
  ednome.Text:=frmLocFornec.Nome;
  frmLocFornec.Free;
end;

end.
