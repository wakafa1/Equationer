unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    UnabledItem: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure N5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

uses Unit2;
var Data:array[1..2,1..3]of TEdit;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
  j: Integer;

begin

  //Init the MainForm
  N5.Checked := False;
  with form1 do
  begin
    BorderIcons := [biMinimize,biSystemMenu];
    BorderStyle := bsSingle;
  end;

  //Init the Editors with an array of TEdit
  for I := 1 to 2 do
    for j := 1 to 3 do
    begin
      Data[i,j] := TEdit.Create(Self);
      with Data[i,j] do
      begin
            Parent     := Self;
            Text       := '';
          //Width      := 40;
          //Height     := 15;
            Top	       := 70*(i-1)+35;
            Left       := ((j-1)*150)+15;
            AutoSize   := False;
            Alignment  := taCenter;
          //Color      := clsilver;
          //Font.Style := [fsBold];
            Font.Size  := 10;
      end;
    end;

end;

procedure TForm1.N5Click(Sender: TObject);
begin
  if not(N5.Checked) then N5.Checked := True
                     else N5.Checked := False;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

end.
