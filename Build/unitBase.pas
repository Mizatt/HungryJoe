unit unitBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXCtrls,
  Vcl.Imaging.pngimage, Vcl.CategoryButtons, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, System.Actions, Vcl.ActnList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TExecutar = (Navegacao, sentencaSQL, exibePanels, desabilitaBotoes, habilitaBotoes, exibeBotoes);
  TformBasico = class(TForm)
    header: TImage;
    footer: TImage;
    SplitView1: TSplitView;
    PNLFicha: TPanel;
    imgMenu: TImage;
    CategoryButtons1: TCategoryButtons;
    ILMenuPrincipal: TImageList;
    ILMenuPrincipalNegativo: TImageList;
    ActionList1: TActionList;
    actIncluir: TAction;
    FDTabela: TFDTable;
    DataSource1: TDataSource;
    actCancelar: TAction;
    actAlterar: TAction;
    actSalvar: TAction;
    actExcluir: TAction;
    actPesquisar: TAction;
    actSair: TAction;
    GroupBox1: TGroupBox;
    procedure imgMenuClick(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
  private
    FExecutar: TExecutar;
    procedure SetExecutar(const Value: TExecutar);
  public
    property Executar: TExecutar read FExecutar write SetExecutar;
    { Public declarations }
  end;

var
  formBasico: TformBasico;
  tipoID: integer;
  nomeTabela: String;
  nomeJanela: String;
  mensagem: String;
  operacaoIncluir: Integer;

implementation

{$R *.dfm}

uses unitDM;

procedure TformBasico.actAlterarExecute(Sender: TObject);
begin
  FDTabela.Edit;
end;

procedure TformBasico.actCancelarExecute(Sender: TObject);
begin
  FDTabela.Cancel;
  mensagem := 'As altera��es foram canceladas. ';
  Application.MessageBox(PChar(mensagem), 'Informa��o', MB_OK+MB_ICONINFORMATION);
end;

procedure TformBasico.actExcluirExecute(Sender: TObject);
begin
  mensagem := 'Tem certeza que deseja excluir o registro?';
  if Application.MessageBox(PChar(mensagem), 'Aten��o', MB_YESNO+MB_ICONQUESTION) = ID_YES then
  begin
    FDTabela.Delete;
    mensagem := 'O registro foi exclu�do com sucesso.';
    Application.MessageBox(PChar(mensagem), 'Informa��o', MB_OK+MB_ICONINFORMATION);
  end
  else
    begin
    mensagem := 'A opera��o foi abortada.';
    Application.MessageBox(PChar(mensagem), 'Informa��o', MB_OK+MB_ICONINFORMATION);
  end;
end;

procedure TformBasico.actIncluirExecute(Sender: TObject);
begin
  if FDTabela.Active = False then
    begin
      FDTabela.Open;
    end;
  FDTabela.Insert;
  FDTabela.FieldByName('DATA_INC').AsDateTime := Date;
end;

procedure TformBasico.actSairExecute(Sender: TObject);
begin
  self.Close;
end;

procedure TformBasico.actSalvarExecute(Sender: TObject);
begin
  FDTabela.Post;
  mensagem := 'O registro foi inclu�do ou alterado com sucesso. ';
  Application.MessageBox(PChar(mensagem), 'Informa��o', MB_OK+MB_ICONINFORMATION);
end;

procedure TformBasico.imgMenuClick(Sender: TObject);
begin
  if (SplitView1.Opened) then
    begin
      SplitView1.Close;
    end
  else
    begin
      SplitView1.Open;
    end;
end;

procedure TformBasico.SetExecutar(const Value: TExecutar);
begin

end;

end.