from antlr4 import Lexer, InputStream
from antlr4.Token import CommonToken

class PythonLexerWithIndentation(Lexer):
    def __init__(self, input_stream: InputStream):
        super().__init__(input_stream)
        self.indent_stack = [0] # for tracking indentation level

    def emitIndentDedent(self, new_indent_level):
        current_indent_level = self.indent_stack[-1]
        if new_indent_level > current_indent_level:
            self.indent_stack.append(new_indent_level)
            return CommonToken(self.INDENT, "INDENT")
        elif new_indent_level < current_indent_level:
            self.indent_stack.pop()
            return CommonToken(self.DEDENT, "DEDENT")
        return None
    
    def nextToken(self):
        token = super().nextToken()
        if token.type == self.NEWLINE:
            indent_count = 0
            while self._input.LA(1) == ' ':
                self._input.consume()
                indent_count += 1

            indent_token = self.emitIndentDedent(indent_count)
            if indent_token:
                return indent_token
            
        return token