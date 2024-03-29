unit unitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Buttons, System.ImageList, Vcl.ImgList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TformLogin = class(TForm)
    Image1: TImage;
    GroupBox1: TGroupBox;
    ValorNome: TEdit;
    ValorSenha: TEdit;
    Image2: TImage;
    iconesLogin: TImageList;
    SpeedButton1: TSpeedButton;
    QueryLogin: TFDQuery;
    procedure Image2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLogin: TformLogin;

implementation

{$R *.dfm}

uses unitCriarConta, unitMenuPrincipal, unitDM;

procedure TformLogin.Image2Click(Sender: TObject);
begin
  formCriaConta.Show;
  Self.Hide;
  {AnimateWindow(PanelCadastrar.Handle,300,AW_HOR_POSITIVE); //Anima��o da Janela
    Anima��es poss�veis:
    AW_BLEND //Somente no Windows 2000
    AW_CENTER //Abre o objeto do meio pra fora
    AW_HOR_POSITIVE //Abre o objeto na horizontal, da direita para a esquerda
    AW_HOR_NEGATIVE //Abre o objeto na horizontal, da esquerda para a direita
    AW_VER_POSITIVE //Abre o objeto na vertical, de cima para baixo
    AW_VER_NEGATIVE //Abre o objeto na vertical, de baixo para cima}
end;

procedure TformLogin.SpeedButton1Click(Sender: TObject);
var mensagem, QuerySQL: String;
begin
  QuerySQL := 'SELECT U.*, P.* ' + 'FROM USUARIO U INNER JOIN PERFIL P ' +
  'ON U.USU_ID_PERFIL = P.ID ' + 'WHERE U.USU_LOGIN = ' + #39 + ValorNome.Text + #39 +
  ' AND U.USU_SENHA = ' + #39 + ValorSenha.Text + #39;
  QueryLogin.Close;
  QueryLogin.SQL.Clear;
  QueryLogin.SQL.Add(QuerySQL);
  QueryLogin.Open();
  if QueryLogin.RecordCount = 1 then
    begin
      formMenuPrincipal.Show;
      formLogin.Close;
    end;
  if QueryLogin.RecordCount = 0 then
    begin
      mensagem := 'Nome de usu�rio ou senha inv�lidos. Caso tenha esquecido login ou senha, consulte o administrador. ';
      Application.MessageBox(PChar(mensagem), 'Login n�o autorizado', MB_OK+MB_ICONERROR);
      ValorNome.Clear;
      ValorSenha.Clear;
      ValorNome.SetFocus;
    end;
end;

end.
