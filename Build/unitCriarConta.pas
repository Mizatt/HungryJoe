unit unitCriarConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TformCriaConta = class(TForm)
    Image1: TImage;
    Image2: TImage;
    GroupBox1: TGroupBox;
    nomeDoUsuario: TEdit;
    senhaDoUsuario: TEdit;
    confirmaSenhaDoUsuario: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCriaConta: TformCriaConta;

implementation

{$R *.dfm}

uses unitLogin;

procedure TformCriaConta.Image2Click(Sender: TObject);
begin
  formLogin.Show;
  Self.Close;
end;

end.