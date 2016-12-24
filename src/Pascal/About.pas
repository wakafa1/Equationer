unit About;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls,
  Advance;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormShow(Sender: TObject);
begin
  with Form2 do
  begin
    BorderIcons := [biSystemMenu, biMinimize];
    BorderStyle := bsDialog;
    if Form1.Regi_Flag = False then Caption := 'Unregistered'
                               else Caption := '���ڱ�����';
  end;


end;

end.
