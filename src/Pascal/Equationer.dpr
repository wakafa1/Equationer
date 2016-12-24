program Equationer;

uses
  Vcl.Forms,
  Advance in 'Advance.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  About in 'About.pas' {Form2},
  Unitmain in 'Unitmain.pas' {Form8};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
