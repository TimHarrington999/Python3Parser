grammar PythonLang;

// ########## parser rules ##########
prog : (NEWLINE*) (exp NEWLINE+)* EOF;

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

conditional : 'if' conditional_phrase (('and'| 'or') conditional_phrase)* ':' block_statements* 
    ((NEWLINE)'elif' conditional_phrase (('and'| 'or') conditional_phrase)* ':' block_statements*)*
    ((NEWLINE)'else' ':' block_statements*)?;

condition : ( expr COMPARE expr) | BOOL | expr;

conditional_phrase : '(' NEGATION? condition ')'
    | NEGATION? condition
    ;

block_statements : (NEWLINE)+ INDENT exp;

//compare : ('if' | 'else' | 'elif') COMPARE ':';

// ########## lexer rules ##########
NEGATION : 'not' ;
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

NEWLINE: ('\r'? '\n' | '\r')+;
INDENT: '    ' | [\t] ;

WS: [ \r]+ -> skip;
