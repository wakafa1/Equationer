unit Unitmain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ShellAPI, Menus, ExtCtrls, System.UITypes;

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
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    CheckBox1: TCheckBox;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Label13: TLabel;
    Label14: TLabel;
    Panel1: TPanel;
    a: TLabel;
    N7: TMenuItem;
    D1: TMenuItem;
    D2: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure D2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

  e1,e2,e3,e4,e5,e6:boolean;
  err:boolean;
  fact:Word;

const Text_MaxLength = 7;

implementation

{$R *.dfm}

uses About;

procedure TForm8.Button1Click(Sender: TObject);
var
    s1,s2,s3,s4,s5,s6,        //��������
    k1,k2,                    //�������
    r,                        //��������ʱ����
    b,
    ls1,ls2,                  //����������
    divisor,                  //��Լ��
    x:longint;
    temp:integer;             //Ϊval������
    st,
    ss1,ss2,
    ed1,ed2,ed3,ed4,ed5,ed6,mixed_number:string;
    positive_flag:boolean;


procedure Decimal_Operation(var a,b,c:string);
var
    I,a1,b1,c1,max: Integer;
    a2,b2,c2:boolean;
begin

  //Ԥ����

  a2:=false;
  for I := 1 to length(a) do
    if a[i]='.' then
      begin
        a2:=true;
        break;
      end;
  if a2 then
          a1:=length(a)-i
        else
          a1:=0;

  b2:=false;
  for I := 1 to length(b) do
    if b[i]='.' then
      begin
        b2:=true;
        break;
      end;
  if b2 then
          b1:=length(b)-i
        else
          b1:=0;

  c2:=false;
  for I := 1 to length(c) do
    if c[i]='.' then
      begin
        c2:=true;
        break;
    end;
  if c2 then
          c1:=length(c)-i
        else
          c1:=0;

  //��max

  if a1>b1 then
             if a1>c1 then
                        max:=a1
                      else
                        max:=c1
           else
             if b1>c1 then
                        max:=b1
                      else
                        max:=c1;

  //ȥС����

  for I := 1 to length(a) do if a[i]='.' then delete(a,i,1);

  for I := 1 to length(b) do if b[i]='.' then delete(b,i,1);

  for I := 1 to length(c) do if c[i]='.' then delete(c,i,1);

  //��0

  for I := 1 to max-a1 do
    a:=a+'0';

  for I := 1 to max-b1 do
    b:=b+'0';

  for I := 1 to max-c1 do
    c:=c+'0';

  //����

end;

function GCD(a,b:longint):longint;
var r1:longint;
begin
  r1:=a mod b;

  while r1<>0 do
    begin

      a:=b;
      b:=r1;
      r1:=a mod b;

    end;

  GCD:=b;

end;

function LCM(a,b:longint):longint;  //a��bС
var r1,ja,jb:longint;
begin

  ja:=a;
  jb:=b;
  r1:=a mod b;

  while r1<>0 do
    begin
      a:=b;
      b:=r1;
      r1:=a mod b;
    end;

  LCM:=jb div b*ja;

end;

procedure LongData_Operation;
var point:longint;
    s:string;
begin
  //Speedbutton1.top    := 170;          //209
  Speedbutton1.Height := 50;        //35

    point := Pos('y',SpeedButton1.Caption);
    s := SpeedButton1.Caption;
    Insert(#13,s,point);
    SpeedButton1.Caption := s;

  SpeedButton1.Font.Size := 16;
end;


procedure Data_Operation(var a,b,c:string);
var sts:array[1..2,1..3]of string;  //���ַ���
    szs:array[1..2,1..3]of longint;  //������
    a1,b1,c1,������,������:longint;  //С��λ��
    I,temp: Integer;

begin

  //��ʼ��

  a1:=0;
  b1:=0;
  c1:=0;

  if pos('/',a)=0 then a:=a+'/1';
  if pos('/',b)=0 then b:=b+'/1';
  if pos('/',c)=0 then c:=c+'/1';

  //�����ַ�������

  sts[1,1]:=copy(a,1,pos('/',a)-1);    //����
  sts[1,2]:=copy(b,1,pos('/',b)-1);
  sts[1,3]:=copy(c,1,pos('/',c)-1);

  sts[2,1]:=copy(a,pos('/',a)+1,length(a)-(pos('/',a)+1)+1);    //��ĸ
  sts[2,2]:=copy(b,pos('/',b)+1,length(b)-(pos('/',b)+1)+1);
  sts[2,3]:=copy(c,pos('/',c)+1,length(c)-(pos('/',c)+1)+1);

  //ȥС��

  //��ʼ����ȡС��λ��

  if pos('.',sts[1,1])<>0 then
                            begin
                              a1:=length(sts[1,1])-pos('.',sts[1,1])
                            end;
  if pos('.',sts[1,2])<>0 then
                            begin
                              b1:=length(sts[1,2])-pos('.',sts[1,2])
                            end;
  if pos('.',sts[1,3])<>0 then
                            begin
                              c1:=length(sts[1,3])-pos('.',sts[1,3])
                            end;

  //��ʼ

  //���Ӵ���ȥС����

  if a1<>0 then
             delete(sts[1,1],pos('.',sts[1,1]),1);
  if b1<>0 then
             delete(sts[1,2],pos('.',sts[1,2]),1);
  if c1<>0 then
             delete(sts[1,3],pos('.',sts[1,3]),1);

  //��ĸ������0

  for I := 1 to a1 do
    begin
      sts[2,1]:=sts[2,1]+'0';
    end;
  for I := 1 to b1 do
    begin
      sts[2,2]:=sts[2,2]+'0';
    end;
  for I := 1 to c1 do
    begin
      sts[2,3]:=sts[2,3]+'0';
    end;

  //����ȥС����������������

  for i := 1 to 3 do
    begin
      val(sts[1,i],szs[1,i],temp);

      if temp<>0 then
        begin
          begin
            messagedlg('�Բ������������������',mterror,[mbok],0);
            err:=true;
            exit;
          end;
        end;

      val(sts[2,i],szs[2,i],temp);

      if temp<>0 then
        begin
          begin
            messagedlg('�Բ������������������',mterror,[mbok],0);
            err:=true;
            exit;
          end;
        end;
    end;

  //�жϷ�ĸ�Ƿ�Ϊ0

  for I := 1 to 3 do
    if szs[2,i]=0 then
      begin
        messagedlg('�Բ������������������',mterror,[mbok],0);
        err:=true;
        exit;
      end;

  //��Լ��

  if szs[1,1]<>0 then

  if szs[1,1]>szs[2,1] then
                         begin
                           ������:=GCD(szs[1,1],szs[2,1]);

                           {if err then
                             exit;
                           if ������=0 then
                                         begin
                                           messagedlg('�Բ�����������������̣�',mterror,[mbok],0);
                                           err:=true;
                                           exit;
                                         end;    }


                           szs[1,1]:=szs[1,1] div ������;
                           szs[2,1]:=szs[2,1] div ������;
                         end
                       else
                         begin
                           ������:=GCD(szs[2,1],szs[1,1]);
                           {if err then
                             exit;

                           if ������=0 then
                                         begin
                                           messagedlg('�Բ�����������������̣�',mterror,[mbok],0);
                                           err:=true;
                                           exit;
                                         end;     }

                           szs[1,1]:=szs[1,1] div ������;
                           szs[2,1]:=szs[2,1] div ������;
                         end;
  if szs[1,2]<>0 then

  if szs[1,2]>szs[2,2] then
                         begin
                           ������:=GCD(szs[1,2],szs[2,2]);
                           {if err then
                             exit;

                           if ������=0 then
                                         begin
                                           messagedlg('�Բ�����������������̣�',mterror,[mbok],0);
                                           err:=true;
                                           exit;
                                         end;}
                           szs[1,2]:=szs[1,2] div ������;
                           szs[2,2]:=szs[2,2] div ������;
                         end
                       else
                         begin
                           ������:=GCD(szs[2,2],szs[1,2]);
                           {if err then
                             exit;

                           if ������=0 then
                                         begin
                                           messagedlg('�Բ�����������������̣�',mterror,[mbok],0);
                                           err:=true;
                                           exit;
                                         end;      }

                           szs[1,2]:=szs[1,2] div ������;
                           szs[2,2]:=szs[2,2] div ������;
                         end;
  if szs[1,3]<>0 then

  if szs[1,3]>szs[2,3] then
                         begin
                           ������:=GCD(szs[1,3],szs[2,3]);
                           {if err then
                             exit;
                           if ������=0 then
                                         begin
                                           messagedlg('�Բ�����������������̣�',mterror,[mbok],0);
                                           err:=true;
                                           exit;
                                         end;       }

                           szs[1,3]:=szs[1,3] div ������;
                           szs[2,3]:=szs[2,3] div ������;
                         end
                       else
                         begin
                           ������:=GCD(szs[2,3],szs[1,3]);
                          { if err then
                             exit;
                           if ������=0 then
                                         begin
                                           messagedlg('�Բ�����������������̣�',mterror,[mbok],0);
                                           err:=true;
                                           exit;
                                         end;    }

                           szs[1,3]:=szs[1,3] div ������;
                           szs[2,3]:=szs[2,3] div ������;
                         end;

  //�����ĸ��С������

  if szs[2,1]>szs[2,2] then
                         begin
                           if err then
                             exit;
                           ������:=LCM(szs[2,1],szs[2,2]);
                         end

                       else
                         begin
                           if err then
                             exit;
                           ������:=LCM(szs[2,2],szs[2,1]);
                         end;


  if ������>szs[2,3]   then
                         begin
                           if err then
                             exit;
                           ������:=LCM(������,szs[2,3]);
                         end

                       else
                         begin
                           if err then
                             exit;
                           ������:=LCM(szs[2,3],������);
                         end;

  //���ó������ķ��ӷ�ĸ

  for I := 1 to 3 do
    begin

      if szs[2,i]=0 then
        begin
          messagedlg('�Բ�����������������̣�',mterror,[mbok],0);
          err:=true;
          exit;
        end;

      szs[1,i]:=������ div szs[2,i]*szs[1,i];
    end;

  //���뷵�ز���������

  str(szs[1,1],a);
  str(szs[1,2],b);
  str(szs[1,3],c);

end;


begin

  //Ԥ����

  err:=false;
  positive_flag:=true;

  if (edit1.Text='')or(edit2.Text='')or(edit3.Text='')or(edit4.Text='')or(edit5.Text='')or(edit6.Text='') then
    begin
      messagedlg('�Բ�������������δ���룡',mterror,[mbok],0);
      exit;
    end;

  if (edit1.Text='0')or(edit2.Text='0')or(edit3.Text='0')or(edit4.Text='0')or(edit5.Text='0')or(edit6.Text='0') then
    begin
      messagedlg('�Բ��𣬱�����汾�ݲ�֧�����ּ�ʽ�ķ��̣�������Ϊ���߰汾��',mterror,[mbok],0);
      exit;
    end;

  //��x

  //��ʼ������ȡ���ݼ�����

  ed1:=edit1.Text;
  ed2:=edit2.Text;
  ed3:=edit3.Text;
  ed4:=edit4.Text;
  ed5:=edit5.Text;
  ed6:=edit6.Text;

  //С������(ed1,ed2,ed3);
  //С������(ed4,ed5,ed6);

  Data_Operation(ed1,ed2,ed3);
  if  err then
    exit;

  Data_Operation(ed4,ed5,ed6);
  if err then
    exit;

  val(ed1,s1,temp);
  val(ed2,s2,temp);
  val(ed3,s3,temp);
  val(ed4,s4,temp);
  val(ed5,s5,temp);
  val(ed6,s6,temp);

  k1:=s2;
  k2:=s5;

  //����С������

  if k1>k2 then
             begin

               if k2=0 then
                 begin
                   messagedlg('�Բ�����������������̣�',mterror,[mbok],0);
                   exit;
                 end;

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

              if k1=0 then
                begin
                   messagedlg('�Բ�����������������̣�',mterror,[mbok],0);
                   exit;
                 end;


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

  //�ó������

  ls1:=s1-s4;
  ls2:=s3-s6;

  //�ж�positive_flag

  if ((ls1>0)and(ls2<0))or((ls1<0)and(ls2>0)) then
    begin
      ls1:=abs(ls1);
      ls2:=abs(ls2);
      positive_flag:=false;
    end;


  if ls1=0 then
      begin
        messagedlg('�Բ�����������������̣�',mterror,[mbok],0);
        Exit;
      end;

  //���ģ��

  if checkbox1.Checked=false then
     begin
  if ls2 mod ls1=0 then
                     begin
                       x:=ls2 div ls1;
                       str(x,st);

                       if positive_flag then
                                 speedbutton1.Caption:='x='+st+'     '
                               else
                                 speedbutton1.Caption:='x=-'+st+'     ';
                     end

                   else
                     begin

                       if ls1>ls2 then
                                    begin
                                      divisor:=GCD(ls1,ls2);
                                      if err then
                                        exit;
                                    end

                                  else
                                    begin
                                      divisor:=GCD(ls1,ls2);
                                      if err then
                                        exit;
                                    end;

                       str(ls1 div divisor,ss1);
                       str(ls2 div divisor,ss2);

                       ls1:=ls1 div divisor;
                       ls2:=ls2 div divisor;



                       if positive_flag then
                                 speedbutton1.Caption:='x='+ss2+'/'+ss1+'    '
                               else
                                 speedbutton1.Caption:='x='+'-'+ss2+'/'+ss1+'    ';

                       {x:=ls2/ ls1;
                       str(x,st);
                       speedbutton1.Caption:='x='+copy(st,1,5)+'     '; }

                     end;
       end
       else begin
              if ls2 mod ls1=0 then
                     begin
                       x:=ls2 div ls1;
                       str(x,st);

                       if positive_flag then
                                 speedbutton1.Caption:='x='+st+'     '
                               else
                                 speedbutton1.Caption:='x=-'+st+'     ';
                     end

                   else

                     begin

                       if ls1>ls2 then
                                    begin
                                      if err then
                                        exit;
                                        divisor:=GCD(ls1,ls2)
                                    end
                                  else
                                    begin
                                      if err then
                                        exit;
                                      divisor:=GCD(ls1,ls2);
                                    end;

                      str(ls1 div divisor,ss1);
                      str(ls2 div divisor,ss2);

                      ls1:=ls1 div divisor;
                      ls2:=ls2 div divisor;

                      if ls2>ls1 then
                        begin
                          str(ls2 div ls1,mixed_number);
                          while ls2>ls1 do
                          begin
                            ls2:=ls2-ls1;
                          end;

                          if ls1>ls2 then
                                    begin
                                      if err then
                                        exit;
                                        divisor:=GCD(ls1,ls2)
                                    end
                                  else
                                    begin
                                      if err then
                                        exit;
                                      divisor:=GCD(ls1,ls2);
                                    end;

                          str(ls1 div divisor,ss1);
                          str(ls2 div divisor,ss2);

                          ls1:=ls1 div divisor;
                          ls2:=ls2 div divisor;


                            if positive_flag then
                                speedbutton1.Caption:='x='+mixed_number+'+'+ss2+'/'+ss1+'    '
                              else
                                speedbutton1.Caption:='x='+'-'+mixed_number+'+'+ss2+'/'+ss1+'    ';
                          end
                      else
                        begin
                      if positive_flag then
                                 speedbutton1.Caption:='x='+ss2+'/'+ss1+'    '
                               else
                                 speedbutton1.Caption:='x='+'-'+ss2+'/'+ss1+'    ';

                         end;
                      //speedbutton1.Caption:=speedbutton1.Caption+'y='+ss2+'/'+ss1;

                      {x:=ls2/ ls1;
                      str(x,st);
                      speedbutton1.Caption:='x='+copy(st,1,5)+'     ';     }
                    end;


            end;

  //��y

  //��ʼ������ȡ���ݼ�����

  positive_flag:=true;

  ed1:=edit1.Text;
  ed2:=edit2.Text;
  ed3:=edit3.Text;
  ed4:=edit4.Text;
  ed5:=edit5.Text;
  ed6:=edit6.Text;

  //С������(ed1,ed2,ed3);
  //С������(ed4,ed5,ed6);

  Data_Operation(ed1,ed2,ed3);
  if err then
    exit;

  Data_Operation(ed4,ed5,ed6);
  if err then
    exit;

  val(ed1,s1,temp);
  val(ed2,s2,temp);
  val(ed3,s3,temp);
  val(ed4,s4,temp);
  val(ed5,s5,temp);
  val(ed6,s6,temp);

  {val(edit1.Text,s1,temp);
  val(edit2.Text,s2,temp);
  val(edit3.Text,s3,temp);
  val(edit4.Text,s4,temp);
  val(edit5.Text,s5,temp);
  val(edit6.Text,s6,temp);}

  k1:=s1;
  k2:=s4;

  if k1>k2 then
    begin


      if k2=0 then
        begin
          messagedlg('�Բ�����������������̣�',mterror,[mbok],0);
          exit;
        end;


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


      if k1=0 then
        begin
          messagedlg('�Բ�����������������̣�',mterror,[mbok],0);
          exit;
        end;


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


  if ((ls1>0)and(ls2<0))or((ls1<0)and(ls2>0)) then
    begin
      ls1:=abs(ls1);
      ls2:=abs(ls2);
      positive_flag:=false;
    end;


  if ls1=0 then
      begin
        messagedlg('�Բ�����������������̣�',mterror,[mbok],0);
        exit;
      end;


  //���ģ��

  if checkbox1.Checked=false then
     begin
  if ls2 mod ls1=0 then
                     begin
                       x:=ls2 div ls1;
                       str(x,st);
                       //speedbutton1.Caption:=speedbutton1.Caption+'y='+st;
                       if positive_flag then
                                speedbutton1.Caption:=speedbutton1.Caption+'y='+st
                              else
                                speedbutton1.Caption:=speedbutton1.Caption+'y='+'-'+st;
                     end

                   else

                     begin

                       if ls1>ls2 then
                                    begin
                                      if err then
                                        exit;
                                        divisor:=GCD(ls1,ls2)
                                    end
                                  else
                                    begin
                                      if err then
                                        exit;
                                      divisor:=GCD(ls1,ls2);
                                    end;

                      str(ls1 div divisor,ss1);
                      str(ls2 div divisor,ss2);

                      ls1:=ls1 div divisor;
                      ls2:=ls2 div divisor;

                      if positive_flag then
                                speedbutton1.Caption:=speedbutton1.Caption+'y='+ss2+'/'+ss1
                              else
                                speedbutton1.Caption:=speedbutton1.Caption+'y='+'-'+ss2+'/'+ss1;

                      //speedbutton1.Caption:=speedbutton1.Caption+'y='+ss2+'/'+ss1;

                      {x:=ls2/ ls1;
                      str(x,st);
                      speedbutton1.Caption:='x='+copy(st,1,5)+'     '; }
                    end;
   end
   else
     begin
       if ls2 mod ls1=0 then
                     begin
                       x:=ls2 div ls1;
                       str(x,st);
                       //speedbutton1.Caption:=speedbutton1.Caption+'y='+st;
                       if positive_flag then
                                speedbutton1.Caption:=speedbutton1.Caption+'y='+st
                               else
                                speedbutton1.Caption:=speedbutton1.Caption+'y='+'-'+st;
                     end

                   else

                     begin

                       if ls1>ls2 then
                                    begin
                                      if err then
                                        Exit;
                                        divisor:=GCD(ls1,ls2)
                                    end
                                  else
                                    begin
                                      if err then
                                        exit;
                                      divisor:=GCD(ls1,ls2);
                                    end;

                      str(ls1 div divisor,ss1);
                      str(ls2 div divisor,ss2);

                      ls1:=ls1 div divisor;
                      ls2:=ls2 div divisor;

                      if ls2>ls1 then
                        begin
                          str(ls2 div ls1,mixed_number);
                          while ls2>ls1 do
                          begin
                            ls2:=ls2-ls1;
                          end;
                          str(ls1,ss1);
                          str(ls2,ss2);
                            if positive_flag then
                                speedbutton1.Caption:=speedbutton1.Caption+'y='+mixed_number+'+'+ss2+'/'+ss1
                              else
                                speedbutton1.Caption:=speedbutton1.Caption+'y='+'-'+mixed_number+'+'+ss2+'/'+ss1;
                          end
                      else
                        begin
                      if positive_flag then
                                speedbutton1.Caption:=speedbutton1.Caption+'y='+ss2+'/'+ss1
                              else
                                speedbutton1.Caption:=speedbutton1.Caption+'y='+'-'+ss2+'/'+ss1;
                         end;
                      //speedbutton1.Caption:=speedbutton1.Caption+'y='+ss2+'/'+ss1;

                      {x:=ls2/ ls1;
                      str(x,st);
                      speedbutton1.Caption:='x='+copy(st,1,5)+'     ';     }
                    end;



     end;
  // �ı䰴ť�ĸ߶�

  if length(speedbutton1.Caption)>31  then
    LongData_Operation;
end;

procedure TForm8.CheckBox1Click(Sender: TObject);
begin
  if checkbox1.Checked
    then
      begin
        d1.Checked:=True;
        SendMessage(Button1.Handle,WM_LBUTTONDOWN,0,0);
        SendMessage(Button1.Handle,WM_LBUTTONUP,0,0);  //һ��Ҫ���һ��WM_LBUTTONUP����Ϣ������ťֻ��ȥ��������
      end
    else
      begin
        d1.Checked:=false;
        SendMessage(Button1.Handle,WM_LBUTTONDOWN,0,0);
        SendMessage(Button1.Handle,WM_LBUTTONUP,0,0);
      end;

end;

procedure TForm8.D1Click(Sender: TObject);
begin
  if d1.Checked
    then
      checkbox1.Checked:=false
    else
      checkbox1.Checked:=true

end;

procedure TForm8.D2Click(Sender: TObject);
begin
  IF ((edit1.Text<>'')or(edit2.Text<>'')or(edit3.Text<>'')or(edit4.Text<>'')or(edit5.Text<>'')or(edit6.Text<>''))and(speedbutton1.Caption='�� ӭ ʹ ��')
    then
      if messagedlg('�����з���δ���꣬���Ҫ�˳���',mtconfirmation,[mbYes, mbNo], 0) = mrYes then
                                                                                                  close
                                                                                                else
    else
      close;
end;

procedure TForm8.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  fact:=Key;
end;

procedure TForm8.EditKeyPress(Sender: TObject; var Key: Char);
var
  lst:string;
begin
  Form8.SpeedButton1.Caption:='�� ӭ ʹ ��';
  Form8.Speedbutton1.Top:=209;          //209
  Form8.Speedbutton1.Height:=35;

  //�Ż�
  //ShowMessage(FLOATTOSTR(fact));
  //if Ord(key)=12290 then key:='.';
  //if (Key=#8)and(fact<>8) then key:=#0;

  //ShowMessage(IntToStr(Ord(key)));
  case Key of
    '��': begin Key := '.';  end;            //��bugע�⣩�����¡������������˸�
    '��': Key := '/';
  end;

  if (key='.')and(length((Sender as TEdit).Text)=0) then
  begin
    key:=#0;
    (Sender as TEdit).Text:='0.';
    (Sender as TEdit).SetFocus;
    SendMessage((Sender as TEdit).Handle,EM_SETSEL,2,2);
    exit;
  end;

  //С���㴦��

  if (key='.')and(pos('/',(Sender as TEdit).Text)>0) then
    begin
      key:=#0;
      exit;
    end;

  if (key='.')and((Sender as TEdit).Text[Length((Sender as TEdit).Text)]='.') then
    begin
      key:=#0;                       //����Ҳ��������
      exit;
    end;

  //if (Sender as TEdit).Text<>'' then ShowMessage((Sender as TEdit).Text[Length((Sender as TEdit).Text)]);
  lst:=copy((Sender as TEdit).Text,1,length((Sender as TEdit).Text));      //���ⲻ������

  if (key='.')and(Pos('.',lst)<>0) then
    begin
      key := #0;
      exit;
    end;

  //�ֺŴ���

  if (key='/')and(length((Sender as TEdit).Text)=0) then
    begin
      key:=#0;
      exit;
    end;

  if (key='/')and((Sender as TEdit).Text[length((Sender as TEdit).Text)]='.') then
    begin
      key:=#0;
      exit;
    end;

  if (key='/')and(pos('/',(Sender as TEdit).Text)<>0) then
    begin
      key := #0;
      exit;
    end;

  if key<>#8 then
               if (length((Sender as TEdit).Text)=Text_MaxLength)or( not (Key in ['0'..'9','.','-','/']))
                  then
                  begin
                    Key := #0;
                    exit;
                  end;

  {e1:=true;
  for i := 1 to length(edit1.text)-1 do
    begin
      if edit1.Text[i]='.' then
        e1:=false;
    end;

  if (key='.') then
                 if e1=false then
                   key:=#0;   }
end;

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   {IF (edit1.Text<>'')or(edit2.Text<>'')or(edit3.Text<>'')or(edit4.Text<>'')or(edit5.Text<>'')or(edit6.Text<>'')
    then if messagedlg('�����з���δ���꣬���Ҫ�˳���',mtconfirmation,[mbYes, mbNo], 0) = mrYes then
                           close
                           else
    else close;        }
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
  //Edit ��ʼ������

  Edit1.Alignment := taCenter;
  Edit2.Alignment := taCenter;
  Edit3.Alignment := taCenter;
  Edit4.Alignment := taCenter;
  Edit5.Alignment := taCenter;
  Edit6.Alignment := taCenter;

  {
  //�ļ��������
  hide;
  if FileExists('c:\program files\fx\uses.nb')=true
    then
      begin
        assignfile(input,'c:\program files\fx\uses.nb');
        reset(input);
        readln(k);
        if k=1 then
          ShellExecute(0, 'open', 'c:\program files\fx\read.txt', '', '', SW_SHOWNORMAL)
               else
                 if k=3 then
                   begin

                     //��ֹʹ��

                     button1.visible:=false;
                     speedbutton1.visible:=false;

                     edit1.visible:=false;
                     edit2.visible:=false;
                     edit3.visible:=false;
                     edit4.visible:=false;
                     edit5.visible:=false;
                     edit6.visible:=false;

                     label1.visible:=false;
                     label2.visible:=false;
                     label3.visible:=false;
                     label4.visible:=false;
                     label5.visible:=false;
                     label6.visible:=false;
                     label7.Visible:=true;
                     label8.visible:=false;
                     label9.visible:=false;
                     label10.visible:=false;
                     label11.visible:=false;
                     label12.visible:=false;
                     label13.visible:=false;
                     label14.visible:=false;

                     panel1.Visible:=false;
                     a.visible:=false;
                     checkbox1.visible:=false;
                     n3.Visible:=false;
                     n4.Visible:=false;
                     d1.Visible:=false;

                     messagedlg('�Բ�������û��ע�ᣡ',mterror,[mbok],0);
                     exit;
                   end;
        closefile(input);
        erase(input);

        assignfile(output,'c:\program files\fx\uses.nb');
        rewrite(output);
        write(0);
        closefile(output);
      end

    else
      begin

        //��ֹʹ��

        messagedlg('�Բ�������װ���ļ����ƻ��򲻼��ݣ������°�װ����wakafa��ϵ��',mterror,[mbok],0);

        button1.visible:=false;
        speedbutton1.visible:=false;

        edit1.visible:=false;
        edit2.visible:=false;
        edit3.visible:=false;
        edit4.visible:=false;
        edit5.visible:=false;
        edit6.visible:=false;

        label1.visible:=false;
        label2.visible:=false;
        label3.visible:=false;
        label4.visible:=false;
        label5.visible:=false;
        label6.visible:=false;
        label7.Visible:=true;
        label8.visible:=false;
        label9.visible:=false;
        label10.visible:=false;
        label11.visible:=false;
        label12.visible:=false;
        label13.visible:=false;
        label14.visible:=false;

        panel1.Visible:=false;
        a.visible:=false;
        checkbox1.visible:=false;
        n3.Visible:=false;
        n4.Visible:=false;
        d1.Visible:=false;
      end;
    }
end;

//����Ϊ�˵�������

procedure TForm8.N3Click(Sender: TObject);
begin
  button1.Click;    //��ʼ����
end;

procedure TForm8.N4Click(Sender: TObject);
begin
  speedbutton1.Click;  //��λ
end;

procedure TForm8.N5Click(Sender: TObject);
begin
  //ShellExecute(0, 'open', 'c:\program files\fx\about1.exe', '', '', SW_SHOWNORMAL);
  //����
  Form2.ShowModal;
end;

procedure TForm8.N6Click(Sender: TObject);
begin
  ShellExecute(0, 'open', 'c:\program files\fx\read.txt', '', '', SW_SHOWNORMAL);
  //ָʾ�ı�
end;


//��λ

procedure TForm8.SpeedButton1Click(Sender: TObject);
begin
  Speedbutton1.Top      := 209;          //209
  Speedbutton1.Height   := 35;           //35
  SpeedButton1.Font.Size:= 20;           //Initial

  edit1.Text:='';
  edit2.Text:='';
  edit3.Text:='';
  edit4.Text:='';
  edit5.Text:='';
  edit6.Text:='';

  SpeedButton1.Caption:='�� ӭ ʹ ��';

  Edit1.SetFocus;
  SendMessage(Edit1.Handle,EM_SETSEL,0,0);

end;

end.
