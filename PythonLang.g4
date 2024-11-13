grammar PythonLang;

// ########## parser rules ##########
prog : exp* EOF;

exp  : assignment
    | conditional
    ;

assignment : VARNAME ASSIGNMENT expr;

expr  : expr OPERATOR expr
	| INT
    | FLOAT
    | STRING
    | VARNAME
    | BOOL
    | ARRAY;

conditional : 'if' conditional_phrase ':' block_statements* 
    ( 'elif' conditional_phrase ':' block_statements*)*
    ('else' ':' block_statements*)?;

condition : (expr COMPARE expr);

conditional_phrase : '(' condition ')' (COND_OPER conditional_phrase)*
    | condition (COND_OPER conditional_phrase)*
    ;

block_statements : INDENT exp;

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
ELEM : INT
    | FLOAT
    | STRING
    | VARNAME
    | BOOL;
ARR_ELEM : ELEM
    | ARRAY;

OPERATOR : '+'
    | '-'
    | '*'
    | '%'
    | '/'
    ;

ASSIGNMENT : '='
    | '+='
    | '-='
    | '*='
    | '/='
    | '%='
    ;

COMPARE : '>' 
    | '<' 
    | '<=' 
    | '>=' 
    | '==' 
    | '!=' 
    ;

COND_OPER : 'and'
    | 'or'
    ;

NEGATION : 'not' ;

//NEWLINE: ('\r'? '\n' | '\r')+;
INDENT: '    ' | [\t] ;

WS: [ \r\t\n]+ -> skip;
