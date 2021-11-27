//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2005
// Sistema...........: Triton - Automação de Imobiliária
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitParametro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcButton, fcImgBtn, RackCtls, StdCtrls, DBCtrls, ToolEdit, RXDBCtrl,
  Mask, RXSplit, RXCtrls, ExtCtrls, SpeedBar, jpeg, ComCtrls, SRColBtn,
  ExtDlgs, VerCPF, VerCNPJ;

type
  TFrmParametro = class(TForm)
    Image6: TImage;
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnGravar: TSpeedItem;
    BtnSair: TSpeedItem;
    Panel1: TPanel;
    Image2: TImage;
    Label2: TLabel;
    Panel2: TPanel;
    ScrewPanel1: TScrewPanel;
    Label1: TLabel;
    Image1: TImage;
    pgcConfig: TPageControl;
    tbsEmpresa: TTabSheet;
    tbsDiversos: TTabSheet;
    tbsValores: TTabSheet;
    btempresa: TSRColorButton;
    btdiversos: TSRColorButton;
    btvalores: TSRColorButton;
    RxSplitter2: TRxSplitter;
    lbempresa: TRxLabel;
    dbEmpresa: TDBEdit;
    dbCGC: TDBEdit;
    lbcgc: TRxLabel;
    lbie: TRxLabel;
    dbIE: TDBEdit;
    lbprop: TRxLabel;
    dbProp: TDBEdit;
    lbcpf: TRxLabel;
    dbCPF: TDBEdit;
    lbendereco: TRxLabel;
    DBend: TDBEdit;
    lbnumero: TRxLabel;
    DBnum: TDBEdit;
    lbcomplemento: TRxLabel;
    DBcompl: TDBEdit;
    lbBairro: TRxLabel;
    DBbairro: TDBEdit;
    lbcidade: TRxLabel;
    DBcidade: TDBEdit;
    lbcep: TRxLabel;
    DBcep: TDBEdit;
    lbuf: TRxLabel;
    DBCBoxUF: TDBComboBox;
    lbtel1: TRxLabel;
    DBtel1: TDBEdit;
    lbtel2: TRxLabel;
    DBTel2: TDBEdit;
    lbcelular: TRxLabel;
    DBcel: TDBEdit;
    lbicms: TRxLabel;
    dbicms: TDBEdit;
    lbMensPromo: TRxLabel;
    dbMensPromo: TDBEdit;
    lbMensRodape: TRxLabel;
    dbMensRodape: TDBEdit;
    dblogo: TDBImage;
    Label3: TLabel;
    RxSplitter1: TRxSplitter;
    RxSplitter3: TRxSplitter;
    Image7: TImage;
    Label4: TLabel;
    RxLabel16: TRxLabel;
    dbcpmf: TDBEdit;
    RxLabel19: TRxLabel;
    RxLabel20: TRxLabel;
    dbcomissao: TDBEdit;
    RxLabel22: TRxLabel;
    GroupBox1: TGroupBox;
    RxLabel23: TRxLabel;
    dbjurosdias: TDBEdit;
    RxLabel24: TRxLabel;
    dbjurosvalor: TDBEdit;
    RxLabel25: TRxLabel;
    dbjurosperc: TDBEdit;
    GroupBox2: TGroupBox;
    RxLabel26: TRxLabel;
    RxLabel27: TRxLabel;
    RxLabel28: TRxLabel;
    dbmultadias: TDBEdit;
    dbmultavalor: TDBEdit;
    dbmultaperc: TDBEdit;
    GroupBox3: TGroupBox;
    RxLabel29: TRxLabel;
    RxLabel30: TRxLabel;
    RxLabel31: TRxLabel;
    dbdescdias: TDBEdit;
    dbdescvalor: TDBEdit;
    dbdescperc: TDBEdit;
    RxLabel32: TRxLabel;
    dbcredito: TDBEdit;
    RxLabel33: TRxLabel;
    btcancelar: TSpeedItem;
    AbreFigura: TOpenPictureDialog;
    VerCNPJ1: TVerCNPJ;
    VerCPF1: TVerCPF;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure dbEmpresaEnter(Sender: TObject);
    procedure dbCGCEnter(Sender: TObject);
    procedure dbIEEnter(Sender: TObject);
    procedure dbPropEnter(Sender: TObject);
    procedure dbCPFEnter(Sender: TObject);
    procedure DBendEnter(Sender: TObject);
    procedure DBnumEnter(Sender: TObject);
    procedure DBcomplEnter(Sender: TObject);
    procedure DBbairroEnter(Sender: TObject);
    procedure DBcidadeEnter(Sender: TObject);
    procedure DBcepEnter(Sender: TObject);
    procedure DBCBoxUFEnter(Sender: TObject);
    procedure DBtel1Enter(Sender: TObject);
    procedure DBTel2Enter(Sender: TObject);
    procedure DBcelEnter(Sender: TObject);
    procedure dbicmsEnter(Sender: TObject);
    procedure dbMensPromoEnter(Sender: TObject);
    procedure dbMensRodapeEnter(Sender: TObject);
    procedure dbjurosdiasEnter(Sender: TObject);
    procedure dbjurosvalorEnter(Sender: TObject);
    procedure dbjurospercEnter(Sender: TObject);
    procedure dbmultadiasEnter(Sender: TObject);
    procedure dbmultavalorEnter(Sender: TObject);
    procedure dbmultapercEnter(Sender: TObject);
    procedure dbdescdiasEnter(Sender: TObject);
    procedure dbdescvalorEnter(Sender: TObject);
    procedure dbdescpercEnter(Sender: TObject);
    procedure dbcreditoEnter(Sender: TObject);
    procedure dbcomissaoEnter(Sender: TObject);
    procedure dbcpmfEnter(Sender: TObject);
    procedure dbEmpresaExit(Sender: TObject);
    procedure dbCGCExit(Sender: TObject);
    procedure dbIEExit(Sender: TObject);
    procedure dbPropExit(Sender: TObject);
    procedure dbCPFExit(Sender: TObject);
    procedure DBendExit(Sender: TObject);
    procedure DBnumExit(Sender: TObject);
    procedure DBcomplExit(Sender: TObject);
    procedure DBbairroExit(Sender: TObject);
    procedure DBcidadeExit(Sender: TObject);
    procedure DBcepExit(Sender: TObject);
    procedure DBCBoxUFExit(Sender: TObject);
    procedure DBtel1Exit(Sender: TObject);
    procedure DBTel2Exit(Sender: TObject);
    procedure DBcelExit(Sender: TObject);
    procedure dbicmsExit(Sender: TObject);
    procedure dbMensPromoExit(Sender: TObject);
    procedure dbMensRodapeExit(Sender: TObject);
    procedure dbjurosdiasExit(Sender: TObject);
    procedure dbjurosvalorExit(Sender: TObject);
    procedure dbjurospercExit(Sender: TObject);
    procedure dbmultadiasExit(Sender: TObject);
    procedure dbmultavalorExit(Sender: TObject);
    procedure dbmultapercExit(Sender: TObject);
    procedure dbdescdiasExit(Sender: TObject);
    procedure dbdescvalorExit(Sender: TObject);
    procedure dbdescpercExit(Sender: TObject);
    procedure dbcreditoExit(Sender: TObject);
    procedure dbcomissaoExit(Sender: TObject);
    procedure dbcpmfExit(Sender: TObject);
    procedure btempresaClick(Sender: TObject);
    procedure btdiversosClick(Sender: TObject);
    procedure btvaloresClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure btcancelarClick(Sender: TObject);
    procedure dblogoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParametro: TFrmParametro;

implementation

uses UnitDmdados;

{$R *.DFM}

procedure TFrmParametro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action:= Cafree;
end;

procedure TFrmParametro.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;
end;

procedure TFrmParametro.BtnSairClick(Sender: TObject);
begin
close;
end;

procedure TFrmParametro.dbEmpresaEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.dbCGCEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.dbIEEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.dbPropEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.dbCPFEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.DBendEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.DBnumEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.DBcomplEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.DBbairroEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.DBcidadeEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.DBcepEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.DBCBoxUFEnter(Sender: TObject);
begin
(Sender as TdbComboBox).color:=$00d2e2ff;
end;

procedure TFrmParametro.DBtel1Enter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.DBTel2Enter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.DBcelEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.dbicmsEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.dbMensPromoEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.dbMensRodapeEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.dbjurosdiasEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.dbjurosvalorEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.dbjurospercEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.dbmultadiasEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.dbmultavalorEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.dbmultapercEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.dbdescdiasEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.dbdescvalorEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.dbdescpercEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.dbcreditoEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.dbcomissaoEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.dbcpmfEnter(Sender: TObject);
begin
(Sender as TdbEdit).color:=$00d2e2ff;
end;

procedure TFrmParametro.dbEmpresaExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.dbCGCExit(Sender: TObject);
begin
VerCnpj1.NumCnpj:= dbcgc.text;
If not VerCnpj1.valid Then
 Begin
  Showmessage('CGC inv�lido');
  dbcgc.Clear;
  dbcgc.setfocus;
 End
  else
    (Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.dbIEExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.dbPropExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.dbCPFExit(Sender: TObject);
begin
VerCpf1.NumeroCpf:= dbcpf.text;
If not VerCpf1.valid Then
 Begin
  Showmessage('CPF inv�lido');
  dbcpf.Clear;
  dbcpf.setfocus;
 End
  else
  (Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.DBendExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.DBnumExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.DBcomplExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.DBbairroExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.DBcidadeExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.DBcepExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.DBCBoxUFExit(Sender: TObject);
begin
(Sender as TdbComboBox).color:=clWindow;
end;

procedure TFrmParametro.DBtel1Exit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.DBTel2Exit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.DBcelExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.dbicmsExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.dbMensPromoExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.dbMensRodapeExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.dbjurosdiasExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.dbjurosvalorExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.dbjurospercExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.dbmultadiasExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.dbmultavalorExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.dbmultapercExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.dbdescdiasExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.dbdescvalorExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.dbdescpercExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.dbcreditoExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.dbcomissaoExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.dbcpmfExit(Sender: TObject);
begin
(Sender as TdbEdit).color:=clWindow;
end;

procedure TFrmParametro.btempresaClick(Sender: TObject);
begin
pgcConfig.ActivePage:=tbsEmpresa;
tbsempresa.Enabled:=true;
end;

procedure TFrmParametro.btdiversosClick(Sender: TObject);
begin
pgcConfig.ActivePage:=tbsDiversos;
tbsDiversos.Enabled:=true;
dbicms.SetFocus;
end;

procedure TFrmParametro.btvaloresClick(Sender: TObject);
begin
pgcConfig.ActivePage:=tbsValores;
tbsvalores.Enabled:=true;
dbjurosdias.SetFocus;
end;

procedure TFrmParametro.FormShow(Sender: TObject);
begin
dmdados.TbParametro.Edit;
pgcConfig.ActivePage:=tbsEmpresa;
dbempresa.SetFocus;
end;

procedure TFrmParametro.BtnGravarClick(Sender: TObject);
Var
 Campos:String;
 Vazio,Gravar:Boolean;

BEGIN
 Campos:='';
 Gravar:=True;
 Vazio:=False;

If dbempresa.Text='' Then
Begin
 Campos:=' Empresa ';
 Gravar:=False;
 Vazio:=True;
End;

If dbCpf.Text='           ' Then
 Begin
 Campos:=Campos+' CPF ';
 Gravar:=False;
 Vazio:=True;
 End
 Else
  Begin
   VerCPF1.NumeroCPF:= dbcpf.text;
    If not VerCpf1.valid Then
     Begin
     Showmessage('CPF inv�lido');
     Gravar:=False;
     End;
  end;

If dbCgc.Text='              ' Then
 Begin
  Campos:=Campos+' Cgc ';
  Gravar:=False;
  Vazio:=True;
 End
 Else
  begin
   VerCnpj1.NumCnpj:= dbcgc.text;
   If not VerCnpj1.valid Then
    Begin
    Showmessage('Cgc inv�lido');
    Gravar:=False;
    end;
  end;

If Gravar Then
Begin
dmdados.TbParametro.Post;
tbsEmpresa.Enabled:=false;
tbsDiversos.Enabled:=false;
tbsValores.Enabled:=false;
ShowMessage('Dados gravados com sucesso');
End
Else
  Begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbempresa.SetFocus;
  end;
end;

procedure TFrmParametro.btcancelarClick(Sender: TObject);
begin
abort;
dmdados.TbParametro.cancel;
tbsEmpresa.Enabled:=false;
tbsDiversos.Enabled:=false;
tbsValores.Enabled:=false;
speedbar1.SetFocus;
end;

procedure TFrmParametro.dblogoDblClick(Sender: TObject);
begin
with AbreFigura do
 if Execute then DMdados.tbparametroLogo.LoadFromFile(AbreFigura.FileName);

end;

end.
