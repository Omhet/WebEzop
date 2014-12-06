% IMPOSE.PRO 
% ������������ �� ������ �� ������ �����������  ���������������� ex - ���������.

ifndef iso_prolog

include "editor.pre"
%include "scan.pro"
include "calc.pre"

include "impose.pre"
include "make_eq.pre"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%include "extractTrm.pro"
Predicates
append1(list_w_v_t,list_w_v_t,list_w_v_t)
extractTerm(integer In,list_w_v_t InListTerm,integer NfirstWord, expr Term,integer  NRest) - nondeterm (i,i,i,o,o)
%���������� ������ Term �� ������ �������� ������ ���� �� ����� � ������� In,
% �� ��� ������������ ������ ���� � ������ InlLstTerm;
%NfirstWord-����� ������� ����� � InlLstTerm;
%NRest -����� ����� � ������� ������ ���� In ����� ��������� �� ������ ����� Term;

getTemplate(list_w_v_t, idTemplate)- nondeterm (i,o)
beginTemplate(list_w_v_t)
nondeterm formTerm(list_w_v_t,idTemplate,expr)
is_list(integer,list_w_v_t,list_w_v_t)
isa(w_v_t,w_v_t)
%type(expr,string) -determ(i,o)
%fronttoken_my(string Str,string Tok ,string Rest)- determ (i,o,o)
 tokll(integer NamberWord)
%subtype(expr, expr)    %?????? �������� �� is_subobject
listTerm(list_w_v_t,list_w_v_t,expr_list)
%nondeterm template2(id,list_w_v_t,expr)
nondeterm skobki(id,string Open, string Close,string Type)
get_word(integer,w_v_t) -determ (i,o)
putTerm(integer Nword,integer NfirstWord,expr Term)
nondeterm  form_dic
insert_listWord(idTemplate,list_w_v_t,integer In_1_or_2_template )
%type(expr,expr) -determ(i,o) %���������� �������������� ��� ��������� 
%subtype(expr, expr) - determ (i,i)   % ��� �������������� ����� ?????? �������� �� is_subobject			

/***********************************************************************************/
/*  ��������� ��������� ����, ����� ���� �� ����� � ������������ ����� �� ������� �����������
*/
/***********************************************************************************/
Predicates

 beginStr(string Begin,string STR,string Rest) %- determ (i,i,o)
/*�������� 3.02.03*/
build_text_skobki(id N,string End,string STR,string TOK,string Rest,string Begin,integer LBeg,integer LEnd,integer LTOK) 
separateStr(string STR,string TOK,string End,string Rest,string Begin,integer LBeg,integer LEnd,integer LTOK) 
/*����� ���������*/
 check(string,w_v_t)
  firstSentence_to_term(expr Term,expr TypeTermIsSentence, integer NambeNextWord)- determ (o,i,o) (o,o,o)
open_word(w_v_t,string) - (i,o)

/* �������� 20.01.03 ��� ��������� ������, �������� 3.02.03*/
count_openbracket(integer,string,string,integer,integer) - determ (i,i,i,i,o)
find_lastclosebracket(integer,string,string,integer,string,integer,string RestStr) - determ (i,i,i,i,i,i,o)
getfirstpos(integer Aux,string Str,string SubStr,integer StrLen,integer FirstPos) - determ (i,i,i,i,o)
not_char_before(string Str,integer Pos,char)
not_char_after(string Str,integer Pos,char,integer StrLen)
/*����� ���������*/

Clauses

elsedef

:- module(impose, [
impose/5, %(string In,string First,string Rest,expr Term,expr TypeTerm) -  (i,o,o,o,o)
impose_all_not_message/3, %(string In, expr Term, expr Type) - (i,o,o)
impose_all/3, %(string In, expr Term, expr TypeTerm) - (i,o,o)
type/2, %(expr,expr) - determ(i,o)  %���������� �������������� ��� ��������� 
fronttoken_my/3 %(string Str,string Tok ,string Rest)- determ (i,o,o) % � ������ ������� � �����������
]).
:- style_check(+string).

:- use_module(vp52_compat).
:- use_module(editor).
:- use_module(calc).
:- use_module(make_eq).
:- use_module(db).


%include "editor.pre"


enddef

 /*
%template2  - ��������, ��������� ��������� ������ -���. �� ������ ���� ������!
%    !!! ��� "term" ����� ������ !!!
%� ����������: ��� � ������� ob - ��� ������� �������, ��������� ������-��� ������ ����������� 
% ���������� is_subobject, � �� isa
template2("2",[var(ex("question",[]))],ex("sentence",[])).  %��� �����,  ����� ������ ��������� impose(...,"sentence",..)

template2("4",[var(ex("item",[]))],ex("expr_real",[])).
template2("1",[var(ex("minusitem",[]))],ex("expr_real",[])).
template2("5",[var(ex("index",[]))],ex("item",[])).
template2("6",[var(ex("real",[]))],ex("simplexpr",[])).
%template2("7",[var(ex("pair_new",[]))],ex("list",[])).
template2("8",[var(ex("simplexpr",[]))],ex("index",[])).

%template2("9",[var(ex("new",[]))],ex("command",[])). % ����� ��� ��� ��������� � ��������.
									% �� ���������� ����� � ������  ���� ������������

%template2("10",[var(ex("new_word",[]))],ex("new",[])).  
template2("11",[var(ex("sentence",[]))],ex("text",[])).
template2("12",[var(ex("input_var",[]))],ex("command",[])).
%template2("13",[var(ex("new",[]))],ex("listnew",[])).
template2("14",[var(ex("boolean",[]))],ex("text_question",[])).
template2("!5",[var(ex("ob",[]))],ex("text_question",[])).
template2("16",[var(ex("mor",[]))],ex("text_question",[])).
template2("17",[var(ex("expr_real",[]))],ex("text_question",[])).
template2("18",[var(ex("message",[]))],ex("sentence",[])).
template2("19",[var(ex("ob",[]))],ex("type",[])).
%template2("20",[var(ex("term",[]))],ex("list",[])).   %����???????
/* �������� 20.01.03 ��� �������� */
%template2("21",[var(ex("emptyset",[]))],ex("set",[])).
%template2("22",[var(ex("list",[]))],ex("term",[])).
%template2("23",[var(ex("set1",[]))],ex("set",[])).
template2("24",[var(ex("item_set",[]))],ex("expr_set",[])).
template2("25",[var(ex("simple_set",[]))],ex("item_set",[])).
template2("26",[var(ex("set",[]))],ex("simple_set",[])).
%template2("27",[var(ex("brack_set",[]))],ex("simple_set",[])).
template2("28",[var(ex("expr_set",[]))],ex("text_question",[])).
template2("29",[var(ex("expr_set",[]))],ex("command",[])).
%template2("30",[var(ex("expr_set",[]))],ex("ob",[])).
*/

/*
skobki("1","\"","\"","�������").
skobki("2","[","]","�������").
skobki("3","/*","*/","�����������").
skobki("4","%%","\n","�����������").
*/

skobki(Id,Begin,End,"�������"):-
	get_in_template(_,_IdConcept,Id,_,"�������",_, List,_),
	List=[w(Begin),w(End)].
skobki(Id,Begin,End,"�������"):-
	get_template(_IdConcept,Id,_,"�������",_,List,_),
	List=[w(Begin),w(End)].
skobki(Id,Begin,End,"�����������"):-
	get_in_template(_,_IdConcept,Id,_,"�����������",_,List,_),
	List=[w(Begin),w(End)].
skobki(Id,Begin,End,"�����������"):-
	get_template(_IdConcept,Id,_,"�����������",_,List,_),
	List=[w(Begin),w(End)].



form_dic:- 
	get_template(IdConcept,N,_,_,_, List,_),
	insert_listWord(id_t(IdConcept,N),List,1).
form_dic:- 
	get_in_template(_,IdConcept,N,_,_,_, List,_),
	insert_listWord(id_t(IdConcept,N),List,1).
form_dic.

	
insert_listWord(N,[w(Word)|Tail],2):- 
	word_dictionary(Word,List1,List2),!,
	retractall(word_dictionary(Word,_,_)),
	asserta(word_dictionary(Word,List1,[N|List2])),
	insert_listWord(N,Tail,2).
insert_listWord(N,[w(Word)|Tail],2):- !,
	asserta(word_dictionary(Word,[],[N])),
	insert_listWord(N,Tail ,2).		
insert_listWord(N,[_|Tail],2):- !, 
	insert_listWord(N,Tail,2).

insert_listWord(N,[w(Word)|Tail],1):- 
	word_dictionary(Word,List1,List2),!,
	retractall(word_dictionary(Word,_,_)),
	asserta(word_dictionary(Word,[N|List1],List2)),
	insert_listWord(N,Tail,1).
insert_listWord(N,[w(Word)|Tail],1):- !,
	asserta(word_dictionary(Word,[N],[])),
	insert_listWord(N,Tail,1).		
insert_listWord(N,[_|Tail],1):- !, 
	insert_listWord(N,Tail,1).
insert_listWord(_,[],_):-fail.


append1([],List,List):-!.
append1([H|T],List,[H|List1]):-append1(T,List,List1).


extractTerm(Nword,ListW_T,NfirstWord, Term,Nword):- 
	getTemplate(ListW_T,NT), 
	formTerm(ListW_T,NT,Term),
	putTerm(Nword,NfirstWord,Term).
extractTerm(Nword,_,_,_,_):- not(get_word(Nword,_)),!,fail.
extractTerm(Nword,ListW_T,NfirstWord,Term,NRest):-
	getTemplate(ListW_T,NumberTemplate),
	formTerm(ListW_T,NumberTemplate,Term1),
	extractTerm(Nword,[t(Term1)],NfirstWord,Term,NRest).				
extractTerm(Nword,List1,NfirstWord,Term,NRest):-
	get_word(Nword,H),
	append1(List1,[H],List2),
	beginTemplate(List2),
ifndef iso_prolog	
	N1=Nword+1,
elsedef
	N1 is Nword+1,
enddef	
	extractTerm(N1,List2, NfirstWord,Term, NRest).
extractTerm(_,[],_,_,_):-!,fail.
extractTerm(Nword,ListW_T,NfirstWord,Term,NRest):- 
	append1(ListW_T,[v],List2),
	beginTemplate(List2), 
	extractTerm(Nword,[],Nword,Term1,NRest1),
	append1(ListW_T,[t(Term1)],ListW_T1),
	extractTerm(NRest1,ListW_T1, NfirstWord,Term,NRest).

getTemplate([],_):-!,fail.
getTemplate([t(r(_))],id_t(0,"-1")):-!,fail.
getTemplate([w(W)],id_t(0,"0")):-str_real(W,_).  %��������� �� �������
getTemplate(List,id_t(IdConcept,N)):-get_in_template(_,IdConcept,N,_,_,_,ListT,_),
	is_list(0,List,ListT).
getTemplate(List,id_t(IdConcept,N)):-get_template(IdConcept,N,_,_,_,ListT,_),
	is_list(0,List,ListT).

get_word(N,Str):-
	word_of_sentence(N,_,_,Str),!.
get_word(N,Str):-tokll(N),get_word(N,Str).


putTerm(_Nword,NfirstWord,_Term):-NfirstWord<>1,!.
putTerm(Nword,_NfirstWord,Term):-
	lastTerm(_,N),
	Nword>N,
	retractall(lastTerm(_,_)),
	assert(lastTerm(Term,Nword)).

beginTemplate([]):-!,fail.
beginTemplate([w(W)]):-str_real(W,_),!. 
beginTemplate(ListW_T):-get_in_template(_,_,_,_,_,_,List,_),
	is_list(1,ListW_T,List),!.
beginTemplate(ListW_T):-get_template(_,_,_,_,_,List,_),
	is_list(1,ListW_T,List),!.


is_list(N,[H|T],[H1|T1]):- isa(H,H1),!,
	is_list(N,T,T1).
is_list(_,[_|_],[]):-!,fail.
is_list(0,[],[]):-!.					
is_list(1,[],_):-!.
			
isa(w(Str),w(Str)):-!.
isa(w(_),var(ex("new",[]))):-!.
%isa(nc(Str),var("new",[])):-!.
%isa(t(Term),var(ex("term",[]))):-type(Term,Type),
%						Type=ex("listnew",[]),!,
%						fail.
isa(_,var(ex("term",[]))):-!.
isa(t(ex("()",[Term])),var(Type)):-
	 type(Term,Type1),
	is_subobject(Type1,Type),!
	;
	type(Term,Type1),
	is_subobject(Type,Type1),!
	;
	type(Term,Type1),
	subobject(_,_,SuperType),
	not(SuperType=ex("term",[])),
	is_subobject(Type1,SuperType),
	is_subobject(Type,SuperType),!.
	
isa(t(Term),var(Type)):- type(Term,Type1),!,
	is_subobject(Type1,Type).
isa(v,var(_)).

/*			
subtype(T,T):-!.						
subtype(_,ex("term",[])):-!.
%!!!! ���������� � ������ ������ �� �������� � road
subtype(T1,T2):- template2(_,[var(T1)],T2),!.
subtype(T1,T2):-template2(_,[var(T1)],T3), subtype(T3,T2),!. %�� ������ ���� ������������ ����������
*/
type(r(_),ex("real",[])):-!.
%!!!!!!!!!! ��� ���� concepts
%type(nc(Name),ex("concepts",[])):-is_element(nc(Name),ex("concepts",[])),!.
type(nc(_),ex("new",[])):-!.
type(undef, undef):-!.
%type(w(_),ex("word",[])):-!.
type(ex("s_skobki",[Ex]),Res):-!,  %�������������� ������
	type(Ex,Res).
type(ex("()",[Ex]),Res):-!,  %������� ������
	type(Ex,Res).
	
type(ex("l_command",[_L_command, Command]),Res):-!,    % ��� ������ ������ ������������ ��������� ��������
	type(Command,Res).
type(ex("ob_metod",[_Ob, Metod]),Res):-!,
	%change_template(Ob,Metod,ObMetod), 
	type(Metod,Res).

type(T,Type):-calc_on_approx(T,DescT), element(_,DescT,Type),!.
type(ex("appl",[F, _El]),Res):-
	calc_on_approx(ex("cod",[F]),Res1),
	Res1=Res,!.

type(ex(N_op,_),Type):-get_in_template(_,_,_,_,N_op,_,_,TypeOP),
	calc_on_approx(TypeOP,T1),Type=T1,!. 
type(ex(N_op,_),Type):-get_template(_,_,_,N_op,_,_,TypeOP),
	calc_on_approx(TypeOP,T1),Type=T1,!.
type(_,Type):-calc(ex("term",[]),Type),!.

formTerm([t(_)],_,_):-!,fail.
formTerm([w(W)],id_t(0,"0"),r(R)):-str_real(W,R).
formTerm(ListW_T,id_t(IdConcept,N),ex(Name,ListArg)):- N<>"0", 
	get_in_template(_,IdConcept,N,_,Name,_,List,_),
	listTerm(List,ListW_T,ListArg).
formTerm(ListW_T,id_t(IdConcept,N),ex(Name,ListArg)):-N<>"0", 
	get_template(IdConcept,N,_,Name,_,List,_),
	listTerm(List,ListW_T,ListArg).

listTerm(_,[],[]):-!.
listTerm([w(X)|T1],[w(X)|T],L):-!, listTerm(T1,T,L).
listTerm([var(ex("new",[]))|T1],[w(X)|T],[nc(X)|L]):-!, listTerm(T1,T,L).
listTerm([var(_)|T1],[t(H)|T],[H|L]):- listTerm(T1,T,L).



firstSentence_to_term(undef,Type,1):- bound(Type),
	not(tokll(1)),!, %        !!!  ����������� ������ ����� � ���� ������
	assert(word_of_sentence(0,1,1,w(""))),
	%dlg_Error("������� ��������� �����."),
	msg_n(err,83,[],b_true).		
 firstSentence_to_term(Term,Type,Rest):-
 	bound(Type),
 	extractTerm(1,[],1, Term,Rest),
	type(Term,TypeTerm),
	is_subobject(TypeTerm,Type),!,
 	!.
				  
firstSentence_to_term(undef,Type,1):- bound(Type),
	%dlg_Error("������� ��������� �����������!"),
	msg_n(err,84,[],b_true),
	lastTerm(_,N),
	word_of_sentence(N,Nplace,_,Word),!,
	str_int(StrNplace,Nplace),
	open_word(Word,Str),
	%format(Mes,"��������� ������ � ����� \"%\" �� % ����� � ������.",Str, Nplace),
	msg_n(diagn,86,[Str, StrNplace],b_false),
	fail.
firstSentence_to_term(undef,Type,1):- bound(Type),
	msg_n(err,85,[],b_true),
	fail.

open_word(w(Word),Word):-!.
open_word(t(nc(Word)),Word):-!.

fronttoken_my(Str,Tok ,Str2 ):-
	skobki(N,Begin,End,"�������"),
	beginStr(Begin,Str,Str1),!,
	str_len(Begin,LBegin),
	str_len(End,LEnd),		
	build_text_skobki(N,End,Str1,Tok,Str2,Begin,LBegin,LEnd,_LTOK),!.
fronttoken_my(Str,Tok ,Str3 ):-	
	skobki(N,Begin,End,"�����������"),
	beginStr(Begin,Str,Str1),!,
	str_len(Begin,LBegin),
	str_len(End,LEnd),	
	build_text_skobki(N,End,Str1,_,Str2,Begin,LBegin,LEnd,_),!,
	fronttoken_my(Str2,Tok,Str3).
fronttoken_my(Str,Tok ,Str2 ):-
	fronttoken(Str,Tok ,Str2 ).
	
tokll(NumberWord):-
	restText(Str),
	skobki(N,Begin,End,"�������"),
	beginStr(Begin,Str,Str1),!,
	str_len(Begin,LBegin),
	str_len(End,LEnd),		
	build_text_skobki(N,End,Str1,Tok,Str2,Begin,LBegin,LEnd,LTok),!,
	searchstring(Str,Begin,N_in_str),
	str_len(Str,L),
	lenText(Len),
ifndef iso_prolog	
	Nplace=Len-L+N_in_str+LBegin+1,
	NplaceEnd=Nplace+LTok+LEnd-1,
elsedef
	Nplace is Len-L+N_in_str+LBegin+1,
	NplaceEnd is Nplace+LTok+LEnd-1,
enddef	
	asserta(word_of_sentence(NumberWord,Nplace,NplaceEnd,t(nc(Tok)))),
	retractall(restText(_)),
	assert(restText(Str2)).
	
tokll(NumberWord):-
	restText(STR),
	skobki(N,Begin,End,"�����������"),
	beginStr(Begin,STR,STR1),!,
	str_len(Begin,LBegin),
	str_len(End,LEnd),	
	build_text_skobki(N,End,STR1,_,STR2,Begin,LBegin,LEnd,_),!,
	retractall(restText(_)),
	assert(restText(STR2)),
	tokll(NumberWord).

tokll(NumberWord):-
	restText(STR),
	fronttoken(STR,TOK,STR1),
	searchstring(STR,TOK,N_in_str),
	str_len(STR,L),
	lenText(Len),
	check(TOK,CheckTOK),
	str_len(TOK,LTOK),
ifndef iso_prolog	
	Nplace=Len-L+N_in_str,
	NplaceEnd=Nplace+LTOK-1,	
elsedef
	Nplace is Len-L+N_in_str,
	NplaceEnd is Nplace+LTOK-1,	
enddef	
	asserta(word_of_sentence(NumberWord,Nplace,NplaceEnd,CheckTOK)),!,
	retractall(restText(_)),
	assert(restText(STR1)).
	
/*�������� 3.02.03*/	
build_text_skobki(_,End,STR,TOK,STR2,Begin,LBegin,LEnd,LTOK):-
	separateStr(STR,TOK,End,STR2,Begin,LBegin,LEnd,LTOK),!.
build_text_skobki(N,End,_,_,_,_,_,_,_):-
/*����� ���������*/
	skobki(N,Begin,End,Type),!,
/* �������� 20.01.03 */
	%format(S,"��� ������ ����������� ������ % ��� ����������� ������ % ���� %",End,Begin,Type),
	%dlg_Error(S),
	msg_n(err,87,[End,Begin,Type],b_true),
	fail.
  
%beginStr("",STR,STR):-!. �� ���������!!!
   beginStr(Begin,STR,STR1):-
 	fronttoken(Begin,Tok,Rest),
 	fronttoken(STR,Tok,Rest1),
 	str_len(Rest,L),
 	str_len(Rest1,L1),
 	L1>=L,
 	frontstr(L,Rest1,B,STR1),
 	Rest=B.
/* �������� 20.01.03, �������� 2.02.03 */
  separateStr(STR,Tok,CloseBr,Rest,OpenBr,LOpenBr,LenClose,LenTok):- 
	CloseBr<>OpenBr,!,
	str_len(STR,LenStr),
 	getfirstpos(0,STR,CloseBr,LenStr,Pos),
ifndef iso_prolog	
	Pos1=Pos+LenClose-1,
elsedef
	Pos1 is Pos+LenClose-1,
enddef	
	frontstr(Pos1,STR,PreStr,EndStr),
	count_openbracket(0,PreStr,OpenBr,LOpenBr,N),
	find_lastclosebracket(0,EndStr,CloseBr,LenClose,OpenBr,N,Rest),
	str_len(Rest,LenRest),
ifndef iso_prolog	
 	LenTok = LenStr-LenRest-LenClose,
elsedef
 	LenTok is LenStr-LenRest-LenClose,
enddef	
 	frontstr(LenTok,STR,Tok,_).

 /* ����� ���������� */
 separateStr(STR,Tok,End,Rest,_,_,L,LenTok):- 
 	searchstring(STR,End,N),
ifndef iso_prolog	
 	N1=N-1,
elsedef
 	N1 is N-1,
enddef	
 	frontstr(N1,STR,Tok,STR1),
 	str_len(Tok,LenTok),
 	frontstr(L,STR1,_,Rest).
 /* ����� ���������*/



/*  -old predicate 7.5.08 
check(WORD,w(WORD)):-
	str_real(WORD,_),!.
check(Word,w(Word)):-
	word_dictionary(Word,_,_),	!.
  
check(WORD,t(nc(WORD))):-
	writedevice(OldWriteDevice),
	writedevice(messages),
	write("<SPAN class=\"header\"> >> ����������� �����: </SPAN>","<SPAN class=\"message\">",WORD, "</SPAN><BR>"),
	writedevice(OldWriteDevice).
*/


check(WORD,w(WORD)):-
	str_real(WORD,_),!.
check(Word,w(Word)):-
	word_dictionary(Word,_,_),!.
  
check(WORD,t(nc(WORD))):-
	concat(">> ����������� �����: ", WORD, Res),
	concat(Res, "\n", Res2),	
	assert(my_message(Res2)).


/* �������� 20.01.03, �������� 3.02.03 - �� �����*/
count_openbracket(C,Str,OpenBr,LenBr,N):- 
	searchstring(Str,OpenBr,Pos),!,
ifndef iso_prolog	
	Pos1=Pos+LenBr-1, % TODO:=
	C1=C+1,
elsedef	
	Pos1 is Pos+LenBr-1, % TODO:=
	C1 is C+1,
enddef
	frontstr(Pos1,Str,_,EndStr), 
	count_openbracket(C1,EndStr,OpenBr,LenBr,N).
count_openbracket(N,_,_,_,N):- !.	

find_lastclosebracket(N,RestStr,_,_,_,N,RestStr):- !.
find_lastclosebracket(C,Str,CloseBr,LenClose,OpenBr,N,RestStr):- C<N,
	str_len(Str,LenStr),
	getfirstpos(0,Str,CloseBr,LenStr,Pos),!,
ifndef iso_prolog	
	Pos1=Pos+LenClose-1,
	C1=C+1,
elsedef	
	Pos1=Pos+LenClose-1,
	C1 is C+1,
enddef
	frontstr(Pos1,Str,PreStr,EndStr),
	not(searchstring(PreStr,OpenBr,_)),
	find_lastclosebracket(C1,EndStr,CloseBr,LenClose,OpenBr,N,RestStr).
find_lastclosebracket(C,_,_,_,_,N,_):- C<N,!,fail.

getfirstpos(Aux,Str,SubStr,_,Pos):- 
        SubStr<>"*/",!,
        searchstring(Str,SubStr,Pos1),
ifndef iso_prolog	
        Pos=Aux+Pos1.
elsedef	
        Pos is Aux+Pos1.
enddef

getfirstpos(Aux,Str,"*/",LenStr,Pos):- searchstring(Str,"*/",Pos1),
ifndef iso_prolog	
	Pos2=Pos1-1,
	Pos3=Pos1+2,
elsedef	
	Pos2 is Pos1-1,
	Pos3 is Pos1+2,
enddef
	not_char_before(Str,Pos2,'/'),
	not_char_after(Str,Pos3,'*',LenStr),!,Pos=Aux+Pos1.

getfirstpos(Aux,Str,"*/",_,Pos):- 
	searchstring(Str,"*/",Pos1),
ifndef iso_prolog	
	Pos2=Pos1-1,
	Len=Pos1+2,
	Aux1=Aux+Len,
elsedef	
	Pos2 is Pos1-1,
	Len is Pos1+2,
	Aux1 is Aux+Len,
enddef
	not_char_before(Str,Pos2,'/'),!,
	frontstr(Len,Str,_,Str1),
	str_len(Str1,Len1),
	getfirstpos(Aux1,Str1,"*/",Len1,Pos).

getfirstpos(Aux,Str,"*/",_,Pos):- 
	searchstring(Str,"/*/",Pos1),!,
ifndef iso_prolog	
	Len=Pos1+1,
	Aux1=Aux+Len,
elsedef	
	Len is Pos1+1,
	Aux1 is Aux+Len,
enddef
	frontstr(Len,Str,_,Str1),
	str_len(Str1,Len1),
	getfirstpos(Aux1,Str1,"*/",Len1,Pos).

not_char_before(_,0,_):- !.
not_char_before(Str,Pos,Ch):- subchar(Str,Pos,Ch1),Ch1<>Ch,!.

not_char_after(_,Pos,_,Len):- Pos>Len,!.
not_char_after(Str,Pos,Ch,_):- subchar(Str,Pos,Ch1),Ch1<>Ch,!.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

impose(Str,Sentence,Rest,Term,Type):-
	retractall(_,sintax),
	retractall(_,dictionaries),
	form_dic,
	upper_lower(Str, StrLower),
	assert(restText(StrLower)),
  	assert(lastTerm(undef,0)),
  	str_len(StrLower,L),
 	assert(lenText(L)),
  	firstSentence_to_term(Term,ex("sentence",[]),Nrest),
ifndef iso_prolog	
  	Nlast=Nrest-1, % TODO:=
elsedef
  	Nlast is Nrest-1, % TODO:=
enddef
  	word_of_sentence(Nlast,_Nplace,NplaceEnd,_Word),!,
 	frontstr(NplaceEnd,Str,Sentence,Rest), 				
 	type(Term,Type).
			
/*******************************************************************/
/*     impose_all ������ ���� �� ����� �������� ������                                         */
/*                                                                                                                                  */
/***************************************************** **************/
impose_all(Str,Term,Type):-
	impose_all_not_message(Str,Term,Type), !. % �����������������
impose_all(Str,undef,_):-
	% bound(Type),
	format(_MesStr,"�� ������� ��������� ���� �� ����� ������:\<BR>       \"%\"",Str),
	msg_n(err,88,[Str],b_false),
	lastTerm(_,N),
	word_of_sentence(N,Nplace,_,Word),!,
	str_int(StrNplace,Nplace),
	open_word(Word,Str1),
	format(_Mes,"��������� ������ � ����� \"%\" �� % ����� � ������.<BR>���� ��� ��� ������ ������� � ������ ����, �� ��� ������� ������ � ��������.",Str1, Nplace),
	msg_n(diagn,89,[Str1, StrNplace],b_false),
	fail.

impose_all_not_message(Str,Term,Type):-
	retractall(_,sintax),
	retractall(_,dictionaries),
	form_dic,
 	upper_lower(Str, StrLower),
       	assert(restText(StrLower)),
  	assert(lastTerm(undef,0)),
  	str_len(StrLower,L),
 	assert(lenText(L)),
 	not(tokll(1)),!,
	Term=nc(""),
	type(Term,Type).
impose_all_not_message(_,Term,Type):-	
	extractTerm(1,[],1,Term,_),
 	restText(Rest),
 	not(fronttoken(Rest,_,_)), !, % ����������������
 	type(Term,Type).
