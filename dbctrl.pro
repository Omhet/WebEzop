
/*****************************************************************************

		Copyright (c) 2000 My Company

 Project:  EDITOR
 FileName: DBCTRL.PRO
 Purpose: EditEzop
 Written by: E. Beniaminov
 Comments:
******************************************************************************/
ifndef iso_prolog

%include "editor.inc"
include "editor.pre"
include "dbctrl.pre"


PREDICATES

nondeterm readterm_repeat(file) - (i)
get_title(STRING,STRING)
set_envTemplates(integer IdConcept)



CLAUSES

elsedef

:- module(dbctrl, [
get_defin1/1, %(string) - (o)
get_defin2/1, %(string) - (o)
get_last_cmd/1, %(string) - (o)
set_current_concept_name/1, %(string) - (i)
set_environment_name/1, %(string)-(i) % � Title TaskWindow � � environment()
put_defin2/1, %(string) - (i)
put_last_cmd/1, %(string) - (i)
load_config/0, %
load_env_concept/0, %
put_defin1/1, %(string) - (i)
get_current_environment_id/1, %(integer IdEnv) -(o)
get_newIdConcept/1 %(integer Id) -(o)
]).
:- style_check(+string).

:- use_module(vp52_compat).
:- use_module(editor).
:- use_module(db).

%include "editor.pre"


enddef

get_current_environment_id(1):-
		get_current_environment_file(File),
		upper_lower(File,"1"),!.
		
get_current_environment_id(ID):-
		get_current_environment_file(File),
		str_int(File,ID).

get_defin1(S):-
	defin1(_,S),!.
get_defin1("").

get_defin2(S):-
	defin2(_,S),!.
get_defin2("").

get_last_cmd(S):-last_cmd(_,S),!.
get_last_cmd("").

get_newIdConcept(Id):-
	random(100000000,Id),
	Id>1,
	str_int(IdStr,Id),
	not(name_file(_,IdStr,_,_)),
	not(element_concept(_, _, Id, _) ),!.   

get_newIdConcept(Id):-
	%Str="��������� ����� �������������� ���������.\n�������� � ������� ������� ����� ���������.",
	%dlg_note(Str),
	%msg(diagn,Str),
	%msg_n(diagn,58,[],b_true),
	get_newIdConcept(Id).

 load_config:-
   	not(existfile("config.ez")),!,
   	msg_n(warning,59,[],b_true).

 load_config:-
   	retractall(_,config),
   	trap(consult("config.ez",config),Err,error_handler("������ � �������� ����� config.ez",Err)),!.

 load_config:-
	msg_n(warning,60,[],b_false).

 get_title(FileName,Title) :-
	filenamepath(FileName,_,Title),!.
 get_title(FileName,FileName).
    
 set_environment_name("���� �������"):-!, 		
    	retractall(environment(_)),
    	notion_base(FileName),
   	get_title(FileName,Title),
    	concat(NameNB,".ezp",Title),
    	format(_Str,"% - WinEzop � �����: \"���� �������\"",NameNB),
    	set_envTemplates(1). 

set_environment_name(S):-
   	retractall(environment(_)),
  	name_file(S,F,_,_),!,
   	str_int(F,Id),
   	assert(environment(F)),
   	notion_base(FileName),
   	get_title(FileName,Title),
    	concat(NameNB,".ezp",Title),
     	format(_Str,"% - WinEzop � �����: \"%\"",NameNB,S),
    	set_envTemplates(Id).
   
% set_envTemplates(_IdConcept):-!!!!! �� �������. 
% ���� �������� ������ ��������� ������ ������� �� ��������� �������.
% ������ �� ��������� ��� �������. ��� �������� ��� ����, ����� ��� ���������� ��������� � 
% ���������� ������� �������� � ����� �� �������� ��������� �� ��������� �������.
% ���������� ���� �� ��������� ������ ������� �������, � ��� ���������� ���������� ������� 
% ������������� ����� ��������, ����� ������� �������, � ����� ��������. ��� �����, ��� ��� 
% ���������� ������ ������������ �� ������.  
 set_envTemplates(_IdConcept):- %�������� �������� ����
 	 not(existfile("kernel.tmt")),!,
   	%Str="����������� ���� \"kernel.tmt\" �  ��������� ���� � ����� �������. ",
   	msg_n(err,65,[],b_true),
   	fail.
   	
set_envTemplates(_IdConcept):-
	retractall(_,templates),
	fail.
	
set_envTemplates(_IdConcept):-
	 openread(input,"kernel.tmt"),
	 readdevice(input),
	 readterm_repeat(input),
  	 %format(Prompt2," ���������� ��������� ������  � ����� �������  \"kernel.tmt\"."),
	readterm(templates,Term),
   	%trap(readterm(templates,Term),Err2,error_handler(" ���������� ��������� ������  � ����� �������  \"kernel.tmt\".",Err2)),
	%Term=template(_IdC1,_Id, _Text, _Op,  _Comment,  _List, _Type),
	%is_usedConcept(IdC1,IdConcept), ���������� �� ��� �������, � ������ �������
	% � ����� ���������� �� ������ ������� �� � ����� ��������!!!
	not(Term=dir_con_tt(_)),
	not(Term=dir_papki_tt(_)),
	assert(Term),
	fail.
	
set_envTemplates(_):-
	readdevice(keyboard),
	closefile(input),
	retractall(_,counts),
	fail.
	
	
 set_envTemplates(_IdConcept):- %�������� �������� ���� ��������� 
 	notion_base(CatalogFile),
	concat(PathAndName,".ezp",CatalogFile),
	concat(PathAndName,".tmt",File),
  	 not(existfile(File)),!,
   	%format(Str," ����������� ���� \"%\", ����������  ������� ������� ���� ���������. ",File),
   	msg_n(warning,66,[File],b_false).   	   	
   	
set_envTemplates(_IdConcept):-
	 notion_base(CatalogFile),
	 filenamepath(CatalogFile, _Path, Name),
	not(Name="kernel.ezp"), 
	concat(PathAndName,".ezp",CatalogFile),

	concat(PathAndName,".tmt",FileTemplates),
	
	 openread(input,FileTemplates),
	 readdevice(input),
	 readterm_repeat(input),
  	 format(_Prompt2," ���������� ��������� ������  � ����� \"%\".", FileTemplates),
  	 readterm(templates,Term),
   	%trap(readterm(templates,Term),Err2,error_handler(Prompt2,Err2)),
	%Term=template(_IdC1,_Id, _Text, _Op,  _Comment,  _List, _Type),
	%is_usedConcept(IdC1,IdConcept), ���������� �� ��� �������, � ������ �������
	% � ����� ���������� �� ������ ������� �� � ����� ��������!!!
	assert(Term,templates),

	fail.
	
set_envTemplates(_):-
    readdevice(keyboard),
    closefile(input),
    retractall(_,counts).

load_env_concept:-
    %send_to_debug("load_env_concept - 1"),
    get_current_concept_name(Name),Name="����� ���������", 
    get_current_environment_file(File),
    upper_lower(File,"1"),
    not(existfile("1")),!,
    %Msg="�� ������ ���� \"1\" � ����� �������.",
   %msg_n(err,61,[],b_true),   
   retractall(environment(_)),
   %Win= vpi_GetTaskWin(),
    %win_SetText(Win,"WinEzop"),
    fail.

load_env_concept:- % new concept, environment file doesnt exist
    	%send_to_debug("load_env_concept - 2"),
    	get_current_concept_name(Name),Name="����� ���������", 
    	get_current_environment_file(File),
    	not(upper_lower(File,"1")),% not Kernel
      	notion_base(CatalogFile),
	filenamepath(CatalogFile,  Path, _Name),
	filenamepath(PathFile,  Path, File),
   	not(existfile(PathFile)),!,
    	get_current_environment_name(_NameEnv),
   	%format(Msg,"�� ������ ���� \"%\" � ���������� \"%\".",PathFile,NameEnv),
  	 msg_n(err,62,[PathFile,_NameEnv],b_true),
  	 retractall(environment(_)),
   	fail.
load_env_concept:-
	%send_to_debug("load_env_concept - 3"),
    	get_current_environment_file(File),
   	upper_lower(File,"1"),
      	not(existfile("1")),!,
      	%Msg=" �� ������ ���� \"1\" � ����� �������",
   	msg_n(err,61,[],b_true),
   	fail.
load_env_concept:-
	%send_to_debug("load_env_concept - 4"),
    	get_current_environment_file(File),
   	not(upper_lower(File,"1")),
   	 notion_base(CatalogFile),
	filenamepath(CatalogFile,  Path, _Name),
	filenamepath(PathFile,  Path, File),
  	not(existfile(PathFile)),!,
    	get_current_environment_name(_Name1),
   	%format(Msg," �� ������ ���� \"%\"� ���������� \"%\".",PathFile,Name),
   	msg_n(err,62,[PathFile,_Name1],b_true),
   	fail.
load_env_concept:-
	%send_to_debug("load_env_concept - 5"),
	retractall(_,concept),
	get_current_environment_file(File),

	%send_to_debug(File),
	%upper_lower(File,"init.ntn"),

	upper_lower(File,"1"),

	consult(File,concept),!,
	%trap(consult(File,concept),Err, error_handler(File,Err)),!,
	 retractall(defin1(_,_),concept),
        retractall(defin2(_,_),concept),
        retractall(last_cmd(_,_),concept),
        retractall(idconcept(_),concept).
load_env_concept:-
	%send_to_debug("load_env_concept - 6"),
	retractall(_,concept),
	get_current_environment_file(File),
	not(upper_lower(File,"1")),
	notion_base(CatalogFile),
	filenamepath(CatalogFile,  Path, _Name),
	filenamepath(PathFile,  Path,File),
	consult(PathFile,concept),!,
	%trap(consult(_PathFile,concept),Err, error_handler(PathFile,Err)),!,
	 retractall(defin1(_,_),concept),
        retractall(defin2(_,_),concept),
        retractall(last_cmd(_,_),concept),
        retractall(idconcept(_),concept).
        

set_current_concept_name(S):-
   retractall(current_concept_name(_)),
   assert(current_concept_name(S)).
   %tnotion_window(Win,"tnotion",_),!,
  % edit_SetTitle(Win,S).
 
put_defin1(S):-
	readonly_concept("false"),!,
	retractall(defin1(_,_)),
	idconcept(Id),
	assert(defin1(Id,S)).
put_defin1(_).	

put_defin2(S):-
	readonly_concept("false"),!,
	retractall(defin2(_,_)),
	idconcept(Id),
	assert(defin2(Id,S)).
put_defin2(_).

put_last_cmd(S):-
	retractall(last_cmd(_,_)),
	idconcept(Id),
	assert(last_cmd(Id,S)).

readterm_repeat(_).
readterm_repeat(File):-not(eof(File)),readterm_repeat(File).


