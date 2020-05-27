program puncte2;
type tabel=array[0..20] of longint;
	var a:tabel;
		n,l,j:longint;
	f1,f2:text;
begin
	assign(f1,'puncte2.in'); reset(f1);
	assign(f2,'puncte2.out'); rewrite(f2);
	read(f1,n);
	l:=1;
	a[0]:=1;
	a[1]:=1;

	if n>1 then
	repeat
		l:=l+1;
		for j:=1 to l do
				a[l]:=a[l]+(a[l-j]*a[j-1]);
	until l=n;

	write(f2,a[n]);
close(f1);
close(f2);
end.
