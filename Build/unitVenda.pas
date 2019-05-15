unit unitVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unitBase, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.CategoryButtons, Vcl.WinXCtrls, Vcl.Imaging.pngimage, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, frxClass;

type
  TformVenda = class(TformBasico)
    Image1: TImage;
    GroupBox2: TGroupBox;
    DBEdit7: TDBEdit;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    FDQueryProduto: TFDQuery;
    DSProduto: TDataSource;
    FDQueryCliente: TFDQuery;
    DSCliente: TDataSource;
    FDQueryVendedor: TFDQuery;
    DSVendedor: TDataSource;
    DSTabelaItens: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    botaoExcluir: TSpeedButton;
    botaoAdicionar: TSpeedButton;
    botaoCancelar: TSpeedButton;
    botaoConfirmar: TSpeedButton;
    FDTabelaID: TFDAutoIncField;
    FDTabelaDATA_INC: TSQLTimeStampField;
    FDTabelaSTATUS: TStringField;
    FDTabelaVEN_ID_CLIENTE: TIntegerField;
    FDTabelaVEN_ID_VENDEDOR: TIntegerField;
    FDTabelaVEN_VAL_PROD: TBCDField;
    FDTabelaVEN_VAL_DESC: TBCDField;
    FDTabelaVEN_VAL_TOTAL: TBCDField;
    FDTabelaItens: TFDTable;
    FDTabelaItensVI_ID_VENDA: TIntegerField;
    FDTabelaItensVI_ID_PRODUTO: TIntegerField;
    FDTabelaItensVI_VALOR_UNT: TBCDField;
    FDTabelaItensVI_QTDE: TIntegerField;
    FDTabelaItensVI_VALOR_TOTAL: TBCDField;
    FDTabelaItensNomeProduto: TStringField;
    frxReport1: TfrxReport;
    procedure botaoExcluirClick(Sender: TObject);
    procedure botaoAdicionarClick(Sender: TObject);
    procedure botaoCancelarClick(Sender: TObject);
    procedure botaoConfirmarClick(Sender: TObject);
    procedure FDTabelaItensAfterDelete(DataSet: TDataSet);
    procedure FDTabelaItensAfterPost(DataSet: TDataSet);
    procedure FDTabelaItensNewRecord(DataSet: TDataSet);
    procedure FDTabelaItensVI_ID_PRODUTOValidate(Sender: TField);
    procedure FDTabelaVEN_ID_CLIENTEValidate(Sender: TField);
    procedure FDTabelaVEN_ID_VENDEDORValidate(Sender: TField);
    procedure actIncluirExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formVenda: TformVenda;

implementation

{$R *.dfm}

uses unitDM;

procedure TformVenda.actCancelarExecute(Sender: TObject);
begin
  inherited;
  GroupBox2.Hide;
  GroupBox3.Hide;
end;

procedure TformVenda.actIncluirExecute(Sender: TObject);
begin
  inherited;
  GroupBox2.Show;
  GroupBox3.Show;
  FDTabela.Post;
  FDTabela.Edit;
  FDTabelaVEN_VAL_DESC.AsFloat := 0;
  actSalvar.Enabled := False;
  botaoAdicionar.Enabled := True;
  botaoExcluir.Enabled := False;
  botaoConfirmar.Enabled := False;
  botaoCancelar.Enabled := False;
end;

procedure TformVenda.actSalvarExecute(Sender: TObject);
begin
  if not (FDTabela.State in [dsInsert, dsEdit]) then
    begin
      mensagem := 'N�o h� um pedido em aberto. Abra um pedido e a� tente salvar novamente.';
      Application.MessageBox(PChar(mensagem), 'Aten��o', MB_OK + MB_ICONWARNING);
      Abort;
    end
  else
    begin
      inherited;
      GroupBox2.Hide;
      GroupBox3.Hide;
    end;
end;

procedure TformVenda.botaoAdicionarClick(Sender: TObject);
begin
  inherited;
  botaoAdicionar.Enabled := False;
  botaoExcluir.Enabled := False;
  botaoConfirmar.Enabled := True;
  botaoCancelar.Enabled := True;
  FDTabelaItens.Insert;
  DBEdit3.SetFocus;
end;

procedure TformVenda.botaoCancelarClick(Sender: TObject);
begin
  inherited;
  botaoAdicionar.Enabled := True;
  botaoExcluir.Enabled := True;
  botaoConfirmar.Enabled := False;
  botaoCancelar.Enabled := False;
  FDTabelaItens.Cancel;
end;

procedure TformVenda.botaoConfirmarClick(Sender: TObject);
begin
  inherited;
  if DBEdit3.Text = '' then
    begin
      mensagem := 'Voc� precisa adicionar um produto para continuar.';
      Application.MessageBox(PChar(mensagem), 'Aten��o', MB_OK + MB_ICONWARNING);
      Abort;
    end;
  if DBEdit5.Text = '' then
    begin
      mensagem := 'O campo quantidade n�o pode ser deixado em branco.';
      Application.MessageBox(PChar(mensagem), 'Aten��o', MB_OK + MB_ICONWARNING);
      Abort;
    end;
  if DBEdit1.Text = '' then
    begin
      mensagem := 'O campo cliente n�o pode ser deixado em branco.';
      Application.MessageBox(PChar(mensagem), 'Aten��o', MB_OK + MB_ICONWARNING);
      Abort;
    end;
  if DBEdit2.Text = '' then
    begin
      mensagem := 'O campo vendedor n�o pode ser deixado em branco.';
      Application.MessageBox(PChar(mensagem), 'Aten��o', MB_OK + MB_ICONWARNING);
      Abort;
    end;

  botaoAdicionar.Enabled := True;
  botaoExcluir.Enabled := True;
  botaoConfirmar.Enabled := False;
  botaoCancelar.Enabled := False;

  DM.FDEstoque.Close;
  DM.FDEstoque.Filter := 'ID = ' + FDTabelaItensVI_ID_PRODUTO.AsString;
  DM.FDEstoque.Filtered := True;
  DM.FDEstoque.Open();
  DM.FDEstoque.Edit;
  DM.FDEstoquePRO_ESTOQUE.AsInteger := DM.FDEstoquePRO_ESTOQUE.AsInteger - FDTabelaItensVI_QTDE.AsInteger;
  DM.FDEstoque.Post;
  actSalvar.Enabled := True;
end;

procedure TformVenda.botaoExcluirClick(Sender: TObject);
begin
  inherited;
  botaoAdicionar.Enabled := True;
  botaoExcluir.Enabled := True;
  botaoConfirmar.Enabled := False;
  botaoCancelar.Enabled := False;

  DM.FDEstoque.Close;
  DM.FDEstoque.Filter := 'ID = ' + FDTabelaItensVI_ID_PRODUTO.AsString;
  DM.FDEstoque.Filtered := True;
  DM.FDEstoque.Open();

  DM.FDEstoque.Edit;
  DM.FDEstoquePRO_ESTOQUE.AsInteger := DM.FDEstoquePRO_ESTOQUE.AsInteger + FDTabelaItensVI_QTDE.AsInteger;
  DM.FDEstoque.Post;

  FDTabelaItens.Delete;

  mensagem := 'Voc� removeu o produto do carrinho. O estoque n�o foi afetado. ';

  Application.MessageBox(Pchar(mensagem), 'Informa��o', MB_OK + MB_ICONINFORMATION);
end;

procedure TformVenda.DBEdit5Exit(Sender: TObject);
var ValTotal, Quantidade, ValorUnt: Real;
begin
  Quantidade := StrToFloat(DBEdit5.Text);
  ValorUnt := StrToFloat(DBEdit4.Text);
  ValTotal := Quantidade * ValorUnt;
  DBEdit6.Text := FloatToStr(ValTotal);
end;

procedure TformVenda.FDTabelaItensAfterDelete(DataSet: TDataSet);
var BMK: TBookmark;
    ValorTotal: Real;
begin
  inherited;
  with FDTabelaItens do
    begin
      BMK := GetBookmark;
      DisableControls;
        try
          ValorTotal := 0;
          First;
          while not EOF do
            begin
              ValorTotal := ValorTotal + FDTabelaItensVI_VALOR_TOTAL.AsFloat;
              Next;
            end;
        finally
          EnableControls;
            if BMK <> nil then
              begin
                GotoBookmark(BMK);
                FreeBookmark(BMK);
              end;
        end;
        if not (FDTabela.State in [dsInsert, dsEdit]) then
        FDTabela.Edit;
        FDTabelaVEN_VAL_PROD.AsFloat := ValorTotal;
        FDTabelaVEN_VAL_TOTAL.AsFloat := ValorTotal - FDTabelaVEN_VAL_DESC.AsFloat;
    end;
end;

procedure TformVenda.FDTabelaItensAfterPost(DataSet: TDataSet);
var BMK: TBookmark;
    ValorTotal: Real;
begin
  inherited;
  with FDTabelaItens do
    begin
      BMK := GetBookmark;
      DisableControls;
        try
          ValorTotal := 0;
          First;
          while not EOF do
            begin
              ValorTotal := ValorTotal + FDTabelaItensVI_VALOR_TOTAL.AsFloat;
              Next;
            end;
        finally
          EnableControls;
            if BMK <> nil then
              begin
                GotoBookmark(BMK);
                FreeBookmark(BMK);
              end;
        end;
        if not (FDTabela.State in [dsInsert, dsEdit]) then
        FDTabela.Edit;
        FDTabelaVEN_VAL_PROD.AsFloat := ValorTotal;
        FDTabelaVEN_VAL_TOTAL.AsFloat := ValorTotal - FDTabelaVEN_VAL_DESC.AsFloat;
    end;
end;

procedure TformVenda.FDTabelaItensNewRecord(DataSet: TDataSet);
begin
  inherited;
  FDTabelaItensVI_ID_VENDA.AsInteger := FDTabelaID.AsInteger;
end;

procedure TformVenda.FDTabelaItensVI_ID_PRODUTOValidate(Sender: TField);
begin
  inherited;
  if not FDQueryProduto.Locate('ID', FDTabelaItensVI_ID_PRODUTO.AsString, []) then
    begin
      mensagem := 'Produto n�o encontrado';
      Application.MessageBox(PChar(mensagem), 'Aviso', MB_OK + MB_ICONERROR);
      DBLookupComboBox3.SetFocus;
      abort;
    end
  else
    begin
      FDTabelaItensVI_QTDE.AsInteger := 1;
      FDTabelaItensVI_VALOR_UNT.AsFloat := FDQueryProduto.FieldByName('PRO_VALOR').AsFloat;
      FDTabelaItensVI_VALOR_TOTAL.AsFloat := FDQueryProduto.FieldByName('PRO_VALOR').AsFloat;
    end;
end;

procedure TformVenda.FDTabelaVEN_ID_CLIENTEValidate(Sender: TField);
begin
  inherited;
  if not FDQueryCliente.Locate('ID', FDTabelaVEN_ID_CLIENTE.AsString, []) then
    begin
      mensagem := 'Cliente n�o encontrado';
      Application.MessageBox(PChar(mensagem), 'Aviso', MB_OK + MB_ICONERROR);
      DBLookupComboBox1.SetFocus;
      abort;
    end;
end;

procedure TformVenda.FDTabelaVEN_ID_VENDEDORValidate(Sender: TField);
begin
  inherited;
  if not FDQueryVendedor.Locate('ID', FDTabelaVEN_ID_VENDEDOR.AsString, []) then
    begin
      mensagem := 'Vendedor n�o encontrado';
      Application.MessageBox(PChar(mensagem), 'Aviso', MB_OK + MB_ICONERROR);
      DBLookupComboBox2.SetFocus;
      abort;
    end;
end;

procedure TformVenda.FormActivate(Sender: TObject);
begin
  inherited;
  botaoAdicionar.Enabled := False;
  botaoExcluir.Enabled := False;
  botaoConfirmar.Enabled := False;
  botaoCancelar.Enabled := False;

  FDTabela.Open();
  FDTabelaItens.Open();

  FDQueryProduto.Close;
  FDQueryProduto.Open();
  FDQueryCliente.Close;
  FDQueryCliente.Open();
  FDQueryVendedor.Close;
  FDQueryVendedor.Open();

  GroupBox2.Hide;
  GroupBox3.Hide;
end;

end.
