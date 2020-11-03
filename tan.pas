program tan;
type tabel=array[0..9] of longint;
var i,j,u:longint;
	s,c,ss:string;
	fr:tabel;
	f1,f2:text;
begin
	assign(f1,'tan.in'); reset(f1);
	assign(f2,'tan.out'); rewrite(f2);
	read(f1,s);

	for i:=1 to length(s) do
		inc(fr[ord(s[i])-48]);

	c:=''; i:=8;
	while i>0 do
		begin
			if fr[i]>0 then
				begin
					c:=c+chr(i+48);
					dec(fr[i]);
					break;
				end;
			i:=i-2;
		end;

	ss:='';
	for i:=1 to 9 do
		if fr[i]>0 then
			begin
				ss:=ss+chr(i+48);
				dec(fr[i]);
				break;
			end;

	for i:=1 to fr[0] do
		ss:=ss+'0';

	for i:=1 to 9 do
		for u:=1 to fr[i] do
			ss:=ss+chr(i+48);

	if ((ord(c[1])<ord(ss[1])) or (ss[1]='0')) and ((ord(ss[length(ss)])-48) mod 2=0) and (c[1]<>'0') then
		ss:=c+ss else
		ss:=ss+c;
	write(f2,ss);
	close(f1);
	close(f2);
end.