grammar g2027056;

datatype : INT ID EQUAL NUM SEMI |DOUBLE ID EQUAL (FLOAT|NUM) SEMI 
   |INT ID EQUAL (NUM|ID) CHAR (NUM|ID) mul2* SEMI
   |DOUBLE ID EQUAL (NUM|FLOAT|ID) CHAR (NUM|FLOAT|ID) mul2* SEMI
   | (DOUBLE|INT)  ID ',' ID mul* SEMI
;
mul : ',' ID;
mul2:  CHAR (ID|NUM|FLOAT);
decl 	:   datatype;
if 	:  IF '(' (ID|FLOAT|NUM) IFOP (FLOAT|ID|NUM) ')' '{' (if*|ifelse*|decl)'}'; 
ifelse	:  IF '(' (ID|FLOAT|NUM) IFOP (ID|FLOAT|NUM) ')' '{' (if*|ifelse*|decl)'}' 'else' '{'decl'}'; 
//nested if statements 
//ifmul 	:   IF '(' (ID|FLOAT|NUM) IFOP (FLOAT|ID|NUM) ')' '{' decl '}';
EQUAL   : '=';
CHAR 	:'+'|'-'|'*'|'/';
IFOP    : '<'|'>'|'='|;
IF 	: 'if';
INT     :'int';
DOUBLE	:'double';
ID     	:'a'..'z'*;
NUM     : '0'..'9'*;
FLOAT   : NUM '.' NUM|NUM;
SEMI    : ';';

WS 	:	(' '|'\n'|'\r'|'\t')+{skip();};