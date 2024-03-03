grammar Lab3Task;

stmnt 	:(decl|ifstmt|while|assignment|forloop)+;
decl 	:   datatype;
datatype : INT ID EQUAL NUM SEMI |DOUBLE ID EQUAL (FLOAT|NUM) SEMI 
   |INT ID EQUAL (NUM|ID) CHAR (NUM|ID) mul2* SEMI
   |DOUBLE ID EQUAL (NUM|FLOAT|ID) CHAR (NUM|FLOAT|ID) mul2* SEMI
   | (DOUBLE|INT) ID mul* SEMI;

assignment 
	:	ID (EQUAL|INCREAMENT) (ID|NUM|FLOAT)* mul2*SEMI*;
ifstmt 	:  (if+|ifelse+); 
if 	:  IF '(' cond ')' '{' (if+|decl+|assignment+|ifelse+)'}'; 
ifelse	:  IF '(' cond ')' '{' stmnt+'}' 'else' '{'(decl+|assignment+)'}';
while 	:  WHILE '(' (cond|ifstmt+) ')''{' stmnt+'}';
cond 	:  (ID|FLOAT|NUM) IFOP (FLOAT|ID|NUM);
mul : ',' ID;
mul2:  CHAR (ID|NUM|FLOAT);
forloop :	FOR'('(INT ID EQUAL NUM) SEMI (condition) SEMI assignment ')' '{' stmnt+ '}';
condition 
	:	ID IFOP NUM;
//nested if statements 
//ifmul 	:   IF '(' (ID|FLOAT|NUM) IFOP (FLOAT|ID|NUM) ')' '{' decl '}';
INCREAMENT 
	:	'+=' | '-='| '++' | '--';
FOR 	:	'for';
EQUAL   : '=';
CHAR 	:'+'|'-'|'*'|'/'|'+='|'-=';
WHILE 	:	'while';
IFOP    : '<'|'>'|'=='|'='|'!=';
IF 	: 'if';
INT     :'int';
DOUBLE	:'double';
ID     	: 'a'..'z'+|'A'..'Z'+;
NUM     : '0'..'9'+;
FLOAT   : NUM '.' NUM|NUM;
SEMI    : ';';

WS 	:	(' '|'\n'|'\r'|'\t')+{skip();};
