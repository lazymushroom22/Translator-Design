// CLexer.cpp : This file contains the 'main' function. Program execution begins and ends there.
//
#include <stdio.h>
#include "globals.h"
#include <errno.h>
extern FILE* yyin;
extern int yylex(void);
extern int yydebug;
const char* lexUnits[] = {

							"AUTO",
							"BREAK",
							"CASE",
							"CHAR",
							"CONST",
							"CONTINUE",
							"DEFAULT",
							"DO",
							"DOUBLE",
							"ELSE",
							"ENUM",
							"EXTERN",
							"FLOAT",
							"FOR",
							"GOTO",
							"IF",
							"INT",
							"LONG",
							"REGISTER",
							"RETURN",
							"SHORT",
							"SIGNED",
							"SIZEOF",
							"STATIC",
							"STRUCT",
							"SWITCH",
							"TYPEDEF",
							"UNION",
							"UNSIGNED",
							"VOID",
							"VOLATILE",
							"WHILE",
							"CONSTANT",
							"STRING_LITERAL",
							"ELLIPSIS",
							"RIGHT_ASSIGN",
							"LEFT_ASSIGN",
							"ADD_ASSIGN",
							"SUB_ASSIGN",
							"MUL_ASSIGN",
							"DIV_ASSIGN",
							"MOD_ASSIGN",
							"AND_ASSIGN",
							"XOR_ASSIGN",
							"OR_ASSIGN",
							"RIGHT_OP",
							"LEFT_OP",
							"INC_OP",
							"DEC_OP",
							"PTR_OP",
							"AND_OP",
							"OR_OP",
							"LE_OP",
							"GE_OP",
							"EQ_OP",
							"NE_OP",
							"EOI",
							"OPEN_BRACKET",
							"CLOSE_BRACKET",
							"COMMA",
							"COLON",
							"ASSIGN",
							"OPEN_ROUND_BRACKET",
							"CLOSE_ROUND_BRACKET",
							"OPEN_SQUARE_BRACKET",
							"CLOSE_SQUARE_BRACKET",
							"PERIOD",
							"AND",
							"NEGATE",
							"NON",
							"SUB",
							"ADD",
							"MUL",
							"DIV",
							"MOD",
							"LESSER",
							"GREATER",
							"XOR",
							"OR",
							"IDENTIFIER",
							"TYPE_NAME",
							"COND_OP"};

							int main()
							{
								/* int tokenValue = 0;
								yyin = fopen("input.csrc", "rt");

								if (yyin != NULL)
								{
									while ((tokenValue = yylex()) != 0)
									{
										printf(" -> TOKEN ID: %d; TOKEN VALUE %s", tokenValue, lexUnits[tokenValue]);
									}
								}
								else
								{
									printf("Fisierul de input nu poate fi deschis. Eroare: %d", errno);
								}

								*/
								yydebug = 1;
								yyin = fopen("input.csrc", "rt");
								if (yyin != NULL)
								{
									int result = yyparse();
									switch (result)
									{
									case 0:
										printf("Parse successful. \n");
										break;

									case 1:
										printf("Invalid input encountered. \n");
										break;

									case 2:
										printf("Out of memory. \n");
										break;

									default:
										break;
									}
									fclose(yyin);
								}
								else
								{
									printf("Fisierul de input nu poate fi deschis. Eroare: %d", errno);
								}	
							}