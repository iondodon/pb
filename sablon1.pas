Program DeterminareSablon;
Const DimMax = 50;           { lungimea maxima a textului   }
Type Gauri  = Array [1..DimMax, 1..DimMax] Of Boolean;
     Textul = Array [1..DimMax, 1..DimMax] Of Char;

Var G, OK  : Gauri;
    T      : Textul;
    Mesaj  : Array [1..4] Of String;
    N, L4  : Integer;
    NrGauri: Integer;

Procedure Afisare;
Var i, j: Integer;
    f   : Text;
Begin
   Assign(f, 'sablon1.out'); ReWrite(f);
   If NrGauri<L4 Then
      FillChar(G, SizeOf(G), False);
   For i := 1 To N Do
      Begin
        For j := 1 To N Do
          If G[i,j] Then
            Write(f, 'O')
          Else
            Write(f, 'X');
        Writeln(f);
      End;
   Close(f);
End;

Procedure Prelucrare;
Var Index, i, j, Lung, Cadran, N2: Integer;
Begin
  FillChar(G, SizeOf(G), False);
  FillChar(OK, SizeOf(OK), True);
  NrGauri := 0;
  Index := 1;
  For i := 1 To N Do     {parcurg cu Index-ul Textul pana la length(mesaj)/4 - pentru 4 rotiri}
    For j := 1 To N Do
      Begin
        If OK[i][j] Then
          If (Mesaj[1][Index] = T[i,j]) And         {primul caracter}
             (Mesaj[2][Index] = T[j,N-i+1]) And     {rotit cu 90o}
             (Mesaj[3][Index] = T[N-i+1,N-j+1]) And {rotit cu 180o}
             (Mesaj[4][Index] = T[N-j+1,i])         {rotit cu 270o}
          Then
            Begin
              Inc(NrGauri);
              G[i,j] := True; OK[i,j] := False; OK[j,N-i+1] := False;
              OK[N-i+1,N-j+1] := False; OK[N-j+1,i] := False;
              Inc(Index);
              If Index > L4 Then exit  {div 4 pentru 4 rotiri}
            End;
      End
End;

Procedure Citire;
Var f   : Text;
    i, j: Integer;
    Lung: Integer;
    M   : Array[1..1000] Of Char;
Begin
  Assign(f, 'sablon1.in'); reset (f);
  Lung := 0;
  FillChar(M, SizeOf(M), #0);
  While Not Eoln(f) Do          {citesc mesajul in sirul de caractere}
    Begin                       {determinandu-i lungimea}
      Inc(Lung);
      Read(f, M[Lung]);
    End;
  ReadLn(f, N);                 {citesc N}
  For i := 1 To N Do            {citesc textul in T}
    Begin
      For j := 1 To N Do
         Read(f, T[i,j]);
      Readln(f);
    End;
  Close(f);
  If Lung Mod 4<>0 Then
    WriteLn('Mesajul nu are lungimea corecta')
  Else
    Begin
      L4 := Lung Div 4;         {determin numarul de caractere la o rotire}
      For i := 1 To L4 Do       {si impart mesajul in 4 parti egale}
        Begin
          Mesaj[1][i] := M[i];
          Mesaj[2][i] := M[L4+i];
          Mesaj[3][i] := M[2*L4+i];
          Mesaj[4][i] := M[3*L4+i]
        End
    End
End;

Begin
  Citire;
  Prelucrare;
  Afisare;
End.
