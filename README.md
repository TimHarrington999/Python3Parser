# Python3Parser

## Team Name: Quarter Code

### Team Members:
  - Timothy Harrington
  - Brody Pfingsten

## Software Requirements:
  - Python3
  - ANTLR4 (4.13.2)
  - pip
  - pip package: antlr4-python3-runtime (4.13.2)

## Setup:
Of course, you'll need to have Python installed, specifically Python3. Additionally, you'll need to install ANTLR. Here's how:
- 1: Install the ANTLR Jar file - https://www.antlr.org/download/antlr-4.13.2-complete.jar
- 2: Place the jar file where you usually place java libraries, may be different than examples shown below:
   - Linux: /usr/local/lib
   - Windows: C:\Program Files\Java\libs
- 3: Add ANTLR to your CLASSPATH with the following terminal command:
   - export CLASSPATH=".:/usr/local/lib/antlr-4.13.2-complete.jar:$CLASSPATH"
- 4: Create two aliases to make generating the lexer and parser files easier as well as using antlr itself.
   - alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.13.2-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
   - alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.13.2-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'
- 5: Next we're going to configure antlr to use with Python. If you don't already have pip installed, install it with:
   - sudo apt install pip
- 6: Next run this command to install the antlr python runtime package:
   - pip install antlr4-python3-runtime==4.13.2
- 7: If the previous command fails, then go to the following link and download the file manually and place it where pip installs python packages.
   - Link: https://pypi.org/project/antlr4-python3-runtime/#files
- 8: At this point you should be ready to begin using ANTLR! If you weren't able to download the latest version of antlr for whatever reason, that is okay as long the python runtime package is the same version.

## Running:
Once ANTLR is setup and necessary python packages installed, we are ready to run the parser. All you need to do is use the command 'antlr4' to generate a lexer and a parser from a .g4 file. The lexer and parser files are what the parser code uses to use the grammar. The first command generates the lexer and parser files. After you import those files into you Python file, you simply run your Python file as you would normally such as the second command.
 - antlr4 -Dlanguage=Python3 PythonLang.g4
 - python3 project_deliverable_3.py
Anytime an edit is made to the .g4 file, the lexer and parser files need to be regenerated with the antlr4 command above to reflect those changes.


Here is a video of the project running : https://youtu.be/PHPbyVQjbjY
