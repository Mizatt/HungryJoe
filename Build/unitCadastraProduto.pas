unit unitCadastraProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unitBase, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.CategoryButtons, Vcl.WinXCtrls, Vcl.Imaging.pngimage, Vcl.Buttons,
  Vcl.DBCtrls;

type
  TformCadastraProduto = class(TformBasico)
    GroupBox2: TGroupBox;
    cadastroDescricao: TLabeledEdit;
    cadastroValor: TLabeledEdit;
    cadastroEstoqueMinimo: TLabeledEdit;
    cadastroEstoqueDisponivel: TLabeledEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    FDQueryProduto: TFDQuery;
    DSProduto: TDataSource;
    Switch: TToggleSwitch;
    Label5: TLabel;
    FDTabelaID: TFDAutoIncField;
    FDTabelaSTATUS: TStringField;
    FDTabelaPRO_ID_CATEGORIA: TIntegerField;
    FDTabelaPRO_ID_FORNECEDOR: TIntegerField;
    FDTabelaPRO_DESCRICAO: TStringField;
    FDTabelaPRO_VALOR: TBCDField;
    FDTabelaPRO_EST_MINIMO: TIntegerField;
    FDTabelaPRO_ESTOQUE: TIntegerField;
    FDTabelaDATA_INC: TSQLTimeStampField;
    Image1: TImage;
    procedure actIncluirExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SwitchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadastraProduto: TformCadastraProduto;

implementation

{$R *.dfm}

uses unitLogin, unitDM, unitMenuPrincipal;

procedure TformCadastraProduto.actIncluirExecute(Sender: TObject);
begin
  inherited;
  actAlterar.Enabled := False;
  FDTabelaPRO_DESCRICAO.AsString := cadastroDescricao.Text;
  FDTabelaPRO_VALOR.AsFloat := StrToFloat(cadastroValor.Text);
  FDTabelaPRO_EST_MINIMO.AsInteger := StrToInt(cadastroEstoqueMinimo.Text);
  FDTabelaPRO_ESTOQUE.AsInteger := StrToInt(cadastroEstoqueDisponivel.Text);
end;


procedure TformCadastraProduto.FormActivate(Sender: TObject);
begin
  FDTabela.TableName:= 'Produto';
  FDTabela.Open();
end;

procedure TformCadastraProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  formMenuPrincipal.Show;
end;

procedure TformCadastraProduto.SwitchClick(Sender: TObject);
begin
  inherited;
  if Switch.State = tssOn then
  begin
    FDTabela.FieldByName('STATUS').AsString := 'A';
  end
  else
  begin
    FDTabela.FieldByName('STATUS').AsString := 'I';
  end;
end;

end.
