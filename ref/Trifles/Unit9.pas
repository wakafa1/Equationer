unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WinSkinData;

type
  TForm9 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    SkinData1: TSkinData;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;
  �ɹ�:boolean;

implementation

{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
var k:longint;
begin
  if button1.Caption='�ر�' then close;

      {assignfile(input,'uses.nb');
      reset(input);
      readln(k);
      if k<>3 then
      begin
        messagedlg('����ע�ᣡ',mtinformation,[mbok],0);
              closefile(input);
        close;
      end;    }
   //closefile(input);
   //erase(input);
  if edit1.Text='adminwakafa' then
    begin
      //assignfile(input,'uses.nb');
      //reset(input);
      //readln(k);
      {if k<>3 then
      begin
        messagedlg('����ע�ᣡ',mtinformation,[mbok],0);
        exit;
      end;    //erase(input);}

      closefile(input);

      assignfile(output,'uses.nb');
      rewrite(output);
      write(1);
      closefile(output);
      messagedlg('ע��ɹ���',mtinformation,[mbok],0);
      deletefile('c:\Documents and Settings\All Users\����\ע��.lnk');
      close;
    end
  else
  begin
    messagedlg('����������������룡',mtinformation,[mbok],0);
    edit1.text:='';
    Edit1.SetFocus;
    SendMessage(Edit1.Handle,EM_SETSEL,0,0);
  end;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
  if (�ɹ�=false)then
    if messagedlg('����˳���',mtconfirmation,[mbYes, mbNo], 0) = mrYes then
                           close
                           else  begin
                               edit1.text:='';
                               Edit1.SetFocus;
                               SendMessage(Edit1.Handle,EM_SETSEL,0,0);
                           end
                 else close;

end;

procedure TForm9.FormCreate(Sender: TObject);
var k:longint;
begin
      �ɹ�:=false;
      assignfile(input,'uses.nb');
      reset(input);
      readln(k);
      if k<>3 then
      begin
        messagedlg('����ע�ᣡ',mtinformation,[mbok],0);
        �ɹ�:=true;
        closefile(input);
        button1.Enabled:=false;
        button2.Caption:='�˳�';
        edit1.Enabled:=false;
        label1.Enabled:=false;
      end;

  close;
end;

end.
