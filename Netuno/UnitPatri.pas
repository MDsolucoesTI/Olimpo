//////////////////////////////////////////////////////////////////////////
// Criacao...........: 10/2002
// Sistema...........: Netuno - Controle de Patrimonio
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitPatri;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolEdit, RXDBCtrl, RackCtls, fcButton, fcImgBtn, StdCtrls, DBCtrls,
  RXSplit, Mask, RXCtrls, ExtCtrls, SpeedBar, jpeg, CurrEdit, RxDBComb,
  RxLookup, DB, DBTables, DCStdCtrls, EFocCol, EDBZero;

type
  TFrmPatri = class(TForm)
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
    BtnLocalizar: TSpeedItem;
    BtnSair: TSpeedItem;
    Panel1: TPanel;
    Image2: TImage;
    Label1: TLabel;
    ScrewPanel1: TScrewPanel;
    Label2: TLabel;
    Image1: TImage;
    pgcPatri: TDCPageControl;
    pgPatri: TDCPage;
    RxLabel1: TRxLabel;
    DBEPatri: TDBEdit;
    RxLabel2: TRxLabel;
    DBEPlaq: TDBEdit;
    DBEDesc: TDBEdit;
    RxLabel4: TRxLabel;
    lbcodcusto: TRxLabel;
    dbCodFor: TDBEdit;
    btLocCusto: TfcImageBtn;
    dbFornec: TDBEdit;
    lbcusto: TRxLabel;
    DBENF: TDBEdit;
    RxLabel5: TRxLabel;
    RxLabel8: TRxLabel;
    DBDDtAq: TDBDateEdit;
    RxDBCVlAq: TRxDBCalcEdit;
    RxLabel9: TRxLabel;
    RxLabel11: TRxLabel;
    RxDBCVlMerc: TRxDBCalcEdit;
    dbcmbCentroCusto: TRxDBLookupCombo;
    RxLabel10: TRxLabel;
    RxLabel16: TRxLabel;
    dbcmbTipoPatri: TRxDBComboBox;
    DBDtCad: TDBDateEdit;
    RxLabel18: TRxLabel;
    pgEspe: TDCPage;
    pnImovel: TPanel;
    pnEquipa: TPanel;
    pnVeiculo: TPanel;
    RxLabel20: TRxLabel;
    DBnumescritura: TDBEdit;
    RxLabel21: TRxLabel;
    DBEndereco: TDBEdit;
    RxLabel22: TRxLabel;
    RxLabel23: TRxLabel;
    DBComplemento: TDBEdit;
    RxLabel24: TRxLabel;
    DBBairro: TDBEdit;
    RxLabel25: TRxLabel;
    DBCep: TDBEdit;
    RxLabel26: TRxLabel;
    DBCidade: TDBEdit;
    RxLabel27: TRxLabel;
    RxLabel28: TRxLabel;
    DBAreaTerr: TDBEdit;
    RxLabel29: TRxLabel;
    RxLabel30: TRxLabel;
    DBAreaconstru: TDBEdit;
    RxLabel31: TRxLabel;
    RxLabel32: TRxLabel;
    dbTipoArea: TRxDBComboBox;
    DBuf: TDBComboBox;
    DBchassi: TDBEdit;
    RxLabel33: TRxLabel;
    RxLabel34: TRxLabel;
    DBplaca: TDBEdit;
    RxLabel35: TRxLabel;
    DBanofabr: TDBEdit;
    RxLabel36: TRxLabel;
    DBanomodelo: TDBEdit;
    RxLabel37: TRxLabel;
    DBcor: TDBEdit;
    pgGerais: TDCPage;
    RxLabel12: TRxLabel;
    dbcmbSegura: TRxDBLookupCombo;
    RxLabel14: TRxLabel;
    RxDBCVlSeg: TRxDBCalcEdit;
    RxLabel13: TRxLabel;
    DBDVencSeg: TDBDateEdit;
    RxLabel7: TRxLabel;
    dbCodCompra: TDBEdit;
    btLocCompra: TfcImageBtn;
    RxLabel19: TRxLabel;
    dbNoCompra: TDBEdit;
    RxLabel17: TRxLabel;
    RxDBCVlVend: TRxDBCalcEdit;
    RxLabel15: TRxLabel;
    DBMDet: TDBMemo;
    RxLabel6: TRxLabel;
    DBEQtde: TDBEdit;
    RxLabel3: TRxLabel;
    dbcmbCondicoes: TRxDBComboBox;
    RxLabel38: TRxLabel;
    DBnumser: TDBEdit;
    RxLabel39: TRxLabel;
    DBmarca: TDBEdit;
    RxLabel40: TRxLabel;
    DBfimgaran: TDBDateEdit;
    dbNum: TEvDBZeroEdit;
    pnOutro: TPanel;
    procedure DBEPlaqExit(Sender: TObject);
    procedure DBEQtdeEnter(Sender: TObject);
    procedure DBENFExit(Sender: TObject);
    procedure DBEDescExit(Sender: TObject);
    procedure DBDDtAqExit(Sender: TObject);
    procedure DBDVencSegExit(Sender: TObject);
    procedure RxDBCVlAqExit(Sender: TObject);
    procedure RxDBCVlSegExit(Sender: TObject);
    procedure RxDBCVlVendExit(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure btLocCustoClick(Sender: TObject);
    procedure btLocCompraClick(Sender: TObject);
    procedure dbCodForExit(Sender: TObject);
    procedure dbCodCompraExit(Sender: TObject);
    procedure dbcmbCondicoesExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbcmbTipoPatriExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBnumescrituraExit(Sender: TObject);
    procedure DBEnderecoExit(Sender: TObject);
    procedure DBNumExit(Sender: TObject);
    procedure DBBairroExit(Sender: TObject);
    procedure DBCidadeExit(Sender: TObject);
    procedure DBufExit(Sender: TObject);
    procedure dbcmbTipoPatriChange(Sender: TObject);
    procedure DBEPatriExit(Sender: TObject);
    procedure DBchassiExit(Sender: TObject);
    procedure DBplacaExit(Sender: TObject);
    procedure DBcorExit(Sender: TObject);
    procedure DBAreaconstruExit(Sender: TObject);
    procedure DBnumserExit(Sender: TObject);
    procedure DBmarcaExit(Sender: TObject);
    procedure DBfimgaranExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPatri: TFrmPatri;
  NovoItem:Boolean;
implementation

uses UnitDMDados, UnitLocFornec, UnitLocComprador, UnitPrincipal,
  UntLocPatrimonio;

{$R *.DFM}

procedure TFrmPatri.DBEPlaqExit(Sender: TObject);
Var
	Tabela: TTable;
begin
	If NovoItem Then
  	Begin
	  Tabela := TTable.Create(Application);
	  Tabela.DatabaseName := dmDados.tbPatrimonio.DatabaseName;
	  Tabela.TableName := dmDados.tbPatrimonio.TableName;
	  Tabela.Open;
	 	If DBEPlaq.Text= '' then
	 		begin
	 		ShowMessage('� obrigat�rio o N�mero da Plaqueta');
	 		DBEPlaq.SetFocus;
	 		end
	 	else
	   	Begin
	    If Tabela.Locate('Plaqueta',dbePlaq.Text,[]) Then
	     	If not ((DmDados.tbPatrimonio.State=dsEdit) And (dmDados.tbPatrimonio.RecNo = Tabela.RecNo)) Then
          begin
	        Showmessage('Plaqueta j� Cadastrada');
	        dbePlaq.Clear;
	        dbePlaq.setfocus;
	        End;
	    End;
	  Tabela.Free;
    End;
 end;


procedure TFrmPatri.DBEQtdeEnter(Sender: TObject);
begin
dbeQtde.Text:='1';
end;


procedure TFrmPatri.DBENFExit(Sender: TObject);
begin
	If NovoItem Then
  	Begin
		If DBENF.Text= '' then
   		Begin
			ShowMessage('� obrigat�rio o n�mero da Nota Fiscal');
			DBENF.SetFocus;
	    End;
    end;
end;

procedure TFrmPatri.DBEDescExit(Sender: TObject);
begin
	If NovoItem Then
  	Begin
		If DBEDesc.Text= '' then
   		Begin
   		ShowMessage('� obrigat�rio a descri��o do patrim�nio');
   		DBEDesc.SetFocus;
   		End;
    end;
end;

procedure TFrmPatri.DBDDtAqExit(Sender: TObject);
begin
	If NovoItem Then
  	Begin
		If DBDDtAq.Text= '  /  /    ' then
   		Begin
   		ShowMessage('� obrigat�rio a data de aquisi��o');
   		DBDDtAq.SetFocus;
   		End
      else
        begin
        try
        StrToDate(DBDDtAq.Text);
        except
        on EConvertError do
        ShowMessage ('Data Inv�lida!');
        end;
        end;
    end;
end;

procedure TFrmPatri.DBDVencSegExit(Sender: TObject);
begin
	If NovoItem Then
  	Begin
		If dbcmbSegura.Text<>'' Then
      Begin
  		If dbdVencSeg.Text='  /  /    ' Then
    		Begin
				ShowMessage('� obrigat�rio a data de vencimento da cobertura');
	      dbdVencSeg.SetFocus;
   			End;
      End
		Else
      Begin
    	dbdVencSeg.Clear;
      End;
    End;

end;

procedure TFrmPatri.RxDBCVlAqExit(Sender: TObject);
begin
	If NovoItem Then
  	Begin
		If RxDBCVlAq.Text= '' then
   		Begin
   		ShowMessage('� obrigat�rio o valor da aquisi��o');
   		RxDBCVlAq.SetFocus;
   		End ;
    end;

end;

procedure TFrmPatri.RxDBCVlSegExit(Sender: TObject);
begin
	If NovoItem Then
  	Begin
		If dbcmbSegura.Text<>'' Then
      Begin
			If RxDBCVlSeg.Text= '' then
   			Begin
   			ShowMessage('� obrigat�rio o valor segurado');
   			RxDBCVlSeg.SetFocus;
   			End;
      End
 		Else
       RxDBCVlSeg.Clear;
    End;

end;

procedure TFrmPatri.RxDBCVlVendExit(Sender: TObject);
begin
	If NovoItem Then
  	Begin
		If dbCodCompra.Text <> '' Then
      Begin
			If RxDBCVlVend.Text= '' then
   			Begin
   			ShowMessage('� obrigat�rio o valor de Venda');
   			RxDBCVlVend.SetFocus;
   			End;
      End
 		  Else
    	  RxDBCVlVend.Clear;
    end;
end;

procedure TFrmPatri.BtnPrimeiroClick(Sender: TObject);
begin
  DMDados.TbPatrimonio.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  // cadastro de ve�culo
  if dbcmbTipoPatri.Text='Ve�culo'then
    dmdados.tbVeiculo.FindKey([dbePatri.Text]);
  // cadastro de im�vel
  if dbcmbTipoPatri.Text='Im�vel'then
    dmdados.tbImovel.FindKey([dbePatri.Text]);
  // cadastro de equipamento
  if dbcmbTipoPatri.Text='Equipamento'then
    dmdados.tbEquipamento.FindKey([dbePatri.Text]);
    if dbcmbTipoPatri.Text='Ve�culo'then
    begin
    pnVeiculo.Visible:=True;
    pnImovel.Visible:=False;
    pnEquipa.Visible:=False;
    pnOutro.Visible:=False;
    end;
  // cadastro de im�vel
  if dbcmbTipoPatri.Text='Im�vel'then
    begin
    pnVeiculo.Visible:=False;
    pnImovel.Visible:=True;
    pnEquipa.Visible:=False;
    pnOutro.Visible:=False;
    end;
  // cadastro de equipamento
  if dbcmbTipoPatri.Text='Equipamento'then
    begin
    pnVeiculo.Visible:=False;
    pnImovel.Visible:=False;
    pnEquipa.Visible:=True;
    pnOutro.Visible:=False;
    end;
  // cadastro de outros tipos
  if dbcmbTipoPatri.Text='Outros' then
    begin
    pnVeiculo.Visible:=False;
    pnImovel.Visible:=False;
    pnEquipa.Visible:=False;
    pnOutro.Visible:=True;
    end;
end;

procedure TFrmPatri.BtnAnteriorClick(Sender: TObject);
begin
  DMDados.TbPatrimonio.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If DMDados.TbPatrimonio.Bof Then
    Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    End;
  // cadastro de ve�culo
  if dbcmbTipoPatri.Text='Ve�culo'then
    dmdados.tbVeiculo.FindKey([dbePatri.Text]);
  // cadastro de im�vel
  if dbcmbTipoPatri.Text='Im�vel'then
    dmdados.tbImovel.FindKey([dbePatri.Text]);
  // cadastro de equipamento
  if dbcmbTipoPatri.Text='Equipamento'then
    dmdados.tbEquipamento.FindKey([dbePatri.Text]);
  // cadastro de ve�culo
  if dbcmbTipoPatri.Text='Ve�culo'then
    begin
    pnVeiculo.Visible:=True;
    pnImovel.Visible:=False;
    pnEquipa.Visible:=False;
    pnOutro.Visible:=False;
    end;
  // cadastro de im�vel
  if dbcmbTipoPatri.Text='Im�vel'then
    begin
    pnVeiculo.Visible:=False;
    pnImovel.Visible:=True;
    pnEquipa.Visible:=False;
    pnOutro.Visible:=False;
    end;
  // cadastro de equipamento
  if dbcmbTipoPatri.Text='Equipamento'then
    begin
    pnVeiculo.Visible:=False;
    pnImovel.Visible:=False;
    pnEquipa.Visible:=True;
    pnOutro.Visible:=False;
    end;
  // cadastro de outros tipos
  if dbcmbTipoPatri.Text='Outros' then
    begin
    pnVeiculo.Visible:=False;
    pnImovel.Visible:=False;
    pnEquipa.Visible:=False;
    pnOutro.Visible:=True;
    end;
end;

procedure TFrmPatri.BtnProximoClick(Sender: TObject);
begin
  DMDados.TbPatrimonio.Next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If DMDados.TbPatrimonio.Eof Then
    Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    End;
  // cadastro de ve�culo
  if dbcmbTipoPatri.Text='Ve�culo'then
    dmdados.tbVeiculo.FindKey([dbePatri.Text]);
  // cadastro de im�vel
  if dbcmbTipoPatri.Text='Im�vel'then
    dmdados.tbImovel.FindKey([dbePatri.Text]);
  // cadastro de equipamento
  if dbcmbTipoPatri.Text='Equipamento'then
    dmdados.tbEquipamento.FindKey([dbePatri.Text]);
  // cadastro de ve�uclos
  if dbcmbTipoPatri.Text='Ve�culo'then
    begin
    pnVeiculo.Visible:=True;
    pnImovel.Visible:=False;
    pnEquipa.Visible:=False;
    pnOutro.Visible:=False;
    end;
  // cadastro de im�vel
  if dbcmbTipoPatri.Text='Im�vel'then
    begin
    pnVeiculo.Visible:=False;
    pnImovel.Visible:=True;
    pnEquipa.Visible:=False;
    pnOutro.Visible:=False;
    end;
  // cadastro de equipamento
  if dbcmbTipoPatri.Text='Equipamento'then
    begin
    pnVeiculo.Visible:=False;
    pnImovel.Visible:=False;
    pnEquipa.Visible:=True;
    pnOutro.Visible:=False;
    end;
  // cadastro de outros tipos
  if dbcmbTipoPatri.Text='Outros' then
    begin
    pnVeiculo.Visible:=False;
    pnImovel.Visible:=False;
    pnEquipa.Visible:=False;
    pnOutro.Visible:=True;
    end;
end;

procedure TFrmPatri.BtnUltimoClick(Sender: TObject);
begin
  DMDados.TbPatrimonio.Last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  // cadastro de ve�culo
  if dbcmbTipoPatri.Text='Ve�culo'then
    dmdados.tbVeiculo.FindKey([dbePatri.Text]);
  // cadastro de im�vel
  if dbcmbTipoPatri.Text='Im�vel'then
    dmdados.tbImovel.FindKey([dbePatri.Text]);
  // cadastro de equipamento
  if dbcmbTipoPatri.Text='Equipamento'then
    dmdados.tbEquipamento.FindKey([dbePatri.Text]);
  // cadastro de ve�culo
  if dbcmbTipoPatri.Text='Ve�culo'then
    begin
    pnVeiculo.Visible:=True;
    pnImovel.Visible:=False;
    pnEquipa.Visible:=False;
    pnOutro.Visible:=False;
    end;
  // cadastro de im�vel
  if dbcmbTipoPatri.Text='Im�vel'then
    begin
    pnVeiculo.Visible:=False;
    pnImovel.Visible:=True;
    pnEquipa.Visible:=False;
    pnOutro.Visible:=False;
    end;
  // cadastro de equipamento
  if dbcmbTipoPatri.Text='Equipamento'then
    begin
    pnVeiculo.Visible:=False;
    pnImovel.Visible:=False;
    pnEquipa.Visible:=True;
    pnOutro.Visible:=False;
    end;
  // cadastro de outros tipos
  if dbcmbTipoPatri.Text='Outros' then
    begin
    pnVeiculo.Visible:=False;
    pnImovel.Visible:=False;
    pnEquipa.Visible:=False;
    pnOutro.Visible:=True;
    end;
end;

procedure TFrmPatri.BtnNovoClick(Sender: TObject);
begin
  DMDados.TbPatrimonio.Append;
  dmdados.tbVeiculo.Append;
  dmdados.tbImovel.Append;
  dmdados.tbEquipamento.Append;
  NovoItem:=True;
  dmDados.vTabStt:=false;
  {habilitando os bot�es}
  BtnGravar.Enabled :=True;
  BtnCancelar.Enabled:=True;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  BtnLocalizar.Enabled:=False;
  {habilitando os componentes}
  dbePatri.Enabled:=true;
  DBEPlaq.Enabled:=True;
  DBEDesc.Enabled:=True;
  DBENF.Enabled:=True;
  DBEQtde.Enabled:=True;
  DBDDtAq.Enabled:=True;
  RxDBCVlAq.Enabled:=True;
  RxDBCVlMerc.Enabled:=True;
  DBDVencSeg.Enabled:=True;
  RxDBCVlSeg.Enabled:=True;
  DBMDet.Enabled:=True;
  RxDBCVlVend.Enabled:=True;
  dbcmbCondicoes.Enabled:=True;
  dbCodFor.Enabled:=True;
  dbCodCompra.Enabled:=True;
  dbcmbCentroCusto.Enabled:=True;
  dbcmbTipoPatri.Enabled:=True;
  dbcmbSegura.Enabled:=True;
  // cadastro de ve�culo
  dbChassi.Enabled:=True;
  dbPlaca.Enabled:=True;
  dbAnoFabr.Enabled:=True;
  dbAnoModelo.Enabled:=True;
  dbCor.Enabled:=True;
  // cadastro de im�vel
  dbNumEscritura.Enabled:=True;
  dbEndereco.Enabled:=True;
  dbNum.Enabled:=True;
  dbComplemento.Enabled:=True;
  dbBairro.Enabled:=True;
  dbCep.Enabled:=True;
  dbCidade.Enabled:=True;
  dbUF.Enabled:=True;
  dbAreaTerr.Enabled:=True;
  dbTipoArea.Enabled:=True;
  dbAreaConstru.Enabled:=True;
  // cadastro de equipamento
  dbNumSer.Enabled:=True;
  dbMarca.Enabled:=True;
  dbFimGaran.Enabled:=True;
  pgcpatri.ActivePage:=pgpatri;
  DBEPatri.SetFocus;
end;

procedure TFrmPatri.BtnGravarClick(Sender: TObject);
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
  Tabela.DatabaseName := dmDados.tbPatrimonio.DatabaseName;
  Tabela.TableName := dmDados.tbPatrimonio.TableName;
  Tabela.Open;
 	If DBEPlaq.Text= '' then
 		begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
 		Campos:=Campos+'Plaqueta';
    Gravar:=False;
    Vazio:=True;
    end
 	else
    If Tabela.Locate('Plaqueta',dbePlaq.Text,[]) Then
     	If Not((DmDados.tbPatrimonio.State=dsEdit) And (dmDados.tbPatrimonio.RecNo = Tabela.RecNo)) Then
        Begin
       	Gravar:=False;
        Showmessage('Plaqueta j� Cadastrada');
        End;
	If DBEDesc.Text= '' then
  	begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
  	Campos:=Campos+'Descri��o';
    Gravar:=False;
    Vazio:=True;
   	end;
	If dbcmbCondicoes.Text= '' then
  	begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Condi��es';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    Begin
    Flag:=True;
    For x:=0 to dbcmbCondicoes.Items.Count-1 Do
      If dbcmbCondicoes.Text=dbcmbCondicoes.Items[x] Then
        Flag:=False;
    If Flag Then
      Begin
      ShowMessage('Valor das condi��es do patrim�nio inv�lido');
      Gravar:=False;
      End;
    End;
	If dbCodFor.Text='' Then
  	begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'C�digo do Fornecedor';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    If Not(dmDados.tbFornecedor.Locate('CodFor',dbCodFor.Text,[])) Then
    	Begin
      Showmessage('Fornecedor n�o Cadastrado');
    	Gravar:=False;
      End;
	If DBENF.Text= '' then
  	Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Nota Fiscal';
    Gravar:=False;
    Vazio:=True;
    End;
  If DBDDtAq.Text= '  /  /    ' then
  	Begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Data Aquisi��o';
    Gravar:=False;
    Vazio:=True;
    End;
	If RxDBCVlAq.Text= '' then
  	begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Valor Aquisi��o';
    Gravar:=False;
    Vazio:=True;
    End;
	If dbcmbSegura.Text<>'' Then
  	If dbdVencSeg.Text='  /  /    ' Then
    	Begin
      If Length(Campos)>0 Then
     		Campos:=Campos+', ';
    	Campos:=Campos+'Vencimento Cobertura';
    	Gravar:=False;
    	Vazio:=True;
   		End;
	If dbcmbSegura.Text<>'' Then
		If RxDBCVlSeg.Text= '' then
   		begin
    	If Length(Campos)>0 Then
    		Campos:=Campos+', ';
    	Campos:=Campos+'Valor Segurado';
    	Gravar:=False;
    	Vazio:=True;
   		End;
  If dbCodCompra.Text <> '' Then
		If Not(dmDados.TbComprador.Locate('CodCompra',dbCodCompra.Text,[])) Then
  		Begin
    	Showmessage('Comprador n�o Cadastrado');
      Gravar:=False;
    	End;
	If dbCodCompra.Text <> '' Then
		If RxDBCVlVend.Text= '' then
   		begin
      If Length(Campos)>0 Then
    		Campos:=Campos+', ';
    	Campos:=Campos+'Valor Venda';
    	Gravar:=False;
    	Vazio:=True;
   		end;
	If dbcmbTipoPatri.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Tipo Patrim�nio';
    Gravar:=False;
    Vazio:=True;
    End;
  // cadastro de im�vel
  if dbcmbTipoPatri.Text='Im�vel'then
    begin
    If DBnumescritura.Text= '' then
      begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:=Campos+'ESCRITURA';
      Gravar:=False;
      Vazio:=True;
      end;
    If DBEndereco.Text= '' then
      begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:=Campos+'ENDERE�O';
      Gravar:=False;
      Vazio:=True;
      end;
    If DBnum.Text= '' then
      begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:=Campos+'N�MERO';
      Gravar:=False;
      Vazio:=True;
      end;
    If DBbairro.Text= '' then
      begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:=Campos+'BAIRRO';
      Gravar:=False;
      Vazio:=True;
      end;
    If DBCidade.Text= '' then
      begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:=Campos+'CIDADE';
      Gravar:=False;
      Vazio:=True;
      end;
    If DBUF.Text= '' then
      begin
      If Length(Campos)>0 Then
    	  Campos:=Campos+', ';
      Campos:=Campos+'ESTADO';
      Gravar:=False;
      Vazio:=True;
      End
    Else
      Begin
      Flag:=True;
      For x:=0 to DBUF.Items.Count-1 Do
        If DBUF.Text=DBUF.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor da UF inv�lido');
        Gravar:=False;
        End;
      End;
    end;
  // cadastro de ve�culo
  if dbcmbTipoPatri.Text='Ve�culo'then
    begin
    If DBchassi.Text= '' then
      begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:=Campos+'CHASSI';
      Gravar:=False;
      Vazio:=True;
      end;
    If DBplaca.Text= '' then
      begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:=Campos+'PLACA';
      Gravar:=False;
      Vazio:=True;
      end;
    end;
  // cadastro de equipamento
  if dbcmbTipoPatri.Text='Equipamento'then
    begin
    If DBnumser.Text= '' then
      begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:=Campos+'N�MERO DE S�RIE';
      Gravar:=False;
      Vazio:=True;
      end;
    If DBmarca.Text= '' then
      begin
      If Length(Campos)>0 Then
        Campos:=Campos+', ';
      Campos:=Campos+'MARCA';
      Gravar:=False;
      Vazio:=True;
      end;
    If DBfimgaran.Text= '  /  /    ' then
      Begin
      If Length(Campos)>0 Then
    	  Campos:=Campos+', ';
      Campos:=Campos+'FIM DA GARANTIA';
      Gravar:=False;
      Vazio:=True;
      End;
    end;
	If Gravar Then
  	Begin
    DMDados.TbPatrimonio.Post;
    // cadastro de ve�culo
    if dbcmbTipoPatri.Text='Ve�culo'then
      begin
      dmdados.tbVeiculo.Post;
      dmdados.tbImovel.Cancel;
      dmdados.tbEquipamento.Cancel;
      end;
    // cadastro de im�vel
    if dbcmbTipoPatri.Text='Im�vel'then
      begin
      dmdados.tbVeiculo.Cancel;
      dmdados.tbImovel.Post;
      dmdados.tbEquipamento.Cancel;
      end;
    // cadastro de equipamento
    if dbcmbTipoPatri.Text='Equipamento'then
      begin
      dmdados.tbVeiculo.Cancel;
      dmdados.tbImovel.Cancel;
      dmdados.tbEquipamento.Post;
      end;
    NovoItem:=False;
    dmDados.vTabStt:=True;
		BtnGravar.Enabled:=False;
		BtnCancelar.Enabled:=False;
		BtnNovo.Enabled:=True;
		BtnPrimeiro.Enabled:=True;
		BtnAnterior.Enabled:=True;
		BtnProximo.Enabled:=True;
		BtnUltimo.Enabled:=True;
		BtnAlterar.Enabled:=True;
		Btndeletar.Enabled:=True;
		BtnLocalizar.Enabled:=True;
		SpeedBar1.SetFocus;
		{desabilitando os componentes}
    dbePatri.Enabled:=false;
		DBEPlaq.Enabled:=False;
		DBEDesc.Enabled:=False;
		DBENF.Enabled:=False;
		DBEQtde.Enabled:=False;
		DBDDtAq.Enabled:=False;
		RxDBCVlAq.Enabled:=False;
		RxDBCVlMerc.Enabled:=False;
		DBDVencSeg.Enabled:=False;
		RxDBCVlSeg.Enabled:=False;
		DBMDet.Enabled:=False;
		RxDBCVlVend.Enabled:=False;
		dbcmbCondicoes.Enabled:=False;
		dbCodFor.Enabled:=False;
		dbCodCompra.Enabled:=False;
		dbcmbCentroCusto.Enabled:=False;
		dbcmbTipoPatri.Enabled:=False;
		dbcmbSegura.Enabled:=False;
    // cadastro de ve�culo
    dbChassi.Enabled:=False;
    dbPlaca.Enabled:=False;
    dbAnoFabr.Enabled:=False;
    dbAnoModelo.Enabled:=False;
    dbCor.Enabled:=False;
    // cadastro de im�vel
    dbNumEscritura.Enabled:=False;
    dbEndereco.Enabled:=False;
    dbNum.Enabled:=False;
    dbComplemento.Enabled:=False;
    dbBairro.Enabled:=False;
    dbCep.Enabled:=False;
    dbCidade.Enabled:=False;
    dbUF.Enabled:=False;
    dbAreaTerr.Enabled:=False;
    dbTipoArea.Enabled:=False;
    dbAreaConstru.Enabled:=False;
    // cadastro de equipamento
    dbNumSer.Enabled:=False;
    dbMarca.Enabled:=False;
    dbFimGaran.Enabled:=False;
 		ShowMessage ('Dados gravados com sucesso!');
    End
  Else
  	Begin
    	If Vazio Then
      begin
      	ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
        pgcpatri.ActivePage:=pgpatri;
      	dbePatri.SetFocus;
     end;
  	end;
Tabela.Free;

end;

procedure TFrmPatri.BtnCancelarClick(Sender: TObject);
begin
  NovoItem:=False;
  dmDados.vTabStt:=True;
  DMDados.TbPatrimonio.Cancel;
  dmdados.tbVeiculo.Cancel;
  dmdados.tbImovel.Cancel;
  dmdados.tbEquipamento.Cancel;
  BtnGravar.Enabled:=False;
  BtnCancelar.Enabled:=False;
  BtnNovo.Enabled:=True;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  BtnLocalizar.Enabled:=True;
  SpeedBar1.SetFocus;
  {desabilitando os objetos}
  dbePatri.Enabled:=false;
  DBEPlaq.Enabled:=False;
  DBEDesc.Enabled:=False;
  DBENF.Enabled:=False;
  DBEQtde.Enabled:=False;
  DBDDtAq.Enabled:=False;
  RxDBCVlAq.Enabled:=False;
  RxDBCVlMerc.Enabled:=False;
  DBDVencSeg.Enabled:=False;
  RxDBCVlSeg.Enabled:=False;
  DBMDet.Enabled:=False;
  RxDBCVlVend.Enabled:=False;
  dbcmbCondicoes.Enabled:=False;
  dbCodFor.Enabled:=False;
  dbCodCompra.Enabled:=False;
  dbcmbCentroCusto.Enabled:=False;
  dbcmbTipoPatri.Enabled:=False;
  dbcmbSegura.Enabled:=False;
  // cadastro de ve�culo
  dbChassi.Enabled:=False;
  dbPlaca.Enabled:=False;
  dbAnoFabr.Enabled:=False;
  dbAnoModelo.Enabled:=False;
  dbCor.Enabled:=False;
  // cadastro de im�vel
  dbNumEscritura.Enabled:=False;
  dbEndereco.Enabled:=False;
  dbNum.Enabled:=False;
  dbComplemento.Enabled:=False;
  dbBairro.Enabled:=False;
  dbCep.Enabled:=False;
  dbCidade.Enabled:=False;
  dbUF.Enabled:=False;
  dbAreaTerr.Enabled:=False;
  dbTipoArea.Enabled:=False;
  dbAreaConstru.Enabled:=False;
  // cadastro de equipamento
  dbNumSer.Enabled:=False;
  dbMarca.Enabled:=False;
  dbFimGaran.Enabled:=False;
  // cadastro de ve�culo
  if dbcmbTipoPatri.Text='Ve�culo'then
    dmdados.tbVeiculo.FindKey([dbePatri.Text]);
  // cadastro de im�vel
  if dbcmbTipoPatri.Text='Im�vel'then
    dmdados.tbImovel.FindKey([dbePatri.Text]);
  // cadastro de equipamento
  if dbcmbTipoPatri.Text='Equipamento'then
    dmdados.tbEquipamento.FindKey([dbePatri.Text]);
  // cadastro de ve�culo
  if dbcmbTipoPatri.Text='Ve�culo'then
    begin
    pnVeiculo.Visible:=True;
    pnImovel.Visible:=False;
    pnEquipa.Visible:=False;
    pnOutro.Visible:=False;
    end;
  // cadastro de im�vel
  if dbcmbTipoPatri.Text='Im�vel'then
    begin
    pnVeiculo.Visible:=False;
    pnImovel.Visible:=True;
    pnEquipa.Visible:=False;
    pnOutro.Visible:=False;
    end;
  // cadastro de equipamento
  if dbcmbTipoPatri.Text='Equipamento'then
    begin
    pnVeiculo.Visible:=False;
    pnImovel.Visible:=False;
    pnEquipa.Visible:=True;
    pnOutro.Visible:=False;
    end;
  // cadastro de outros tipos
  if dbcmbTipoPatri.Text='Outros' then
    begin
    pnVeiculo.Visible:=False;
    pnImovel.Visible:=False;
    pnEquipa.Visible:=False;
    pnOutro.Visible:=True;
    end;
end;

procedure TFrmPatri.BtnAlterarClick(Sender: TObject);
begin
  if DMDados.TbPatrimonio.RecordCount=0 then
    ShowMessage('Tabela Vazia')
  else
    begin
    // cadastro de ve�culo
    if dbcmbTipoPatri.Text='Ve�culo'then
      dmdados.tbVeiculo.FindKey([dbePatri.Text]);
    // cadastro de im�vel
    if dbcmbTipoPatri.Text='Im�vel'then
      dmdados.tbImovel.FindKey([dbePatri.Text]);
    // cadastro de equipamento
    if dbcmbTipoPatri.Text='Equipamento'then
      dmdados.tbEquipamento.FindKey([dbePatri.Text]);
    NovoItem:=True;
    dmDados.vTabStt:=false;
    DMDados.TbPatrimonio.Edit;
    dmdados.tbVeiculo.Edit;
    dmdados.tbImovel.Edit;
    dmdados.tbEquipamento.Edit;
    {habilitando os bot�es}
    BtnCancelar.Enabled:=True;
    BtnGravar.Enabled:=True;
    BtnNovo.Enabled:=False;
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    BtnAlterar.Enabled:=False;
    Btndeletar.Enabled:=False;
    BtnLocalizar.Enabled:=False;
    {habilitando os componentes}
    dbePatri.Enabled:=true;
    DBEPlaq.Enabled:=True;
    DBEDesc.Enabled:=True;
    DBENF.Enabled:=True;
    DBEQtde.Enabled:=True;
    DBDDtAq.Enabled:=True;
    RxDBCVlAq.Enabled:=True;
    RxDBCVlMerc.Enabled:=True;
    DBDVencSeg.Enabled:=True;
    RxDBCVlSeg.Enabled:=True;
    DBMDet.Enabled:=True;
    RxDBCVlVend.Enabled:=True;
    dbcmbCondicoes.Enabled:=True;
    dbCodFor.Enabled:=True;
    dbCodCompra.Enabled:=True;
    dbcmbCentroCusto.Enabled:=True;
    dbcmbTipoPatri.Enabled:=True;
    dbcmbSegura.Enabled:=True;
    // cadastro de ve�culo
    if dbcmbTipoPatri.Text='Ve�culo'then
      begin
      dbChassi.Enabled:=True;
      dbPlaca.Enabled:=True;
      dbAnoFabr.Enabled:=True;
      dbAnoModelo.Enabled:=True;
      dbCor.Enabled:=True;
      end;
    // cadastro de im�vel
    if dbcmbTipoPatri.Text='Im�vel'then
      begin
      dbNumEscritura.Enabled:=True;
      dbEndereco.Enabled:=True;
      dbNum.Enabled:=True;
      dbComplemento.Enabled:=True;
      dbBairro.Enabled:=True;
      dbCep.Enabled:=True;
      dbCidade.Enabled:=True;
      dbUF.Enabled:=True;
      dbAreaTerr.Enabled:=True;
      dbTipoArea.Enabled:=True;
      dbAreaConstru.Enabled:=True;
      end;
    // cadastro de equipamento
    if dbcmbTipoPatri.Text='Equipamento'then
      begin
      dbNumSer.Enabled:=True;
      dbMarca.Enabled:=True;
      dbFimGaran.Enabled:=True;
      end;
    pgcpatri.ActivePage:=pgpatri;
    DBEPatri.SetFocus;
    end;
end;

procedure TFrmPatri.BtnDeletarClick(Sender: TObject);
begin
  if DMDados.TbPatrimonio.RecordCount=0 then
    ShowMessage('Tabela Vazia')
  else
    begin
    if Application.MessageBox('Tem certeza que deseja excluir este patrim�nio ?','Excluir', mb_yesno+mb_iconquestion+mb_defbutton1+mb_applmodal) = id_yes then
      begin
      // cadastro de ve�culo
      if dbcmbTipoPatri.Text='Ve�culo'then
        begin
        if dmdados.tbVeiculo.FindKey([dbePatri.Text]) then
          dmdados.tbVeiculo.Delete;
        end;
      // cadastro de im�vel
      if dbcmbTipoPatri.Text='Im�vel'then
        begin
        if dmdados.tbImovel.FindKey([dbePatri.Text]) then
          dmdados.tbImovel.Delete;
        end;
      // cadastro de equipamento
      if dbcmbTipoPatri.Text='Equipamento'then
        begin
        if dmdados.tbEquipamento.FindKey([dbePatri.Text]) then
          dmdados.tbEquipamento.Delete;
        end;
      DMDados.TbPatrimonio.Delete;
      // cadastro de ve�culo
      if dbcmbTipoPatri.Text='Ve�culo'then
        dmdados.tbVeiculo.FindKey([dbePatri.Text]);
      // cadastro de im�vel
      if dbcmbTipoPatri.Text='Im�vel'then
        dmdados.tbImovel.FindKey([dbePatri.Text]);
      // cadastro de equipamento
      if dbcmbTipoPatri.Text='Equipamento'then
        dmdados.tbEquipamento.FindKey([dbePatri.Text]);
      // cadastro de ve�culo
      if dbcmbTipoPatri.Text='Ve�culo'then
        begin
        pnVeiculo.Visible:=True;
        pnImovel.Visible:=False;
        pnEquipa.Visible:=False;
        pnOutro.Visible:=False;
        end;
      // cadastro de im�vel
      if dbcmbTipoPatri.Text='Im�vel'then
        begin
        pnVeiculo.Visible:=False;
        pnImovel.Visible:=True;
        pnEquipa.Visible:=False;
        pnOutro.Visible:=False;
        end;
      // cadastro de equipamento
      if dbcmbTipoPatri.Text='Equipamento'then
        begin
        pnVeiculo.Visible:=False;
        pnImovel.Visible:=False;
        pnEquipa.Visible:=True;
        pnOutro.Visible:=False;
        end;
      // cadastro de outros tipos
      if dbcmbTipoPatri.Text='Outros' then
        begin
        pnVeiculo.Visible:=False;
        pnImovel.Visible:=False;
        pnEquipa.Visible:=False;
        pnOutro.Visible:=True;
        end;
      end
    else
      DMDados.TbPatrimonio.Cancel;
    end;
end;

procedure TFrmPatri.BtnSairClick(Sender: TObject);
begin
Close;
end;


procedure TFrmPatri.btLocCustoClick(Sender: TObject);
begin
  if (dmdados.TbPatrimonio.State=dsInsert)or(dmdados.TbPatrimonio.State=dsEdit) then
    begin
    frmLocFornec:=tfrmLocFornec.create(application);
    frmLocFornec.showmodal;
    dmDados.TbPatrimonioCodFor.Value:=frmLocFornec.Resultado;
    frmlocFornec.Free;
    end;
end;

procedure TFrmPatri.btLocCompraClick(Sender: TObject);
begin
if (dmdados.TbPatrimonio.State=dsInsert)or(dmdados.TbPatrimonio.State=dsEdit) then
begin
frmLocComprador:=tfrmLocComprador.create(application);
frmLocComprador.showmodal;
dmDados.TbPatrimonioCodCompra.Value:=frmLocComprador.Resultado;
frmlocComprador.Free;
end;
end;


procedure TFrmPatri.dbCodForExit(Sender: TObject);
begin
	If NovoItem Then
  	Begin
    if dbcodfor.Text=''then
       begin
       ShowMessage('Obrigat�rio informar o C�DIGO do fornecedor');
       dbcodfor.SetFocus;
       end
       else
       begin
         If Not(dmDados.tbFornecedor.Locate('CodFor',dbCodFor.Text,[])) Then
    	    Begin
          Showmessage('Fornecedor n�o Cadastrado');
          dbCodFor.Clear;
          dbCodFor.setfocus;
          End ;
       end;
   end;       

End;

procedure TFrmPatri.dbCodCompraExit(Sender: TObject);
begin
	If NovoItem Then
  	Begin
	  If dbCodCompra.Text <> '' Then
      Begin
			  If Not(dmDados.TbComprador.Locate('CodCompra',dbCodCompra.Text,[])) Then
  			  Begin
    		  Showmessage('Comprador n�o Cadastrado');
    		  dbCodCompra.Clear;
	    	  dbCodCompra.setfocus;
	    	  End;
      end;
    end;
end;

procedure TFrmPatri.dbcmbCondicoesExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
	If NovoItem Then
  	Begin
		If dbcmbCondicoes.Text= '' then
   		Begin
   		ShowMessage('� obrigat�rio informar as condi��es do patrim�nio');
   		dbcmbCondicoes.SetFocus;
   		End
    Else
      Begin
      Flag:=True;
      For x:=0 to dbcmbCondicoes.Items.Count-1 Do
        If dbcmbCondicoes.Text=dbcmbCondicoes.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor das condi��es do patrim�nio inv�lido');
        dbcmbCondicoes.SetFocus;
        End;
      end;
    end;
end;


procedure TFrmPatri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.TbPatrimonio.Close;
  dmdados.TbComprador.Close;
  dmdados.TbSeguradora.Close;
  dmdados.tbFornecedor.Close;
  dmdados.tbCCusto.Close;
  dmdados.tbImovel.Close;
  dmdados.tbVeiculo.Close;
  dmdados.tbEquipamento.Close;
  Action:=caFree;
end;

procedure TFrmPatri.dbcmbTipoPatriExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
	If NovoItem Then
  	Begin
		If dbcmbTipoPatri.Text= '' then
   		Begin
   		ShowMessage('� obrigat�rio informar o tipo do patrim�nio');
   		dbcmbTipoPatri.SetFocus;
   		End
    Else
      Begin
      Flag:=True;
      For x:=0 to dbcmbTipoPatri.Items.Count-1 Do
        If dbcmbTipoPatri.Text=dbcmbTipoPatri.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('Valor do tipo de patrim�nio � inv�lido');
        dbcmbTipoPatri.SetFocus;
        End
      else
        if dbcmbTipoPatri.Text='Outros' then
          pgcPatri.ActivePage:=pgGerais
        else
          pgcPatri.ActivePage:=pgEspe;
      end;
    end;
end;

procedure TFrmPatri.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmPatri.FormShow(Sender: TObject);
begin
  NovoItem:= false;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [Delete] Excluir [End] Gravar [F9] Localizar [Esc] Cancelar ou Sair');
  dmDados.vTabStt:=True;
  pgcpatri.ActivePage:=pgpatri;
  // cadastro de ve�culo
  if dbcmbTipoPatri.Text='Ve�culo'then
    dmdados.tbVeiculo.FindKey([dbePatri.Text]);
  // cadastro de im�vel
  if dbcmbTipoPatri.Text='Im�vel'then
    dmdados.tbImovel.FindKey([dbePatri.Text]);
  // cadastro de equipamento
  if dbcmbTipoPatri.Text='Equipamento'then
    dmdados.tbEquipamento.FindKey([dbePatri.Text]);
  // cadastro de ve�culo
  if dbcmbTipoPatri.Text='Ve�culo'then
    begin
    pnVeiculo.Visible:=True;
    pnImovel.Visible:=False;
    pnEquipa.Visible:=False;
    pnOutro.Visible:=False;
    end;
  // cadastro de im�vel
  if dbcmbTipoPatri.Text='Im�vel'then
    begin
    pnVeiculo.Visible:=False;
    pnImovel.Visible:=True;
    pnEquipa.Visible:=False;
    pnOutro.Visible:=False;
    end;
  // cadastro de equipamento
  if dbcmbTipoPatri.Text='Equipamento'then
    begin
    pnVeiculo.Visible:=False;
    pnImovel.Visible:=False;
    pnEquipa.Visible:=True;
    pnOutro.Visible:=False;
    end;
  // cadastro de outros tipos
  if dbcmbTipoPatri.Text='Outros' then
    begin
    pnVeiculo.Visible:=False;
    pnImovel.Visible:=False;
    pnEquipa.Visible:=False;
    pnOutro.Visible:=True;
    end;
end;

procedure TFrmPatri.BtnLocalizarClick(Sender: TObject);
begin
  FrmLocPatrimonio:=TFrmLocPatrimonio.Create(Application);
  FrmLocPatrimonio.showmodal;
  frmLocPatrimonio.Free;

end;

procedure TFrmPatri.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_Home   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_Delete : if (dmDados.vTabStt) then BtnDeletar.Click;
      VK_End    : if not(dmDados.vTabStt) then BtnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
      VK_F9     : btnLocalizar.Click;
    end;

end;

procedure TFrmPatri.FormCreate(Sender: TObject);
begin
  dmdados.TbComprador.Open;
  dmdados.tbFornecedor.Open;
  dmdados.TbPatrimonio.Open;
  dmdados.TbSeguradora.Open;
  dmdados.tbCCusto.Open;
  dmdados.tbImovel.Open;
  dmdados.tbVeiculo.Open;
  dmdados.tbEquipamento.Open;
end;

procedure TFrmPatri.DBnumescrituraExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbnumescritura.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o N�MERO DA ESCRITURA');
      dbnumescritura.SetFocus;
      End;
    end;
end;

procedure TFrmPatri.DBEnderecoExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbendereco.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o ENDERE�O');
      dbendereco.SetFocus;
      End;
    end;
end;

procedure TFrmPatri.DBNumExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbnum.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o N�MERO');
      dbnum.SetFocus;
      End;
    end;
end;

procedure TFrmPatri.DBBairroExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbbairro.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o BAIRRO');
      dbbairro.SetFocus;
      End;
    end;
end;

procedure TFrmPatri.DBCidadeExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbcidade.Text= '' then
      Begin
      ShowMessage('� obrigat�rio a CIDADE');
      dbcidade.SetFocus;
      End;
    end;
end;

procedure TFrmPatri.DBufExit(Sender: TObject);
Var
  x:integer;
  Flag:Boolean;
begin
  If NovoItem Then
    If DBUF.Text= '' then
      Begin
      ShowMessage('� obrigat�rio informar ESTADO');
      DBUF.SetFocus;
      End
    Else
      Begin
      Flag:=True;
      For x:=0 to DBUF.Items.Count-1 Do
        If DBUF.Text=DBUF.Items[x] Then
          Flag:=False;
      If Flag Then
        Begin
        ShowMessage('ESTADO inv�lido');
        DBUF.SetFocus;
        End
      End;
end;

procedure TFrmPatri.dbcmbTipoPatriChange(Sender: TObject);
begin
  // cadastro de ve�culo
  if dbcmbTipoPatri.Text='Ve�culo'then
    begin
    pnVeiculo.Visible:=True;
    pnImovel.Visible:=False;
    pnEquipa.Visible:=False;
    pnOutro.Visible:=False;
    end;
  // cadastro de im�vel
  if dbcmbTipoPatri.Text='Im�vel'then
    begin
    pnVeiculo.Visible:=False;
    pnImovel.Visible:=True;
    pnEquipa.Visible:=False;
    pnOutro.Visible:=False;
    end;
  // cadastro de equipamento
  if dbcmbTipoPatri.Text='Equipamento'then
    begin
    pnVeiculo.Visible:=False;
    pnImovel.Visible:=False;
    pnEquipa.Visible:=True;
    pnOutro.Visible:=False;
    end;
  // cadastro de outros tipos
  if dbcmbTipoPatri.Text='Outros' then
    begin
    pnVeiculo.Visible:=False;
    pnImovel.Visible:=False;
    pnEquipa.Visible:=False;
    pnOutro.Visible:=True;
    end;
end;

procedure TFrmPatri.DBEPatriExit(Sender: TObject);
Var
	Tabela: TTable;
begin
	If NovoItem Then
  	Begin
	  Tabela := TTable.Create(Application);
	  Tabela.DatabaseName := dmDados.tbPatrimonio.DatabaseName;
	  Tabela.TableName := dmDados.tbPatrimonio.TableName;
	  Tabela.Open;
	 	If DBEPatri.Text= '' then
	 		begin
	 		ShowMessage('� obrigat�rio o N�mero do Patrim�nio');
	 		DBEPatri.SetFocus;
	 		end
	 	else
	   	Begin
	    If Tabela.Locate('NumPatri',dbePatri.Text,[]) Then
	     	If not ((DmDados.tbPatrimonio.State=dsEdit) And (dmDados.tbPatrimonio.RecNo = Tabela.RecNo)) Then
          begin
	        Showmessage('N�mero do Parim�nio j� Cadastrado');
	        dbePatri.Clear;
	        dbePatri.setfocus;
	        End;
	    End;
	  Tabela.Free;
    dmdados.tbVeiculoNumPatri.Value:=dbePatri.Text;
    dmdados.tbImovelNumPatri.Value:=dbePatri.Text;
    dmdados.tbEquipamentoNumPatri.Value:=dbePatri.Text;
    End;
end;

procedure TFrmPatri.DBchassiExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbchassi.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o CHASSI');
      dbchassi.SetFocus;
      End;
    end;
end;

procedure TFrmPatri.DBplacaExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbchassi.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o CHASSI');
      dbchassi.SetFocus;
      End;
    end;
end;

procedure TFrmPatri.DBcorExit(Sender: TObject);
begin
  pgcPatri.ActivePage:=pgGerais;
end;

procedure TFrmPatri.DBAreaconstruExit(Sender: TObject);
begin
  pgcPatri.ActivePage:=pgGerais;
end;

procedure TFrmPatri.DBnumserExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbnumser.Text= '' then
      Begin
      ShowMessage('� obrigat�rio o N�MERO DE S�RIE');
      dbnumser.SetFocus;
      End;
    end;
end;

procedure TFrmPatri.DBmarcaExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dbmarca.Text= '' then
      Begin
      ShowMessage('� obrigat�rio a MARCA');
      dbmarca.SetFocus;
      End;
    end;
end;

procedure TFrmPatri.DBfimgaranExit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBfimgaran.Text= '  /  /    ' then
      Begin
      ShowMessage('� obrigat�rio o FIM DA GARANTIA');
      DBfimgaran.SetFocus;
      End
    else
      pgcPatri.ActivePage:=pgGerais;
    end;
end;

end.
