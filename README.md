# Python3Parser

Team Name: Quarter Code

Team Members:
  - Timothy Harrington
  - Brody Pfingsten

Software Requirements:
  - Python3
  - ANTLR4 (Specifically 4.7.2)
  - pip
  - pip package: antlr4-python3-runtime (4.7.2)

Setup:
Of course, you'll need to have Python installed, specifically Python3. Additionally, you'll need to install ANTLR. Here's how:
  <!-- 1: Install the ANTLR Jar file - https://www.antlr.org/download/antlr-4.13.2-complete.jar
  2: Place the jar file where you usually place java libraries, may be different than examples shown below:
    - Linux: /usr/local/lib
    - Windows: C:\Program Files\Java\libs
  3: Add ANTLR to your CLASSPATH with the following terminal command:
    - export CLASSPATH=".:/usr/local/lib/antlr-4. -->
  4: If you don't have pip installed, install it with:
    - sudo apt install pip
  5: Next run this command:
    - pip install antlr4-python3-runtime==4.7.2
  6: If the previous command fails, then go to the following link and download the file manually and place it where pip installs python packages.
    - Link: https://pypi.org/project/antlr4-python3-runtime/4.7.2/#files
  7: At this point you should be ready to begin using ANTLR!

Running:
Once ANTLR is setup and necessary python packages installed, we are ready to run the parser. All you need to do is use the command 'antlr4' to generate a lexer and a parser from a .g4 file. The lexer and parser files are what the parser code uses to use the grammar. Simply run this:
  antlr4 -Dlanguage=Python3 PythonLang.g4
Followed by this to execute the parser code:
  python3 project_deliverable_3.py
Anytime an edit is made to the .g4 file, the lexer and parser files need to be regenerated to reflect those changes.