program Project9;

uses
  Forms,
  Unit8 in '..\code_templates\Unit8.pas' {Form8},
  Unit12 in 'Unit12.pas' {Form12};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm12, Form12);
  Application.Run;
end.
