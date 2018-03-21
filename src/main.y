%{
/*
NOME: GUILHERME DE BRITO ABREU
RA: 173691
DISCIPLINA: EA876

DESCRICAO: Esta aplicacao implementa um pequeno parser de listas de Python.
O programa receberá uma linha contendo uma lista, em notação Python, e deverá ser capaz de identificar se é uma lista válida ou se a sintaxe está incorreta.
Caso seja uma lista válida, o programa deverá imprimir OK\n na tela. Caso seja inválida, deverá imprimir ERRO\n.
*/

#include <stdio.h>
#include <stdlib.h>

void yyerror(char *c);
int yylex(void);

%}

%token inteiro palavra string virgula abre fecha EOL

%%

linha:
  list EOL { 
    printf("OK\n");
    exit(1);
  };

list:
  abre conteudo fecha;

conteudo:
  element;
  | ;

element:
  inteiro;
  | palavra;
  | string;
  | list;
  | element virgula element;

%%

void yyerror(char *s) {
  printf("ERRO\n");
}

int main() {
  yyparse();
  return 0;
}
