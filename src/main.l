%{
/*
Este programa tem como objetivo identificar os tokens que representam interios, palavras e strings.
*/

#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"
%}

inteiro [0-9]+
palavra [A-Za-z]+
string \"{palavra}\"

%%

{inteiro} { return inteiro; }
{string} { return string; }
{palavra} { return palavra; }

[,] { return virgula; }

[\n] { return EOL;}

[\[]  { return abre; }

[\]]  { return fecha; }

[\t ] ;

%%

int yywrap() {
  return 1;
}
