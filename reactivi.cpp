{$R-,S-} //Sursa am copiat-o 
Program Reactivi;
{NU l-am dat pe asta ca sursa deoarece intr-a IX-a INCA nu se face QuickSort}
Type Frigider = Record
                   min, max: ShortInt
                End;
Var f            : Array[1..10000] Of Frigider;
    r            : Array[1..10000] Of Frigider;
    Fisier       : Text;
    Cate, i, j, N: Integer;
    min, max     : ShortInt;

Function Maxim(x, y: ShortInt): ShortInt;
Begin
  If x>y Then
    Maxim := x
  Else
    Maxim := y
End;

Function Minim(x, y: ShortInt): ShortInt;
Begin
  If x<y Then
    Minim := x
  Else
    Minim := y
End;

Function Cauta(min, max: ShortInt): Integer;
Var i: Integer;
Begin
  Cauta := -1;
  For i := 1 To Cate Do
    Begin
      If (f[i].max>=min) And (f[i].max<=max) Then
        Begin Cauta := i; Break End
      Else
        If (f[i].min>=min) And (f[i].min<=max) Then
          Begin Cauta := i; Break End
        Else
          If (f[i].min<=min) And (f[i].max>=max) Then
            Begin Cauta := i; Break End
          Else
            If (f[i].max<min) Or (f[i].min>max) Then
              Cauta := -1
    End;
End;

Procedure Intersectie(j: Integer; min, max: ShortInt);
Begin
  f[j].min := Maxim(min, f[j].min);
  f[j].max := Minim(max, f[j].max)
End;

procedure QuickSortCresc(Lo, Hi: Integer);

  procedure Sort(Stanga, Dreapta: Integer);
  var i, j, x: integer;
      y: Frigider;
  begin
    i := Stanga; j := Dreapta; x := r[(Stanga+Dreapta) DIV 2].min;
    repeat
      while r[i].min < x do i := i + 1;
      while x < r[j].min do j := j - 1;
      if i <= j then
      begin
        y := r[i]; r[i] := r[j]; r[j] := y;
        i := i + 1; j := j - 1;
      end;
    until i > j;
    if Stanga < j then Sort(Stanga, j);
    if i < Dreapta then Sort(i, Dreapta);
  end;

begin {QuickSort};
  Sort(Lo,Hi);
end;

procedure QuickSortDescresc(Lo, Hi: Integer);

  procedure Sort(Stanga, Dreapta: Integer);
  var i, j, x: integer;
      y: Frigider;
  begin
    i := Stanga; j := Dreapta; x := r[(Stanga+Dreapta) DIV 2].max;
    repeat
      while r[i].max > x do i := i + 1;
      while x > r[j].max do j := j - 1;
      if i <= j then
      begin
        y := r[i]; r[i] := r[j]; r[j] := y;
        i := i + 1; j := j - 1;
      end;
    until i > j;
    if Stanga < j then Sort(Stanga, j);
    if i < Dreapta then Sort(i, Dreapta);
  end;

begin {QuickSort};
  Sort(Lo,Hi);
end;

Begin
  Assign(Fisier, 'reactivi.in'); Reset(Fisier);
  ReadLn(Fisier, N);
  For i := 1 To N Do
    ReadLn(Fisier, r[i].min, r[i].max);
  Close(Fisier);

  QuickSortCresc(1, N);

  i := 1; j := i+1;
  While j<=N Do
    Begin
      While (r[j].min=r[i].min) And (j<=N) Do Inc(j);
      QuickSortDescresc(i, j-1);
      i := j; j := i+1
    End;

  f[1].min := r[1].min; f[1].max := r[1].max; Cate := 1;
  For i := 2 To N Do
    Begin
      min := r[i].min; max := r[i].max;
      j := Cauta(min, max);
      If j>0 Then
        Intersectie(j, min, max)
      Else
        Begin
          Inc(Cate);
          f[Cate].min := min;
          f[Cate].max := max
        End
    End;
  Assign(Fisier, 'reactivi.out'); ReWrite(Fisier);
  WriteLn(Fisier, Cate);
  Close(Fisier)
End.
