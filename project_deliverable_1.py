import sys
from io import StringIO
from antlr4 import *
from PythonLangLexer import PythonLangLexer
from PythonLangParser import PythonLangParser
from antlr4.tree.Trees import Trees

# following tuples are to test the features of the python parser
# TODO: At some point we will probably need to have some more in-depth tests beyond
#   a set of one-liners, preferably imitating possible python3 programs
assign_1 = ( [
'assign1 = "20"',
'assign2 = 123',
'assign3 = 1.23',
'assign4 = assign1'
], "assignment")

arith_1 = ( [
'arith_op1 = 1 + 2',
'arith_op2 = 13 - 3',
'arith_op3 = 10 / arith_op1',
'arith_op4 = 4.2 * 10',
"arith_op5 = arith_op1 % arith_op2"
], "arithmetic 1")

arith_2 = ( [
'arith_op1 += arith_op2',
'arith_op2 -= arith_op3',
'arith_op3 *= arith_op4',
'arith_op4 /= arith_op5'
], "arithmetic 2")

array_1 = ( [
"array1 = [1, 2, 3, 4, 5]",
"array2 = ['a', 'b', 'c']",
"array3 = [1.6, 2.7, 3.8, 4.9, 5.0]"
], "array 1")

var_1 = ( [
'var1 = 10',
'var2 = var1/2 + 5',
'var3 = var2 % 2',
'var4 = 1'
], "variable 1")

bool = ( ['flag = True'], "bool")

test_groups = [assign_1, arith_1, arith_2, array_1, var_1, bool]

def check_code(code):
    s = InputStream(code)
    # OR you can use a FileStream
    '''
    s = FileStream(filepath)
    '''

    lexer = PythonLangLexer(s)
    stream = CommonTokenStream(lexer)
    parser = PythonLangParser(stream)
	
    tree = parser.prog()
	
    if parser.getNumberOfSyntaxErrors() > 0:
        print(f"failed {code}")
    else:
        print("passed")

def main():
    """ for assign in bool:
        print(assign+"\n")
        check_code(assign) """
    
    for suite in test_groups:
        print("Test suite: "+suite[1])
        for test in suite[0]:
            check_code(test)
        print(". . . complete\n")

main()
