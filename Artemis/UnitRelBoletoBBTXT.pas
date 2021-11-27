//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitRelBoletoBBTXT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SpeedBar, StdCtrls, RxLookup, Mask, ToolEdit, RXSplit, fcButton,
  fcImgBtn, RXCtrls, ExtCtrls, jpeg, ELibFnc, RxGrdCpt, fcImager;

type
  TFrmRelBoletoBBTXT = class(TForm)
    Panel1: TPanel;
    RxLabel4: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    cmbClassif: TComboBox;
    EdtInicial: TDateEdit;
    EdtFinal: TDateEdit;
    edCliente: TRxLookupEdit;
    Edit1: TEdit;
    edCcusto: TRxLookupEdit;
    Edit2: TEdit;
    EvLibFunctions1: TEvLibFunctions;
    Panel2: TPanel;
    RxLabel8: TRxLabel;
    Panel4: TPanel;
    btnImprimir: TfcImageBtn;
    btnSair: TfcImageBtn;
    RxSplitter3: TRxSplitter;
    Image1: TImage;
    RxGradientCaption2: TRxGradientCaption;
    Label2: TLabel;
    procedure BtnimprimirClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure cmbClassifChange(Sender: TObject);
    procedure edClienteExit(Sender: TObject);
    procedure edCcustoChange(Sender: TObject);
    Function AjustaStr( str:String;tam:Integer;carac:char;cont:char):String;
    Function AjustaDt(str:string):string;
    Function RetiraVirg(str:string):string;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtInicialExit(Sender: TObject);
    procedure EdtFinalExit(Sender: TObject);
    procedure EdtFinalChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelBoletoBBTXT: TFrmRelBoletoBBTXT;

implementation

uses Unitbolreal, unitDmDados, UnitPrincipal;

{$R *.dfm}

procedure TFrmRelBoletoBBTXT.BtnimprimirClick(Sender: TObject);
var F : TextFile;
    Linha, brn:string;
    i:integer;
begin
if (EdtFinal.Text = '  /  /    ') then
  begin
    Showmessage('Data Final vazia');
    EdtFinal.SetFocus;
  end
else
  begin
btnImprimir.Enabled:=false;
QrBoleto1:=tQrBoleto1.create(application);
if cmbclassif.text='Por Cliente' then
begin
  dmdados.tbCReceber.Filtered:=false;
  dmdados.tbCReceber.Filter:='(codcli='''+edit1.Text+''')and '+
                             '(CodDoc='''+IntToStr(1)+''')and'+
                             '(Pago='''+'ABERTO'+''')and'+
                             '(datavenc>='''+edtinicial.Text+''')and'+
                             '(datavenc<='''+edtfinal.Text+''')';
   dmdados.tbCReceber.Filtered:=true;
end;

if cmbclassif.text='Por Per�odo' then
begin
  dmdados.tbCReceber.Filtered:=false;
  dmdados.tbCReceber.Filter:= '(CodDoc='''+IntToStr(1)+''')and'+
                              '(Pago='''+'ABERTO'+''')and'+
                              '(datavenc>='''+edtinicial.Text+''')and'+
                              '(datavenc<='''+edtfinal.Text+''')';
  dmdados.tbCReceber.Filtered:=true;
end;

if cmbclassif.text='Por Centro de Custo' then
begin
  dmdados.tbCReceber.Filtered:=false;
  dmdados.tbCReceber.Filter:='(codccusto='''+edit2.Text+''')and '+
                             '(CodDoc='''+IntToStr(1)+''')and'+
                             '(Pago='''+'ABERTO'+''')and'+
                             '(datavenc >='''+edtinicial.Text+''')and'+
                             '(datavenc <='''+edtfinal.Text+''')';
   dmdados.tbCReceber.Filtered:=true;
end;

AssignFile(F,'c:\boleto.txt');
Rewrite(F);
             (*HEADER*)
Linha:='0002';                    //TP.REGISTRO+TP.INSCR.CED
brn:=dmdados.TbParametroCNPJ.Value;//INSRC.CED.
Linha:=Linha+AjustaStr(brn,14,'0','d');
brn:=dmdados.TbParametroEmpresa.Value;//NOME CEDENTE
Linha:=Linha+AjustaStr(brn,30,' ','d');
brn:=' ';
Linha:=Linha+AjustaStr(brn,452,' ','d');//USO DO BANCO
Writeln(F,linha); //FIM HEADER

             (*TITULO*)
dmdados.tbCReceber.First;
i:=0;
While not(dmdados.tbCReceber.Eof) do
begin
 Linha:='01';   //TIPO DE REGISTRO
 Linha:=Linha+'000000';    //CONV�NIO
 Linha:=Linha+'17019';     //CARTEIRA+VARIA��O
 brn:=dmDados.tbCReceberNumDoc.Value;//SEU NUMERO
 Linha:=Linha+AjustaStr(brn,10,' ','d');
 Linha:=Linha+'00000000000000000000';//NOSSO NUMERO
 brn:=' ';
 Linha:=Linha+AjustaStr(brn,25,' ','d');//CONTROLE
 brn:='DM';//SIGLA ESP�CIE
 Linha:=Linha+AjustaStr(brn,5,' ','d');
 brn:=DateToStr(dmDados.tbCReceberDataEmis.Value);//EMISS�O
 Linha:=Linha+AjustaDt(brn);
 brn:=DateToStr(dmDados.tbCReceberDataVenc.Value);//VENCIMENTO
 Linha:=Linha+AjustaDt(brn);
 brn:=FloatToStr(dmdados.tbCReceberValor.Value);//VALOR
 brn:=RetiraVirg(brn);
 Linha:=Linha+AjustaStr(brn,13,'0','e');
 Brn:='09';//C�DIGO MOEDA
 Linha:=Linha+AjustaStr(brn,5,' ','d');
 Linha:=Linha+'0000000000000';//QUANTIDADE MOEDA
 Linha:=Linha+'N';
 brn:=FloatToStr(dmdados.tbCReceberPercJuros.Value);//JUROS DIA
 brn:=RetiraVirg(brn);
 Linha:=Linha+AjustaStr(brn,13,'0','e');
 brn:=DateToStr(dmDados.tbCReceberDescDia.Value);//LIM.DESCON
 brn:=AjustaDt(brn);
 Linha:=Linha+brn;
 if dmDados.tbCReceberValorDesc.Value > 0 then //VL.DESCONT
 begin
  brn:=FloatToStr(dmDados.tbCReceberValorDesc.Value);
  brn:=RetiraVirg(brn);
  Linha:=Linha+AjustaStr(brn,13,'0','e');
 end else
 begin
  brn:=' ';
  Linha:=Linha+AjustaStr(brn,13,' ','e');
 end;
 Linha:=Linha+'0000000000000';//VALOR ABATIMENTO
 Linha:=Linha+'  ';//QUANT DIAS PROTESTO
 brn:=dmDados.TbParametroMensPromo.Value;
 Linha:=Linha+AjustaStr(brn,40,' ','d');//1� LN.MENSAGEM
 brn:=dmDados.TbParametroMensRodape.Value;
 Linha:=Linha+AjustaStr(brn,40,' ','d');//2� LN.MENSAGEM
 Linha:=Linha+'  ';//TIPO INSCR.AVALISTA
 Linha:=Linha+'              '; //INSCR.AVALISTA
 brn:=' ';
 Linha:=Linha+AjustaStr(brn,37,' ','d');//NOME AVALISTA
 Linha:=Linha+'S';  //IMPRESS�O
 if dmdados.tbCliente.Locate('CodCli',dmdados.tbCReceberCodCli.Value,[]) then
  if dmdados.tbClienteTipo.Value='1'then
  begin
     Linha:=Linha+'01';   //TIPO INSCR.SACADO
     brn:=dmDados.tbClienteCPF.Value; //CPF SACADO
  end
  else
  begin
     Linha:=Linha+'02';    //TIPO INSCR.SACADO
     brn:=dmDados.tbClienteCNPJ.Value; //CNPJ SACADO
  end;
 Linha:=Linha+AjustaStr(brn,14,' ', 'd');
 brn:=dmDados.tbCReceberlkCliente.Value;//NOME SACADO
 Linha:=Linha+AjustaStr(brn,37,' ','d');
 brn:=dmDados.tbCReceberlkEndereco.Value;//ENDERE�O SACADO
 brn:=brn+(dmDados.tbCReceberlknumero.Value);//NUMERO ENDERE�O SACADO
 Linha:=Linha+AjustaStr(brn,37,' ','d');
 brn:=dmDados.tbCReceberlkCep.Value; //CEP SACADO
 Linha:=Linha+AjustaStr(brn,8,'0','e');
 brn:=dmDados.tbCReceberlkCidade.Value; //CIDADE SACADO
 Linha:=Linha+AjustaStr(brn,15,' ','d');
 brn:=dmDados.tbCReceberlkUF.Value; //UF SACADO
 Linha:=Linha+brn;
 brn:='0';
 Linha:=Linha+AjustaStr(brn,61,'0','d');//USO BANCO
 Linha:=Linha+'01';//MODALIDADE TITULO
 brn:='0';
 Linha:=Linha+AjustaStr(brn,18,'0','d');//USO BANCO
 Writeln(F,linha);  //FIM TITULO

            (*SACADO*)
 {if dmdados.tbCliente.Locate('CodCli',dmdados.tbCReceberCodCli.Value,[]) then}
 Linha:='02';  //TIPO REGISTRO
 if dmdados.tbCliente.Locate('CodCli',dmdados.tbCReceberCodCli.Value,[]) then
  if dmdados.tbClienteTipo.Value='1'then //CPF SACADO
  begin
   Linha:=Linha+'01';
   brn:=dmDados.tbCReceberlkCPF.Value;
   Linha:=Linha+AjustaStr(brn,14,' ','d');
  end
  else if dmdados.tbClienteTipo.Value='2'then //CNPJ SACADO
  begin
   Linha:=Linha+'02';
   brn:=dmDados.tbCReceberlkCNPJ.Value;
   Linha:=Linha+brn;
  end
  else
  begin
   Linha:=Linha+'03'; //OUTROS DOCUMENTOS
   brn:=' ';
   Linha:=Linha+AjustaStr(brn,14,' ','d');
  end;
 brn:=dmDados.tbCReceberlkCliente.Value; //NOME SACADO
 Linha:=Linha+AjustaStr(brn,37,' ','d');
 brn:=dmDados.tbCReceberlkEndereco.Value;//ENDERE�O SACADO
 brn:=brn+IntToStr(dmDados.tbClienteNumero.Value);
 Linha:=Linha+AjustaStr(brn,37,' ','d');
 brn:=dmDados.tbCReceberlkCep.Value; //CEP SACADO
 Linha:=Linha+AjustaStr(brn,8,'0','e');
 brn:=dmDados.tbCReceberlkCidade.Value; //CIDADE SACADO
 Linha:=Linha+AjustaStr(brn,15,' ','d');
 brn:=dmDados.tbCReceberlkUF.Value; //UF SACADO
 Linha:=Linha+brn;
 brn:=' '; //GRUPO DISTR.SACADO
 Linha:=Linha+AjustaStr(brn,40,' ','d');
 Brn:='0';  //USO BANCO
 Linha:=Linha+AjustaStr(brn,343,'0','d');
 Writeln(F,Linha);
 dmdados.tbcreceber.Next;
 i:=i+2;
end;

            (* TRAILER*)
Linha:='99';
brn:=IntToStr(i);//QUANT.REGIST
Linha:=linha+AjustaStr(brn,6,'0','e');
brn:=' '; //USO BANCO
Linha:=Linha+AjustaStr(brn,492,' ','d');
Writeln(F,linha);    //FIM TRAILER

CloseFile(F);
dmdados.tbCReceber.Filtered:=false;
end;
end;


procedure TFrmRelBoletoBBTXT.BtnSairClick(Sender: TObject);
begin
 close;
end;

procedure TFrmRelBoletoBBTXT.cmbClassifChange(Sender: TObject);
begin
    If cmbClassif.Text= 'Por Cliente' Then
   Begin
     EdtInicial.Enabled:= True;
     EdtFinal.Enabled:= True;
     Edccusto.Enabled:=False;
     Edcliente.Enabled:=true;
     btnImprimir.Enabled:=false;
    end;
If cmbClassif.Text= 'Por Per�odo' Then
   Begin
     EdtInicial.Enabled:= True;
     EdtFinal.Enabled:= True;
     Edcliente.Enabled:=False;
     Edccusto.Enabled:=False;
     btnImprimir.Enabled:=false;
  end;
If cmbClassif.Text= 'Por Centro de Custo' Then
   Begin
   EdtInicial.Enabled:= True;
   EdtFinal.Enabled:= True;
   Edcliente.Enabled:=False;
   Edccusto.Enabled:=true;
   btnImprimir.Enabled:=false;
   end;
end;

procedure TFrmRelBoletoBBTXT.edClienteExit(Sender: TObject);
begin
    if dmdados.TbCliente.Locate('nome',edCliente.Text,[]) then
   edit1.Text:=dmdados.TbClientecodcli.AsString;
end;

procedure TFrmRelBoletoBBTXT.edCcustoChange(Sender: TObject);
 begin
if dmdados.TbCcusto.Locate('Descricao',edCcusto.Text,[]) then
   edit2.Text:=dmdados.TbCcustoCodCcusto.AsString;
end;

function tFrmRelBoletoBBTXT.AjustaStr( str:String;tam:Integer;carac:char;cont:char):String;
var I:integer;
begin
i:=Length(str);
while Length(str)< tam do
begin
  if cont = 'd' then  str := str+carac
  else if cont = 'e' then  str := carac+str;
end;
if i > tam then Delete(str,tam,i-tam );

Result := str;
end;

Function tFrmRelBoletoBBTXT.AjustaDt(str:string):string;
begin
   delete(str,3,1);
   delete(str,5,1);
   result:=str;
end;

Function tFrmRelBoletoBBTXT.RetiraVirg(str:string):string;
begin
 str:=FloatToStr(StrToFloat(str)*100);
 result:=str;
end;


procedure TFrmRelBoletoBBTXT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
   Action:=cafree;
end;

procedure TFrmRelBoletoBBTXT.EdtInicialExit(Sender: TObject);
begin
  if (EdtInicial.Text ='  /  /    ') then
  begin
    ShowMessage('Data Inicial Vazia');
    EdtInicial.SetFocus;
  end
  else
    try StrToDate(EdtInicial.Text)
     Except on EConvertError do
     begin
      ShowMessage('Data Final Inv�lida');
      EdtInicial.SetFocus;
     end;
     end;
end;

procedure TFrmRelBoletoBBTXT.EdtFinalExit(Sender: TObject);
var flag:boolean;
begin
  flag:=true;
  if (EdtFinal.Text ='  /  /    ') then
  begin
    ShowMessage('Data Final Vazia');
    EdtFinal.SetFocus;
    flag:=false;
  end
  else
    try StrToDate(EdtFinal.Text)
     Except on EConvertError do
     begin
      ShowMessage('Data Final Inv�lida');
      EdtFinal.SetFocus;
      flag:=false;
     end;
     end;
  if flag then
    Btnimprimir.Enabled:=true;
end;

procedure TFrmRelBoletoBBTXT.EdtFinalChange(Sender: TObject);
begin
 Btnimprimir.Enabled:=true;
end;

procedure TFrmRelBoletoBBTXT.FormShow(Sender: TObject);
begin
FrmPrincipal.StatusTeclas(True,'[F2] Gravar [Esc] Cancelar ou Sair');
    //CmbDestino.Enabled:=false;
end;

procedure TFrmRelBoletoBBTXT.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_F2    : Btnimprimir.Click;
      VK_ESCAPE : if dmDados.vTabStt then BtnSair.Click;
    end;
end;

end.

