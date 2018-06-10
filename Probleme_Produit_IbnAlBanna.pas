Program Probleme_Produit_IbnAlBanna;
Uses Wincrt;
Type
  Matrice = Array[1..5, 1..5] Of Byte;
  Ch10 = String[10];
  Tab = Array[1..10] Of Byte;
Var
  CA, CB: Ch10;
  M: Matrice;
  R: Tab;
  N: Byte;
{===================================================}
Procedure Lecture(Var CA, CB: Ch10);
Var
  A, B: Integer;
Begin
  Repeat
    Write('A: '); Readln(A);
    Write('B: '); Readln(B);
  Until (A>=10) And (A<=10000) And (B>=10) And (B<=10000);
  Str(A, CA);
  Str(B, CB);
  While Length(CA)<Length(CB) Do CA := '0'+ CA;
  While Length(CA)>Length(CB) Do CB := '0'+ CB;
End;
{===================================================}
Procedure MiseAjour(Var R:Tab; N:Byte);
Var
  i: Byte;
Begin
  For i:=2*N Downto 2 Do
    Begin
      If R[i]>=10 Then
        Begin
          R[i-1] := R[i-1]+R[i] Div 10;
          R[i] := R[i] Mod 10;
        End;
    End;
End;
{===================================================}
Procedure Diag(M:Matrice; N:Byte; Var R:Tab);
Var
  i,j,k: Byte;
Begin
  For k:=2*N Downto N Do
    Begin
      i := N;
      j := k-i;
      R[k] := M[i, j] Mod 10;
      While (j<N) Do
        Begin
          j := j+1;
          R[k] := R[k]+M[i,j] Div 10 + M[i-1, j] Mod 10;
          i := i-1;
        End;
    End;
  For k:=N Downto 1 Do
    Begin
      R[k] := M[k, 1] Div 10;
      i := k;
      j := 1;
      While (i>1) Do
        Begin
          i := i-1;
          R[k] := R[k]+M[i,j] Mod 10 + M[i, j+1] Div 10;
          j := j+1;
        End;
    End;
  MiseAjour(R, N);
End;
{===================================================}

Procedure GenerationMatrice(Var M:Matrice;Var N:Byte; CA, CB: Ch10);
Var
  i, j, Xi, Yj: Byte;
  e: Integer;
Begin
  N := Length(CA);
  For i:=1 To N Do
    Begin
      Val(CA[i], Xi, e);
      For j:=1 To N Do
        Begin
          Val(CB[j], Yj, e);
          M[i, j] := Xi * Yj;
        End;
    End;
End;
{===================================================}
Function Concatenation(R:Tab; N:Byte): Ch10;
Var
  Res, Tmp: Ch10;
  i: Byte;
Begin
  Res := '';
  For i:=1 To 2*N Do
    Begin
      Str(R[i], Tmp);
      Res := Res+Tmp;
    End;
  Concatenation := Res;
End;
{===================================================}
Begin
  Lecture(CA, CB);
  GenerationMatrice(M, N, CA, CB);
  Diag(M, N, R);
  Writeln(Concatenation(R,N))
End.
