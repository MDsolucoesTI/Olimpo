//////////////////////////////////////////////////////////////////////////
// Criacao...........: 05/2002
// Sistema...........: Metallum - Controle de Serviços
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, fcOutlookList, fcButton, fcImgBtn, fcShapeBtn,db,dbTables,
  ExtCtrls, fcClearPanel, fcButtonGroup, fcOutlookBar, ImgList, StdCtrls,
  DBCtrls, Mask, ToolEdit, RXDBCtrl, RXCtrls, DCStdCtrls, EHintBal,
  TFlatComboBoxUnit, EFocCol, EDBTime, jpeg, RackCtls, RxGIF;

type
  TFrmAgenda = class(TForm)
    OutBar: TfcOutlookBar;
    OutBarShp: TfcShapeBtn;
    OutBarOutlookList1: TfcOutlookList;
    ImageList4: TImageList;
    DCPageControl1: TDCPageControl;
    PgAgendar: TDCPage;
    PgFech: TDCPage;
    PgVisu: TDCPage;
    PgServAb: TDCPage;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    btLocAgVi: TfcImageBtn;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel8: TRxLabel;
    RxLabel9: TRxLabel;
    GroupBox4: TGroupBox;
    Bevel4: TBevel;
    RxLabel10: TRxLabel;
    RxLabel12: TRxLabel;
    RxLabel14: TRxLabel;
    RxLabel15: TRxLabel;
    RxLabel17: TRxLabel;
    RxLabel13: TRxLabel;
    RxLabel16: TRxLabel;
    dbTecnicoVis: TDBText;
    dbEnderVis: TDBText;
    dbBairroVis: TDBText;
    dbCidVis: TDBText;
    dbNumVis: TDBText;
    dbComplVis: TDBText;
    dbTelVis: TDBText;
    btnPrimeiroVi: TfcImageBtn;
    btnAnteriorVi: TfcImageBtn;
    btnProximoVi: TfcImageBtn;
    btnUltimoVi: TfcImageBtn;
    btLocOS: TfcImageBtn;
    RxLabel20: TRxLabel;
    RxLabel21: TRxLabel;
    RxLabel22: TRxLabel;
    RxLabel23: TRxLabel;
    RxLabel24: TRxLabel;
    RxLabel25: TRxLabel;
    RxLabel26: TRxLabel;
    GroupBox1: TGroupBox;
    Bevel1: TBevel;
    RxLabel27: TRxLabel;
    RxLabel29: TRxLabel;
    RxLabel30: TRxLabel;
    RxLabel31: TRxLabel;
    RxLabel32: TRxLabel;
    RxLabel33: TRxLabel;
    RxLabel34: TRxLabel;
    dbTecnico: TDBText;
    dbEnder: TDBText;
    dbBairro: TDBText;
    dbCidade: TDBText;
    dbNum: TDBText;
    dbCompl: TDBText;
    dbTel: TDBText;
    RxLabel18: TRxLabel;
    btnPositivo: TfcImageBtn;
    btnNegativo: TfcImageBtn;
    RxLabel19: TRxLabel;
    btLocAgenda: TfcImageBtn;
    RxLabel36: TRxLabel;
    RxLabel37: TRxLabel;
    RxLabel38: TRxLabel;
    RxLabel39: TRxLabel;
    RxLabel40: TRxLabel;
    RxLabel41: TRxLabel;
    RxLabel42: TRxLabel;
    GroupBox2: TGroupBox;
    Bevel2: TBevel;
    RxLabel43: TRxLabel;
    RxLabel45: TRxLabel;
    RxLabel46: TRxLabel;
    RxLabel47: TRxLabel;
    RxLabel48: TRxLabel;
    RxLabel49: TRxLabel;
    RxLabel50: TRxLabel;
    dbTecFech: TDBText;
    dbEnderFech: TDBText;
    dbBairroFech: TDBText;
    dbCidFech: TDBText;
    dbNumFech: TDBText;
    dbComplFech: TDBText;
    dbTelFEch: TDBText;
    RxLabel35: TRxLabel;
    btnPrimeiroFe: TfcImageBtn;
    btnAnteriorFe: TfcImageBtn;
    btnProximoFe: TfcImageBtn;
    btnUltimoFe: TfcImageBtn;
    RxLabel51: TRxLabel;
    RxLabel52: TRxLabel;
    RxLabel53: TRxLabel;
    RxLabel54: TRxLabel;
    RxLabel55: TRxLabel;
    RxLabel56: TRxLabel;
    RxLabel57: TRxLabel;
    GroupBox3: TGroupBox;
    Bevel3: TBevel;
    RxLabel59: TRxLabel;
    RxLabel61: TRxLabel;
    RxLabel62: TRxLabel;
    RxLabel63: TRxLabel;
    RxLabel64: TRxLabel;
    RxLabel65: TRxLabel;
    RxLabel66: TRxLabel;
    DBText25: TDBText;
    DBText26: TDBText;
    DBText27: TDBText;
    DBText28: TDBText;
    DBText30: TDBText;
    DBText31: TDBText;
    DBText32: TDBText;
    dbCodAg: TDBEdit;
    dbeCodOs: TDBEdit;
    dbNumOSAg: TDBEdit;
    dbCodCliAg: TDBEdit;
    dbClienteAg: TDBEdit;
    dbPriorAg: TDBEdit;
    dbCodOSFech: TDBEdit;
    dbCodCliFech: TDBEdit;
    dbNumOSFech: TDBEdit;
    dbClienteFech: TDBEdit;
    dbHorFech: TDBEdit;
    dbDataFech: TDBEdit;
    dbPriorFech: TDBEdit;
    dbSaiCliFech: TDBEdit;
    dbCodOSVis: TDBEdit;
    dbCodCliVis: TDBEdit;
    dbNumOSVis: TDBEdit;
    dbClienteVis: TDBEdit;
    dbHorVis: TDBEdit;
    dbDtVis: TDBEdit;
    dbPriorVis: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    edtdatavi: TDateEdit;
    dbDataAg: TDBDateEdit;
    edtData: TDateEdit;
    btnPosFe: TfcImageBtn;
    btnNegFe: TfcImageBtn;
    btnAlterarFe: TfcImageBtn;
    btnPrimeiroAb: TfcImageBtn;
    btnAnteriorAb: TfcImageBtn;
    btnProximoAb: TfcImageBtn;
    btnUltimoAb: TfcImageBtn;
    cbTempo: TComboBox;
    dbHorAg: TEvDBTimeEdit;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    RxLabel11: TRxLabel;
    Label2: TLabel;
    Image2: TImage;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OutBarOutlookList1Items4Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure OutBarOutlookList1Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure OutBarOutlookList1Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure OutBarOutlookList1Items2Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure OutBarOutlookList1Items3Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure btnPositivoClick(Sender: TObject);
    procedure btnNegativoClick(Sender: TObject);
    procedure btLocOSClick(Sender: TObject);
    procedure btLocAgViClick(Sender: TObject);
    procedure dbeCodOsExit(Sender: TObject);
    procedure btLocAgendaClick(Sender: TObject);
    procedure btnPrimeiroFeClick(Sender: TObject);
    procedure btnAnteriorFeClick(Sender: TObject);
    procedure btnProximoFeClick(Sender: TObject);
    procedure btnUltimoFeClick(Sender: TObject);
    procedure btnPosFeClick(Sender: TObject);
    procedure btnNegFeClick(Sender: TObject);
    procedure btnAlterarFeClick(Sender: TObject);
    procedure btnPrimeiroViClick(Sender: TObject);
    procedure btnAnteriorViClick(Sender: TObject);
    procedure btnProximoViClick(Sender: TObject);
    procedure btnUltimoViClick(Sender: TObject);
    procedure btnPrimeiroAbClick(Sender: TObject);
    procedure btnAnteriorAbClick(Sender: TObject);
    procedure btnProximoAbClick(Sender: TObject);
    procedure btnUltimoAbClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edtdataviExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAgenda: TFrmAgenda;
  NovoItem: Boolean;

implementation

uses unitDmDados, Unit1, UnitlocOS;

{$R *.dfm}

procedure TFrmAgenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= Cafree;
end;

procedure TFrmAgenda.OutBarOutlookList1Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  dmdados.tbAgenda.Cancel;
  Close;
end;

procedure TFrmAgenda.OutBarOutlookList1Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
dmDados.tbAgenda.Filtered:=False;
dmDados.tbAgenda.Append;
NovoItem:=True;
DCPageControl1.ActivePage:=PgAgendar;
dbeCodOs.Enabled:=true;
dbDataAg.Enabled:=true;
dbHorAg.Enabled:=true;
dbPriorAg.Enabled:=true;
dbeCodOs.SetFocus;
end;

procedure TFrmAgenda.OutBarOutlookList1Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  NovoItem:=False;
  dmDados.tbAgenda.Cancel;
  dmDados.tbAgenda.Filtered:=False;
  DCPageControl1.ActivePage:=PgFech;
  edtData.Enabled:=true;
end;

procedure TFrmAgenda.OutBarOutlookList1Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  NovoItem:=False;
  dmDados.tbAgenda.Cancel;
  dmDados.tbAgenda.Filtered:=False;
  DCPageControl1.ActivePage:=PgVisu;
end;

procedure TFrmAgenda.OutBarOutlookList1Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  NovoItem:=False;
  dmDados.tbAgenda.Cancel;
  dmDados.tbAgenda.Filtered:=False;
  dmDados.tbAgenda.Filter:='(Aberto = '''+'A'+''')';
  dmDados.tbAgenda.Filtered:=True;
  DCPageControl1.ActivePage:=PgServAb;
end;

procedure TFrmAgenda.btnPositivoClick(Sender: TObject);
begin
  NovoItem:=False;
  dmDados.tbAgendaAberto.Value:='A';
  dmDados.tbAgenda.Post;
  OutBarOutlookList1.Items[2].Selected:=True;
  DCPageControl1.ActivePage := PgVisu;
end;

procedure TFrmAgenda.btnNegativoClick(Sender: TObject);
begin
  NovoItem:=False;
  dmDados.tbAgenda.Cancel;
  OutBarOutlookList1.Items[2].Selected:=True;
  DCPageControl1.ActivePage :=PgVisu;
end;

procedure TFrmAgenda.btLocOSClick(Sender: TObject);
begin
if (dmdados.tbAgenda.State=dsInsert) then
  begin
  dmDados.tbOs.Filtered:=False;
  dmDados.tbOs.Filter:='(Aberto = '''+'A'+''')';
  dmDados.tbOs.Filtered:=True;
  FrmLocOs:=TFrmLocOs.Create(Application);
  FrmLocOs.ShowModal;
  dmDados.tbAgendaCodOs.Value:=frmLocOs.Resultado;
  dmDados.tbAgendaCodCli.Value:=frmlocos.codcli;
  dmdados.tbAgendaCodFunc.Value:=frmLocOs.CodFunc;
  dmDados.tbOs.Filtered:=False;
  frmLocOs.Free;
  end;
end;

procedure TFrmAgenda.btLocAgViClick(Sender: TObject);
begin
If edtdatavi.Text= '  /  /    ' then
   Begin
   ShowMessage('� obrigat�rio a DATA');
   edtdatavi.SetFocus;
   End
else
   begin
   If (dmDados.tbAgeVisual.Locate('Dia',edtDataVi.Text,[])) Then
     Begin
     dmDados.tbAgeVisual.Filtered:=False;
     dmDados.tbAgeVisual.Filter:='(Dia = '''+edtDataVi.Text+''')';
     dmDados.tbAgeVisual.Filtered:=True;
     End
   Else
    MessageBox(frmAgenda.Handle,'Informa��o n�o Localizada !!!','Resultado da Localiza��o',MB_ICONWARNING);
   end;
end;

procedure TFrmAgenda.dbeCodOsExit(Sender: TObject);
begin
If NovoItem Then
begin
  If dbeCodOs.Text='' Then
     Begin
     ShowMessage('Obrigat�rio informar o C�DIGO da OS');
     dbeCodOS.SetFocus;
     End
  Else
     Begin
       If (VarType(dmDados.tbOs.Lookup('CodOs',dbeCodOs.Text,'CodOs')) in [varNull]) Then
          Begin
          ShowMessage('C�DIGO n�o cadastrado');
          dbeCodOS.SetFocus;
          End
       Else
          Begin
          dmDados.tbOs.Locate('CodOs',dbeCodOs.Text,[]);
          dmDados.tbAgendaCodCli.Value:=dmdados.tbOsCodCli.Value;
          dmdados.tbAgendaCodFunc.Value:=dmdados.tbOsCodFunc.Value;
          End;
     end;
end;
end;

procedure TFrmAgenda.btLocAgendaClick(Sender: TObject);
begin
dmDados.tbAgenda.Filtered:=False;
dmDados.tbAgenda.Filter:='(Aberto = '''+'A'+''') And '+
                         '(Dia = '''+ edtData.Text+''')';
dmDados.tbAgenda.Filtered:=True;
btnAlterarFe.Enabled:=true;

end;

procedure TFrmAgenda.btnPrimeiroFeClick(Sender: TObject);
begin
  dmdados.tbAgenda.First;
  BtnPrimeiroFe.Enabled:=False;
  BtnAnteriorFe.Enabled:=False;
  BtnProximoFe.Enabled:=True;
  BtnUltimoFe.Enabled:=True;
end;

procedure TFrmAgenda.btnAnteriorFeClick(Sender: TObject);
begin
dmDados.tbAgenda.Prior;
  btnProximoFe.Enabled:=True;
  btnUltimoFe.Enabled:=True;
  If dmdados.TbAgenda.Bof Then
    Begin
    btnPrimeiroFe.Enabled:=False;
    btnAnteriorFe.Enabled:=False;
    End;
end;

procedure TFrmAgenda.btnProximoFeClick(Sender: TObject);
begin
  dmDados.tbAgenda.Next;
  btnPrimeiroFe.Enabled:=True;
  btnAnteriorFe.Enabled:=True;
  If dmdados.tbAgenda.Eof Then
    Begin
    btnProximoFe.Enabled:=False;
    btnUltimoFe.Enabled:=False;
    End;
end;

procedure TFrmAgenda.btnUltimoFeClick(Sender: TObject);
begin
  dmDados.tbAgenda.Last;
  btnPrimeiroFe.Enabled:=True;
  btnAnteriorFe.Enabled:=True;
  btnProximoFe.Enabled:=False;
  btnUltimoFe.Enabled:=False;
end;

procedure TFrmAgenda.btnPosFeClick(Sender: TObject);
begin
  NovoItem:=False;
  dmDados.tbAgendaAberto.Value:='F';
  dmDados.tbAgenda.Post;
  btnPrimeiroFe.Enabled:=True;
  btnAnteriorFe.Enabled:=True;
  btnProximoFe.Enabled:=True;
  btnUltimoFe.Enabled:=True;
  btnAlterarFe.Enabled:=True;
  btnPosFe.Enabled:=False;
  btnNegFe.Enabled:=False;
  dbsaiclifech.Enabled:=false;
end;

procedure TFrmAgenda.btnNegFeClick(Sender: TObject);
begin
  NovoItem:=False;
  dmDados.tbAgenda.Cancel;
  btnPrimeiroFe.Enabled:=True;
  btnAnteriorFe.Enabled:=True;
  btnProximoFe.Enabled:=True;
  btnUltimoFe.Enabled:=True;
  btnAlterarFe.Enabled:=True;
  btnPosFe.Enabled:=False;
  btnNegFe.Enabled:=False;
end;

procedure TFrmAgenda.btnAlterarFeClick(Sender: TObject);
begin
  dmDados.tbAgenda.Edit;
  btnPrimeiroFe.Enabled:=False;
  btnAnteriorFe.Enabled:=False;
  btnProximoFe.Enabled:=False;
  btnUltimoFe.Enabled:=False;
  btnAlterarFe.Enabled:=False;
  btnPosFe.Enabled:=True;
  btnNegFe.Enabled:=True;
  edtData.Enabled:=true;
  dbsaiclifech.Enabled:=true;
  dbsaiclifech.SetFocus;
end;

procedure TFrmAgenda.btnPrimeiroViClick(Sender: TObject);
begin
dmdados.tbAgeVisual.First;
  BtnPrimeiroVi.Enabled:=False;
  BtnAnteriorVi.Enabled:=False;
  BtnProximoVi.Enabled:=True;
  BtnUltimoVi.Enabled:=True;
end;

procedure TFrmAgenda.btnAnteriorViClick(Sender: TObject);
begin
dmDados.tbAgeVisual.Prior;
  btnProximoVi.Enabled:=True;
  btnUltimoVi.Enabled:=True;
  If dmdados.TbAgeVisual.Bof Then
    Begin
    btnPrimeiroVi.Enabled:=False;
    btnAnteriorVi.Enabled:=False;
    End;
end;

procedure TFrmAgenda.btnProximoViClick(Sender: TObject);
begin
dmDados.tbAgeVisual.Next;
  btnPrimeiroVi.Enabled:=True;
  btnAnteriorVi.Enabled:=True;
  If dmdados.tbAgeVisual.Eof Then
    Begin
    btnProximoVi.Enabled:=False;
    btnUltimoVi.Enabled:=False;
    End;
end;

procedure TFrmAgenda.btnUltimoViClick(Sender: TObject);
begin
dmDados.tbAgeVisual.Last;
  btnPrimeiroVi.Enabled:=True;
  btnAnteriorVi.Enabled:=True;
  btnProximoVi.Enabled:=False;
  btnUltimoVi.Enabled:=False;
end;

procedure TFrmAgenda.btnPrimeiroAbClick(Sender: TObject);
begin
  dmdados.tbAgenda.First;
  BtnPrimeiroAb.Enabled:=False;
  BtnAnteriorAb.Enabled:=False;
  BtnProximoAb.Enabled:=True;
  BtnUltimoAb.Enabled:=True;
end;

procedure TFrmAgenda.btnAnteriorAbClick(Sender: TObject);
begin
  dmDados.tbAgenda.Prior;
  btnProximoAb.Enabled:=True;
  btnUltimoAb.Enabled:=True;
  If dmdados.TbAgenda.Bof Then
     Begin
     btnPrimeiroAb.Enabled:=False;
     btnAnteriorAb.Enabled:=False;
     End;
end;

procedure TFrmAgenda.btnProximoAbClick(Sender: TObject);
begin
  dmDados.tbAgenda.Next;
  btnPrimeiroAb.Enabled:=True;
  btnAnteriorAb.Enabled:=True;
  If dmdados.tbAgenda.Eof Then
    Begin
    btnProximoAb.Enabled:=False;
    btnUltimoAb.Enabled:=False;
    End;

end;

procedure TFrmAgenda.btnUltimoAbClick(Sender: TObject);
begin
  dmDados.tbAgenda.Last;
  btnPrimeiroAb.Enabled:=True;
  btnAnteriorAb.Enabled:=True;
  btnProximoAb.Enabled:=False;
  btnUltimoAb.Enabled:=False;
end;

procedure TFrmAgenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
  Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
  End;
end;

procedure TFrmAgenda.FormShow(Sender: TObject);
begin
  dcPageControl1.ActivePage:=PgVisu;
end;

procedure TFrmAgenda.edtdataviExit(Sender: TObject);
begin
{   try
     StrToDate(edtdatavi.Text);
     except
     on EConvertError do
     begin
      ShowMessage ('Data Inv�lida');
      edtdatavi.SetFocus;
     end;
   end;  }
end;

end.
