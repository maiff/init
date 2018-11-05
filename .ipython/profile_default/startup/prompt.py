# encoding: utf-8
from IPython.terminal.prompts import Prompts, Token
import os

class MyPrompts(Prompts):
    def in_prompt_tokens(self, cli=None):
        return [
            (Token, ' '),
            (Token.Prompt , os.getcwd().split('/')[-2]),
            (Token, '/'),
            (Token.Prompt , os.getcwd().split('/')[-1]),
            (Token, ' '),
            (Token.PromptNum, str(self.shell.execution_count)),
            (Token.Prompt, u'│ '),
        ]
    
    def continuation_prompt_tokens(self, cli=None, width=None):
        if width is None:
            width = self._width()
        return [
            (Token.Prompt, (' ' * (width - 2)) + u'│ '),
        ]

    def out_prompt_tokens(self):
        return [
            (Token, ' '),
            (Token.OutPromptNum, str(self.shell.execution_count)),
            (Token.OutPrompt, '> '),
        ]

ip = get_ipython()
if getattr(ip, 'pt_cli'):
    ip.prompts = MyPrompts(ip)
