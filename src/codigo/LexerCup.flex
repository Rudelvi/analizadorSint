
package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }

    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

integer {return new Symbol (sym.Integer, yychar, yyline, yytext() );}
long {return new Symbol (sym.Long, yychar, yyline, yytext() );}
double {return new Symbol (sym.Double, yychar, yyline, yytext() );}
float {return new Symbol (sym.Float, yychar, yyline, yytext() );}
if {return new Symbol (sym.If, yychar, yyline, yytext() );}
else {return new Symbol (sym.Else, yychar, yyline, yytext() );}
private {return new Symbol (sym.Private, yychar, yyline, yytext() );}
protected {return new Symbol (sym.Protected, yychar, yyline, yytext() );}
for {return new Symbol (sym.For, yychar, yyline, yytext() );}
( byte | int | char | long | float | double ) {return new Symbol(sym.T_dato, yychar, yyline, yytext());}
while {return new Symbol (sym.While, yychar, yyline, yytext() );}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return new Symbol (sym.Igual, yychar, yyline, yytext() );}
"+" {return new Symbol (sym.Suma, yychar, yyline, yytext() );}
"-" {return new Symbol (sym.Resta, yychar, yyline, yytext() );}
"*" {return new Symbol (sym.Multiplicacion, yychar, yyline, yytext() );}
"/" {return new Symbol (sym.Division, yychar, yyline, yytext() );}
"(" {return new Symbol (sym.Parentesis_a, yychar, yyline, yytext() );}
")" {return new Symbol (sym.Parentesis_c, yychar, yyline, yytext() );}
"{" {return new Symbol (sym.Llave_a, yychar, yyline, yytext() );}
"}" {return new Symbol (sym.Llave_c, yychar, yyline, yytext() );}
"main" {return new Symbol (sym.Main, yychar, yyline, yytext() );}
";" {return new Symbol (sym.P_coma, yychar, yyline, yytext() );}
{L}({L}|{D})* {return new Symbol (sym.Identificador, yychar, yyline, yytext() );}
("(-"{D}+")")|{D}+ {return new Symbol (sym.Numero, yychar, yyline, yytext() );}
 . {return new Symbol (sym.ERROR, yychar, yyline, yytext() );}