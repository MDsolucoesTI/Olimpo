//////////////////////////////////////////////////////////////////////////
// Criacao...........: 05/2002
// Sistema...........: Metallum - Controle de Serviços
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, fcOutlookList, fcButton, fcImgBtn, fcShapeBtn,DB,
  ExtCtrls, fcClearPanel, fcButtonGroup, fcOutlookBar, StdCtrls, DBCtrls,
  CurrEdit, Mask, ToolEdit, rmBaseEdit, DCStdCtrls, ahmtleds,dbTables,
  SRLabel, RXCtrls, RXDBCtrl, EHintBal, EDBDate, EFocCol, EDBTime, RxDBComb,
  RackCtls, jpeg, TFlatPanelUnit;

type
  TFrmOS = class(TForm)
    outbarOS: TfcOutlookBar;
    outbarOSfcShapeBtn1: TfcShapeBtn;
    fcOutlookBar1OutlookList1: TfcOutlookList;
    ImageList1: TImageList;
    pcOS: TDCPageControl;
    PgAbrirOS: TDCPage;
    PgExecOS: TDCPage;
    PgFechOS: TDCPage;
    btlocCli: TfcImageBtn;
    dbDefCli: TDBMemo;
    dbObsAb: TDBMemo;
    btnNovoAbre: TfcImageBtn;
    btnGravarAbre: TfcImageBtn;
    btnCancelarAbre: TfcImageBtn;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel10: TRxLabel;
    RxLabel11: TRxLabel;
    RxLabel12: TRxLabel;
    RxLabel14: TRxLabel;
    credtValorPre: TRxDBCalcEdit;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    RxLabel15: TRxLabel;
    RxLabel16: TRxLabel;
    RxLabel17: TRxLabel;
    RxLabel18: TRxLabel;
    RxLabel19: TRxLabel;
    DBMemo1: TDBMemo;
    dbDefEnc: TDBMemo;
    dbDataAprov: TDBDateEdit;
    dbOBS: TDBMemo;
    btnPrimeiroEx: TfcImageBtn;
    btnAnteriorEx: TfcImageBtn;
    btnProximoEx: TfcImageBtn;
    btnUltimoEx: TfcImageBtn;
    btnAlterarEx: TfcImageBtn;
    btnGravarEx: TfcImageBtn;
    btnCancelarEx: TfcImageBtn;
    btnlocalizarEx: TfcImageBtn;
    RxLabel22: TRxLabel;
    RxLabel23: TRxLabel;
    RxLabel24: TRxLabel;
    RxLabel25: TRxLabel;
    edtValor: TRxDBCalcEdit;
    RxLabel28: TRxLabel;
    RxLabel29: TRxLabel;
    DBText7: TDBText;
    RxLabel30: TRxLabel;
    DBText8: TDBText;
    RxLabel31: TRxLabel;
    DBText9: TDBText;
    RxLabel32: TRxLabel;
    DBText10: TDBText;
    RxLabel33: TRxLabel;
    RxLabel36: TRxLabel;
    DBMemo2: TDBMemo;
    RxLabel37: TRxLabel;
    dbSolucaoFe: TDBMemo;
    RxLabel38: TRxLabel;
    edtValorFe: TRxDBCalcEdit;
    RxLabel39: TRxLabel;
    dbDataEntreFe: TDBDateEdit;
    dbObsFe: TDBMemo;
    RxLabel42: TRxLabel;
    btnPrimeiroFe: TfcImageBtn;
    btnAnteriorFe: TfcImageBtn;
    btnProximoFe: TfcImageBtn;
    btnUltimoFe: TfcImageBtn;
    btnAlterarFe: TfcImageBtn;
    btnGravarFe: TfcImageBtn;
    btnCancelarFe: TfcImageBtn;
    btnLocalizarFe: TfcImageBtn;
    RxLabel43: TRxLabel;
    tmedtHoraEntra: TEvDBTimeEdit;
    dtedtDiaEntra: TDBDateEdit;
    edtCodCli: TDBEdit;
    cmbTipo: TRxDBComboBox;
    dtedtPrevEntre: TDBDateEdit;
    edtCod: TDBEdit;
    edtNumOS: TDBEdit;
    edtHoraEntreFe: TEvDBTimeEdit;
    pgManut: TDCPage;
    RxLabel13: TRxLabel;
    DBText1: TDBText;
    RxLabel26: TRxLabel;
    DBText13: TDBText;
    RxLabel27: TRxLabel;
    DBText14: TDBText;
    RxLabel40: TRxLabel;
    DBText15: TDBText;
    RxLabel41: TRxLabel;
    RxLabel46: TRxLabel;
    DBMdefcli: TDBMemo;
    RxLabel47: TRxLabel;
    DBMdefenc: TDBMemo;
    RxLabel48: TRxLabel;
    RxLabel49: TRxLabel;
    RxLabel51: TRxLabel;
    DBMobs: TDBMemo;
    btnPrimeiroMa: TfcImageBtn;
    btnAnteriorMa: TfcImageBtn;
    btnProximoMa: TfcImageBtn;
    btnUltimoMa: TfcImageBtn;
    btnAlterarMa: TfcImageBtn;
    btnGravarMa: TfcImageBtn;
    btnCancelarMa: TfcImageBtn;
    btnLocalizarMa: TfcImageBtn;
    edtval: TRxDBCalcEdit;
    DBdataaprovacao: TDBDateEdit;
    btnVisualOS: TfcImageBtn;
    Image2: TImage;
    Label2: TLabel;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    RxLabel50: TRxLabel;
    FlatPanel1: TFlatPanel;
    RxLabel20: TRxLabel;
    dbCodRespEx: TDBText;
    RxLabel21: TRxLabel;
    DBText6: TDBText;
    FlatPanel2: TFlatPanel;
    RxLabel34: TRxLabel;
    DBText11: TDBText;
    RxLabel35: TRxLabel;
    DBText12: TDBText;
    FlatPanel3: TFlatPanel;
    RxLabel44: TRxLabel;
    DBText16: TDBText;
    RxLabel45: TRxLabel;
    DBText17: TDBText;
    FlatPanel4: TFlatPanel;
    RxLabel8: TRxLabel;
    edtCodTec: TDBEdit;
    btLocFunc: TfcImageBtn;
    RxLabel9: TRxLabel;
    lblNomeTec: TDBText;
    procedure fcOutlookBar1OutlookList1Items4Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure dtedtDiaEntraExit(Sender: TObject);
    procedure fcOutlookBar1OutlookList1Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure btnNovoAbreClick(Sender: TObject);
    procedure edtNumOSExit(Sender: TObject);
    procedure btnGravarAbreClick(Sender: TObject);
    procedure edtCodCliExit(Sender: TObject);
    procedure tmedtHoraEntraExit(Sender: TObject);
    procedure edtCodTecExit(Sender: TObject);
    procedure dbDefCliExit(Sender: TObject);
    procedure btlocCliClick(Sender: TObject);
    procedure btnCancelarAbreClick(Sender: TObject);
    procedure btnLocalTecicoClick(Sender: TObject);
    procedure btnPrimeiroExClick(Sender: TObject);
    procedure btnAnteriorExClick(Sender: TObject);
    procedure btnProximoExClick(Sender: TObject);
    procedure btnUltimoExClick(Sender: TObject);
    procedure btnAlterarExClick(Sender: TObject);
    procedure btnGravarExClick(Sender: TObject);
    procedure btnCancelarExClick(Sender: TObject);
    procedure btnlocalizarExClick(Sender: TObject);
    procedure dbDefEncExit(Sender: TObject);
    procedure dbDataAprovExit(Sender: TObject);
    procedure btnPrimeiroFeClick(Sender: TObject);
    procedure btnAnteriorFeClick(Sender: TObject);
    procedure btnProximoFeClick(Sender: TObject);
    procedure btnUltimoFeClick(Sender: TObject);
    procedure btnAlterarFeClick(Sender: TObject);
    procedure btnGravarFeClick(Sender: TObject);
    procedure btnCancelarFeClick(Sender: TObject);
    procedure btnLocalizarFeClick(Sender: TObject);
    procedure btnPrimeiroMaClick(Sender: TObject);
    procedure btnAnteriorMaClick(Sender: TObject);
    procedure btnProximoMaClick(Sender: TObject);
    procedure btnUltimoMaClick(Sender: TObject);
    procedure btnAlterarMaClick(Sender: TObject);
    procedure btnGravarMaClick(Sender: TObject);
    procedure btnCancelarMaClick(Sender: TObject);
    procedure btnLocalizarMaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure fcOutlookBar1OutlookList1Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items2Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList1Items3Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure btnVisualOSClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbSolucaoFeExit(Sender: TObject);
    procedure dbDataEntreFeExit(Sender: TObject);
    procedure edtHoraEntreFeExit(Sender: TObject);
    procedure tmedtHoraEntraEnter(Sender: TObject);
    procedure cmbTipoExit(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOS: TFrmOS;
  NovoItem : boolean;

implementation

uses unitDmDados, unitLocCliente, UnitLocFunc, untVisualOS, UnitlocOS,
  untQROSAberta;

{$R *.dfm}

procedure TFrmOS.fcOutlookBar1OutlookList1Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  Close;
end;

procedure TFrmOS.dtedtDiaEntraExit(Sender: TObject);
begin
  if NovoItem then
    if dtedtDiaEntra.Text='  /  /    ' then
      begin
      ShowMessage('� necess�rio informar a DIA DE ENTRADA');
      dtedtDiaEntra.SetFocus;
      end
    else
      try
        StrToDate(dtedtDiaEntra.Text);
      except
        on EConvertError do
          begin
          ShowMessage ('Data Inv�lida!');
          dtedtDiaEntra.SetFocus;
          end;
      end;
end;

procedure TFrmOS.fcOutlookBar1OutlookList1Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  dmDados.tbOs.Filtered:=False;
  pcOS.ActivePage:=PgAbrirOS;
  NovoItem:=False;
end;

procedure TFrmOS.btnNovoAbreClick(Sender: TObject);
begin
  NovoItem:=True;
  // Bot�es
  dmDados.tbOs.Append;
  btnNovoAbre.Enabled:=False;
  btnGravarAbre.Enabled:=True;
  btnCancelarAbre.Enabled:=True;
  // Componentes
  edtNumOS.Enabled:=True;
  edtNumOS.Clear;
  cmbTipo.Enabled:=True;
  edtCodCli.Enabled:=True;
  dtedtDiaEntra.Enabled:=True;
  dtedtDiaEntra.Text:=DateToStr(Date);
  tmedtHoraEntra.Enabled:=True;
  tmedtHoraEntra.Text:=TimeToStr(Time);
  edtCodTec.Enabled:=True;
  dbDefCli.Enabled:=True;
  dtedtPrevEntre.Enabled:=True;
  dtedtPrevEntre.Text:=DateToStr(Date);
  credtValorPre.Enabled:=True;
  credtValorPre.Value:=50;
  dbObsAb.Enabled:=True;
  edtNumOS.setfocus;
end;

procedure TFrmOS.edtNumOSExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  If NovoItem Then
    Begin
    Tabela := TTable.Create(Application);
    Tabela.DatabaseName := dmDados.tbOs.DatabaseName;
    Tabela.TableName := dmDados.tbOs.TableName;
    Tabela.IndexName := dmdados.TbOs.IndexName;
    Tabela.Open;

    If edtNumOS.Text= '' then
      begin
      ShowMessage('� obrigat�rio o N�mero da OS');
      edtNumOS.SetFocus;
      end
    else
      If Tabela.Locate('Numero',edtNumOS.Text,[]) Then
        If Not((DmDados.tbOs.State=dsEdit) And (dmDados.tbOs.RecNo = Tabela.RecNo)) Then
          Begin
          Showmessage('N�MERO DE OS j� Cadastrada');
          edtNumOS.Clear;
          edtNumOS.setfocus;
          End;
    Tabela.Free;
    End;
end;



procedure TFrmOS.btnGravarAbreClick(Sender: TObject);
var
  Campos:String;
  Vazio,Gravar:Boolean;
  Tabela: TTable;
  vCodOs:integer;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbOs.DatabaseName;
  Tabela.TableName := dmDados.tbos.TableName;
  Tabela.IndexName := dmdados.Tbos.IndexName;
  Tabela.Open;

  If edtNumOS.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'N�mero da OS';
    Gravar:=False;
    Vazio:=True;
    end
  else
    If Tabela.Locate('Numero',edtNumOS.Text,[]) Then
      If Not((DmDados.tbOs.State=dsEdit) And (dmDados.tbOs.RecNo = Tabela.RecNo)) Then
        Begin
        Showmessage('N�MERO DE OS j� Cadastrada');
        edtNumOS.Clear;
        edtNumOS.setfocus;
        End;


  If edtcodcli.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'C�digo do cliente';
    Gravar:=False;
    Vazio:=True;
    end;

  If tmedthoraentra.Text= '00:00' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Hora da entrada';
    Gravar:=False;
    Vazio:=True;
    end;

  If edtcodtec.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'C�digo do T�cnico Respons�vel';
    Gravar:=False;
    Vazio:=True;
    end;

  If dbdefcli.Text= '' then
    begin
    If Length(Campos)>0 Then
    Campos:=Campos+', ';
    Campos:=Campos+'Defeito detectado pelo cliente';
    Gravar:=False;
    Vazio:=True;
    end;

  If Gravar Then
    Begin
    dmdados.tbOsAberto.Value:='A';
    DMDados.Tbos.Post;
    NovoItem:=False;
    With dmDados.tbOs Do
      Begin
      vCodOS:=dmdados.tbOsCodOs.Value;
      SetRangeStart;
      FieldByName('CodOS').AsInteger:=vCodOS;
      SetRangeEnd;
      FieldByName('CodOS').AsInteger:=vCodOS;
      ApplyRange;
      End;
    qrOSAberta:=tqrOSAberta.Create(Application);
    qrOSAberta.Preview;
    qrOSAberta.Free;
    dmDados.tbOs.CancelRange;
    {bot�es}
    btnGravarAbre.Enabled:=false;
    btnCancelarAbre.Enabled:=false;
    btnNovoAbre.Enabled:=true;
    {desabilitando os componentes}
    edtNumOS.Enabled:=false;
    cmbTipo.Enabled:=false;
    edtCodCli.Enabled:=false;
    dtedtDiaEntra.Enabled:=false;
    tmedtHoraEntra.Enabled:=false;
    edtCodTec.Enabled:=false;
    dbDefCli.Enabled:=false;
    dtedtPrevEntre.Enabled:=false;
    credtValorPre.Enabled:=false;
    dbObsAb.Enabled:=false;
    ShowMessage ('Dados gravados com sucesso!');
    End
  Else
    Begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      edtNumOS.SetFocus;
    end;
  Tabela.Free;
end;


procedure TFrmOS.edtCodCliExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If edtcodcli.Text= '' then
       Begin
       ShowMessage('� obrigat�rio o C�DIGO DO CLIENTE');
       edtcodcli.SetFocus;
       End
    else
       begin
       if not dmdados.tbCliente.Locate('CodCli',edtcodcli.Text,[]) then
          begin
          ShowMessage('Cliente n�o cadastrado');
          edtcodcli.SetFocus;
          end;
       end;
    end;
end;

procedure TFrmOS.tmedtHoraEntraExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If tmedthoraentra.Text= '00:00' then
      Begin
      ShowMessage('� obrigat�rio a HORA DE ENTRADA');
      tmedthoraentra.SetFocus;
      End
    end;
end;

procedure TFrmOS.edtCodTecExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If edtcodtec.Text= '' then
       Begin
       ShowMessage('� obrigat�rio o C�DIGO DO FUNCION�RIO RESPONS�VEL');
       edtcodtec.SetFocus;
       End
    else
       begin
       if not dmdados.tbFunc.Locate('Codfunc',edtcodtec.Text,[]) then
          begin
          ShowMessage('Funcion�rio n�o cadastrado');
          edtcodtec.SetFocus;
          end;
       end;
    end;
end;

procedure TFrmOS.dbDefCliExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbdefcli.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar o DEFEITO DETECTADO PELO CLIENTE');
      dbdefcli.SetFocus;
      End
    end;
end;

procedure TFrmOS.btlocCliClick(Sender: TObject);
begin
  if (dmdados.tbOs.State=DsInsert) then
  begin
  frmLoccliente := TfrmLoccliente.Create( Application );
  frmLoccliente.ShowModal;
  dmdados.tbOsCodCli.Value:=frmLoccliente.Resultado;
  frmLoccliente.Free;
  end;
end;

procedure TFrmOS.btnCancelarAbreClick(Sender: TObject);
begin
  dmDados.tbOs.Cancel;
  NovoItem:=False;
  dtedtDiaEntra.Text:=DateToStr(Date);
  tmedtHoraEntra.Text:=timetostr(Time);
  dtedtPrevEntre.Text:=DateToStr(Date);
  credtValorPre.Value:=50;
  edtNumOS.Enabled :=False;
  cmbTipo.Enabled:=False;
  edtCodcli.Enabled:=False;
  dtedtDiaEntra.Enabled:=False;
  tmedtHoraEntra.Enabled:=False;
  edtCodTec.Enabled:=False;
  dbDefCli.Enabled:=False;
  dtedtPrevEntre.Enabled:=False;
  credtValorPre.Enabled:=False;
  dbObsAb.Enabled:=False;
  btnGravarAbre.Enabled:=False;
  btnCancelarAbre.Enabled:=False;
  btnNovoAbre.Enabled:=True;
  btnNovoAbre.SetFocus;

end;

procedure TFrmOS.btnLocalTecicoClick(Sender: TObject);
begin
  if (dmdados.tbOs.State=DsInsert) then
  begin
  frmLocfunc := TfrmLocfunc.Create( Application );
  frmLocfunc.ShowModal;
  dmdados.tbOsCodFunc.Value:=frmLocfunc.Resultado;
  frmLocfunc.Free;
  end;

end;

procedure TFrmOS.btnPrimeiroExClick(Sender: TObject);
begin
  dmdados.tbOS.First;
  BtnPrimeiroEx.Enabled:=False;
  BtnAnteriorEx.Enabled:=False;
  BtnProximoEx.Enabled:=True;
  BtnUltimoEx.Enabled:=True;
end;

procedure TFrmOS.btnAnteriorExClick(Sender: TObject);
begin
  dmDados.tbOS.Prior;
  btnProximoEx.Enabled:=True;
  btnUltimoEx.Enabled:=True;
  If dmdados.TbOS.Bof Then
    Begin
    btnPrimeiroEx.Enabled:=False;
    btnAnteriorEx.Enabled:=False;
    End;
end;

procedure TFrmOS.btnProximoExClick(Sender: TObject);
begin
  dmDados.tbOS.Next;
  btnPrimeiroEx.Enabled:=True;
  btnAnteriorEx.Enabled:=True;
  If dmdados.tbOS.Eof Then
    Begin
    btnProximoEx.Enabled:=False;
    btnUltimoEx.Enabled:=False;
    End;
end;

procedure TFrmOS.btnUltimoExClick(Sender: TObject);
begin
  dmDados.tbOS.Last;
  btnPrimeiroEx.Enabled:=True;
  btnAnteriorEx.Enabled:=True;
  btnProximoEx.Enabled:=False;
  btnUltimoEx.Enabled:=False;
end;

procedure TFrmOS.btnAlterarExClick(Sender: TObject);
begin
  dmDados.tbOS.Edit;
  NovoItem:=True;
  btnPrimeiroEx.Enabled:=False;
  btnAnteriorEx.Enabled:=False;
  btnProximoEx.Enabled:=False;
  btnUltimoEx.Enabled:=False;
  btnAlterarEx.Enabled:=False;
  btnGravarEx.Enabled:=True;
  btnCancelarEx.Enabled:=True;
  btnLocalizarEx.Enabled:=False;

  dbDefEnc.Enabled:=True;
  edtValor.Enabled:=True;
  dbDataAprov.Enabled:=True;
  dbObs.Enabled:=True;
  dbDefEnc.SetFocus;
end;

procedure TFrmOS.btnGravarExClick(Sender: TObject);
begin
  dmDados.tbOs.Post;
  NovoItem:=False;
  btnPrimeiroEx.Enabled:=True;
  btnAnteriorEx.Enabled:=True;
  btnProximoEx.Enabled:=True;
  btnUltimoEx.Enabled:=True;
  btnAlterarEx.Enabled:=True;
  btnGravarEx.Enabled:=False;
  btnCancelarEx.Enabled:=False;
  btnLocalizarEx.Enabled:=True;

  dbDefEnc.Enabled:=false;
  edtValor.Enabled:=false;
  dbDataAprov.Enabled:=false;
  dbObs.Enabled:=false;

  btnAlterarEx.SetFocus;
end;

procedure TFrmOS.btnCancelarExClick(Sender: TObject);
begin
  dmDados.tbOs.Cancel;
  NovoItem:=False;
  btnPrimeiroEx.Enabled:=True;
  btnAnteriorEx.Enabled:=True;
  btnProximoEx.Enabled:=True;
  btnUltimoEx.Enabled:=True;
  btnAlterarEx.Enabled:=True;
  btnGravarEx.Enabled:=False;
  btnCancelarEx.Enabled:=False;
  btnLocalizarEx.Enabled:=True;

  dbDefEnc.Enabled:=False;
  edtValor.Enabled:=False;
  dbDataAprov.Enabled:=False;
  dbObs.Enabled:=False;
  btnAlterarEx.SetFocus;
end;

procedure TFrmOS.btnlocalizarExClick(Sender: TObject);
begin
  FrmLocOS:=TFrmLocOS.Create(Application);
  FrmLocOS.showmodal;
end;

procedure TFrmOS.dbDefEncExit(Sender: TObject);
begin
  if NovoItem then
    If dbDefEnc.Text='' Then
      Begin
      MessageBox(frmOS.Handle,'� necess�rio informar o Defeito !!!',
        'Alerta de Dados n�o Informados',MB_ICONWARNING);
      dbDefEnc.SetFocus;
      End;
end;

procedure TFrmOS.dbDataAprovExit(Sender: TObject);
begin
  If NovoItem then
    If edtValor.Value > 0 Then
      If dbDataAprov.Text='  /  /    ' Then
        Begin
        MessageBox(frmOS.Handle,'� necess�rio informar o Dia de Aprova��o do Valor !!!',
          'Alerta de Dados n�o Informados',MB_ICONWARNING);
        dbDataAprov.SetFocus;
        End;
end;

procedure TFrmOS.btnPrimeiroFeClick(Sender: TObject);
begin
  dmdados.tbOS.First;
  BtnPrimeiroFe.Enabled:=False;
  BtnAnteriorFe.Enabled:=False;
  BtnProximoFe.Enabled:=True;
  BtnUltimoFe.Enabled:=True;
end;

procedure TFrmOS.btnAnteriorFeClick(Sender: TObject);
begin
  dmDados.tbOS.Prior;
  btnProximoFe.Enabled:=True;
  btnUltimoFe.Enabled:=True;
  If dmdados.TbOS.Bof Then
    Begin
    btnPrimeiroFe.Enabled:=False;
    btnAnteriorFe.Enabled:=False;
    End;
end;

procedure TFrmOS.btnProximoFeClick(Sender: TObject);
begin
  dmDados.tbOS.Next;
  btnPrimeiroFe.Enabled:=True;
  btnAnteriorFe.Enabled:=True;
  If dmdados.tbOS.Eof Then
    Begin
    btnProximoFe.Enabled:=False;
    btnUltimoFe.Enabled:=False;
    End;
end;

procedure TFrmOS.btnUltimoFeClick(Sender: TObject);
begin
  dmDados.tbOS.Last;
  btnPrimeiroFe.Enabled:=True;
  btnAnteriorFe.Enabled:=True;
  btnProximoFe.Enabled:=False;
  btnUltimoFe.Enabled:=False;
end;

procedure TFrmOS.btnAlterarFeClick(Sender: TObject);
begin
  dmDados.tbOS.Edit;
  NovoItem:=True;
  btnPrimeiroFe.Enabled:=False;
  btnAnteriorFe.Enabled:=False;
  btnProximoFe.Enabled:=False;
  btnUltimoFe.Enabled:=False;
  btnAlterarFe.Enabled:=False;
  btnGravarFe.Enabled:=True;
  btnCancelarFe.Enabled:=True;
  btnLocalizarFe.Enabled:=False;

  dbSolucaoFe.Enabled:=True;
  edtvalorfe.Enabled:=true;
  dbDataEntreFe.Enabled:=True;
  edtHoraEntreFe.Enabled:=True;
  dbObsfe.Enabled:=True;
  dbSolucaoFe.SetFocus;
end;

procedure TFrmOS.btnGravarFeClick(Sender: TObject);
begin
  dmDados.tbOsAberto.Value:='F';
  dmDados.tbOs.Post;
  NovoItem:=False;
  btnPrimeiroFe.Enabled:=True;
  btnAnteriorFe.Enabled:=True;
  btnProximoFe.Enabled:=True;
  btnUltimoFe.Enabled:=True;
  btnAlterarFe.Enabled:=True;
  btnGravarFe.Enabled:=False;
  btnCancelarFe.Enabled:=False;
  btnLocalizarFe.Enabled:=True;

  dbSolucaoFe.Enabled:=false;
  edtvalorfe.Enabled:=false;
  dbDataEntreFe.Enabled:=false;
  edtHoraEntreFe.Enabled:=false;
  dbObsfe.Enabled:=false;

  btnAlterarFe.SetFocus;
end;

procedure TFrmOS.btnCancelarFeClick(Sender: TObject);
begin
  dmDados.tbOs.Cancel;
  NovoItem:=False;
  btnPrimeiroFe.Enabled:=True;
  btnAnteriorFe.Enabled:=True;
  btnProximoFe.Enabled:=True;
  btnUltimoFe.Enabled:=True;
  btnAlterarFe.Enabled:=True;
  btnGravarFe.Enabled:=False;
  btnCancelarFe.Enabled:=False;
  btnLocalizarFe.Enabled:=True;

  dbSolucaoFe.Enabled:=false;
  edtvalorfe.Enabled:=false;
  dbDataEntreFe.Enabled:=false;
  edtHoraEntreFe.Enabled:=false;
  dbObsfe.Enabled:=false;

  btnAlterarFe.SetFocus;
end;

procedure TFrmOS.btnLocalizarFeClick(Sender: TObject);
begin
  FrmLocOS:=TFrmLocOS.Create(Application);
  FrmLocOS.showmodal;
  frmLocOs.Free;
end;


procedure TFrmOS.btnPrimeiroMaClick(Sender: TObject);
begin
  dmdados.tbOS.First;
  edtVal.Value:=dmDados.tbOsValor.Value;
  BtnPrimeiroMa.Enabled:=False;
  BtnAnteriorMa.Enabled:=False;
  BtnProximoMa.Enabled:=True;
  BtnUltimoMa.Enabled:=True;
end;

procedure TFrmOS.btnAnteriorMaClick(Sender: TObject);
begin
  dmDados.tbOS.Prior;
  edtVal.Value:=dmDados.tbOsValor.Value;
  btnProximoMa.Enabled:=True;
  btnUltimoMa.Enabled:=True;
  If dmdados.TbOS.Bof Then
    Begin
    btnPrimeiroMa.Enabled:=False;
    btnAnteriorMa.Enabled:=False;
    End;
end;

procedure TFrmOS.btnProximoMaClick(Sender: TObject);
begin
  dmDados.tbOS.Next;
  edtVal.Value:=dmDados.tbOsValor.Value;
  btnPrimeiroMa.Enabled:=True;
  btnAnteriorMa.Enabled:=True;
  If dmdados.TbOs.Eof Then
    Begin
    btnProximoMa.Enabled:=False;
    btnUltimoMa.Enabled:=False;
    End;
end;

procedure TFrmOS.btnUltimoMaClick(Sender: TObject);
begin
  dmDados.tbOS.Last;
  edtVal.Value:=dmDados.tbOsValor.Value;
  btnPrimeiroMa.Enabled:=True;
  btnAnteriorMa.Enabled:=True;
  btnProximoMa.Enabled:=False;
  btnUltimoMa.Enabled:=False;
end;

procedure TFrmOS.btnAlterarMaClick(Sender: TObject);
begin
  dmDados.tbOS.Edit;
  btnPrimeiroMa.Enabled:=False;
  btnAnteriorMa.Enabled:=False;
  btnProximoMa.Enabled:=False;
  btnUltimoMa.Enabled:=False;
  btnAlterarMa.Enabled:=False;
  btnGravarMa.Enabled:=True;
  btnCancelarMa.Enabled:=True;
  btnLocalizarMa.Enabled:=False;
  dbmdefcli.Enabled:=true;
  dbmdefenc.Enabled:=true;
  edtval.Enabled:=true;
  dbdataaprovacao.Enabled:=true;
  dbmobs.Enabled:=true;
  dbmdefcli.SetFocus;
end;

procedure TFrmOS.btnGravarMaClick(Sender: TObject);
begin
  dmDados.tbOsValor.Value:=edtVal.Value;
  dmDados.tbOs.Post;
  btnPrimeiroMa.Enabled:=True;
  btnAnteriorMa.Enabled:=True;
  btnProximoMa.Enabled:=True;
  btnUltimoMa.Enabled:=True;
  btnAlterarMa.Enabled:=True;
  btnGravarMa.Enabled:=False;
  btnCancelarMa.Enabled:=False;
  btnLocalizarMa.Enabled:=True;

  dbmdefcli.Enabled:=false;
  dbmdefenc.Enabled:=false;
  edtval.Enabled:=false;
  dbdataaprovacao.Enabled:=false;
  dbmobs.Enabled:=false;
  
  btnAlterarMa.SetFocus;
end;

procedure TFrmOS.btnCancelarMaClick(Sender: TObject);
begin
  dmDados.tbOs.Cancel;
  btnPrimeiroMa.Enabled:=True;
  btnAnteriorMa.Enabled:=True;
  btnProximoMa.Enabled:=True;
  btnUltimoMa.Enabled:=True;
  btnAlterarMa.Enabled:=True;
  btnGravarMa.Enabled:=False;
  btnCancelarMa.Enabled:=False;
  btnLocalizarMa.Enabled:=True;

  dbmdefcli.Enabled:=false;
  dbmdefenc.Enabled:=false;
  edtval.Enabled:=false;
  dbdataaprovacao.Enabled:=false;
  dbmobs.Enabled:=false;

  btnAlterarMa.SetFocus;
end;

procedure TFrmOS.btnLocalizarMaClick(Sender: TObject);
begin
  FrmLocOS:=TFrmLocOS.Create(Application);
  FrmLocOS.showmodal;
end;

procedure TFrmOS.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
  Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
  End;
end;

procedure TFrmOS.FormShow(Sender: TObject);
begin
  pcOs.activePage:=PgAbrirOS;                                                  
end;

procedure TFrmOS.fcOutlookBar1OutlookList1Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  dmDados.tbOs.Filtered:=true;
  pcOS.ActivePage:=PgExecOS;
  NovoItem:=False;
end;

procedure TFrmOS.fcOutlookBar1OutlookList1Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  dmDados.tbOs.Filtered:=true;
  pcOS.ActivePage:=PgFechOS;
  NovoItem:=False;
end;

procedure TFrmOS.fcOutlookBar1OutlookList1Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  dmDados.tbOs.Filtered:=True;
  pcOs.ActivePage:=pgManut;
  NovoItem:=False;
end;

procedure TFrmOS.btnVisualOSClick(Sender: TObject);
begin
  dmDados.tbOsVisual.Filtered:=False;
  dmDados.tbOsVisual.Filter:='(CodCli = '''+IntToStr(dmDados.tbOsCodCli.Value)+''') And '+
                             '(Aberto = '''+'F'+''')';
  dmDados.tbOsVisual.Filtered:=True;
  frmVisualOS:=TfrmVisualOS.Create(Application);
  frmVisualOS.ShowModal;

end;

procedure TFrmOS.FormCreate(Sender: TObject);
begin
  dmDados.tbOs.Filtered:=False;
  dmDados.tbOs.Filter:='(Aberto = '''+'A'+''')';
  dmDados.tbOs.Filtered:=True;
end;

procedure TFrmOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmDados.tbOs.Filtered:=False;
  dmDados.tbOs.Filter:='';
  Action:=caFree;
end;

procedure TFrmOS.dbSolucaoFeExit(Sender: TObject);
begin
  if NovoItem then
    If dbSolucaoFe.Text='' Then
      Begin
      MessageBox(frmOS.Handle,'� necess�rio informar a Solu��o Dada !!!',
        'Alerta de Dados n�o Informados',MB_ICONWARNING);
      dbSolucaoFe.SetFocus;
      End;
end;

procedure TFrmOS.dbDataEntreFeExit(Sender: TObject);
begin
  if NovoItem then
    If dbDataEntreFe.Text='  /  /    ' Then
      Begin
      MessageBox(frmOS.Handle,'� necess�rio informar o Dia de Entrega do Equipamento !!!',
        'Alerta de Dados n�o Informados',MB_ICONWARNING);
      dbDataEntreFe.SetFocus;
      End;
end;

procedure TFrmOS.edtHoraEntreFeExit(Sender: TObject);
begin
  if NovoItem then
    If edtHoraEntreFe.TimeValue=StrToTime('00:00') Then
      Begin
      MessageBox(frmOS.Handle,'� necess�rio informar a Hora de Entrada !!!',
        'Alerta de Dados n�o Informados',MB_ICONWARNING);
      edtHoraEntreFe.SetFocus;
      End;
end;

procedure TFrmOS.tmedtHoraEntraEnter(Sender: TObject);
begin
  tmedtHoraEntra.Text:=TimeToStr(Time);
end;

procedure TFrmOS.cmbTipoExit(Sender: TObject);
begin
  if NovoItem then
    if cmbTipo.Text='' then
      begin
      MessageBox(frmOS.Handle,'� necess�rio informar o TIPO DA OS !!!',
        'Alerta de Dados n�o Informados',MB_ICONWARNING);
      cmbTipo.SetFocus;
      end;
end;

procedure TFrmOS.edtValorExit(Sender: TObject);
begin
  if NovoItem then
    if edtValor.Value=0 then
      begin
      MessageBox(frmOS.Handle,'� necess�rio informar o VALOR DA OS !!!',
        'Alerta de Dados n�o Informados',MB_ICONWARNING);
      edtValor.SetFocus;
      end;
end;

end.
