program kperms;
type matrice=array[0..1010, 0..1010] of longint;
var i,j,n,k:longint;
f1,f2:text; dp:matrice;
begin
assign(f1,'kperms.in'); reset(f1);
assign(f2,'kperms.out'); rewrite(f2);
read(f1,n,k);
dp[0,1]:=1;
for i:=1 to n do
for j:=1 to i do
dp[i,j]:=((i-j+1)*dp[i-1,j-1]+j*dp[i-1,j]) mod 666013;

write(f2,dp[n,k]);
close(f1);
close(f2);
end.
