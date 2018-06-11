Program Ex1_Question3_TriShell;
Uses Wincrt;
Type
  Tab = Array[1..20] Of Byte;
Var
  Ti, Tr: Tab;
  N, P: Byte;
{===================================================}
Function Tri_Shell_V1(Var T:Tab; N:Byte): Byte;
Var
  Kes, i, j, P, NombreDeDecalage : Integer;
Begin
  NombreDeDecalage := 0;
  P := 0;
  While (P < N) Do P := 3 + P;

  While (P <> 1) Do
    Begin
      P := (P - 3) + Ord(P - 3 = 0);
      For i := P+1 To N Do
        Begin
          Kes := T[i];
          j := i;
          While (j > P) And (T[j - P] > Kes) Do
            Begin
              T[j] := T[j - P];
              j := j - P;
              Inc(NombreDeDecalage);
            End;
          T[j] := Kes;
        End;
    End;
  Tri_Shell_V1 := NombreDeDecalage;
End;
{===================================================}
Function Tri_Shell_V2(Var T:Tab; N:Byte): Byte;
Var
  Kes, i, j, P, NombreDeDecalage : Integer;
Begin
  NombreDeDecalage := 0;
  P := 1;
  While (P < N) Do P := 2 * P;

  While (P <> 1) Do
    Begin
      P := (P Div 2) + Ord(P Div 2 = 0);
      For i := P+1 To N Do
        Begin
          Kes := T[i];
          j := i;
          While (j > P) And (T[j - P] > Kes) Do
            Begin
              T[j] := T[j - P];
              j := j - P;
              Inc(NombreDeDecalage);
            End;
          T[j] := Kes;
        End;
    End;
  Tri_Shell_V2 := NombreDeDecalage;
End;
{===================================================}
Function Tri_Shell_V3(Var T:Tab; N:Byte): Byte;
Var
  Kes, i, j, P, NombreDeDecalage : Integer;
Begin
  NombreDeDecalage := 0;
  P := 1;
  While (P < N) Do P := 3 * P + 1;

  While (P <> 1) Do
    Begin
      P := (P Div 3) + Ord(P Div 2 = 0);
      For i := P+1 To N Do
        Begin
          Kes := T[i];
          j := i;
          While (j > P) And (T[j - P] > Kes) Do
            Begin
              T[j] := T[j - P];
              j := j - P;
              Inc(NombreDeDecalage);
            End;
          T[j] := Kes;
        End;
    End;
  Tri_Shell_V3 := NombreDeDecalage;
End;
{===================================================}

Procedure Afficher(T:Tab; N:Integer);
Var
  i: Integer;
Begin
  For i:=1 To N Do Write(T[i]:4);
  Writeln(#10#10);
End;
{===================================================}

Procedure Remplir(Var T:Tab; N:Integer);
Var
  i: Integer;
Begin
  For i:=1 To N Do T[i] := 10+Random(90);
End;
{===================================================}
Begin
  Randomize;
  N := 5+Random(16);
  Remplir(Ti, N);
  Writeln('0-Tableau initial:'#10);
  Afficher(Ti, N);
{1- Calcul de l'Espacement P: P(0)=0, P(n)=3+P(n-1) }
  Tr := Ti;
  Writeln('1-Calcul de l''Espacement P: P(0)=0, P(n)=3+P(n-1)');
  Writeln('1-Nombre de décalages: ',Tri_Shell_V1(Tr, N),#10);
  Afficher(Tr, N);
{2- Calcul de l'Espacement P: P(0)=1, P(n)=2*P(n-1) }
  Tr := Ti;
  Writeln('2-Calcul de l''Espacement P: P(0)=1, P(n)=2*P(n-1)');
  Writeln('2-Nombre de décalages: ',Tri_Shell_V2(Tr, N),#10);
  Afficher(Tr, N);
{3- Calcul de l'Espacement P: P(0)=1, P(n)=3*P(n-1) + 1 }
  Tr := Ti;
  Writeln('3-Calcul de l''Espacement P: P(0)=1, P(n)=3*P(n-1) + 1');
  Writeln('3-Nombre de décalages: ',Tri_Shell_V3(Tr, N),#10);
  Afficher(Tr, N);
End.
