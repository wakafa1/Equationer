unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ShellAPI, Menus, ExtCtrls,
  RibbonLunaStyleActnCtrls, Ribbon, WinSkinData, WinSkinStore, ComCtrls;

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
    SkinData1: TSkinData;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure D2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sd1FormSkin(Sender: TObject; aName: string; var DoSkin: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

  e1,e2,e3,e4,e5,e6:boolean;
  err,f,bo:boolean;

function 最大公因数(a,b:longint):longint;stdcall;external 'Project5.dll';
function 最小公倍数(a,b:longint):longint; stdcall;external 'Project5.dll';
implementation

uses Unit12;

{$R *.dfm}

procedure TForm8.Button1Click(Sender: TObject);
var
    s1,s2,s3,s4,s5,s6,        //缓存数据
    k1,k2,                    //计算变量
    r,                        //公因数临时变量
    b,
    ls1,ls2,                  //结果计算变量
    约数,
    x:longint;
    temp:integer;             //为val做变量
    st,
    ss1,ss2,
    ed1,ed2,ed3,ed4,ed5,ed6,带分数:string;
    正负:boolean;


procedure 数据处理(var a,b,c:string);
var sts:array[1..2,1..3]of string;  //存字符串
    szs:array[1..2,1..3]of longint;  //存整数
    a1,b1,c1,公因数,公倍数:longint;  //小数位数
    I,temp: Integer;

begin

  //初始化

  a1:=0;
  b1:=0;
  c1:=0;

  if pos('/',a)=0 then a:=a+'/1';
  if pos('/',b)=0 then b:=b+'/1';
  if pos('/',c)=0 then c:=c+'/1';

  //载入字符串数组

  sts[1,1]:=copy(a,1,pos('/',a)-1);    //分子
  sts[1,2]:=copy(b,1,pos('/',b)-1);
  sts[1,3]:=copy(c,1,pos('/',c)-1);

  sts[2,1]:=copy(a,pos('/',a)+1,length(a)-(pos('/',a)+1)+1);    //分母
  sts[2,2]:=copy(b,pos('/',b)+1,length(b)-(pos('/',b)+1)+1);
  sts[2,3]:=copy(c,pos('/',c)+1,length(c)-(pos('/',c)+1)+1);

  //去小数

  //初始化，取小数位数

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

  //开始

  //分子处理，去小数点

  if a1<>0 then
             delete(sts[1,1],pos('.',sts[1,1]),1);
  if b1<>0 then
             delete(sts[1,2],pos('.',sts[1,2]),1);
  if c1<>0 then
             delete(sts[1,3],pos('.',sts[1,3]),1);

  //分母处理，加0

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

  //结束去小数，载入整数数组

  for i := 1 to 3 do
    begin
      val(sts[1,i],szs[1,i],temp);

      if temp<>0 then
        begin
          begin
            messagedlg('对不起，您输入的数据有误！',mterror,[mbok],0);
            err:=true;
            exit;
          end;
        end;

      val(sts[2,i],szs[2,i],temp);

      if temp<>0 then
        begin
          begin
            messagedlg('对不起，您输入的数据有误！',mterror,[mbok],0);
            err:=true;
            exit;
          end;
        end;
    end;

  //判断分母是否为0

  for I := 1 to 3 do
    if szs[2,i]=0 then
      begin
        messagedlg('对不起，您输入的数据有误！',mterror,[mbok],0);
        err:=true;
        exit;
      end;

  //先约分

  if szs[1,1]<>0 then

  if szs[1,1]>szs[2,1] then
                         begin
                           公因数:=最大公因数(szs[1,1],szs[2,1]);

                           {if err then
                             exit;
                           if 公因数=0 then
                                         begin
                                           messagedlg('对不起，您输入的是死方程！',mterror,[mbok],0);
                                           err:=true;
                                           exit;
                                         end;    }


                           szs[1,1]:=szs[1,1] div 公因数;
                           szs[2,1]:=szs[2,1] div 公因数;
                         end
                       else
                         begin
                           公因数:=最大公因数(szs[2,1],szs[1,1]);
                           {if err then
                             exit;

                           if 公因数=0 then
                                         begin
                                           messagedlg('对不起，您输入的是死方程！',mterror,[mbok],0);
                                           err:=true;
                                           exit;
                                         end;     }

                           szs[1,1]:=szs[1,1] div 公因数;
                           szs[2,1]:=szs[2,1] div 公因数;
                         end;
  if szs[1,2]<>0 then

  if szs[1,2]>szs[2,2] then
                         begin
                           公因数:=最大公因数(szs[1,2],szs[2,2]);
                           {if err then
                             exit;

                           if 公因数=0 then
                                         begin
                                           messagedlg('对不起，您输入的是死方程！',mterror,[mbok],0);
                                           err:=true;
                                           exit;
                                         end;}
                           szs[1,2]:=szs[1,2] div 公因数;
                           szs[2,2]:=szs[2,2] div 公因数;
                         end
                       else
                         begin
                           公因数:=最大公因数(szs[2,2],szs[1,2]);
                           {if err then
                             exit;

                           if 公因数=0 then
                                         begin
                                           messagedlg('对不起，您输入的是死方程！',mterror,[mbok],0);
                                           err:=true;
                                           exit;
                                         end;      }

                           szs[1,2]:=szs[1,2] div 公因数;
                           szs[2,2]:=szs[2,2] div 公因数;
                         end;
  if szs[1,3]<>0 then

  if szs[1,3]>szs[2,3] then
                         begin
                           公因数:=最大公因数(szs[1,3],szs[2,3]);
                           {if err then
                             exit;
                           if 公因数=0 then
                                         begin
                                           messagedlg('对不起，您输入的是死方程！',mterror,[mbok],0);
                                           err:=true;
                                           exit;
                                         end;       }

                           szs[1,3]:=szs[1,3] div 公因数;
                           szs[2,3]:=szs[2,3] div 公因数;
                         end
                       else
                         begin
                           公因数:=最大公因数(szs[2,3],szs[1,3]);
                          { if err then
                             exit;
                           if 公因数=0 then
                                         begin
                                           messagedlg('对不起，您输入的是死方程！',mterror,[mbok],0);
                                           err:=true;
                                           exit;
                                         end;    }

                           szs[1,3]:=szs[1,3] div 公因数;
                           szs[2,3]:=szs[2,3] div 公因数;
                         end;

  //再求分母最小公倍数

  if szs[2,1]>szs[2,2] then
                         begin
                           if err then
                             exit;
                           公倍数:=最小公倍数(szs[2,1],szs[2,2]);
                         end

                       else
                         begin
                           if err then
                             exit;
                           公倍数:=最小公倍数(szs[2,2],szs[2,1]);
                         end;


  if 公倍数>szs[2,3]   then
                         begin
                           if err then
                             exit;
                           公倍数:=最小公倍数(公倍数,szs[2,3]);
                         end

                       else
                         begin
                           if err then
                             exit;
                           公倍数:=最小公倍数(szs[2,3],公倍数);
                         end;

  //最后得出整数的分子分母

  for I := 1 to 3 do
    begin

      if szs[2,i]=0 then
        begin
          messagedlg('对不起，您输入的是死方程！',mterror,[mbok],0);
          err:=true;
          exit;
        end;

      szs[1,i]:=公倍数 div szs[2,i]*szs[1,i];
    end;

  //载入返回参数，结束

  str(szs[1,1],a);
  str(szs[1,2],b);
  str(szs[1,3],c);

end;


begin

  //预处理

  err:=false;
  正负:=true;

  if (edit1.Text='')or(edit2.Text='')or(edit3.Text='')or(edit4.Text='')or(edit5.Text='')or(edit6.Text='') then
    begin
      messagedlg('对不起，您还有数据未输入！',mterror,[mbok],0);
      exit;
    end;

  if (edit1.Text='0')or(edit2.Text='0')or(edit3.Text='0')or(edit4.Text='0')or(edit5.Text='0')or(edit6.Text='0') then
    begin
      messagedlg('对不起，本软件版本暂不支持这种简单式的方程，请升级为更高版本。',mterror,[mbok],0);
      exit;
    end;

  //求x

  //初始化，获取数据及处理

  ed1:=edit1.Text;
  ed2:=edit2.Text;
  ed3:=edit3.Text;
  ed4:=edit4.Text;
  ed5:=edit5.Text;
  ed6:=edit6.Text;

  //小数处理(ed1,ed2,ed3);
  //小数处理(ed4,ed5,ed6);

  数据处理(ed1,ed2,ed3);
  if  err then
    exit;

  数据处理(ed4,ed5,ed6);
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
  val(edit6.Text,s6,temp); }

  k1:=s2;
  k2:=s5;

  //求最小公倍数

  if k1>k2 then
             begin

               if k2=0 then
                 begin
                   messagedlg('对不起，您输入的是死方程！',mterror,[mbok],0);
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
                   messagedlg('对不起，您输入的是死方程！',mterror,[mbok],0);
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

  //得出结果数

  ls1:=s1-s4;
  ls2:=s3-s6;

  //判断正负

  if ((ls1>0)and(ls2<0))or((ls1<0)and(ls2>0)) then
    begin
      ls1:=abs(ls1);
      ls2:=abs(ls2);
      正负:=false;
    end;


  if ls1=0 then
      begin
        messagedlg('对不起，您输入的是死方程！',mterror,[mbok],0);
        exit;
      end;

  //输出模块

  if checkbox1.Checked=false then
     begin
  if ls2 mod ls1=0 then
                     begin
                       x:=ls2 div ls1;
                       str(x,st);

                       if 正负 then
                                 speedbutton1.Caption:='x='+st+'     '
                               else
                                 speedbutton1.Caption:='x=-'+st+'     ';
                     end

                   else
                     begin

                       if ls1>ls2 then
                                    begin
                                      约数:=最大公因数(ls1,ls2);
                                      if err then
                                        exit;
                                    end

                                  else
                                    begin
                                      约数:=最大公因数(ls1,ls2);
                                      if err then
                                        exit;
                                    end;

                       str(ls1 div 约数,ss1);
                       str(ls2 div 约数,ss2);

                       ls1:=ls1 div 约数;
                       ls2:=ls2 div 约数;



                       if 正负 then
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

                       if 正负 then
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
                                        约数:=最大公因数(ls1,ls2)
                                    end
                                  else
                                    begin
                                      if err then
                                        exit;
                                      约数:=最大公因数(ls1,ls2);
                                    end;

                      str(ls1 div 约数,ss1);
                      str(ls2 div 约数,ss2);

                      ls1:=ls1 div 约数;
                      ls2:=ls2 div 约数;

                      {if ls1>ls2 then
                                    begin
                                      if err then
                                        exit;
                                        约数:=最大公因数(ls1,ls2)
                                    end
                                  else
                                    begin
                                      if err then
                                        exit;
                                      约数:=最大公因数(ls1,ls2);
                                    end; }


                      {ls1:=ls1 div 约数;
                      ls2:=ls2 div 约数;   }

                      if ls2>ls1 then
                        begin
                          str(ls2 div ls1,带分数);
                          while ls2>ls1 do
                          begin
                            ls2:=ls2-ls1;
                          end;

                          if ls1>ls2 then
                                    begin
                                      if err then
                                        exit;
                                        约数:=最大公因数(ls1,ls2)
                                    end
                                  else
                                    begin
                                      if err then
                                        exit;
                                      约数:=最大公因数(ls1,ls2);
                                    end;

                          str(ls1 div 约数,ss1);
                          str(ls2 div 约数,ss2);

                          ls1:=ls1 div 约数;
                          ls2:=ls2 div 约数;


                            if 正负 then
                                speedbutton1.Caption:='x='+带分数+'+'+ss2+'/'+ss1+'    '
                              else
                                speedbutton1.Caption:='x='+'-'+带分数+'+'+ss2+'/'+ss1+'    ';
                          end
                      else
                        begin
                      if 正负 then
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

  //求y

  //初始化，获取数据及处理

  正负:=true;

  ed1:=edit1.Text;
  ed2:=edit2.Text;
  ed3:=edit3.Text;
  ed4:=edit4.Text;
  ed5:=edit5.Text;
  ed6:=edit6.Text;

  //小数处理(ed1,ed2,ed3);
  //小数处理(ed4,ed5,ed6);

  数据处理(ed1,ed2,ed3);
  if err then
    exit;

  数据处理(ed4,ed5,ed6);
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
          messagedlg('对不起，您输入的是死方程！',mterror,[mbok],0);
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
          messagedlg('对不起，您输入的是死方程！',mterror,[mbok],0);
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
      正负:=false;
    end;


  if ls1=0 then
      begin
        messagedlg('对不起，您输入的是死方程！',mterror,[mbok],0);
        exit;
      end;


  //输出模块

  if checkbox1.Checked=false then
     begin
  if ls2 mod ls1=0 then
                     begin
                       x:=ls2 div ls1;
                       str(x,st);
                       //speedbutton1.Caption:=speedbutton1.Caption+'y='+st;
                       if 正负 then
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
                                        约数:=最大公因数(ls1,ls2)
                                    end
                                  else
                                    begin
                                      if err then
                                        exit;
                                      约数:=最大公因数(ls1,ls2);
                                    end;

                      str(ls1 div 约数,ss1);
                      str(ls2 div 约数,ss2);

                      ls1:=ls1 div 约数;
                      ls2:=ls2 div 约数;

                      if 正负 then
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
                       if 正负 then
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
                                        约数:=最大公因数(ls1,ls2)
                                    end
                                  else
                                    begin
                                      if err then
                                        exit;
                                      约数:=最大公因数(ls1,ls2);
                                    end;

                      str(ls1 div 约数,ss1);
                      str(ls2 div 约数,ss2);

                      ls1:=ls1 div 约数;
                      ls2:=ls2 div 约数;

                      if ls2>ls1 then
                        begin
                          str(ls2 div ls1,带分数);
                          while ls2>ls1 do
                          begin
                            ls2:=ls2-ls1;
                          end;
                          str(ls1,ss1);
                          str(ls2,ss2);
                            if 正负 then
                                speedbutton1.Caption:=speedbutton1.Caption+'y='+带分数+'+'+ss2+'/'+ss1
                              else
                                speedbutton1.Caption:=speedbutton1.Caption+'y='+'-'+带分数+'+'+ss2+'/'+ss1;
                          end
                      else
                        begin
                      if 正负 then
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
  if length(speedbutton1.Caption)>31  then
  begin
    speedbutton1.top:=170;          //209
    speedbutton1.Height:=86;        //35
  end;
end;

procedure TForm8.CheckBox1Click(Sender: TObject);
begin
  if checkbox1.Checked
    then
      d1.Checked:=true
    else
      d1.Checked:=false;
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
  IF ((edit1.Text<>'')or(edit2.Text<>'')or(edit3.Text<>'')or(edit4.Text<>'')or(edit5.Text<>'')or(edit6.Text<>''))and(speedbutton1.Caption='欢 迎 使 用')
    then
      if messagedlg('您还有方程未算完，真的要退出吗？',mtconfirmation,[mbYes, mbNo], 0) = mrYes then
                                                                                                  close
                                                                                                else
    else
      f:=false;
end;

procedure TForm8.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  lst:string;
begin
  SpeedButton1.Caption:='欢 迎 使 用';
  speedbutton1.top:=209;          //209
  speedbutton1.Height:=35;
  //优化

  if (key='.')and(length(edit1.Text)=0) then
  begin
    key:=#0;
    edit1.Text:='0.';
    Edit1.SetFocus;
    SendMessage(Edit1.Handle,EM_SETSEL,2,2);
    exit;
  end;

  //debug

  if (key='/')and(length(edit1.Text)=0) then
    begin
      key:=#0;
      exit;
    end;


  {if (key='0')and(length(edit1.Text)=0) then
    begin
      key:=#0;
      exit;
    end;   }

  if (key='.')and(length(edit1.Text)=0) then
    begin
      key:=#0;
      exit;
    end;

  if (key='/')and(edit1.Text[length(edit1.Text)]='.') then
    begin
      key:=#0;
      exit;
    end;

  if (key='.')and(pos('/',edit1.Text)>0) then
    begin
      key:=#0;
      exit;
    end;

  if (key='.')and(edit1.Text[length(edit1.Text)-1]='.') then
    begin
      key:=#0;
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

  lst:=copy(edit1.Text,1,length(edit1.Text));

  if (key='.')and(pos('.',lst)<>0) then
    begin
      key:=#0;
      exit;
    end;

  if (key='/')and(pos('/',edit1.Text)<>0) then
    begin
      key:=#0;
      exit;
    end;



  if key<>#8 then
               if (length(edit1.Text)=5)or( not (Key in ['0'..'9','.','-','/']))  then  Key := Chr(0);

end;

procedure TForm8.Edit2KeyPress(Sender: TObject; var Key: Char);
var  lst:string;
begin
  SpeedButton1.Caption:='欢 迎 使 用';
  speedbutton1.top:=209;          //209
  speedbutton1.Height:=35;
  //优化

  if (key='.')and(length(edit2.Text)=0) then
  begin
    key:=#0;
    edit2.Text:='0.';
    Edit2.SetFocus;
    SendMessage(Edit2.Handle,EM_SETSEL,2,2);
    exit;
  end;

  //debug

  if (key='/')and(length(edit2.Text)=0) then
    begin
      key:=#0;
      exit;
    end;

  {if (key='0')and(length(edit2.Text)=0) then
    begin
      key:=#0;
      exit;
    end;   }

  if (key='.')and(length(edit2.Text)=0) then
    begin
      key:=#0;
      exit;
    end;

  if (key='/')and(edit2.Text[length(edit2.Text)]='.') then
    begin
      key:=#0;
      exit;
    end;

  if (key='.')and(pos('/',edit2.Text)>0) then
    begin
      key:=#0;
      exit;
    end;

  if (key='.')and(edit2.Text[length(edit2.Text)-1]='.') then
    begin
      key:=#0;
      exit;
    end;

  {e2:=true;
  for i := 1 to length(edit2.text)-1 do
    begin
      if edit2.Text[i]='.' then
        e2:=false;
    end;

  if (key='.') then
                 if e2=false then
                   key:=#0;   }

  lst:=copy(edit2.Text,1,length(edit2.Text));

  if (key='.')and(pos('.',lst)<>0) then
    begin
      key:=#0;
      exit;
    end;

  if (key='/')and(pos('/',edit2.Text)<>0) then
    begin
      key:=#0;
      exit;
    end;

  if key<>#8 then
               if (length(edit2.Text)=5)or( not (Key in ['0'..'9','.','-','/']))  then  Key := Chr(0);

end;

procedure TForm8.Edit3KeyPress(Sender: TObject; var Key: Char);
var  lst:string;
begin
  SpeedButton1.Caption:='欢 迎 使 用';
  speedbutton1.top:=209;          //209
  speedbutton1.Height:=35;
  //优化

  if (key='.')and(length(edit3.Text)=0) then
  begin
    key:=#0;
    edit3.Text:='0.';
    Edit3.SetFocus;
    SendMessage(Edit3.Handle,EM_SETSEL,2,2);
    exit;
  end;

  //debug

  if (key='/')and(length(edit3.Text)=0) then
    begin
      key:=#0;
      exit;
    end;

  {if (key='0')and(length(edit3.Text)=0) then
    begin
      key:=#0;
      exit;
    end;     }

  if (key='.')and(length(edit3.Text)=0) then
    begin
      key:=#0;
      exit;
    end;

  if (key='/')and(edit3.Text[length(edit3.Text)]='.') then
    begin
      key:=#0;
      exit;
    end;

  if (key='.')and(pos('/',edit3.Text)>0) then
    begin
      key:=#0;
      exit;
    end;

  if (key='.')and(edit3.Text[length(edit3.Text)-1]='.') then
    begin
      key:=#0;
      exit;
    end;

  {e3:=true;
  for i := 1 to length(edit3.text)-1 do
    begin
      if edit3.Text[i]='.' then
        e3:=false;
    end;

  if (key='.') then
                 if e3=false then
                   key:=#0;   }

  lst:=copy(edit3.Text,1,length(edit3.Text));

  if (key='.')and(pos('.',lst)<>0) then
    begin
      key:=#0;
      exit;
    end;

  if (key='/')and(pos('/',edit3.Text)<>0) then
    begin
      key:=#0;
      exit;
    end;


  if key<>#8 then
               if (length(edit3.Text)=6)or( not (Key in ['0'..'9','.','-','/']))  then  Key := Chr(0);


end;

procedure TForm8.Edit4KeyPress(Sender: TObject; var Key: Char);
var  lst:string;
begin
  SpeedButton1.Caption:='欢 迎 使 用';
  speedbutton1.top:=209;          //209
  speedbutton1.Height:=35;
  //优化

  if (key='.')and(length(edit4.Text)=0) then
  begin
    key:=#0;
    edit4.Text:='0.';
    Edit4.SetFocus;
    SendMessage(Edit4.Handle,EM_SETSEL,2,2);
    exit;
  end;

  //debug

  if (key='/')and(length(edit4.Text)=0) then
    begin
      key:=#0;
      exit;
    end;

  {if (key='0')and(length(edit4.Text)=0) then
    begin
      key:=#0;
      exit;
    end;         }

  if (key='.')and(length(edit4.Text)=0) then
    begin
      key:=#0;
      exit;
    end;

  if (key='/')and(edit4.Text[length(edit4.Text)]='.') then
    begin
      key:=#0;
      exit;
    end;

  if (key='.')and(pos('/',edit4.Text)>0) then
    begin
      key:=#0;
      exit;
    end;


  if (key='.')and(edit4.Text[length(edit4.Text)-1]='.') then
    begin
      key:=#0;
      exit;
    end;

 { e4:=true;
  for i := 1 to length(edit4.text)-1 do
    begin
      if edit4.Text[i]='.' then
        e4:=false;
    end;

  if (key='.') then
                 if e4=false then
                   key:=#0;    }

  lst:=copy(edit4.Text,1,length(edit4.Text));

  if (key='.')and(pos('.',lst)<>0) then
    begin
      key:=#0;
      exit;
    end;

  if (key='/')and(pos('/',edit4.Text)<>0) then
    begin
      key:=#0;
      exit;
    end;

  if key<>#8 then
               if (length(edit4.Text)=5)or( not (Key in ['0'..'9','.','-','/']))  then  Key := Chr(0);

end;

procedure TForm8.Edit5KeyPress(Sender: TObject; var Key: Char);
var  lst:string;
begin
  SpeedButton1.Caption:='欢 迎 使 用';
  speedbutton1.top:=209;          //209
  speedbutton1.Height:=35;
  //优化

  if (key='.')and(length(edit5.Text)=0) then
  begin
    key:=#0;
    edit5.Text:='0.';
    Edit5.SetFocus;
    SendMessage(Edit5.Handle,EM_SETSEL,2,2);
    exit;
  end;

  //debug

  if (key='/')and(length(edit5.Text)=0) then
    begin
      key:=#0;
      exit;
    end;

  {if (key='0')and(length(edit5.Text)=0) then
    begin
      key:=#0;
      exit;
    end; }

  if (key='.')and(length(edit5.Text)=0) then
    begin
      key:=#0;
      exit;
    end;

  if (key='/')and(edit5.Text[length(edit5.Text)]='.') then
    begin
      key:=#0;
      exit;
    end;

  if (key='.')and(pos('/',edit5.Text)>0) then
    begin
      key:=#0;
      exit;
    end;


  if (key='.')and(edit5.Text[length(edit5.Text)-1]='.') then
    begin
      key:=#0;
      exit;
    end;

  {e5:=true;
  for i := 1 to length(edit5.text)-1 do
    begin
      if edit5.Text[i]='.' then
        e5:=false;
    end;

  if (key='.') then
                 if e5=false then
                   key:=#0;       }

  lst:=copy(edit5.Text,1,length(edit5.Text));

  if (key='.')and(pos('.',lst)<>0) then
    begin
      key:=#0;
      exit;
    end;

  if (key='/')and(pos('/',edit5.Text)<>0) then
    begin
      key:=#0;
      exit;
    end;

  if key<>#8 then
               if (length(edit5.Text)=5)or( not (Key in ['0'..'9','.','-','/']))  then  Key := Chr(0);

end;

procedure TForm8.Edit6KeyPress(Sender: TObject; var Key: Char);
var   lst:string;
begin
  SpeedButton1.Caption:='欢 迎 使 用';
  speedbutton1.top:=209;          //209
  speedbutton1.Height:=35;
  //优化

  if (key='.')and(length(edit6.Text)=0) then
  begin
    key:=#0;
    edit6.Text:='0.';
    Edit6.SetFocus;
    SendMessage(Edit6.Handle,EM_SETSEL,2,2);
    exit;
  end;

  //debug

  if (key='/')and(length(edit6.Text)=0) then
    begin
      key:=#0;
      exit;
    end;

  {if (key='0')and(length(edit6.Text)=0) then
    begin
      key:=#0;
      exit;
    end;  }

  if (key='.')and(length(edit6.Text)=0) then
    begin
      key:=#0;
      exit;
    end;

  if (key='/')and(edit6.Text[length(edit6.Text)]='.') then
    begin
      key:=#0;
      exit;
    end;

  if (key='.')and(pos('/',edit6.Text)>0) then
    begin
      key:=#0;
      exit;
    end;

  if (key='.')and(edit6.Text[length(edit6.Text)-1]='.') then
    begin
      key:=#0;
      exit;
    end;

  {e6:=true;
  for i := 1 to length(edit6.text)-1 do
    begin
      if edit6.Text[i]='.' then
        e6:=false;
    end;

  if (key='.') then
                 if e6=false then
                   key:=#0;  }

  lst:=copy(edit6.Text,1,length(edit6.Text));

  if (key='.')and(pos('.',lst)<>0) then
    begin
      key:=#0;
      exit;
    end;

  if (key='/')and(pos('/',edit6.Text)<>0) then
    begin
      key:=#0;
      exit;
    end;


  if key<>#8 then
               if (length(edit6.Text)=6)or( not (Key in ['0'..'9','.','-','/']))  then  Key := Chr(0);

end;

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   {IF (edit1.Text<>'')or(edit2.Text<>'')or(edit3.Text<>'')or(edit4.Text<>'')or(edit5.Text<>'')or(edit6.Text<>'')
    then if messagedlg('您还有方程未算完，真的要退出吗？',mtconfirmation,[mbYes, mbNo], 0) = mrYes then
                           close
                           else
    else close;        }

end;

procedure TForm8.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if bo=false then

  canclose:=false  else   canclose:=true;
  f:=false;
  //canclose:=true;
end;

procedure TForm8.FormCreate(Sender: TObject);
var k:longint;
begin
  self.AlphaBlend:=true;
  self.AlphaBlendValue:=0;
  f:=true;
  bo:=false;


    {self.TrackBar1.Min:=0;

    self.TrackBar1.Max:=255;

    self.TrackBar1.Frequency:=1; }
    //TrackBar1.Position:=  self.TrackBar1.Max;
  //文件处理操作

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

                     //禁止使用

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

                     messagedlg('对不起，您还没有注册！',mterror,[mbok],0);
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

        //禁止使用

        messagedlg('对不起，您安装的文件被破坏或不兼容，请重新安装或与wakafa联系！',mterror,[mbok],0);

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
end;

procedure TForm8.Label2Click(Sender: TObject);
begin
end;

//以下为菜单栏命令

procedure TForm8.N3Click(Sender: TObject);
begin
  button1.Click;    //开始计算
end;

procedure TForm8.N4Click(Sender: TObject);
begin
  speedbutton1.Click;  //复位
end;

procedure TForm8.N5Click(Sender: TObject);
begin
  //ShellExecute(0, 'open', 'c:\program files\fx\about1.exe', '', '', SW_SHOWNORMAL);
  //关于
  form12.showmodal;
end;

procedure TForm8.N6Click(Sender: TObject);
begin
  ShellExecute(0, 'open', 'c:\program files\fx\read.txt', '', '', SW_SHOWNORMAL);
  //指示文本
end;

procedure TForm8.sd1FormSkin(Sender: TObject; aName: string;  var DoSkin: Boolean);
begin

end;

//复位

procedure TForm8.SpeedButton1Click(Sender: TObject);
begin
  speedbutton1.top:=209;          //209
  speedbutton1.Height:=35;        //35
  edit1.Text:='';
  edit2.Text:='';
  edit3.Text:='';
  edit4.Text:='';
  edit5.Text:='';
  edit6.Text:='';

  SpeedButton1.Caption:='欢 迎 使 用';

  Edit1.SetFocus;
  SendMessage(Edit1.Handle,EM_SETSEL,0,0);

end;



procedure TForm8.Timer1Timer(Sender: TObject);
begin
  if f then
    if self.AlphaBlendValue<=235 then
                                  self.AlphaBlendValue:=self.AlphaBlendValue+10
                                else
                                  self.AlphaBlendValue:=255
  else begin
         if (self.AlphaBlendValue>=20)
           then self.AlphaBlendValue:=self.AlphaBlendValue-30
           else begin
                  bo:=true;
                  close;
                end;
       end;
end;

end.
