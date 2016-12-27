unit Advance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, ShellAPI;

type
  TForm1 = class(TForm)
    Answerbt: TButton;
    procedure FormCreate(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    { Private declarations }

  const _Answerbt_Height: LongInt = 40;
        _Welcome_Word: String = 'W e l c o m e';

  public
    { Public declarations }

  var Regi_Flag: Boolean;

  end;

var
  Form1: TForm1;


implementation

uses About;
var Data:array[1..2,1..3]of TEdit;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
  J: Integer;

begin

  //Init the MainForm
  Regi_Flag := False;         //Check the registered state
  with form1 do
  begin
    BorderIcons := [biMinimize,biSystemMenu];
    BorderStyle := bsSingle;
  end;

  //Init the answerbutton
  with Answerbt do
  begin
    Align       := alBottom;
    Height      := _Answerbt_Height;
    Font.Size   := 15;
    Caption     := _Welcome_Word;
  end;

  //Init the Editors with an array of TEdit
  for I := 1 to 2 do
    for J := 1 to 3 do
    begin
      Data[i,j] := TEdit.Create(Self);
      with Data[i,j] do
      begin
            Parent     := Self;
            Text       := '';
            Width      := 100;
            Height     := 28;
            Top	       := 70*(i-1)+35;
            Left       := ((j-1)*150)+15;
            AutoSize   := False;
            Alignment  := taCenter;
          //Color      := clsilver;
          //Font.Style := [fsBold];
            Font.Size  := 13;
      end;
    end;

end;

procedure TForm1.N6Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  //Call AboutForm
  Form2.ShowModal;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
  //Use ShellAPI to link to the outside webside
  ShellExecute(Application.Handle, nil, 'http://www.github.com/wakafa1/', nil, nil, SW_SHOWNORMAL);
end;

end.
