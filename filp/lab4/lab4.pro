domains 
s = string
i = integer

facts
animal(s, s, i)

predicates

nondeterm population(s, i, i)
nondeterm endangered(i)
nondeterm main_menu
nondeterm menu(s)

clauses

population(S, N, 0) :- animal(S, A, P), !, P2 = P + N, retract(animal(S, A, P)), assert(animal(S, A, P2)), save("Y:/���/filp/lab4/db.txt"). 
population(S, N, 1) :- animal(S, A, P), !, P2 = P - N, retract(animal(S, A, P)), assert(animal(S, A, P2)), save("Y:/���/filp/lab4/db.txt").
population(_, _, _) :- write("�������� �� �������"), nl.
	
endangered(N) :- animal(S,A, P),	P <= N, write(S, " ( �����: ",A,") - ���������: ",P), nl, fail. 
endangered(_).

menu("1") :- write("===================="),nl,
	write("���������� ��������� ��������"),nl,
	write("��������: "), readln(S),
	write("��������: "), readint(N),
	population(S, N, 0), main_menu.
menu("2") :- write("===================="),nl,
	write("���������� ��������� ��������"),nl,
	write("��������: "), readln(S),
	write("������: "), readint(N),
	population(S, N, 1), main_menu.
menu("3") :- write("===================="),nl,
	write("������ ���������� ��������"),nl,
	write("���������� ������ ���������: "), readint(N),
	endangered(N), main_menu.
menu(_) :- main_menu.

main_menu :- nl,write("��������:"),nl,
  	write("1 - ���������� ��������� ��������"),nl,
  	write("2 - ���������� ��������� ��������"),nl,
  	write("3 - ������ ���������� ��������"),nl,
  	readln(R), menu(R). 

goal
  consult("Y:/���/filp/lab4/db.txt"),main_menu.
