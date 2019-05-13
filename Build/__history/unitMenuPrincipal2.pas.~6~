unit unitMenuPrincipal2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TformMenuPrincipal2 = class(TForm)
    Image1: TImage;
    cadastrarUsuario: TSpeedButton;
    IncluirCadastro: TSpeedButton;
    abrirEstoque: TSpeedButton;
    abrirRelatórios: TSpeedButton;
    Image2: TImage;
    procedure Image2Click(Sender: TObject);
    procedure cadastrarUsuarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMenuPrincipal2: TformMenuPrincipal2;

implementation

{$R *.dfm}

uses unitDM, unitMenuPrincipal, unitManutencaoUsuario;

procedure TformMenuPrincipal2.cadastrarUsuarioClick(Sender: TObject);
begin
  formManutencaoUsuario.ShowModal;
end;

procedure TformMenuPrincipal2.Image2Click(Sender: TObject);
begin
  formMenuPrincipal2.Hide;
  formMenuPrincipal.Show;
end;

end.
