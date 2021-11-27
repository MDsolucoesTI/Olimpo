//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
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
  ExtDlgs, VerCPF, VerCNPJ, DCStdCtrls, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint , db ;

type
  TFrmParametro = class(TForm)
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    BtnGravar: TSpeedItem;
    Panel1: TPanel;
    btnCancelar: TSpeedItem;
    AbreFigura: TOpenPictureDialog;
    VerCNPJ1: TVerCNPJ;
    VerCPF1: TVerCPF;
    Panel2: TPanel;
    ScrewPanel1: TScrewPanel;
    Image1: TImage;
    pgcConfig: TDCPageControl;
    tbsDiversos: TDCPage;
    tbsValores: TDCPage;
    lbempresa: TRxLabel;
    dbEmpresa: TDBEdit;
    lbie: TRxLabel;
    dbIE: TDBEdit;
    lbprop: TRxLabel;
    dbProp: TDBEdit;
    lbcgc: TRxLabel;
    dbCGC: TDBEdit;
    dbCPF: TDBEdit;
    lbcpf: TRxLabel;
    RxSplitter2: TRxSplitter;
    lbendereco: TRxLabel;
    DBend: TDBEdit;
    lbnumero: TRxLabel;
    DBnum: TDBEdit;
    lbcomplemento: TRxLabel;
    DBcompl: TDBEdit;
    lbuf: TRxLabel;
    DBCBoxUF: TDBComboBox;
    DBcep: TDBEdit;
    lbcep: TRxLabel;
    DBcidade: TDBEdit;
    lbcidade: TRxLabel;
    DBbairro: TDBEdit;
    lbBairro: TRxLabel;
    lbtel1: TRxLabel;
    DBtel1: TDBEdit;
    lbtel2: TRxLabel;
    DBTel2: TDBEdit;
    lbcelular: TRxLabel;
    DBcel: TDBEdit;
    lbicms: TRxLabel;
    dbicms: TDBEdit;
    RxSplitter1: TRxSplitter;
    lbMensPromo: TRxLabel;
    dbMensPromo: TDBEdit;
    lbMensRodape: TRxLabel;
    dbMensRodape: TDBEdit;
    RxSplitter3: TRxSplitter;
    Image7: TImage;
    Label3: TLabel;
    Label4: TLabel;
    dblogo: TDBImage;
    GroupBox1: TGroupBox;
    RxLabel23: TRxLabel;
    RxLabel24: TRxLabel;
    RxLabel25: TRxLabel;
    dbjurosdias: TDBEdit;
    dbjurosvalor: TDBEdit;
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
    RxLabel19: TRxLabel;
    RxLabel22: TRxLabel;
    RxLabel33: TRxLabel;
    tbsEmpresa: TDCPage;
    GroupBox4: TGroupBox;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    rbEntrada: TRadioButton;
    rbSaida: TRadioButton;
    RxLabel15: TRxLabel;
    GroupBox5: TGroupBox;
    RxLabel32: TRxLabel;
    RxLabel20: TRxLabel;
    dbcredito: TDBEdit;
    dbcomissao: TDBEdit;
    Image2: TImage;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbCGCExit(Sender: TObject);
    procedure dbCPFExit(Sender: TObject);
    procedure DBcelExit(Sender: TObject);
    procedure btempresaClick(Sender: TObject);
    procedure btdiversosClick(Sender: TObject);
    procedure btvaloresClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dblogoDblClick(Sender: TObject);
    procedure rbEntradaClick(Sender: TObject);
    procedure rbSaidaClick(Sender: TObject);
    procedure tbsValoresShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblogoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParametro: TFrmParametro;

implementation

uses UnitDmdados, UnitPrincipal;

{$R *.DFM}

procedure TFrmParametro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.tbParametro.Close;
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

procedure TFrmParametro.dbCGCExit(Sender: TObject);
begin
  VerCnpj1.NumCnpj:= dbcgc.text;
  If not VerCnpj1.valid Then
    Begin
    Showmessage('CGC inv�lido');
    dbcgc.Clear;
    dbcgc.setfocus;
    End;
end;

procedure TFrmParametro.dbCPFExit(Sender: TObject);
begin
  VerCpf1.NumeroCpf:= dbcpf.text;
  If not VerCpf1.valid Then
    Begin
    Showmessage('CPF inv�lido');
    dbcpf.Clear;
    dbcpf.setfocus;
    End;
end;

procedure TFrmParametro.DBcelExit(Sender: TObject);
begin
  pgcConfig.ActivePage:=tbsDiversos;
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
  FrmPrincipal.StatusTeclas(True,'[End] Gravar [Esc] Cancelar');
  If dmDados.TbParametro.RecordCount=0 Then
    Begin
    dmDados.TbParametro.Append;
    pgcConfig.ActivePage:=tbsEmpresa;
    dbempresa.SetFocus;
    End
  Else
    Begin
    dmDados.TbParametro.First;
    if not (dmdados.tbParametro.State=dsedit) then
    dmdados.TbParametro.Edit;
    pgcConfig.ActivePage:=tbsEmpresa;
    dbempresa.SetFocus;
    End;
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
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:='Empresa';
    Gravar:=False;
    Vazio:=True;
    End;
  If dbCpf.Text='           ' Then
    Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'CPF';
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
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'CNPJ';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    begin
    VerCnpj1.NumCnpj:= dbcgc.text;
    If not VerCnpj1.valid Then
      Begin
      Showmessage('CNPJ inv�lido');
      Gravar:=False;
      end;
    end;
  If Gravar Then
    Begin
    dmdados.TbParametro.Post;
    ShowMessage('Dados gravados com sucesso');
    Close;
    End
  Else
    Begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    dbempresa.SetFocus;
    end;
end;

procedure TFrmParametro.btnCancelarClick(Sender: TObject);
begin
  dmdados.TbParametro.cancel;
  speedbar1.SetFocus;
  Close;
end;

procedure TFrmParametro.dblogoDblClick(Sender: TObject);
begin
  with AbreFigura do
    if Execute then DMdados.tbparametroLogo.LoadFromFile(AbreFigura.FileName);
end;

procedure TFrmParametro.rbEntradaClick(Sender: TObject);
begin
  dmDados.TbParametroDecoEntra.Value:='S';
end;

procedure TFrmParametro.rbSaidaClick(Sender: TObject);
begin
  dmDados.TbParametroDecoEntra.Value:='N';
end;

procedure TFrmParametro.tbsValoresShow(Sender: TObject);
begin
  if dmdados.TbParametroDecoEntra.Value='S' then
    begin
    rbEntrada.Checked:=True;
    rbSaida.Checked:=False;
    end
  else
    begin
    rbEntrada.Checked:=True;
    rbSaida.Checked:=False;
    end;
end;

procedure TFrmParametro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (key) of
    VK_END    : BtnGravar.Click;
    VK_ESCAPE : BtnCancelar.Click;
    VK_F2     : dblogoDblClick(Sender);
    VK_PRIOR  : begin
                if pgcConfig.ActivePage=tbsEmpresa then
                  pgcConfig.ActivePage:=tbsDiversos
                else if pgcConfig.ActivePage=tbsDiversos then
                  pgcConfig.ActivePage:=tbsValores
                else
                  pgcConfig.ActivePage:=tbsEmpresa;
                end;
    VK_NEXT   : begin
                if pgcConfig.ActivePage=tbsValores then
                  pgcConfig.ActivePage:=tbsDiversos
                else if pgcConfig.ActivePage=tbsDiversos then
                  pgcConfig.ActivePage:=tbsEmpresa
                else
                  pgcConfig.ActivePage:=tbsValores;
                end;
  end;
end;

procedure TFrmParametro.dblogoExit(Sender: TObject);
begin
pgcConfig.ActivePage:=tbsvalores;
end;

procedure TFrmParametro.FormCreate(Sender: TObject);
begin
  dmdados.tbParametro.Open;
end;

end.
