% Author:
% Date: 19.12.2009

ifndef iso_prolog
include "russian.pre"

predicates
c1251_unicode(integer, integer)

CLAUSES

elsedef

:-module(russian,[
    c1251_utf/2,
    c_utf_1251/2,
    c1251_utf8/3,
    c_1251_lower_upper/2
]).


enddef


c1251_utf(R, U) :-
ifdef iso_prolog
        current_prolog_flag(windows, Win),
        Win = true,
enddef       
        c1251_unicode(R,U),!.

c1251_utf(R, R) :- !.


c_utf_1251(U, R) :-
ifdef iso_prolog
        current_prolog_flag(windows, Win),
        Win = true,
enddef       
        c1251_unicode(R,U), !.

c_utf_1251(U, U) :- !.


c1251_unicode(192,1040).
c1251_unicode(193,1041).
c1251_unicode(194,1042).
c1251_unicode(195,1043).
c1251_unicode(196,1044).
c1251_unicode(197,1045).
c1251_unicode(198,1046).
c1251_unicode(199,1047).
c1251_unicode(200,1048).
c1251_unicode(201,1049).
c1251_unicode(202,1050).
c1251_unicode(203,1051).
c1251_unicode(204,1052).
c1251_unicode(205,1053).
c1251_unicode(206,1054).
c1251_unicode(207,1055).
c1251_unicode(208,1056).
c1251_unicode(209,1057).
c1251_unicode(210,1058).
c1251_unicode(211,1059).
c1251_unicode(212,1060).
c1251_unicode(213,1061).
c1251_unicode(214,1062).
c1251_unicode(215,1063).
c1251_unicode(216,1064).
c1251_unicode(217,1065).
c1251_unicode(218,1066).
c1251_unicode(219,1067).
c1251_unicode(220,1068).
c1251_unicode(221,1069).
c1251_unicode(222,1070).
c1251_unicode(223,1071).
c1251_unicode(224,1072).
c1251_unicode(225,1073).
c1251_unicode(226,1074).
c1251_unicode(227,1075).
c1251_unicode(228,1076).
c1251_unicode(229,1077).
c1251_unicode(230,1078).
c1251_unicode(231,1079).
c1251_unicode(232,1080).
c1251_unicode(233,1081).
c1251_unicode(234,1082).
c1251_unicode(235,1083).
c1251_unicode(236,1084).
c1251_unicode(237,1085).
c1251_unicode(238,1086).
c1251_unicode(239,1087).
c1251_unicode(240,1088).
c1251_unicode(241,1089).
c1251_unicode(242,1090).
c1251_unicode(243,1091).
c1251_unicode(244,1092).
c1251_unicode(245,1093).
c1251_unicode(246,1094).
c1251_unicode(247,1095).
c1251_unicode(248,1096).
c1251_unicode(249,1097).
c1251_unicode(250,1098).
c1251_unicode(251,1099).
c1251_unicode(252,1100).
c1251_unicode(253,1101).
c1251_unicode(254,1102).
c1251_unicode(255,1103).

c1251_utf8(192, 208, 144). % d090 - d0bf
c1251_utf8(193, 208, 145).
c1251_utf8(194, 208, 146).
c1251_utf8(195, 208, 147).
c1251_utf8(196, 208, 148).
c1251_utf8(197, 208, 149).
c1251_utf8(198, 208, 150).
c1251_utf8(199, 208, 151).
c1251_utf8(200, 208, 152).
c1251_utf8(201, 208, 153).
c1251_utf8(202, 208, 154).
c1251_utf8(203, 208, 155).
c1251_utf8(204, 208, 156).
c1251_utf8(205, 208, 157).
c1251_utf8(206, 208, 158).
c1251_utf8(207, 208, 159).
c1251_utf8(208, 208, 160).
c1251_utf8(209, 208, 161).
c1251_utf8(210, 208, 162).
c1251_utf8(211, 208, 163).
c1251_utf8(212, 208, 164).
c1251_utf8(213, 208, 165).
c1251_utf8(214, 208, 166).
c1251_utf8(215, 208, 167).
c1251_utf8(216, 208, 168).
c1251_utf8(217, 208, 169).
c1251_utf8(218, 208, 170).
c1251_utf8(219, 208, 171).
c1251_utf8(220, 208, 172).
c1251_utf8(221, 208, 173).
c1251_utf8(222, 208, 174).
c1251_utf8(223, 208, 175).
c1251_utf8(224, 208, 176).
c1251_utf8(225, 208, 177).
c1251_utf8(226, 208, 178).
c1251_utf8(227, 208, 179).
c1251_utf8(228, 208, 180).
c1251_utf8(229, 208, 181).
c1251_utf8(230, 208, 182).
c1251_utf8(231, 208, 183).
c1251_utf8(232, 208, 184).
c1251_utf8(233, 208, 185).
c1251_utf8(234, 208, 186).
c1251_utf8(235, 208, 187).
c1251_utf8(236, 208, 188).
c1251_utf8(237, 208, 189).
c1251_utf8(238, 208, 190).
c1251_utf8(239, 208, 191).

% d180 - d18f
c1251_utf8(240, 209, 128).
c1251_utf8(241, 209, 129).
c1251_utf8(242, 209, 130).
c1251_utf8(243, 209, 131).
c1251_utf8(244, 209, 132).
c1251_utf8(245, 209, 133).
c1251_utf8(246, 209, 134).
c1251_utf8(247, 209, 135).
c1251_utf8(248, 209, 136).
c1251_utf8(249, 209, 137).
c1251_utf8(250, 209, 138).
c1251_utf8(251, 209, 139).
c1251_utf8(252, 209, 140).
c1251_utf8(253, 209, 141).
c1251_utf8(254, 209, 142).
c1251_utf8(255, 209, 143).

ifdef iso_prolog

% upper        lower
% 192 -223 <-> 224 - 255
% 168 <-> 184

c_1251_lower_upper(L, U) :-
     U = 168,
     L = 184.

c_1251_lower_upper(L, U) :-
     nonvar(L),
     L >= 224,
     L =< 255,
     !,
     U is L - 32.

c_1251_lower_upper(L, U) :-
     nonvar(U),
     U >= 192,
     U =< 223,
     !,
     L is U + 32.

c_1251_lower_upper(U, U).

enddef