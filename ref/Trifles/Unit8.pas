unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm8 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

procedure TForm8.Button1Click(Sender: TObject);
var s1,s2,s3,s4,s5,s6,k1,k2,r,b,ls1,ls2,约数:longint;
    temp:integer;
    st,ss1,ss2:string;
    x:real;
function 最大公因数(a,b:longint):longint;
var r1:longint;
begin
  r1:=a mod b;
  while r1<>0 do
    begin
      a:=b;
      b:=r1;
      r1:=a mod b;
    end;
  最大公因数:=b;
end;
begin
  val(edit1.Text,s1,temp);
  val(edit2.Text,s2,temp);
  val(edit3.Text,s3,temp);
  val(edit4.Text,s4,temp);
  val(edit5.Text,s5,temp);
  val(edit6.Text,s6,temp);
  k1:=s2;k2:=s5;
  if k1>k2 then
  begin
    r:=k1 mod k2;
    while r<>0 do
    begin
      k1:=k2;
      k2:=r;
      r:=k1 mod k2;
    end;

    b:=s5 div k2*s2;

  end
  else
  begin
    r:=k2 mod k1;
    while r<>0 do
    begin
      k2:=k1;
      k1:=r;
      r:=k2 mod k1;
    end;

    b:=s2 div k1*s5;
  end;
  s1:=b div s2*s1;
  s3:=b div s2*s3;
  s4:=b div s5*s4;
  s6:=b div s5*s6;
  ls1:=s1-s4;
  ls2:=s3-s6;
  if ls2 mod ls1=0 then  begin x:=ls2/ ls1;
  str(x,st);
  speedbutton1.Caption:='x='+copy(st,1,5)+'     ';
  end
  else
  begin

  if ls1>ls2 then
    约数:=最大公因数(ls1,ls2)
             else
    约数:=最大公因数(ls1,ls2);
  str(ls1 div 约数,ss1);
  str(ls2 div 约数,ss2);
  speedbutton1.Caption:='x='+ss2+'/'+ss1+'     ';
  {x:=ls2/ ls1;
  str(x,st);
  speedbutton1.Caption:='x='+copy(st,1,5)+'     '; }
  end;





  val(edit1.Text,s1,temp);
  val(edit2.Text,s2,temp);
  val(edit3.Text,s3,temp);
  val(edit4.Text,s4,temp);
  val(edit5.Text,s5,temp);
  val(edit6.Text,s6,temp);
  k1:=s1;k2:=s4;
  if k1>k2 then
  begin
    r:=k1 mod k2;
    while r<>0 do
    begin
      k1:=k2;
      k2:=r;
      r:=k1 mod k2;
    end;

    b:=s4 div k2*s1;

  end
  else
  begin
    r:=k2 mod k1;
    while r<>0 do
    begin
      k2:=k1;
      k1:=r;
      r:=k2 mod k1;
    end;

    b:=s1 div k1*s4;
  end;
  s2:=b div s1*s2;
  s3:=b div s1*s3;
  s5:=b div s4*s5;
  s6:=b div s4*s6;
  ls1:=s2-s5;
  ls2:=s3-s6;
  if ls2 mod ls1=0 then  begin x:=ls2/ ls1;
  str(x,st);
  speedbutton1.Caption:=speedbutton1.Caption+'y='+copy(st,1,5);
  end
  else
  begin

  if ls1>ls2 then
    约数:=最大公因数(ls1,ls2)
             else
    约数:=最大公因数(ls1,ls2);
  str(ls1 div 约数,ss1);
  str(ls2 div 约数,ss2);
  speedbutton1.Caption:=speedbutton1.Caption+'y='+ss2+'/'+ss1;
  {x:=ls2/ ls1;
  str(x,st);
  speedbutton1.Caption:='x='+copy(st,1,5)+'     '; }
  end;

end;

procedure TForm8.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then

end;

procedure TForm8.SpeedButton1Click(Sender: TObject);
begin
  edit1.Text:='';
  edit2.Text:='';
  edit3.Text:='';
  edit4.Text:='';
  edit5.Text:='';
  edit6.Text:='';
  SpeedButton1.Caption:='欢迎使用';
end;

end.
