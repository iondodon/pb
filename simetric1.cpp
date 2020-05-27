{Code by Patcas Csaba}
{Time complexity: O(n^3)}
{Space complexity: O(n^2)}

//ID Solutia mea e de 20p si e brute force in C++

const MAX = 400;
      IN_FILE = 'simetric1.in';
      OUT_FILE = 'simetric1.out';
var a, dp : array[1..MAX, 1..MAX] of word;
    n, m, maxSize : word;
    fin, fout : text;
    nSize : array[1..MAX] of longint;
procedure ReadData;
var i, j : word;
begin
     assign(fin, IN_FILE);
     reset(fin);
     read(fin, n, m);
     for i := 1 to n do
         for j := 1 to m do read(fin, a[i][j]);
     close(fin);
end;
function Min(p, q : word) : word;
begin
     if p < q
     then Min := p
     else Min := q;
end;
procedure Solve;
var i, j, k : word;
begin
     fillchar(nSize, sizeof(nSize), 0);
     nSize[1] := n + m - 1;
     for i := 1 to m do dp[n][i] := 1;
     for i := n - 1 downto 1 do
     begin
          dp[i][m] := 1;
          for j := m - 1 downto 1 do
          begin
               k := 1;
               while (i + k <= n) and
                     (j + k <= m) and
                     (a[i + k][j] = a[i][j + k]) do inc(k);
               dp[i][j] := Min(dp[i + 1][j + 1] + 1, k);
               for k := 1 to dp[i][j] do inc(nSize[k]);
               if (maxSize < dp[i][j])
               then maxSize := dp[i][j];
          end;
     end;
end;
procedure WriteData;
var i : word;
begin
     assign(fout, OUT_FILE);
     rewrite(fout);
     for i := 1 to maxSize do writeln(fout, nSize[i]);
     close(fout);
end;
begin
     ReadData;
     Solve;
     WriteData;
end.