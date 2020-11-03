program moretime;
type tabel=array[0..10000] of longint;
	var n,i,j,cp,numc,valc,l,rez:longint;
	    nc,vfs,st:tabel;
	    s:string;
	    q:boolean;
	f1,f2:text;

begin
assign(f1,'moretime.in'); reset(f1);
assign(f2,'moretime.out'); rewrite(f2);
readln(f1,n);

cp:=0; j:=0;
for i:=1 to n do
	begin
		readln(f1,numc,valc);
		str(numc,s);
		if (s[1]=s[length(s)]) then 
			begin
				j:=j+1;
				cp:=cp+1; 
				nc[j]:=numc;
				vfs[j]:=valc;
				st[j]:=st[j-1]+vfs[j];
			end;
	end;

l:=j; q:=false;
for i:=1 to l do
	if (st[i] mod cp=0) then 
		begin 
			writeln(f2,cp);
			writeln(f2,i);
			for j:=1 to i do 
				write(f2,nc[j],' '); 
			q:=true;
			break;
		end;

if (q=false) then 
	begin
		for i:=1 to cp do
			for j:=i+1 to cp do 
				if (st[i] mod cp=st[j] mod cp) then 
					begin
						writeln(f2,cp);
						writeln(f2,j-i);
						for l:=i+1 to j do
							write(f2,nc[l],' ');
					end;
	end;

close(f1);
close(f2);
end.