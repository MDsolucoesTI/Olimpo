//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitEfAluguel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolEdit, CurrEdit, RXDBCtrl, StdCtrls, Mask, DBCtrls, ExtCtrls,
  RackCtls, RXSplit, RXCtrls, SpeedBar, jpeg, RxLookup, fcButton, fcImgBtn,
  TFlatHintUnit, LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint,
  LMDShapeHint;

type
  TFrmEfAluguel = class(TForm)
    Panel1: TPanel;
    RxLabel2: TRxLabel;
    RxSplitter1: TRxSplitter;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    Panel2: TPanel;
    Image2: TImage;
    Label2: TLabel;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel9: TRxLabel;
    GroupBox1: TGroupBox;
    RxLabel6: TRxLabel;
    dbDataInicio: TDBDateEdit;
    RxLabel7: TRxLabel;
    dbDataFim: TDBDateEdit;
    GroupBox2: TGroupBox;
    RxLabel12: TRxLabel;
    cmbDia: TDBComboBox;
    GroupBox3: TGroupBox;
    RxLabel8: TRxLabel;
    RxLabel10: TRxLabel;
    dbDataVenc: TDBDateEdit;
    RxLabel11: TRxLabel;
    cmbAntec: TDBComboBox;
    RxLabel13: TRxLabel;
    dbReajuste: TDBEdit;
    dbNumRec: TDBEdit;
    RxSplitter2: TRxSplitter;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnPrimeiro: TSpeedItem;
    BtnAnterior: TSpeedItem;
    BtnProximo: TSpeedItem;
    BtnUltimo: TSpeedItem;
    BtnNovo: TSpeedItem;
    BtnGravar: TSpeedItem;
    BtnCancelar: TSpeedItem;
    BtnAlterar: TSpeedItem;
    BtnDeletar: TSpeedItem;
    BtnSair: TSpeedItem;
    dbAluguel: TRxDBCalcEdit;
    dbComis: TRxDBCalcEdit;
    cmbLkLoc: TRxDBLookupCombo;
    RxLabel14: TRxLabel;
    RxLabel1: TRxLabel;
    dbCodImov: TDBEdit;
    cmblkImob: TRxDBLookupCombo;
    RxLabel5: TRxLabel;
    dbCodAluguel: TDBEdit;
    RxLabel15: TRxLabel;
    cmbProrro: TDBComboBox;
    LMDShapeHint1: TLMDShapeHint;
    cmblkccusto: TRxDBLookupCombo;
    RxLabel35: TRxLabel;
    btnGerarUm: TSpeedItem;
    btnGera1P: TSpeedItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbCodImovEnter(Sender: TObject);
    procedure dbCodImovExit(Sender: TObject);
    procedure dbAluguelEnter(Sender: TObject);
    procedure dbAluguelExit(Sender: TObject);
    procedure dbComisEnter(Sender: TObject);
    procedure dbComisExit(Sender: TObject);
    procedure cmblkImobEnter(Sender: TObject);
    procedure cmblkImobExit(Sender: TObject);
    procedure cmbLkLocEnter(Sender: TObject);
    procedure cmbLkLocExit(Sender: TObject);
    procedure cmbLkCCustoEnter(Sender: TObject);
    procedure dbDataInicioEnter(Sender: TObject);
    procedure dbDataInicioExit(Sender: TObject);
    procedure dbDataFimEnter(Sender: TObject);
    procedure dbDataFimExit(Sender: TObject);
    procedure cmbProrroEnter(Sender: TObject);
    procedure cmbDiaEnter(Sender: TObject);
    procedure cmbDiaExit(Sender: TObject);
    procedure cmbAntecEnter(Sender: TObject);
    procedure cmbAntecExit(Sender: TObject);
    procedure dbReajusteEnter(Sender: TObject);
    procedure dbReajusteExit(Sender: TObject);
    procedure dbNumRecEnter(Sender: TObject);
    procedure dbNumRecExit(Sender: TObject);
    procedure dbDataVencEnter(Sender: TObject);
    procedure dbDataVencExit(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure cmblkccustoExit(Sender: TObject);
    procedure btnGerarUmClick(Sender: TObject);
    function GeraData(iData:TdateTime;iDias:integer;iVenc:string):TDateTime;
    function VerData(iAnt,iVenc,iMes,iAno:String):TDateTime;
    function RetData(vDia,vMes,vAno,iDias:integer):TDateTime;
    procedure btnGera1PClick(Sender: TObject);
    procedure cmbProrroExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEfAluguel: TFrmEfAluguel;
  novoitem:boolean;

implementation

uses UnitDmdados;

{$R *.dfm}

procedure TFrmEfAluguel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= Cafree;
end;

procedure TFrmEfAluguel.BtnSairClick(Sender: TObject);
begin
Close;
end;

procedure TFrmEfAluguel.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmEfAluguel.dbCodImovEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmEfAluguel.dbCodImovExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If dbCodImov.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o N�MERO DO IM�VEL');
      dbCodImov.SetFocus;
      End
    Else
      (Sender as TDBEdit).color:=clWindow;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmEfAluguel.dbAluguelEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmEfAluguel.dbAluguelExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If dbAluguel.Value = 0 then
      Begin
      ShowMessage('� obrigat�rio o VALOR DO ALUGUEL');
      dbAluguel.SetFocus;
      End
    Else
      (Sender as TRxDBCalcEdit).color:=clWindow;
    End
  Else
    (Sender as TRxDBCalcEdit).color:=clWindow;
end;

procedure TFrmEfAluguel.dbComisEnter(Sender: TObject);
begin
(Sender as TRxDBCalcEdit).color:=$00d2e2ff;
end;

procedure TFrmEfAluguel.dbComisExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If dbcomis.Value = 0 then
      Begin
      ShowMessage('� obrigat�rio o VALOR DA COMISS�O');
      dbcomis.SetFocus;
      End
    Else
      (Sender as TRxDBCalcEdit).color:=clWindow;
    End
  Else
    (Sender as TRxDBCalcEdit).color:=clWindow;
end;

procedure TFrmEfAluguel.cmblkImobEnter(Sender: TObject);
begin
(Sender as TRxDBLookupCombo).color:=$00d2e2ff;
end;

procedure TFrmEfAluguel.cmblkImobExit(Sender: TObject);
begin
 If NovoItem Then
    Begin
    If cmblkImob.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o NOME DA IMOBILI�RIA');
      cmblkImob.SetFocus;
      End
    Else
      (Sender as TRxDBLookupCombo).color:=clWindow;
    End
  Else
    (Sender as TRxDBLookupCombo).color:=clWindow;
end;

procedure TFrmEfAluguel.cmbLkLocEnter(Sender: TObject);
begin
(Sender as TRxDBLookupCombo).color:=$00d2e2ff;
end;

procedure TFrmEfAluguel.cmbLkLocExit(Sender: TObject);
begin
 If NovoItem Then
    Begin
    If cmblkloc.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o NOME DO LOCAT�RIO');
      cmblkloc.SetFocus;
      End
    Else
      (Sender as TRxDBLookupCombo).color:=clWindow;
    End
  Else
    (Sender as TRxDBLookupCombo).color:=clWindow;
end;

procedure TFrmEfAluguel.cmbLkCCustoEnter(Sender: TObject);
begin
(Sender as TRxDBLookupCombo).color:=$00d2e2ff;
end;

procedure TFrmEfAluguel.dbDataInicioEnter(Sender: TObject);
begin
(Sender as TDBDateEdit).color:=$00d2e2ff;
end;

procedure TFrmEfAluguel.dbDataInicioExit(Sender: TObject);
begin
 If NovoItem Then
    Begin
    If dbdatainicio.Text= '  /  /    ' then
      Begin
      ShowMessage('� obrigat�rio a DATA IN�CIO DO CONTRATO');
      dbdatainicio.SetFocus;
      End
    Else
      (Sender as TDBDateEdit).color:=clWindow;
    End
  Else
    (Sender as TDBDateEdit).color:=clWindow;
end;

procedure TFrmEfAluguel.dbDataFimEnter(Sender: TObject);
begin
(Sender as TDBDateEdit).color:=$00d2e2ff;
end;

procedure TFrmEfAluguel.dbDataFimExit(Sender: TObject);
begin
 If NovoItem Then
    Begin
    If dbdatafim.Text= '  /  /    ' then
      Begin
      ShowMessage('� obrigat�rio a DATA DE T�RMINO DO CONTRATO');
      dbdatafim.SetFocus;
      End
    Else
      (Sender as TDBDateEdit).color:=clWindow;
    End
  Else
    (Sender as TDBDateEdit).color:=clWindow;
end;

procedure TFrmEfAluguel.cmbProrroEnter(Sender: TObject);
begin
(Sender as TDBComboBox).color:=$00d2e2ff;
end;

procedure TFrmEfAluguel.cmbDiaEnter(Sender: TObject);
begin
(Sender as TDBComboBox).color:=$00d2e2ff;
end;

procedure TFrmEfAluguel.cmbDiaExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If NovoItem Then
    Begin
    If cmbdia.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar o DIA DO VENCIMENTO DO ALUGUEL');
      cmbdia.SetFocus;
      End
    Else
      Begin
      Flag:=True;
      For x:=0 to cmbdia.Items.Count-1 Do
        If cmbdia.Text=cmbdia.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor '+ cmbDia.Text+' inv�lido');
        cmbDia.SetFocus;
        End
      Else
        (Sender as TDBComboBox).color:=clWindow;
      End;
    End
  Else
    (Sender as TDBComboBox).color:=clWindow;
end;


procedure TFrmEfAluguel.cmbAntecEnter(Sender: TObject);
begin
(Sender as TDBComboBox).color:=$00d2e2ff;
end;

procedure TFrmEfAluguel.cmbAntecExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If NovoItem Then
    Begin
    If cmbAntec.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar o campo ANTECIPADO!');
      cmbAntec.SetFocus;
      End
    Else
      Begin
      Flag:=True;
      For x:=0 to cmbAntec.Items.Count-1 Do
        If cmbAntec.Text=cmbAntec.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor do campo ANTECIPA��O inv�lido!');
        cmbAntec.SetFocus;
        End
      Else
        (Sender as TDBComboBox).color:=clWindow;
      End;
    End
  Else
    (Sender as TDBComboBox).color:=clWindow;
end;

procedure TFrmEfAluguel.dbReajusteEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmEfAluguel.dbReajusteExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmEfAluguel.dbNumRecEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmEfAluguel.dbNumRecExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If dbnumrec.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o N�MERO DO �LTIMO RECIBO');
      dbnumrec.SetFocus;
      End
    Else
      (Sender as TDBEdit).color:=clWindow;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmEfAluguel.dbDataVencEnter(Sender: TObject);
begin
(Sender as TDBdateEdit).color:=$00d2e2ff;
end;

procedure TFrmEfAluguel.dbDataVencExit(Sender: TObject);
begin
 If NovoItem Then
    Begin
    If dbdatavenc.Text= '  /  /    ' then
      Begin
      ShowMessage('� obrigat�rio a DATA DE VENCIMENTO DO �LTIMO RECIBO');
      dbdatavenc.SetFocus;
      End
    Else
      (Sender as TDBDateEdit).color:=clWindow;
    End
  Else
    (Sender as TDBDateEdit).color:=clWindow;
end;

procedure TFrmEfAluguel.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.TbAluguel.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
end;

procedure TFrmEfAluguel.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.TbAluguel.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.TbAluguel.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
end;

procedure TFrmEfAluguel.BtnProximoClick(Sender: TObject);
begin
  dmdados.TbAluguel.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.TbAluguel.Eof Then
  Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
  End;
end;

procedure TFrmEfAluguel.BtnUltimoClick(Sender: TObject);
begin
  dmdados.TbAluguel.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
end;

procedure TFrmEfAluguel.BtnNovoClick(Sender: TObject);
begin
 NovoItem:=True;
 DMDados.tbAluguel.Append;
 {habilitando os bot�es}
 BtnGravar.Enabled:= True;
 BtnCancelar.Enabled := True;
 BtnAlterar.Enabled:=False;
 BtnDeletar.Enabled:=False;
 BtnNovo.Enabled:=False;
// BtnLocalizar.Enabled:=False;

 {habilitando os componentes}
 dbcodimov.Enabled:=true;
 dbAluguel.Enabled:=true;
 dbcomis.Enabled:=true;
 cmblkImob.Enabled:=true;
 cmblkloc.Enabled:=true;
 cmblkccusto.Enabled:=true;
 dbdatainicio.Enabled:=true;
 dbdatafim.Enabled:=true;
 cmbProrro.Enabled:=true;
 cmbdia.Enabled:=true;
 cmbantec.enabled:=true;
 dbreajuste.Enabled:=true;
 dbnumrec.Enabled:=true;
 dbdatavenc.Enabled:=true;
 dbcodimov.SetFocus;

end;

procedure TFrmEfAluguel.BtnCancelarClick(Sender: TObject);
begin
 NovoItem:=False;
 dmdados.tbCadImovel.cancel;
 {Desabilitando os bot�es}
 BtnCancelar.Enabled := false;
 BtnAlterar.Enabled:=True;
 BtnDeletar.Enabled:=True;
 BtnNovo.Enabled:=True;
// BtnLocalizar.Enabled:=True;

 {Desabilitando os componetes}
 dbcodimov.Enabled:=false;
 dbAluguel.Enabled:=false;
 dbcomis.Enabled:=false;
 cmbLkImob.Enabled:=false;
 cmblkloc.Enabled:=false;
 cmblkccusto.Enabled:=false;
 dbdatainicio.Enabled:=false;
 dbdatafim.Enabled:=false;
 cmbProrro.Enabled:=false;
 cmbdia.Enabled:=false;
 cmbantec.enabled:=false;
 dbreajuste.Enabled:=false;
 dbnumrec.Enabled:=false;
 dbdatavenc.Enabled:=false;
 speedbar1.SetFocus;

end;

procedure TFrmEfAluguel.BtnAlterarClick(Sender: TObject);
begin
 if dmdados.TbAluguel.RecordCount=0 then
    ShowMessage('Tabela vazia')
 else
 begin
 novoitem:=true;
 dmdados.tbAluguel.Edit;
 btncancelar.Enabled:=true;
 btngravar.Enabled:=true;
 btnnovo.Enabled:=false;
 btnprimeiro.Enabled:=false;
 btnanterior.Enabled:=false;
 btnproximo.Enabled:=false;
 btnultimo.Enabled:=false;

 {habilitando os componentes}
 dbcodimov.Enabled:=true;
 dbAluguel.Enabled:=true;
 dbcomis.Enabled:=true;
 cmbLkImob.Enabled:=true;
 cmblkloc.Enabled:=true;
 cmblkccusto.Enabled:=true;
 dbdatainicio.Enabled:=true;
 dbdatafim.Enabled:=true;
 cmbProrro.Enabled:=true;
 cmbdia.Enabled:=true;
 cmbantec.enabled:=true;
 dbreajuste.Enabled:=true;
 dbnumrec.Enabled:=true;
 dbdatavenc.Enabled:=true;
 dbcodimov.SetFocus;
 end;
end;

procedure TFrmEfAluguel.BtnDeletarClick(Sender: TObject);
begin
NovoItem:=False;
if dmdados.tbAluguel.RecordCount=0 then
begin
ShowMessage('Tabela sem registro')
end
else
If application.MessageBox('Tem certeza que deseja exluir esse registro?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
   dmdados.tbaluguel.Delete
   else
   dmdados.tbaluguel.cancel;
end;
procedure TFrmEfAluguel.BtnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar,Flag:Boolean;
  x:Integer;

begin
   Campos:='';
  Gravar:=True;
  Vazio:=False;

{}
If dbcodimov.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'N�mero do im�vel';
    Gravar:=False;
    Vazio:=True;
    end;

If dbaluguel.Text= '' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Valor do aluguel';
    Gravar:=False;
    Vazio:=True;
    End;

If dbcomis.Text= '' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Valor da comiss�o';
    Gravar:=False;
    Vazio:=True;
    End;

If cmbLkImob.Text='' Then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Nome da imobili�ria';
    Gravar:=False;
    Vazio:=True;
    end;

If cmblkloc.Text='' Then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Nome do locat�rio';
    Gravar:=False;
    Vazio:=True;
    end;

 If dbdatainicio.Text= '  /  /    ' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Data In�cio';
    Gravar:=False;
    Vazio:=True;
    End;

 If dbdatafim.Text= '  /  /    ' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Data T�rmino';
    Gravar:=False;
    Vazio:=True;
    End;

 If cmbProrro.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Prorroga';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to cmbProrro.Items.Count-1 Do
      If cmbProrro.Text=cmbProrro.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor do campo PRORROGA��O inv�lido!');
      Gravar:=False;
      End;
    End;

 If cmbdia.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Dia do vencimento do aluguel';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to cmbdia.Items.Count-1 Do
      If cmbdia.Text=cmbdia.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor '+cmbdia.Text+' inv�lido');
      Gravar:=False;
      End;
    End;

  If cmbAntec.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'ANTECIPADO';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to cmbAntec.Items.Count-1 Do
      If cmbAntec.Text=cmbAntec.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor do campo ANTECIPADO inv�lido!');
      Gravar:=False;
      End;
    End;

  If dbnumrec.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'N�mero do �ltimo recibo';
    Gravar:=False;
    Vazio:=True;
    end;

  If dbdatavenc.Text= '  /  /    ' then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Data do vencimento do �ltimo recibo';
    Gravar:=False;
    Vazio:=True;
    End;
{}  If Gravar Then
    Begin
    DMDados.TbAluguel.Post;
    NovoItem:=False;
    BtnGravar.Enabled:=False;
    BtnCancelar.Enabled:=False;
    BtnNovo.Enabled:=True;
    BtnPrimeiro.Enabled:=True;
    BtnAnterior.Enabled:=True;
    BtnProximo.Enabled:=True;
    BtnUltimo.Enabled:=True;
    BtnAlterar.Enabled:=True;
    Btndeletar.Enabled:=True;
    SpeedBar1.SetFocus;
    {desabilitando os componentes}
    dbcodimov.Enabled:=false;
    dbAluguel.Enabled:=false;
    dbcomis.Enabled:=false;
    cmbLkImob.Enabled:=false;
    cmblkloc.Enabled:=false;
    cmblkccusto.Enabled:=false;
    dbdatainicio.Enabled:=false;
    dbdatafim.Enabled:=false;
    cmbProrro.Enabled:=false;
    cmbdia.Enabled:=false;
    cmbantec.enabled:=false;
    dbreajuste.Enabled:=false;
    dbnumrec.Enabled:=false;
    dbdatavenc.Enabled:=false;
    ShowMessage ('Dados gravados com sucesso!');
    End
  Else
    Begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbcodImov.SetFocus;
    end;
end;

procedure TFrmEfAluguel.cmblkccustoExit(Sender: TObject);
begin
 { If NovoItem Then
    Begin
    If cmblkccusto.Text <> '' Then
      Begin
      If Not(dmDados.tbCcusto.Locate('CodCCusto',cmblkccusto.Text,[])) Then
        Begin
        Showmessage('CENTRO DE CUSTO n�o Cadastrado!');
        cmblkccusto.ClearValue;
        cmblkccusto.setfocus;
        End
      Else
        (Sender as TRxDBLookupCombo).Color:=clwindow;
      End
    Else
      (Sender as TRxDBLookupCombo).Color:=clwindow;
    End
  Else}
    (Sender as TRxDBLookupCombo).Color:=clwindow;
end;

procedure TFrmEfAluguel.btnGerarUmClick(Sender: TObject);
{var
  tDia,tMes,tAno:word;
  Dia,Mes,Ano:string;
  DataVenc:TDateTime;}
begin
{  With dmdados do
    Begin
    FrmRecibos:=TFrmRecibos.create(application);
    FrmRecibos.LbTitulo.Caption:='Recibo do Locat�rio';
    FrmRecibos.Showmodal;
    decodedate(TbAluguelDataRecib.Value,tAno,tMes,tDia);
    Ano:=IntToStr(tAno);
    Mes:=IntToStr(tMes);
    Dia:=IntToStr(tDia);
    DataVenc:=VerData('N',TbAluguelDiaVenc.Value,Mes,Ano);
    if (StrToInt(FrmRecibos.edtMes.Text)<=tMes)and(StrToInt(FrmRecibos.edtAno.Text)<=tAno) then
      begin
      if TbRecLoca.Locate('CodImo,DataRecib',VarArrayOf([TbAluguelCodImo.Value,DataVenc]),[]) Then
        begin
        tbRecLoca.Edit;
        TbRecLocaCodImo.Value:=TbAluguelCodImo.Value;
        TbRecLocaNumRecib.Value:=TbAluguelNumRecib.Value;
        TbRecLocaVencContrato.Value:=TbAluguelDataTermino.Value;
        TbRecLocaPerIni.Value:=VerData(TbAluguelAntecipado.Value,TbAluguelDiaVenc.Value,FrmRecibos.edtMes.Text,FrmRecibos.edtAno.Text);
        TbRecLocaPerFim.Value:=GeraData(TbRecLocaPerIni.Value,30,TbAluguelDiaVenc.Value)-1;
        TbRecLocaCodLoca.Value:=TbAluguelCodPes.Value;
        TbRecLocaCodFiador.Value:=TbAluguelCodFiador.Value;
        TbRecLocaAte.Value:=DataVenc;
        TbRecLocaApos.Value:=DataVenc;
        TbRecLocaVrAlu1.Value:=TbAluguelValorAlu.Value;
        TbRecLocaVrAlu2.Value:=TbAluguelValorAlu.Value*(1+(tbParamPercMulta.Value/100));
        TbRecLoca.Post;
        end;
      end
    else
      begin
      TbRecLoca.Append;
      TbRecLocaCodImo.Value:=TbAluguelCodImo.Value;
      TbRecLocaNumRecib.Value:=IntToStr(StrToInt(TbAluguelNumRecib.Value)+1);
      TbRecLocaVencContrato.Value:=TbAluguelDataTermino.Value;
      TbRecLocaPerIni.Value:=VerData(TbAluguelAntecipado.Value,TbAluguelDiaVenc.Value,FrmRecibos.edtMes.Text,FrmRecibos.edtAno.Text);
      TbRecLocaPerFim.Value:=GeraData(TbRecLocaPerIni.Value,30,TbAluguelDiaVenc.Value)-1;
      TbRecLocaCodLoca.Value:=TbAluguelCodPes.Value;
      TbRecLocaCodFiador.Value:=TbAluguelCodFiador.Value;
      TbRecLocaAte.Value:=DataVenc;
      TbRecLocaApos.Value:=DataVenc;
      TbRecLocaVrAlu1.Value:=TbAluguelValorAlu.Value;
      TbRecLocaVrAlu2.Value:=TbAluguelValorAlu.Value*(1+(tbParamPercMulta.Value/100));
      TbRecLoca.Post;
      TbAluguel.Edit;
      TbAluguelNumRecib.Value:=TbRecLocaNumRecib.Value;
      TbAluguelDataRecib.Value:=TbRecLocaAte.Value;
      TbAluguel.Post;
      end;
    end;
  FrmRecibos.Free;}
end;

function TfrmEfAluguel.GeraData(iData:TdateTime;iDias:integer;iVenc:string):TDateTime;
var
  vVenc,vDia,vMes,vAno:Word;
  iDia,iMes,iAno:string;
  x:integer;
begin
  vVenc:=StrToInt(iVenc);
  if iDias >= 30 then
    begin
    decodedate(iData,vAno,vMes,vDia);
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

function TfrmEfAluguel.VerData(iAnt,iVenc,iMes,iAno:String):TDateTime;
var
  vDia,vMes,vAno:Word;
begin
  vAno:=StrToInt(iAno);
  vMes:=StrToInt(iMes);
  vDia:=StrToInt(iVenc);
  if vMes =2 then
    if vDia >=29 then
      if (vAno mod 4) = 0 then
        vDia:=29
      else
        vDia:=28;
  if (vDia=31)and((vMes=4)or(vMes=6)or(vMes=9)or(vMes=11)) then
    vDia:=30;
  iVenc:=IntToStr(vDia);
  iMes:=IntToStr(vMes);
  iAno:=IntToStr(vAno);
  if iAnt='S' then
    VerData:=RetData(vDia,vMes,vAno,30)
  else
    VerData:=StrToDate(iVenc+'/'+iMes+'/'+iAno);
end;

function TfrmEfAluguel.RetData(vDia,vMes,vAno,iDias:integer):TDateTime;
var
  sDia,sMes,sAno:string;
  vVenc:word;
  x:integer;
begin
  vVenc:=vDia;
  if iDias >= 30 then
    begin
    For x:=1 to (iDias div 30) do
      begin
      vMes:=vMes-1;
      if vMes=13 Then
        Begin
        vAno:=vAno-1;
        vMes:=12;
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
    sDia:=IntToStr(vDia);
    sMes:=IntToStr(vMes);
    sAno:=IntToStr(vAno);
    RetData:=StrToDate(sDia+'/'+sMes+'/'+sAno);
    end
  else
    RetData:=StrToDate(sDia+'/'+sMes+'/'+sAno)-iDias;
end;

procedure TFrmEfAluguel.btnGera1PClick(Sender: TObject);
{var
  tDia,tMes,tAno:word;
  Dia,Mes,Ano:string;
  DataVenc:TDateTime;}
begin
{  With dmdados do
    Begin
    FrmRecibos:=TFrmRecibos.create(application);
    FrmRecibos.LbTitulo.Caption:='Recibo do Locat�rio';
    FrmRecibos.Showmodal;
    decodedate(TbAluguelDataRecib.Value,tAno,tMes,tDia);
    Ano:=IntToStr(tAno);
    Mes:=IntToStr(tMes);
    Dia:=IntToStr(tDia);
    DataVenc:=VerData('N',TbAluguelDiaVenc.Value,Mes,Ano);
    if (StrToInt(FrmRecibos.edtMes.Text)<=tMes)and(StrToInt(FrmRecibos.edtAno.Text)<=tAno) then
      begin
      if TbRecProp.Locate('CodImo,DataRecib',VarArrayOf([TbAluguelCodImo.Value,DataVenc]),[]) Then
        begin
        tbRecLoca.Edit;
        TbRecPropCodImo.Value:=TbAluguelCodImo.Value;
        TbRecPropNumRecib.Value:=TbAluguelNumRecib.Value;
        TbRecPropVencContrato.Value:=TbAluguelDataTermino.Value;
        TbRecPropPerIni.Value:=VerData(TbAluguelAntecipado.Value,TbAluguelDiaVenc.Value,FrmRecibos.edtMes.Text,FrmRecibos.edtAno.Text);
        TbRecPropPerFim.Value:=GeraData(TbRecPropPerIni.Value,30,TbAluguelDiaVenc.Value)-1;
        TbRecPropCodLoca.Value:=TbAluguelCodPes.Value;
        TbRecPropCodFiador.Value:=TbAluguelCodFiador.Value;
        TbRecPropAte.Value:=DataVenc;
        TbRecPropApos.Value:=DataVenc;
        TbRecPropVrAlu1.Value:=TbAluguelValorAlu.Value;
        TbRecPropVrAlu2.Value:=TbAluguelValorAlu.Value*(1+(tbParamPercMulta.Value/100));
        TbRecPropPercComiss.Value:=TbAluguelComiss.Value;
        TbRecProp.Post;
        end;
      end
    else
      begin
      TbRecProp.Append;
      TbRecPropCodImo.Value:=TbAluguelCodImo.Value;
      TbRecPropNumRecib.Value:=IntToStr(StrToInt(TbAluguelNumRecib.Value)+1);
      TbRecPropVencContrato.Value:=TbAluguelDataTermino.Value;
      TbRecPropPerIni.Value:=VerData(TbAluguelAntecipado.Value,TbAluguelDiaVenc.Value,FrmRecibos.edtMes.Text,FrmRecibos.edtAno.Text);
      TbRecPropPerFim.Value:=GeraData(TbRecPropPerIni.Value,30,TbAluguelDiaVenc.Value)-1;
      TbRecPropCodLoca.Value:=TbAluguelCodPes.Value;
      TbRecPropCodFiador.Value:=TbAluguelCodFiador.Value;
      TbRecPropAte.Value:=DataVenc;
      TbRecPropApos.Value:=DataVenc;
      TbRecPropVrAlu1.Value:=TbAluguelValorAlu.Value;
      TbRecPropVrAlu2.Value:=TbAluguelValorAlu.Value*(1+(tbParamPercMulta.Value/100));
      TbRecPropPercComiss.Value:=TbAluguelComiss.Value;
      TbRecProp.Post;
      TbAluguel.Edit;
      TbAluguelNumRecib.Value:=TbRecPropNumRecib.Value;
      TbAluguelDataRecib.Value:=TbRecPropAte.Value;
      TbAluguel.Post;
      end;
    end;
  FrmRecibos.Free; }
end;

procedure TFrmEfAluguel.cmbProrroExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If NovoItem Then
    Begin
    If cmbProrro.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar PRORROGA��O!');
      cmbProrro.SetFocus;
      End
    Else
      Begin
      Flag:=True;
      For x:=0 to cmbProrro.Items.Count-1 Do
        If cmbProrro.Text=cmbProrro.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor do campo PRORROGA��O inv�lido!');
        cmbProrro.SetFocus;
        End
      Else
        (Sender as TDBComboBox).color:=clWindow;
      End;
    End
  Else
    (Sender as TDBComboBox).color:=clWindow;

(Sender as TDBComboBox).color:=clwindow;
end;

end.
