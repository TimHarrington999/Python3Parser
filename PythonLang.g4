grammar PythonLang;

// ########## parser rules ##########
prog : exp* EOF;

exp 
    : assignment 
    | conditional 
    ;

assignment : VARNAME ASSIGNMENT expr;

expr 
    : expr OPERATOR expr
	| INT
    | FLOAT
    | STRING
    | VARNAME
    | BOOL
    | ARRAY;

conditional
    : 'if' conditional_phrase ':\n' block_statements+ ;

condition
    : VARNAME COMPARE ELEM
    | VARNAME COMPARE ELEM COND_OPER conditional_phrase
    ;

conditional_phrase
    : '(' conditional_phrase ')'
    | condition
    ;

block_statements : INDENT exp '\r';

//compare : ('if' | 'else' | 'elif') COMPARE ':';

// ########## lexer rules ##########
INT : '-'?[0-9]+;
FLOAT : '-'?[0-9]+'.'[0-9]+;
VARNAME : [a-zA-Z][a-zA-Z0-9_]*;
STRING : STRING1 | STRING2 ;
STRING1 : '\'' [a-zA-Z0-9 ]* '\'';
STRING2 : '"' [a-zA-Z0-9 ]* '"';
BOOL : 'True' | 'False';

ARRAY : '[' ARR_ELEMENTS? ']';
ARR_ELEMENTS : ARR_ELEM (',' WS* ARR_ELEM)*;
ELEM 
    : INT
    | FLOAT
    | STRING
    | VARNAME
    | BOOL;
ARR_ELEM 
    : ELEM
    | ARRAY;

OPERATOR
    : '+'
    | '-'
    | '*'
    | '%'
    | '/'
    ;

ASSIGNMENT
    : '='
    | '+='
    | '-='
    | '*='
    | '/='
    | '%='
    ;

COMPARE 
    : '>' 
    | '<' 
    | '<=' 
    | '>=' 
    | '==' 
    | '!=' 
    ;

COND_OPER
    : 'and'
    | 'or'
    ;

NEGATION : 'not' ;

//NEWLINE: ('\r'? '\n' | '\r')+;
INDENT: '    ' | [\t] ;

WS: [ \t\r\n]+ -> skip;