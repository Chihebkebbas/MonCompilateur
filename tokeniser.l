%{
// This is our Lexical tokeniser 
// It should be compiled into cpp with :
// flex++ -d -otokeniser.cpp tokeniser.l 
// And then compiled into object with
// g++ -c tokeniser.cpp
// tokens can be read using lexer->yylex()
// lexer->yylex() returns the type of the lexicon entry (see enum TOKEN in tokeniser.h)
// and lexer->YYText() returns the lexicon entry as a string

#include "tokeniser.h"
#include <iostream>

using namespace std;

%}

%option noyywrap
%option c++
%option yylineno

charconst	\'\\?.\'
ws      [ \t\n\r]+
alpha   [A-Za-z]
digit   [0-9]
number  {digit}+(\.{digit}+)?
keyword	(DISPLAY|IF|THEN|ELSE|BEGIN|END|FOR|TO|DOWNTO|WHILE|DO|VAR|INTEGER|BOOLEAN|CHAR|DOUBLE)
id	{alpha}({alpha}|{digit})*
addop	(\+|\-|\|\|)
mulop	(\*|\/|%|\&\&)
relop	(\<|\>|"=="|\<=|\>=|!=)
unknown [^\"A-Za-z0-9 \n\r\t\(\)\<\>\=\!\%\&\|\}\-\;\.]+
keyword (DISPLAY|IF|THEN|ELSE|BEGIN|END|FOR|TO|DOWNTO|WHILE|DO|VAR|INTEGER|BOOLEAN|CHAR|DOUBLE|CASE|OF)  // + CASE/OF


%%
{addop}     return ADDOP;
{mulop}     return MULOP;
{relop}     return RELOP;
{number}    return NUMBER;
{keyword}   return KEYWORD;
{id}        return ID;
{charconst} return CHARCONST;
"["         return RBRACKET;
"]"         return LBRACKET;
","         return COMMA;
";"         return SEMICOLON;
"."         return DOT;
":"         return COLON;
":="        return ASSIGN;
"("         return RPARENT;
")"         return LPARENT;
"!"         return NOT;
<<EOF>>     return FEOF;
{ws}    {/* skip blanks and tabs */};
"(*"    { /* Skip comments between '(*' and '*)' */
		int c;
		while((c = yyinput()) != 0){
     			if(c == '*'){
     	    			if((c = yyinput()) == ')')
    	        			break;
    	     			else
  	          			unput(c);
  	   		}	
		}
	};

{unknown}	return UNKNOWN;

%%

