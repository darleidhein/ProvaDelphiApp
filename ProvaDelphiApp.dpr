program ProvaDelphiApp;

uses
  Vcl.Forms,
  MenuPrincial in 'Forms\MenuPrincial.pas' {frmPrincipal},
  ufTarefa2 in 'Forms\ufTarefa2.pas' {fTarefa2},
  ufProgresso in 'Classes\ufProgresso.pas',
  ufTarefa1 in 'Forms\ufTarefa1.pas' {fTarefa1},
  ufTarefa3 in 'Forms\ufTarefa3.pas' {fTarefa3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
