import sys
from io import StringIO
from antlr4 import *
from PythonLangLexer import PythonLangLexer
from PythonIndentationLexer import PythonLexerWithIndentation
from PythonLangParser import PythonLangParser
from antlr4.tree.Trees import Trees

def check_code():
    # s = InputStream(code)
    # OR you can use a FileStream
    
    filepath = 'program_code.txt'
    test_filepath = 'test_code.txt'
    #s = FileStream(filepath)
    s = FileStream(test_filepath)
    
    # regular setup
    """ lexer = PythonLangLexer(s)
    stream = CommonTokenStream(lexer)
    parser = PythonLangParser(stream) """

    # to use new indent and dedent tokens
    lexer = PythonLexerWithIndentation(s)
    stream = CommonTokenStream(lexer)
    parser = PythonLangParser(stream)
	
    tree = parser.prog()
	
    if parser.getNumberOfSyntaxErrors() > 0:
        #print(f"\nfailed:\n{s}")
        print("failed")
    else:
        print("passed")


def main():
    check_code()

if __name__ == "__main__":
    main()
