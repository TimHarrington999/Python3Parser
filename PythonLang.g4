grammar PythonLang;

prog:	exp EOF;

exp : assignment;

expr: expr ('+'|'-') expr
	| expr ('*') expr
    | expr ('%'|'/') expr
	| INT
    | FLOAT
    | STRING1
    | STRING2
    | VARNAME
    | BOOL
    | ARRAY;

INT:	[0-9]+;
FLOAT: [0-9]+'.'[0-9]+;
VARNAME: [a-zA-Z][a-zA-Z0-9_]*;
STRING1 : '\'' [a-zA-Z0-9]* '\'';
STRING2 : '"' [a-zA-Z0-9]* '"';
BOOL : 'True' | 'False';
ARRAY : '[' ARR_ELEMENTS? ']';
ARR_ELEMENTS : ARR_ELEM (', ' ARR_ELEM | ',' ARR_ELEM)*;
ARR_ELEM : INT
    | FLOAT
    | STRING1
    | STRING2
    | VARNAME
    | BOOL
    | ARRAY;
assignment:	VARNAME '=' expr | VARNAME ('+=' | '-=' | '*=' | '%=' | '/=') expr;

WS:	[ \t\r]+ -> skip;
