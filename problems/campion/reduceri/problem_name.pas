Program reduceri;
type matrice=array[1..100,1..100] of longint;
var a:matrice;
        n,i,j:longint;
        f1,f2:text;

Procedure readdata;
begin
        readln(f1,n);
        i:=0;
        j:=0;
        repeat
                i:=i+1;
                j:=j+1;
                read(f1,a[i,j]);
        until i=n;
end;

Procedure make;
var u,r,g:longint;
begin

for u:=2 to n do
        begin
        i:=1;
        j:=u;
        while j<=n do
                begin
                r:=0;
                g:=0;
                while i+g+1<=j do
                        begin
                        if a[i,i+g]+a[i+g+1,j]>r then
                                r:=a[i,i+g]+a[i+g+1,j];
                        g:=g+1;
                        end;
                if abs(a[i,i]-a[j,j])*(j-i+1)>r then
                        a[i,j]:=abs(a[i,i]-a[j,j])*(j-i+1) else
                                a[i,j]:=r;
                i:=i+1;
                j:=j+1;
                end;

        end;

end;

begin
assign(f1,'reduceri.in'); reset(f1);
assign(f2,'reduceri.out'); rewrite(f2);

readdata;
make;
write(f2,a[1,n]);

close(f1);
close(f2);
end.