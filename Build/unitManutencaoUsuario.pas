unit unitManutencaoUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unitBase, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.CategoryButtons, Vcl.WinXCtrls, Vcl.Imaging.pngimage, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Buttons;

type
  TformManutencaoUsuario = class(TformBasico)
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    Switch: TToggleSwitch;
    Label5: TLabel;
    nomeDoUsuario: TEdit;
    loginDoUsuario: TEdit;
    senhaDoUsuario: TEdit;
    FDTabelaID: TFDAutoIncField;
    FDTabelaUSU_NOME: TStringField;
    FDTabelaUSU_SENHA: TStringField;
    FDTabelaUSU_LOGIN: TStringField;
    FDTabelaUSU_ID_PERFIL: TIntegerField;
    FDTabelaSTATUS: TStringField;
    FDTabelaDATA_INC: TSQLTimeStampField;
    procedure FormActivate(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure SwitchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formManutencaoUsuario: TformManutencaoUsuario;

implementation

{$R *.dfm}

uses unitDM, unitMenuPrincipal, unitMenuPrincipal2;

procedure TformManutencaoUsuario.actSairExecute(Sender: TObject);
begin
  inherited;
  formMenuPrincipal2.Show;
end;

procedure TformManutencaoUsuario.actSalvarExecute(Sender: TObject);
begin
  if (nomeDoUsuario.Text = '') or (senhaDoUsuario.text = '') or (loginDoUsuario.text = '') then
  begin
    Application.MessageBox('H� dados em branco. Confira e tente novamente.','Aten��o',  MB_OK+MB_ICONERROR);
  end
  else
  begin
    FDTabelaUSU_NOME.AsString := nomeDoUsuario.Text;
    FDTabelaUSU_LOGIN.AsString := loginDoUsuario.Text;
    FDTabelaUSU_SENHA.AsString := senhaDoUsuario.Text;
    FDTabelaUSU_ID_PERFIL.AsInteger := 1;
    FDTabelaSTATUS.AsString := 'A';
    inherited;
    nomeDoUsuario.Clear;
    senhaDoUsuario.Clear;
    loginDoUsuario.Clear;
  end;
end;

procedure TformManutencaoUsuario.FormActivate(Sender: TObject);
begin
  formMenuPrincipal2.Close;
  FDTabela.Close;
  FDTabela.TableName := 'Usuario';
  FDTabela.Open();
  inherited;
end;

procedure TformManutencaoUsuario.SwitchClick(Sender: TObject);
begin
  inherited;
  if Switch.State = tssOn then
    begin
      senhaDoUsuario.PasswordChar := #0;
    end
  else
    begin
      senhaDoUsuario.PasswordChar := '*';
    end;
end;

end.
