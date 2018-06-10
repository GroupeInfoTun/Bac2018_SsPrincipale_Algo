Program Ex3_Pi_ZetaRiemann;
Uses Wincrt;
{=================================================}
Function Inconnue(E, k:Integer): Boolean;
Begin
  If (E<2) Or (E Mod k=0) Then Inconnue := False
  Else If k>Sqrt(E) Then Inconnue := True
  Else Inconnue := Inconnue(E, K+1);
End;
{=================================================}
Function Calcul_Version_1(Epsilon:Real): Real;
Var
  Pi_Actuel, Pi_Precedent: Real;
  i: Integer;
Begin
  Pi_Actuel := Sqrt(6*Sqr(2)/(Sqr(2)-1));
  i := 2;
  Repeat
    i := i+1;
    If Inconnue(i,2) Then
      Begin
        Pi_Precedent := Pi_Actuel;
        Pi_Actuel := Pi_Actuel*(Sqrt(Sqr(i)/(Sqr(i)-1)));
      End;
  Until Abs(Pi_Actuel-Pi_Precedent)<=Epsilon;
  Calcul_Version_1 := Pi_Actuel
End;
{=================================================}
Function Calcul_Version_2(Epsilon:Real): Real;
Var
  Zeta_Actuel, Zeta_Precedent: Real;
  i: Integer;
Begin
  Zeta_Actuel := Sqr(2)/(Sqr(2)-1);
  i := 2;
  Repeat
    i := i+1;
    If Inconnue(i,2) Then
      Begin
        Zeta_Precedent := Zeta_Actuel;
        Zeta_Actuel := Zeta_Actuel*(Sqr(i)/(Sqr(i)-1));
      End;
  Until Abs(Sqrt(6*Zeta_Actuel)-Sqrt(6*Zeta_Precedent))<=Epsilon;
  Calcul_Version_2 := Sqrt(6*Zeta_Actuel)
End;
{=================================================}
Begin
  Writeln(Calcul_Version_1(1e-8): 0: 9);
  Writeln(Calcul_Version_2(1e-8): 0: 9);
End.
