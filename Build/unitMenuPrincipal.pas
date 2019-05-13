unit unitMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.Buttons, Vcl.Imaging.pngimage;

type
  TformMenuPrincipal = class(TForm)
    Image1: TImage;
    executarVenda: TSpeedButton;
    IncluirCadastro: TSpeedButton;
    abrirEstoque: TSpeedButton;
    abrirRelat�rios: TSpeedButton;
    Image2: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure executarVendaClick(Sender: TObject);
    procedure IncluirCadastroClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMenuPrincipal: TformMenuPrincipal;

implementation

{$R *.dfm}

uses unitBase, unitManutencaoUsuario, unitVenda, unitCadastraProduto,
  unitCadastroClientes, unitMenuPrincipal2;

procedure TformMenuPrincipal.executarVendaClick(Sender: TObject);
begin
  formVenda.ShowModal;
end;

procedure TformMenuPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.Free;
  Application.Terminate;
end;

procedure TformMenuPrincipal.Image2Click(Sender: TObject);
begin
  formMenuPrincipal.Hide;
  formMenuPrincipal2.Show;
end;

procedure TformMenuPrincipal.IncluirCadastroClick(Sender: TObject);
begin
  formMenuPrincipal.Hide;
  formCadastroClientes.ShowModal;
end;

end.
