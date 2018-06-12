(*
Un programme Pascal qui génère aléatoirement 100 Tableaux d'entiers
de 2 chiffres, la taille de chacun des tableaux est générée aussi
aléatoirement et varie entre 5 et 50.

Pour chacun des 100 tableaux, le programme teste le Tri de Shell 3 fois,
chacun utilise l'une des suites proposées dans la question 3 de l'Exercice 1
de l'examen du baccalauréat 2018 en Algorithmique (Session Principale),
Les Suites proposées:
- Suite-1: P=0, P=3+P
- Suite-2: P=1, P=2*P
- Suite-3: P=1, P=3*P+1

Le programme génère et affiche un rapport (un fichier texte qui s'ouvre
à la fin de l'exécution du programme) et affiche:
1) Le Nombre Total de Décalages pour chacune des "Suites" après le tri de 100 Tableaux.
2) Pour chaque tableau, il affiche le nombre de cases, le tableau lui-même, et le
nombre de décalages effectués pour chacune des "Suites"
*)
Program Ex1_Q3_TriShell_B2018;
Uses Wincrt, Shellapi;
Type
  Tab = Array[1..50] Of Byte;
Var
	FTemp, FRap:Text;
  Ti, Tr: Tab;
	Ligne:String;
  NbDec_V1, NbDec_V2, NbDec_V3, N, i, NbDecTemp: Integer;
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
      P := (P Div 2);
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
      P := (P Div 3);
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

Procedure Remplir(Var T:Tab; N:Integer);
Var
  i: Integer;
Begin
  For i:=1 To N Do T[i] := 10+Random(90);
End;
{===================================================}
Procedure TableauVersFichier(Var F:Text; T:Tab; N:Integer);
Var
  i: Integer;
Begin
	For i:=1 To N Do Write(F, T[i]:3);
	Writeln(F);
End;
{===================================================}
Begin
	Randomize;
	Assign(FTemp, 'Tmp.txt');
	ReWrite(FTemp);
{--Tri de 100 Tableaux   --------}
	NbDec_V1:=0;
	NbDec_V2:=0;
	NbDec_V3:=0;
	For i:=1 To 100 Do
	Begin
		  N := 5+Random(46);
			Writeln(FTemp, ' __ N=', N,' __________');
		  Remplir(Ti, N);
			TableauVersFichier(FTemp, Ti, N);
			Write(FTemp, #10' Nb de decalages=  ');
		{--}
		  Tr := Ti;
			NbDecTemp:=Tri_Shell_V1(Tr, N);
			NbDec_V1:=NbDec_V1+ NbDecTemp;
			Write(FTemp, 'Suite-1: ', NbDecTemp,' | ');
		{--}
		  Tr := Ti;
			NbDecTemp:=Tri_Shell_V2(Tr, N);
			NbDec_V2:=NbDec_V2+ NbDecTemp;
			Write(FTemp, 'Suite-2: ', NbDecTemp,' | ');
		{--}
		  Tr := Ti;
			NbDecTemp:=Tri_Shell_V3(Tr, N);
			NbDec_V3:=NbDec_V3+ NbDecTemp;
			Writeln(FTemp, 'Suite-3: ', NbDecTemp);
		{--}
			Writeln(FTemp, '___________________________________________________________________________');
	End;
{--Génération du Rapport --------}
	Assign(FRap, 'Rapport.txt');
	ReWrite(FRap);
	Reset(FTemp);
	Writeln(FRap, '___________________________________________________');
	Writeln(FRap, '  Tri Shell de 100 Tableaux generes aleatoirement');
	Writeln(FRap, '___________________________________________________'#10);
	Writeln(FRap, 'Le Nombre Total de Decalages pour : '#10);
	Writeln(FRap, 'La Suite-1: P=0, P=3+P   === ', NbDec_V1,#10);
	Writeln(FRap, 'La Suite-2: P=1, P=2*P   === ', NbDec_V2,#10);
	Writeln(FRap, 'La Suite-3: P=1, P=3*P+1 === ', NbDec_V3,#10);
	Writeln(FRap, '___________________________________________________________________________');
	Writeln(FRap, 'Les Tableaux');
	Writeln(FRap, '___________________________________________________________________________');

	While not EOF(FTemp) Do
	Begin
			Readln(FTemp, Ligne);
			Writeln(FRap, Ligne);
	End;
	Close(FRap);
	Close(FTemp);
	Erase(FTemp);
	ShellExecute(0,PChar('open'),PChar('Rapport.txt'), '','',3);
End.
