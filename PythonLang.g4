grammar PythonLang;

prog:	exp EOF;

exp : assignment;

expr: expr ('+'|'-') expr
	| expr ('*'|'/') expr
	| INT
    | FLOAT
    | STRING1
    | STRING2
    | VARNAME;

INT:	[0-9]+;
FLOAT: [0-9]+'.'[0-9]+;
VARNAME: [a-zA-Z][a-zA-Z0-9]*;
STRING1 : '\'' [a-zA-Z0-9]* '\'';
STRING2 : '"' [a-zA-Z0-9]* '"';
assignment:	VARNAME '=' expr;

WS:	[ \t\r]+ -> skip;