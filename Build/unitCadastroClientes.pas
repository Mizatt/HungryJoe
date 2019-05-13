unit unitCadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unitBase, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.CategoryButtons, Vcl.WinXCtrls, Vcl.Imaging.pngimage, Vcl.Mask;

type
  TformCadastroClientes = class(TformBasico)
    Image1: TImage;
    nomeCliente: TLabeledEdit;
    enderecoCliente: TLabeledEdit;
    bairroCliente: TLabeledEdit;
    numeroCliente: TLabeledEdit;
    obsDoCliente: TLabeledEdit;
    telefoneCliente: TMaskEdit;
    Label1: TLabel;
    FDTabelaID: TFDAutoIncField;
    FDTabelaCAD_NOME: TStringField;
    FDTabelaCAD_ENDERECO: TStringField;
    FDTabelaCAD_CIDADE: TStringField;
    FDTabelaCAD_BAIRRO: TStringField;
    FDTabelaCAD_CPF: TStringField;
    FDTabelaCAD_TELEFONE: TStringField;
    FDTabelaCAD_CELULAR: TStringField;
    FDTabelaCAD_OBS: TMemoField;
    FDTabelaCAD_CLIENTE: TStringField;
    FDTabelaCAD_ENTREGADOR: TStringField;
    FDTabelaSTATUS: TStringField;
    FDTabelaDATA_INC: TSQLTimeStampField;
    cidadeCliente: TLabeledEdit;
    celularCliente: TMaskEdit;
    Label2: TLabel;
    FDTabelaCAD_NUMERO: TStringField;
    procedure actIncluirExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadastroClientes: TformCadastroClientes;

implementation

{$R *.dfm}

uses unitMenuPrincipal, unitDM, unitManutencaoUsuario;

procedure TformCadastroClientes.actCancelarExecute(Sender: TObject);
begin
  inherited;
  actSair.Enabled := True;
end;

procedure TformCadastroClientes.actIncluirExecute(Sender: TObject);
begin
  inherited;
  actSair.Enabled := False;
end;


procedure TformCadastroClientes.actSairExecute(Sender: TObject);
begin
  inherited;
  formMenuPrincipal.Show;
end;

procedure TformCadastroClientes.actSalvarExecute(Sender: TObject);
begin
  if (nomeCliente.Text = '') or (telefoneCliente.Text = '') or (enderecoCliente.Text = '') or
  (bairroCliente.Text = '') or (numeroCliente.Text = '') or (cidadeCliente.Text = '') then
  begin
    Application.MessageBox('H� dados em branco. Confira e tente novamente.','Aten��o',  MB_OK+MB_ICONERROR);
  end
  else
  begin
    FDTabelaCAD_NOME.AsString := nomeCliente.Text;
    FDTabelaCAD_CELULAR.AsString := celularCliente.Text;
    FDTabelaCAD_TELEFONE.AsString := telefoneCliente.Text;
    FDTabelaCAD_ENDERECO.AsString := enderecoCliente.Text;
    FDTabelaCAD_BAIRRO.AsString := bairroCliente.Text;
    FDTabelaCAD_NUMERO.AsString := numeroCliente.Text;
    FDTabelaCAD_CIDADE.AsString := cidadeCliente.Text;
    FDTabelaCAD_OBS.AsString := obsDoCliente.Text;
    FDTabelaCAD_CLIENTE.AsString := 'S';
    FDTabelaCAD_ENTREGADOR.AsString := 'N';
    FDTabelaSTATUS.AsString := 'S';
    inherited;
    actSair.Enabled := True;
  end;
end;

procedure TformCadastroClientes.FormActivate(Sender: TObject);
begin
  FDTabela.TableName:= 'Cadastro';
  FDTabela.Open();
  inherited;
end;

end.
