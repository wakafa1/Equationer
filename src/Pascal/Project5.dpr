library Project5;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes;

function 最大公因数(a,b:longint):longint; stdcall;
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

function 最小公倍数(a,b:longint):longint; stdcall;
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

  最小公倍数:=jb div b*ja;

end;
procedure 小数处理(var a,b,c:string);
var
    I,a1,b1,c1,max: Integer;
    a2,b2,c2:boolean;
begin

  //预处理

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

  //求max

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

  //去小数点

  for I := 1 to length(a) do
    if a[i]='.' then
      delete(a,i,1);

  for I := 1 to length(b) do
    if b[i]='.' then
      delete(b,i,1);

  for I := 1 to length(c) do
    if c[i]='.' then
      delete(c,i,1);

  //加0

  for I := 1 to max-a1 do
    a:=a+'0';

  for I := 1 to max-b1 do
    b:=b+'0';

  for I := 1 to max-c1 do
    c:=c+'0';

  //结束

end;

{$R *.res}
exports 最小公倍数;
exports 最大公因数;
begin
end.
