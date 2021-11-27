//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitDespImov;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, RackCtls, RXSplit, RXCtrls,
  SpeedBar, jpeg, fcButton, fcImgBtn, TFlatHintUnit, LMDCustomComponent,
  LMDCustomHint, LMDCustomShapeHint, LMDShapeHint, DBTables, DB;

type
  TFrmDespImov = class(TForm)
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnPrimeiro: TSpeedItem;
    BtnAnterior: TSpeedItem;
    BtnProximo: TSpeedItem;
    BtnUltimo: TSpeedItem;
    BtnNovo: TSpeedItem;
    BtnCancelar: TSpeedItem;
    BtnAlterar: TSpeedItem;
    BtnDeletar: TSpeedItem;
    BtnSair: TSpeedItem;
    Panel1: TPanel;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    RxSplitter1: TRxSplitter;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    DBEcod: TDBEdit;
    Panel2: TPanel;
    Image2: TImage;
    Label2: TLabel;
    btnLocProp: TfcImageBtn;
    RxLabel11: TRxLabel;
    dbAno: TDBEdit;
    cmbLkEnd: TDBEdit;
    RxLabel15: TRxLabel;
    cmbIptu: TDBComboBox;
    RxLabel3: TRxLabel;
    cmbAgua: TDBComboBox;
    RxLabel4: TRxLabel;
    cmbLuz: TDBComboBox;
    RxLabel5: TRxLabel;
    cmbSeguro: TDBComboBox;
    RxLabel6: TRxLabel;
    cmbCondom: TDBComboBox;
    LMDShapeHint1: TLMDShapeHint;
    cmbLkProp: TDBEdit;
    RxLabel7: TRxLabel;
    RxLabel8: TRxLabel;
    RxLabel18: TRxLabel;
    RxLabel38: TRxLabel;
    MemoRef: TDBMemo;
    RxSplitter2: TRxSplitter;
    cmbLkNum: TDBEdit;
    btnGravar: TSpeedItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cmbLkEndEnter(Sender: TObject);
    procedure cmbLkEndExit(Sender: TObject);
    procedure dbAnoEnter(Sender: TObject);
    procedure dbAnoExit(Sender: TObject);
    procedure cmbIptuEnter(Sender: TObject);
    procedure cmbIptuExit(Sender: TObject);
    procedure cmbSeguroEnter(Sender: TObject);
    procedure cmbSeguroExit(Sender: TObject);
    procedure cmbCondomEnter(Sender: TObject);
    procedure cmbCondomExit(Sender: TObject);
    procedure cmbAguaEnter(Sender: TObject);
    procedure cmbAguaExit(Sender: TObject);
    procedure cmbLuzEnter(Sender: TObject);
    procedure cmbLuzExit(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure DBEcodEnter(Sender: TObject);
    procedure DBEcodExit(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure btnLocPropClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDespImov: TFrmDespImov;
  NovoItem: Boolean;

implementation

uses UnitDmdados, UnitLocImovel;

{$R *.dfm}

procedure TFrmDespImov.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= Cafree;
end;

procedure TFrmDespImov.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmDespImov.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmDespImov.cmbLkEndEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmDespImov.cmbLkEndExit(Sender: TObject);
begin
(Sender as TDBEdit).color:=clwindow;
end;

procedure TFrmDespImov.dbAnoEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmDespImov.dbAnoExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If dbAno.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o ANO!');
      dbAno.SetFocus;
      End
    Else
      (Sender as TDBEdit).color:=clWindow;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmDespImov.cmbIptuEnter(Sender: TObject);
begin
(Sender as TDBComboBox).color:=$00d2e2ff;
end;

procedure TFrmDespImov.cmbIptuExit(Sender: TObject);
VAR
  Flag :boolean;
  x:integer;
begin
if NovoItem then
  begin
  If cmbIptu.Text= '' then
    begin
    ShowMessage('� obrigat�rio o IPTU!');
    cmbIPTU.SetFocus;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to cmbIptu.Items.Count-1 Do
      If cmbIptu.Text=cmbIptu.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor do campo IPTU inv�lido!');
      cmbIPTU.SetFocus;
      End
    else
      (Sender as TDBComboBox).color:=clWindow;
    End;
  end
  else
    (Sender as TDBComboBox).color:=clWindow;
end;

procedure TFrmDespImov.cmbSeguroEnter(Sender: TObject);
begin
(Sender as TDBComboBox).color:=$00d2e2ff;
end;

procedure TFrmDespImov.cmbSeguroExit(Sender: TObject);
VAR
  Flag :boolean;
  x:integer;
begin
if NovoItem then
  begin
  If cmbSeguro.Text= '' then
    begin
    ShowMessage('� obrigat�rio o SEGURO!');
    cmbSeguro.SetFocus;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to cmbSeguro.Items.Count-1 Do
      If cmbSeguro.Text=cmbSeguro.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor do campo SEGURO inv�lido!');
      cmbSeguro.SetFocus;
      End
    else
      (Sender as TDBComboBox).color:=clWindow;
    End;
  end
  else
    (Sender as TDBComboBox).color:=clWindow;
end;

procedure TFrmDespImov.cmbCondomEnter(Sender: TObject);
begin
(Sender as TDBComboBox).color:=$00d2e2ff;
end;

procedure TFrmDespImov.cmbCondomExit(Sender: TObject);
VAR
  Flag :boolean;
  x:integer;
begin
if NovoItem then
  begin
  If cmbCondom.Text= '' then
    begin
    ShowMessage('� obrigat�rio o CONDOM�NIO!');
    cmbCondom.SetFocus;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to cmbCondom.Items.Count-1 Do
      If cmbCondom.Text=cmbCondom.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor do campo CONDOM�NIO inv�lido!');
      cmbCondom.SetFocus;
      End
    else
      (Sender as TDBComboBox).color:=clWindow;
    End;
  end
  else
    (Sender as TDBComboBox).color:=clWindow;
end;

procedure TFrmDespImov.cmbAguaEnter(Sender: TObject);
begin
(Sender as TDBComboBox).color:=$00d2e2ff;
end;

procedure TFrmDespImov.cmbAguaExit(Sender: TObject);
VAR
  Flag :boolean;
  x:integer;
begin
if NovoItem then
  begin
  If cmbAgua.Text= '' then
    begin
    ShowMessage('� obrigat�rio o campo �GUA!');
    cmbAgua.SetFocus;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to cmbAgua.Items.Count-1 Do
      If cmbAgua.Text=cmbAgua.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor do campo AUGA inv�lido!');
      cmbAgua.SetFocus;
      End
    else
      (Sender as TDBComboBox).color:=clWindow;
    End;
  end
  else
    (Sender as TDBComboBox).color:=clWindow;
end;

procedure TFrmDespImov.cmbLuzEnter(Sender: TObject);
begin
(Sender as TDBComboBox).color:=$00d2e2ff;
end;

procedure TFrmDespImov.cmbLuzExit(Sender: TObject);
VAR
  Flag :boolean;
  x:integer;
begin
if NovoItem then
  begin
  If cmbLuz.Text= '' then
    begin
    ShowMessage('� obrigat�rio o campo LUZ!');
    cmbLuz.SetFocus;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to cmbLuz.Items.Count-1 Do
      If cmbLuz.Text=cmbLuz.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor do campo LUZ inv�lido!');
      cmbLuz.SetFocus;
      End
    else
      (Sender as TDBComboBox).color:=clWindow;
    End;
  end
  else
    (Sender as TDBComboBox).color:=clWindow;
end;

procedure TFrmDespImov.BtnNovoClick(Sender: TObject);
begin
 NovoItem:=True;
 DMDados.TbDespImov.Append;
 {habilitando os bot�es}
 BtnGravar.Enabled:= True;
 BtnCancelar.Enabled := True;
 BtnAlterar.Enabled:=False;
 BtnDeletar.Enabled:=False;
 BtnNovo.Enabled:=False;
 {habilitando os componentes}
 dbeCod.Enabled:=True;
 cmbLkEnd.Enabled:= True;
 cmbLkNum.Enabled:=True;
 cmbLkProp.Enabled:=True;
 dbAno.Enabled:=True;
 cmbIptu.Enabled:=True;
 cmbSeguro.Enabled:=True;
 cmbCondom.Enabled:=True;
 cmbAgua.Enabled:=True;
 cmbLuz.Enabled:=True;
 MemoRef.Enabled:=True;
 dbeCod.SetFocus;
end;

procedure TFrmDespImov.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.TbDespImov.First;
  Btnprimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
end;

procedure TFrmDespImov.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.TbDespImov.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If dmdados.TbDespImov.bof Then
  Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
  End;
end;

procedure TFrmDespImov.BtnProximoClick(Sender: TObject);
begin
  dmdados.TbDespImov.next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If dmdados.TbDespImov.Eof Then
  Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
  End;
end;

procedure TFrmDespImov.BtnUltimoClick(Sender: TObject);
begin
  dmdados.TbDespImov.last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
end;

procedure TFrmDespImov.DBEcodEnter(Sender: TObject);
begin
(Sender as TDBEdit).color:=$00d2e2ff;
end;

procedure TFrmDespImov.DBEcodExit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If DBEcod.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o C�DIGO');
      DBEcod.SetFocus;
      End
    Else
      If Not(dmDados.TbImob.Locate('CodImo',DBEcod.Text,[])) Then
        Begin
        Showmessage('C�DIGO n�o Cadastrado');
        DBEcod.SetFocus;
        End
      Else
        (Sender as TDBEdit).color:=clWindow;
    End
  Else
    (Sender as TDBEdit).color:=clWindow;
end;

procedure TFrmDespImov.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar,Flag:Boolean;
  x:Integer;
  Tabela: TTable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbDespImov.DatabaseName;
  Tabela.TableName := dmDados.tbDespImov.TableName;
  Tabela.Open;
  //Campo que n�o pode estar vazio
  If dbeCod.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'C�d. do Im�vel';
    Gravar:=False;
    Vazio:=True;
    end;
  If dbAno.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Ano';
    Gravar:=False;
    Vazio:=True;
    end;
  //Campos com uso de Combo
  If cmbIptu.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'IPTU';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to cmbIptu.Items.Count-1 Do
      If cmbIptu.Text=cmbIptu.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor do campo IPTU inv�lido!');
      Gravar:=False;
      End;
    End;
  If cmbSeguro.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Seguro';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to cmbSeguro.Items.Count-1 Do
      If cmbSeguro.Text=cmbSeguro.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor do campo SEGURO inv�lido!');
      Gravar:=False;
      End;
    End;
  If cmbCondom.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Condom�nio';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to cmbCondom.Items.Count-1 Do
      If cmbIptu.Text=cmbCondom.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor do campo CONDOM�NIO inv�lido!');
      Gravar:=False;
      End;
    End;
  If cmbAgua.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'�gua';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to cmbAgua.Items.Count-1 Do
      If cmbAgua.Text=cmbAgua.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor do campo �GUA inv�lido!');
      Gravar:=False;
      End;
    End;
  If cmbLuz.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Luz';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to cmbLuz.Items.Count-1 Do
      If cmbLuz.Text=cmbLuz.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor do campo LUZ inv�lido!');
      Gravar:=False;
      End;
    End;
  //Campo que tem conte�do de outra Tabela
  If dbeCod.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'C�d. do Im�vel';
    Gravar:=False;
    Vazio:=True;
    end
  Else
    If Not(dmDados.TbCadImovel.Locate('CodImo',dbeCod.Text,[])) Then
      Begin
      Showmessage(' C�DIGO  n�o Cadastrado!!');
      Gravar:=False;
      End;
  If Gravar Then
    Begin
    DMDados.TbDespImov.Post;
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
    dbeCod.Enabled:=False;
    cmbLkEnd.Enabled:= False;
    cmbLkNum.Enabled:=False;
    cmbLkProp.Enabled:=False;
    dbAno.Enabled:=False;
    cmbIptu.Enabled:=False;
    cmbSeguro.Enabled:=False;
    cmbCondom.Enabled:=False;
    cmbAgua.Enabled:=False;
    cmbLuz.Enabled:=False;
    MemoRef.Enabled:=False;
    ShowMessage ('Dados gravados com sucesso!');
    End
  Else
    Begin
      If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      DbeCod.SetFocus;
    end;
Tabela.Free;

end;

procedure TFrmDespImov.BtnCancelarClick(Sender: TObject);
begin
NovoItem:=False;
dmdados.TbDespImov.cancel;
{Desabilitando os bot�es}
BtnCancelar.Enabled := false;
BtnAlterar.Enabled:=True;
BtnDeletar.Enabled:=True;
BtnNovo.Enabled:=True;
{Desabilitando os Componentes}
dbeCod.Enabled:=False;
cmbLkEnd.Enabled:= False;
cmbLkNum.Enabled:=False;
cmbLkProp.Enabled:=False;
dbAno.Enabled:=False;
cmbIptu.Enabled:=False;
cmbSeguro.Enabled:=False;
cmbCondom.Enabled:=False;
cmbAgua.Enabled:=False;
cmbLuz.Enabled:=False;
MemoRef.Enabled:=False;
end;

procedure TFrmDespImov.BtnAlterarClick(Sender: TObject);
begin
novoitem:=true;
dmdados.tbDespImov.Edit;
{habilitando os componentes}
btncancelar.Enabled:=true;
btngravar.Enabled:=true;
btnnovo.Enabled:=false;
btnprimeiro.Enabled:=false;
btnanterior.Enabled:=false;
btnproximo.Enabled:=false;
btnultimo.Enabled:=false;
{Habilitando os Componentes}
dbeCod.Enabled:=True;
cmbLkEnd.Enabled:= True;
cmbLkNum.Enabled:=True;
cmbLkProp.Enabled:=True;
dbAno.Enabled:=True;
cmbIptu.Enabled:=True;
cmbSeguro.Enabled:=True;
cmbCondom.Enabled:=True;
cmbAgua.Enabled:=True;
cmbLuz.Enabled:=True;
MemoRef.Enabled:=True;
dbeCod.SetFocus;
end;

procedure TFrmDespImov.BtnDeletarClick(Sender: TObject);
begin
NovoItem:=False;
if dmdados.tbDespImov.RecordCount=0 then
begin
ShowMessage('Tabela sem registro');
end
else
If application.MessageBox('Tem certeza que deseja exluir esse registro?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
   dmdados.tbDespImov.Delete
   else
   dmdados.TbDespImov.Cancel;
end;

procedure TFrmDespImov.btnLocPropClick(Sender: TObject);
begin
If (dmdados.TbDespImov.State=dsinsert)or (dmdados.TbDespImov.State=dsedit) Then
  Begin
  FrmLocImov:=TFrmLocImov.create(application);
  FrmLocImov.Showmodal;
  dbecod.Text:= IntToStr(FrmLocImov.resultado);
  End;
End;  


end.
