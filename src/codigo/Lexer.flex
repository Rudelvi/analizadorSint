package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%

integer {lexeme=yytext(); return Integer;}
long {lexeme=yytext(); return Long;}
double {lexeme=yytext(); return Double;}
float {lexeme=yytext(); return Float;}
if {lexeme=yytext(); return If;}
else {lexeme=yytext(); return Else;}
private {lexeme=yytext(); return Private;}
protected {lexeme=yytext(); return Protected;}
( byte | int | char | long | float | double ) {lexeme=yytext(); return T_dato;}
for {lexeme=yytext(); return For;}
while {lexeme=yytext(); return While;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"\n" {return Linea;}
"=" {return Igual;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
"(" {lexeme=yytext(); return Parentesis_a;}
")" {lexeme=yytext(); return Parentesis_c;}
"{" {lexeme=yytext(); return Llave_a;}
"}" {lexeme=yytext(); return Llave_c;}
"main" {lexeme=yytext(); return Main;}
";" {lexeme=yytext(); return P_coma;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}