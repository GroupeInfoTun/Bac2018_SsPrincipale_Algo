Program Ex2_Fibonacci;
Uses Wincrt;
{===================================================}
Function Fibo(N:Byte): Longint;
Var
  P: Byte;
Begin
  If N<=1 Then Fibo := 1
  Else If N Mod 2=0 Then
         Begin
           P := N Div 2;
           Fibo := Sqr(Fibo(P -1)) + Sqr(Fibo(P))
         End
  Else
    Begin
      P := (N-1) Div 2;
      Fibo := (2*Fibo(P+1)-Fibo(P))*Fibo(P)
    End;
End;
{===================================================}
Function Fibo_Som(N:Byte): Longint;
Begin
  Fibo_Som := Fibo(N+2)-1;
End;
{===================================================}
Begin
  Write(Fibo_Som(15));
End.

{ Nombres de Fibonacci:
1, 1, 2, 3, 5,
8, 13, 21, 34, 55
89, 144, 233, 377, 610
987, 1597, 2584, 4181, 6765
10946, 17711, 28657, 46368, 75025
121393, 196418, 317811, ...
}
