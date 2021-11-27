//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitFechCC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, StdCtrls, Mask, ToolEdit, RxLookup,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDShapeHint,
  jpeg, ExtCtrls, RackCtls, RXCtrls, SpeedBar, RxGrdCpt, fcImager;

type
  TFrmFechCC = class(TForm)
    Panel2: TPanel;
    RxLabel5: TRxLabel;
    Image1: TImage;
    Panel3: TPanel;
    RxLabel3: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    cmblkCC: TRxLookupEdit;
    edtDtIni: TDateEdit;
    edtDtFim: TDateEdit;
    Edit1: TEdit;
    Panel4: TPanel;
    btnConfirmar: TfcImageBtn;
    btnSair: TfcImageBtn;
    RxGradientCaption2: TRxGradientCaption;
    procedure cmblkCCExit(Sender: TObject);
    procedure edtDtIniExit(Sender: TObject);
    procedure edtDtFimExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFechCC: TFrmFechCC;
  NovoItem : boolean;
implementation

uses unitDmDados, UnitPrincipal;

{$R *.dfm}

procedure TFrmFechCC.cmblkCCExit(Sender: TObject);
begin
if dmdados.TbCCorrente.Locate('Descricao',cmblkCC.Text,[]) then
   edit1.Text:=dmdados.TbCCorrenteConta.Value;
end;

procedure TFrmFechCC.edtDtIniExit(Sender: TObject);
begin
If NovoItem Then
   Begin
     If edtDtIni.Text= '  /  /    ' then
       Begin
       ShowMessage('� obrigat�rio a DATA INICIAL');
       edtDtIni.SetFocus;
       End
     else
       try StrToDate(edtDtIni.Text)
       except on EconvertError do
         begin
         ShowMessage('Data Inicial Inv�lida');
         edtDtIni.SetFocus;
         end;
       end;
   end;
end;

procedure TFrmFechCC.edtDtFimExit(Sender: TObject);
begin
If NovoItem Then
   Begin
     If edtDtFim.Text= '  /  /    ' then
       Begin
       ShowMessage('� obrigat�rio a DATA FINAL');
       edtDtFim.SetFocus;
       End
     else
       try StrToDate(edtDtFim.Text)
       except on EconvertError do
         begin
         ShowMessage('Data Final Inv�lida');
         edtDtFim.SetFocus;
         end;
       end;
   end;
end;

procedure TFrmFechCC.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmFechCC.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[F2] Confirmar [Esc] Sair');
  NovoItem:=True;
end;

procedure TFrmFechCC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.statusteclas(False,'');
  Action:=caFree;
end;

procedure TFrmFechCC.btnConfirmarClick(Sender: TObject);
var
  SaldoMov : Real;
  campos:string;
  flag:boolean;
begin
  campos:=''; //teste campos vazios
  flag:=true;   //teste data inv�lida
  if cmblkCC.Text='' then
    begin
    if length(campos)>0 then
      campos:=campos+', ';
    campos:=campos+'CC';
    end;
  If edtDtIni.Text= '  /  /    ' then
    begin
    if length(campos)>0 then
      campos:=campos+', ';
    campos:=campos+'DATA INICIAL';  
    end
  else
    try StrToDate(edtDtIni.Text)  //teste data preenchida
       except on EconvertError do
         begin
         ShowMessage('Data Inicial Inv�lida');
         edtDtIni.SetFocus;
         flag:=false;
         end;
       end;
  if edtDtFim.Text= '  /  /    ' then
    begin
    if length(campos)>0 then
      campos:=campos+', ';
    campos:=campos+'DATA FINAL';
    end
  else
    try StrToDate(edtDtFim.Text)
       except on EconvertError do
         begin
         ShowMessage('Data Final Inv�lida');
         edtDtFim.SetFocus;
         flag:=false;
         end;
       end;
 if flag then                //se as datas s�o v�lidas
  if (length(campos)= 0) then  //se todos campos foram preenchidos...
  begin
   with dmDados do
    begin
    TbCCorrente.Locate('Conta',cmblkCC.Text,[]);
    TbMovConta.Filtered:=False;
    TbMovConta.Filter:='(DataMov >='''+edtDtIni.text+''') and'+
                       '(DataMov <='''+edtDtFim.text+''') and' +
                       '(Conta = '''+edit1.Text+''')';
    TbMovConta.Filtered:=True;
    TbMovConta.Locate('CodHist',2,[]);
    SaldoMov:=TbMovContaValor.Value;
    TbMovConta.First;
    while Not TbMovConta.Eof do
      begin
      if (TbMovContaCodHist.Value<>'1')and(TbMovContaCodHist.Value<>'2') then
        if TbMovContaTipoOper.Value='E' then
          SaldoMov:=SaldoMov+TbMovContaValor.Value
        else
          SaldoMov:=SaldoMov-TbMovContaValor.Value;
      TbMovConta.Next;
      end;
    TbMovConta.Filtered:=False;
    //Lan�a a transfer�ncia de saldo para o dia seguinte
    TbMovConta.Append;
    TbMovContaTipoOper.Value:='S';
    TbMovContaNumAgencia.Value:=TbCCorrenteNumAgencia.Value;
    TbMovContaConta.Value:=dmdados.TbCCorrenteConta.Value;
    TbMovContaCodHist.Value:='1';
    TbMovContaComplHist.Value:='FECHAMENTO DA CONTA';
    TbMovContaDataMov.Value:=edtDtFim.Date;
    TbMovContaValor.Value:=SaldoMov;
    TbMovContaDataReg.Value:=Now;
    TbMovContaHoraReg.Value:=StrToTime('23:59:59');
    TbMovConta.Post;
    TbMovConta.Filtered:=False;
    //Registra a entrado do Saldo ref. transfer�cnia do dia anterior
    TbMovConta.Append;
    TbMovContaTipoOper.Value:='E';
    TbMovContaNumAgencia.Value:=TbCCorrenteNumAgencia.Value;
    TbMovContaConta.Value:=dmdados.TbCCorrenteConta.Value;
    TbMovContaCodHist.Value:='2';
    TbMovContaComplHist.Value:='FECHAMENTO DA CONTA';
    TbMovContaDataMov.Value:=edtDtFim.Date+1;
    TbMovContaValor.Value:=SaldoMov;
    TbMovContaDataReg.Value:=Now;
    TbMovContaHoraReg.Value:=StrToTime('00:00:00');
    TbMovConta.Post;
    //Atualiza informa��o de movimento da C.Corrente
    TbCCorrente.Edit;
    TbCCorrenteUltMov.Value:=edtDtFim.Date+1;
    TbCCorrenteHoraMov.Value:=StrToTime('00:00:00');
    end;
   close;
   end
  else
   ShowMessage('Os Campos '+campos+' n�o foram preenchidos');
end;

procedure TFrmFechCC.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmFechCC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : if dmDados.vTabStt then BtnSair.Click;
      Vk_F2     : btnConfirmar.Click;
end;
end;

end.
