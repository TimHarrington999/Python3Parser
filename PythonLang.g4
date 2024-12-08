grammar PythonLang;




// ########## parser rules ##########
prog : (NEWLINE*) prog_block;

prog_block : (exp NEWLINE+)* exp EOF
    | (exp NEWLINE+)* EOF
    | exp EOF
    | EOF
    ;

exp  : assignment
    | conditional
    | loop
    ;

assignment : VARNAME ASSIGNMENT expr;

expr  : expr OPERATOR expr
	| INT
    | FLOAT
    | STRING
    | VARNAME
    | BOOL
    | ARRAY;

conditional : 'if' conditional_phrase (CONDOR conditional_phrase)* ':' block_statements* 
    ((NEWLINE)'elif' conditional_phrase (CONDOR conditional_phrase)* ':' block_statements*)*
    ((NEWLINE)'else' ':' block_statements*)?;

loop : 'while' conditional_phrase (CONDOR conditional_phrase)* ':' (block_statements)* 
    | 'for' VARNAME 'in' ( 'range(' (VARNAME | INT | TUPLE) ')' | (VARNAME | ARRAY) ) ':' (block_statements)*;




condition : ( expr COMPARE expr) | BOOL | expr;

conditional_phrase : '(' NEGATION? condition ')'
    | NEGATION? condition
    ;

block_statements : (NEWLINE)+ INDENT exp?;


//compare : ('if' | 'else' | 'elif') COMPARE ':';

// ########## lexer rules ##########
NEGATION : 'not' ;
CONDOR : 'and' | 'or';
INT : '-'?[0-9]+;
FLOAT : '-'?[0-9]+'.'[0-9]+;
BOOL : 'True' | 'False';
STRING : STRING1 | STRING2 ;
STRING1 : '\'' (~'\'')* '\'';
STRING2 : '"' (~'"')* '"';
VARNAME : [a-zA-Z][a-zA-Z0-9_]*;
TUPLE : [0-9]+','[0-9]+;

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

// new indent and dedent tokens to be used with the custom lexer
//INDENT: 'INDENT';
//DEDENT: 'DEDENT';


COMMENT
    : ('#' ~[\r\n]* 
    | '\'\'\''( . | '\r' | '\n' )*?'\'\'\'') -> skip
    ;

WS: [ ]+ -> skip;
