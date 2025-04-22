program Project1;

uses
  Forms,
  NewPage in 'NewPage.lnk' {Form1},
  qsort in 'qsort.pas',
  MyUnit in 'myunit.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
