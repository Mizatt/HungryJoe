unit unitSplashScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, unitMenuPrincipal, Vcl.WinXCtrls, Vcl.Imaging.GIFImg;

type
  TformSplashScreen = class(TForm)
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    Image1: TImage;
    ActivityIndicator1: TActivityIndicator;
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSplashScreen: TformSplashScreen;

implementation

{$R *.dfm}

uses unitLogin;

procedure TformSplashScreen.FormActivate(Sender: TObject);
begin
  ProgressBar1.Hide;
end;


procedure TformSplashScreen.Timer1Timer(Sender: TObject);
begin
  if ProgressBar1.Position = 100 then
    begin
       Timer1.Enabled := False;
       //UnitLogin.FrmLogin.Show;
       Self.Hide;
       unitLogin.formLogin.ShowModal;
    end
  else
    begin
      ProgressBar1.Position := ProgressBar1.Position + 20 //25 parece ser o posicionamento perfeito.
    end;

end;

end.