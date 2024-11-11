%{
// Reconhecedor de uma linguagem simplificada
#include <iostream>
#include <string>
#include "tokens.h"
using std::cout;
using std::string;
%}

%option noyywrap
delim       [ \t\n]
brancos     {delim}+
letra       [A-Za-z]
digito      [0-9]
id          ({letra}|_)(({letra}|{digito}|_)*) 
num         {digito}+(\.{digito}+)?(E[+-]?{digito}+)?
STRING      \"([^\\\"]|\\[\\\"])*\"

%% 
{brancos}   ; // nenhuma ação e nenhum retorno
if          return IF; 
then        return THEN; 
else        return ELSE;
while       return WHILE;
{id}        return ID;  
{num}       return NUM;
"=="        return RELOP;
"!="        return RELOP;
"<"         return RELOP;
"<="        return RELOP;
">"         return RELOP;
">="        return RELOP;

{STRING} {
    // Remove aspas e processa as barras invertidas para o valor léxico
    std::string lexeme = yytext;
    lexeme = lexeme.substr(1, lexeme.size() - 2);  // Remove aspas

    // Processa o valor, removendo caracteres de escape
    std::string processed_lexeme;
    for (size_t i = 0; i < lexeme.size(); ++i) {
        if (lexeme[i] == '\\' && i + 1 < lexeme.size()) {
            switch (lexeme[i + 1]) {
                case '\\': processed_lexeme += '\\'; ++i; break;
                case '\"': processed_lexeme += '\"'; ++i; break;
                default: processed_lexeme += lexeme[i];
            }
        } else {
            processed_lexeme += lexeme[i];
        }
    }

    std::cout << "STRING: " << processed_lexeme << std::endl; // Exibe o valor do token
    return STRING;
}


.           cout << yytext << " é um token inválido!\n"; 
%%

