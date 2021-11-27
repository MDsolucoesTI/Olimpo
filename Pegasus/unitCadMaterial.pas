//////////////////////////////////////////////////////////////////////////
// Cria��o...........: 08-01-2001
// Ultima modifica��o: 08-07-2005
// M�dulo............: Cadastro e Manuten��o de Mercadoris/Produtos
// Sistema...........: Pegasus - Controle de Estoque
// Integra��o........: Olimpo - Automa��o Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////
unit unitCadMaterial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RxDBComb, fcButton, fcImgBtn, DBCtrls, RxLookup, Mask,
  Grids, DBGrids, RXDBCtrl, DCStdCtrls, SpeedBar, ExtDlgs, ImgList,
  RXCtrls, RxGIF, ExtCtrls, RackCtls, jpeg,db,dbtables, EFocCol, RxGrdCpt,
  fcImager, EMsgDlg, EUserAcs, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel;

type
  TFrmCadMaterial = class(TForm)
    AbreFigura: TOpenPictureDialog;
    dlgImprimir: TPrintDialog;
    MsgDlg: TEvMsgDlg;
    RxLabel12: TRxLabel;
    Image3: TImage;
    RxLabel2: TRxLabel;
    DBEdit1: TDBEdit;
    RxLabel3: TRxLabel;
    DBEdit2: TDBEdit;
    RxLabel6: TRxLabel;
    RxLabel8: TRxLabel;
    dblkcb1: TRxDBLookupCombo;
    RxLabel4: TRxLabel;
    dblkcb2: TRxDBLookupCombo;
    RxLabel11: TRxLabel;
    DBEdit5: TDBEdit;
    RxLabel9: TRxLabel;
    DBEdit6: TDBEdit;
    RxLabel1: TRxLabel;
    DBEdit9: TDBEdit;
    dblkcb3: TRxDBLookupCombo;
    RxLabel5: TRxLabel;
    RxLabel7: TRxLabel;
    DBEdit3: TDBEdit;
    RxLabel13: TRxLabel;
    DBEdit4: TDBEdit;
    RxLabel14: TRxLabel;
    DBEdit7: TDBEdit;
    DBImage1: TDBImage;
    fcImageBtn1: TfcImageBtn;
    fcImageBtn2: TfcImageBtn;
    RxLabel15: TRxLabel;
    btnPrimeiro: TfcImageBtn;
    btnAnterior: TfcImageBtn;
    btnProximo: TfcImageBtn;
    btnUltimo: TfcImageBtn;
    btnNovo: TfcImageBtn;
    btnGravar: TfcImageBtn;
    btnCancelar: TfcImageBtn;
    btnAlterar: TfcImageBtn;
    btnDeletar: TfcImageBtn;
    btnLocalizar: TfcImageBtn;
    btnSair: TfcImageBtn;
    DBEdit8: TDBEdit;
    UserAccess: TEvUserAccess;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure btnLocImagemClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1Exit(Sender: TObject);
    procedure fcImageBtn2Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure dblkcb1Exit(Sender: TObject);
    procedure dblkcb3Exit(Sender: TObject);
    procedure dblkcb2Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadMaterial: TFrmCadMaterial;
  NovoItem:boolean;

implementation

uses unitDmDados, UnitPrincipal, UnitLocProd;

{$R *.dfm}


procedure TFrmCadMaterial.BtnAlterarClick(Sender: TObject);
begin
  If dmDados.tbEstoque.RecordCount=0 Then
    MsgDlg.MsgError('Tabela vazia!!!')
  Else
    begin
    NovoItem:=True;
    DMDados.tbEstoque.Edit;
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
    DBEdit1.Enabled:=True;
    DBEdit2.Enabled:=True;
    DBEdit3.Enabled:=True;
    DBEdit4.Enabled:=True;
    DBEdit5.Enabled:=True;
    DBEdit6.Enabled:=True;
    DBEdit7.Enabled:=True;
    dblkcb1.Enabled:=True;
    dblkcb2.Enabled:=True;
    dblkcb3.Enabled:=True;
    DBImage1.Enabled:=True;
    dmDados.vTabStt:=False;
    DBEdit1.SetFocus;
    end;
end;

procedure TFrmCadMaterial.FormShow(Sender: TObject);
begin
  dmDados.vTabStt:=True;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [F9] Localiza [F7] Abre Foto [F8] Limpa Foto [Esc] Cancelar ou Sair');
  dmdados.tbEstoque.Open;
  dmdados.tbFuncEsto.Open;
  dmdados.tbMovEstoque.Open;
  If dmDados.tbEstoque.RecordCount=0 Then
    begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    BtnNovo.Enabled:=True;
    BtnCancelar.Enabled:=False;
    BtnAlterar.Enabled:=False;
    Btndeletar.Enabled:=False;
    end;
  BtnSair.Enabled:= True;
  BtnGravar.Enabled:=False;
end;

procedure TFrmCadMaterial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmdados.tbEstoque.Close;
  dmdados.tbFuncEsto.Close;
  dmdados.tbMovEstoque.Close;
  dmDados.HabilitaTeclado:=True;
  Action:=caFree;
end;

procedure TFrmCadMaterial.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then
    Begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    End;
end;

procedure TFrmCadMaterial.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if dmDados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_INSERT : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_HOME   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_DELETE : if (dmDados.vTabStt) then BtnDeletar.Click;
      VK_END    : if not(dmDados.vTabStt) then BtnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
      VK_F7     : fcImageBtn1.Click;
      VK_F8     : fcImageBtn2.Click;
      VK_F9     : btnLocalizar.Click;
    end;
end;

procedure TFrmCadMaterial.DBEdit1Exit(Sender: TObject);
Var
  Tabela: TTable;
begin
  If NovoItem Then
    Begin
    Tabela := TTable.Create(Application);
    Tabela.DatabaseName := dmDados.tbEstoque.DatabaseName;
    Tabela.TableName := dmDados.tbEstoque.TableName;
    Tabela.IndexFieldNames:=dmDados.tbEstoque.IndexFieldNames;
    Tabela.Open;
    If DBEdit1.Text= '' then
      begin
      MsgDlg.MsgWarning('� obrigat�rio o C�digo');
      DBEdit1.SetFocus;
      end
    else
      Begin
      If Tabela.Locate('CodMerc',DBEdit1.Text,[]) Then
        If not ((DmDados.tbEstoque.State=dsEdit) And (dmDados.tbEstoque.RecNo = Tabela.RecNo)) Then
          Begin
          MsgDlg.MsgWarning('C�digo j� Cadastrado');
          DBEdit1.Clear;
          DBEdit1.setfocus;
          End;
      End;
    Tabela.Free;
   End;
end;

procedure TFrmCadMaterial.fcImageBtn2Click(Sender: TObject);
begin
  if (dmdados.tbEstoque.State=dsedit)or(dmdados.tbEstoque.State=dsInsert) then
    DMdados.tbEstoqueFoto.Clear;
end;

procedure TFrmCadMaterial.DBEdit2Exit(Sender: TObject);
begin
  If NovoItem Then
    If DBEdit2.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio a Nome do Produto');
      DBEdit2.SetFocus;
      End;
end;

procedure TFrmCadMaterial.dblkcb1Exit(Sender: TObject);
begin
If NovoItem Then
    Begin
    If dblkcb1.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o SubGrupo');
      dblkcb1.SetFocus;
      End
    Else
      If Not(dmDados.tbSubgrupo.Locate('SubGrupo',dblkcb1.Text,[])) Then
        Begin
        MsgDlg.MsgWarning('SubGrupo n�o Cadastrado');
        dblkcb1.SetFocus;
        End;
     end;
end;

procedure TFrmCadMaterial.dblkcb3Exit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dblkcb3.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio a Unidade');
      dblkcb3.SetFocus;
      End
    Else
      If Not(dmDados.tbUnidade.Locate('Descricao',dblkcb3.Text,[])) Then
        Begin
        MsgDlg.MsgWarning('Unidade n�o Cadastrada');
        dblkcb3.SetFocus;
        End;
    end;
END;

procedure TFrmCadMaterial.dblkcb2Exit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If dblkcb2.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio a Marca');
      dblkcb2.SetFocus;
      End
    Else
      If Not(dmDados.tbMarca.Locate('Marca',dblkcb2.Text,[])) Then
        Begin
        MsgDlg.MsgWarning('Marca n�o Cadastrada');
        dblkcb2.SetFocus;
        End;
      end;
end;

procedure TFrmCadMaterial.DBEdit5Exit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBEdit5.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o Pre�o de Compra');
      DBEdit5.SetFocus;
      End;
    end;  
end;

procedure TFrmCadMaterial.DBEdit6Exit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBEdit6.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o Pre�o de Venda');
      DBEdit6.SetFocus;
      End;
    end;
end;

procedure TFrmCadMaterial.DBEdit3Exit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBEdit3.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o Estoque M�nimo');
      DBEdit3.SetFocus;
      End;
    end;
end;

procedure TFrmCadMaterial.DBEdit4Exit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBEdit4.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o Estoque M�ximo');
      DBEdit4.SetFocus;
      End;
    End;
end;

procedure TFrmCadMaterial.DBEdit7Exit(Sender: TObject);
begin
  If NovoItem Then
    Begin
    If DBEdit7.Text= '' then
      Begin
      MsgDlg.MsgWarning('� obrigat�rio o Estoque Atual');
      DBEdit7.SetFocus;
      End;
    End;
end;

procedure TFrmCadMaterial.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadMaterial.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
if (DMdados.tbEstoqueQuantidade.AsInteger < DMdados.tbEstoqueEstoqueMin.AsInteger) then
  begin
    Background := clInfoBk;
    AFont.Color := clRed;
  end;
  if (DMdados.tbEstoqueQuantidade.AsInteger > DMdados.tbEstoqueEstoqueMax.AsInteger) then
  begin
    Background := clInfoBk;
    AFont.Color := clBlue;
  end;
end;

procedure TFrmCadMaterial.btnPrimeiroClick(Sender: TObject);
begin
  DMDados.tbEstoque.First;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadMaterial.btnAnteriorClick(Sender: TObject);
begin
  DMDados.tbEstoque.Prior;
  BtnProximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  If DMDados.tbEstoque.Bof Then
    Begin
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadMaterial.btnProximoClick(Sender: TObject);
begin
  DMDados.tbEstoque.Next;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  If DMDados.tbEstoque.Eof Then
    Begin
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    End;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadMaterial.btnUltimoClick(Sender: TObject);
begin
  DMDados.tbEstoque.Last;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  dmDados.vTabStt:=True;
end;

procedure TFrmCadMaterial.btnNovoClick(Sender: TObject);
begin
  btnAnterior.Enabled:=false;
  btnPrimeiro.Enabled:=false;
  btnProximo.Enabled:=false;
  btnUltimo.Enabled:=false;
  //RxDBGrid1.Enabled:=False;
  DMDados.tbEstoque.Append;
  NovoItem:=True;
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
  DBEdit1.Enabled:=True;
  DBEdit2.Enabled:=True;
  DBEdit3.Enabled:=True;
  DBEdit4.Enabled:=True;
  DBEdit5.Enabled:=True;
  DBEdit6.Enabled:=True;
  DBEdit7.Enabled:=True;
  dblkcb1.Enabled:=True;
  dblkcb2.Enabled:=True;
  dblkcb3.Enabled:=True;
  DBImage1.Enabled:=True;
  //RxDBGrid1.Enabled:=True;
  dmDados.vTabStt:=False;
  DBEdit1.SetFocus;
end;

procedure TFrmCadMaterial.btnLocImagemClick(Sender: TObject);
begin
  if (dmdados.tbEstoque.State=dsedit)or(dmdados.tbEstoque.State=dsInsert) then
    if AbreFigura.Execute then DMdados.tbEstoqueFoto.LoadFromFile(AbreFigura.FileName);
end;

procedure TFrmCadMaterial.btnCancelarClick(Sender: TObject);
begin
  NovoItem:=False;
  DMDados.tbEstoque.Cancel;
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
  {desabilitando os objetos}
  DBEdit1.Enabled:=False;
  DBEdit2.Enabled:=False;
  DBEdit3.Enabled:=False;
  DBEdit4.Enabled:=False;
  DBEdit5.Enabled:=False;
  DBEdit6.Enabled:=False;
  DBEdit7.Enabled:=False;
  dblkcb1.Enabled:=False;
  dblkcb2.Enabled:=False;
  dblkcb3.Enabled:=False;
  DBImage1.Enabled:=False;
  //RxDBGrid1.Enabled:=False;
  dmDados.vTabStt:=True;
  Panel3.SetFocus;
end;

procedure TFrmCadMaterial.btnDeletarClick(Sender: TObject);
var
  Flag : Boolean;
begin
  Flag:=False;
  If dmDados.tbEstoque.RecordCount=0 Then
    MsgDlg.MsgError('Tabela vazia!!!')
  Else
    begin
    if Application.MessageBox('Deseja realmente excluir o registro?','Aten��o !',MB_YESNO + MB_DEFBUTTON2 + MB_ICONEXCLAMATION) = IDYES then
      begin
      if dmDados.tbFuncEsto.Locate('CodMerc',dmDados.tbEstoqueCodMerc.Value,[]) then
        flag:=true;
      if dmDados.tbMovEstoque.Locate('CodMerc',dmDados.tbEstoqueCodMerc.Value,[]) then
        flag:=true;
      if dmDados.tbDetVendas.Locate('CodMerc',dmDados.tbEstoqueCodMerc.Value,[]) then
        flag:=true;
      if Flag Then
        MsgDlg.MsgInformation('Material ativo, ou com registro de opera��es anteriores.'+#13+#13+'N�o pode ser EXCLU�DO!!!')
      else
        dmdados.TbEstoque.Delete;
      end;
    end;
end;

procedure TFrmCadMaterial.btnLocalizarClick(Sender: TObject);
begin
  frmLocProd := TfrmLocProd.Create(Application);
  frmLocProd.ShowModal;
  frmLocProd.free;
end;

procedure TFrmCadMaterial.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
  Tabela: TTable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbEstoque.DatabaseName;
  Tabela.TableName := dmDados.tbEstoque.TableName;
  Tabela.Open;
  //Campo que n�o pode repetir
  If DBEdit1.Text= '' then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'C�digo';
    Gravar:=False;
    Vazio:=True;
    end
  else
    If Tabela.Locate('CodMerc',DBEdit1.Text,[]) Then
      If Not((DmDados.tbEstoque.State=dsEdit) And (dmDados.tbEstoque.RecNo = Tabela.RecNo)) Then
        Begin
       	Gravar:=False;
        MsgDlg.MsgWarning('C�digo j� Cadastrado');
        End;
  //Campo que n�o pode estar vazio
  If DBEdit7.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Estoque Atual';
    Gravar:=False;
    Vazio:=True;
    end;
  If DBEdit4.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Estoque M�ximo';
    Gravar:=False;
    Vazio:=True;
    end;
  If DBEdit3.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Estoque M�nimo';
    Gravar:=False;
    Vazio:=True;
    end;
  If DBEdit6.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Pre�o de Venda';
    Gravar:=False;
    Vazio:=True;
    end;
  If DBEdit5.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
    Campos:=Campos+'Pre�o de Compra';
    Gravar:=False;
    Vazio:=True;
    end;
  //Campo que tem conte�do de outra Tabela
  If dblkcb3.Text='' Then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Unidade';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    If Not(dmDados.tbUnidade.Locate('Descricao',dblkcb3.Text,[])) Then
      Begin
      MsgDlg.MsgWarning('Unidade n�o Cadastrada');
      Gravar:=False;
      End;
  If dblkcb3.Text='' Then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'Marca';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    If Not(dmDados.tbMarca.Locate('Marca',dblkcb2.Text,[])) Then
      Begin
      MsgDlg.MsgWarning('Marca n�o Cadastrada');
      Gravar:=False;
      End;
  If dblkcb1.Text='' Then
    begin
    If Length(Campos)>0 Then
    	Campos:=Campos+', ';
    Campos:=Campos+'SubGrupo';
    Gravar:=False;
    Vazio:=True;
    End
  Else
    If Not(dmDados.tbSubgrupo.Locate('SubGrupo',dblkcb1.Text,[])) Then
      Begin
      MsgDlg.MsgWarning('SubGrupo n�o Cadastrado');
      Gravar:=False;
      End;
  If Gravar Then
    Begin
    DMdados.tbEstoque.Post;
    dmDados.vTabStt:=true;
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
    BtnLocalizar.Enabled:=True;
    Panel3.SetFocus;
    {desabilitando os componentes}
    DBEdit1.Enabled:=False;
    DBEdit2.Enabled:=False;
    DBEdit3.Enabled:=False;
    DBEdit4.Enabled:=False;
    DBEdit5.Enabled:=False;
    DBEdit6.Enabled:=False;
    DBEdit7.Enabled:=False;
    dblkcb1.Enabled:=False;
    dblkcb2.Enabled:=False;
    dblkcb3.Enabled:=False;
    DBImage1.Enabled:=False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    End
  Else
    Begin
    If Vazio Then
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
    DBEdit1.SetFocus;
    end;
  Tabela.Free;
end;

procedure TFrmCadMaterial.FormActivate(Sender: TObject);
begin
  UserAccess.UserID:=frmPrincipal.Acesso;
end;

end.
