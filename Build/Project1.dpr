program Project1;

uses
  Vcl.Forms,
  unitSplashScreen in 'unitSplashScreen.pas' {formSplashScreen},
  unitMenuPrincipal in 'unitMenuPrincipal.pas' {formMenuPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  unitBase in 'unitBase.pas' {formBasico},
  unitLogin in 'unitLogin.pas' {formLogin},
  unitCriarConta in 'unitCriarConta.pas' {formCriaConta},
  unitDM in 'unitDM.pas' {DM: TDataModule},
  unitPerfil in 'unitPerfil.pas' {formPerfil},
  unitVenda in 'unitVenda.pas' {formVenda},
  unitManutencaoUsuario in 'unitManutencaoUsuario.pas' {formManutencaoUsuario},
  unitCadastraProduto in 'unitCadastraProduto.pas' {formCadastraProduto},
  unitCadastroClientes in 'unitCadastroClientes.pas' {formCadastroClientes},
  unitMenuPrincipal2 in 'unitMenuPrincipal2.pas' {formMenuPrincipal2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformSplashScreen, formSplashScreen);
  Application.CreateForm(TformLogin, formLogin);
  Application.CreateForm(TformMenuPrincipal, formMenuPrincipal);
  Application.CreateForm(TformBasico, formBasico);
  Application.CreateForm(TformCriaConta, formCriaConta);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TformPerfil, formPerfil);
  Application.CreateForm(TformVenda, formVenda);
  Application.CreateForm(TformManutencaoUsuario, formManutencaoUsuario);
  Application.CreateForm(TformCadastraProduto, formCadastraProduto);
  Application.CreateForm(TformCadastroClientes, formCadastroClientes);
  Application.CreateForm(TformMenuPrincipal2, formMenuPrincipal2);
  Application.Run;
end.
