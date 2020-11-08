%{
#include<stdio.h>

int yyerror(char* s);
extern int yylex(void);

%}

%token IDENTIFIER CONSTANT STRING_LITERAL SIZEOF
%token PTR_OP INC_OP DEC_OP LEFT_OP RIGHT_OP LE_OP GE_OP EQ_OP NE_OP
%token AND_OP OR_OP MUL_ASSIGN DIV_ASSIGN MOD_ASSIGN ADD_ASSIGN
%token SUB_ASSIGN LEFT_ASSIGN RIGHT_ASSIGN AND_ASSIGN
%token XOR_ASSIGN OR_ASSIGN TYPE_NAME
%token OPEN_ROUND_BRACKET CLOSE_ROUND_BRACKET OPEN_SQUARE_BRACKET CLOSE_SQUARE_BRACKET OPEN_BRACKET CLOSE_BRACKET
%token PERIOD COMMA AND MUL ADD SUB NON NEGATE DIV MOD LESSER GREATER XOR OR COND_OP COLON ASSIGN EOI
%token TYPEDEF EXTERN STATIC AUTO REGISTER
%token CHAR SHORT INT LONG SIGNED UNSIGNED FLOAT DOUBLE CONST VOLATILE VOID
%token STRUCT UNION ENUM ELLIPSIS

%token CASE DEFAULT IF ELSE SWITCH WHILE DO FOR GOTO CONTINUE BREAK RETURN

%start translation_unit
%%

primary_expression
	: IDENTIFIER
	| CONSTANT
	| STRING_LITERAL
	| OPEN_ROUND_BRACKET expression CLOSE_ROUND_BRACKET
	;

postfix_expression
	: primary_expression
	| postfix_expression OPEN_SQUARE_BRACKET expression CLOSE_SQUARE_BRACKET
	| postfix_expression OPEN_ROUND_BRACKET CLOSE_ROUND_BRACKET
	| postfix_expression OPEN_ROUND_BRACKET argument_expression_list CLOSE_ROUND_BRACKET
	| postfix_expression PERIOD IDENTIFIER
	| postfix_expression PTR_OP IDENTIFIER
	| postfix_expression INC_OP
	| postfix_expression DEC_OP
	;

argument_expression_list
	: assignment_expression
	| argument_expression_list COMMA assignment_expression
	;

unary_expression
	: postfix_expression
	| INC_OP unary_expression
	| DEC_OP unary_expression
	| unary_operator cast_expression
	| SIZEOF unary_expression
	| SIZEOF OPEN_ROUND_BRACKET type_name CLOSE_ROUND_BRACKET
	;

unary_operator
	: AND
	| MUL
	| ADD
	| SUB
	| NON
	| NEGATE
	;

cast_expression
	: unary_expression
	| OPEN_ROUND_BRACKET type_name CLOSE_ROUND_BRACKET cast_expression
	;

multiplicative_expression
	: cast_expression
	| multiplicative_expression MUL cast_expression
	| multiplicative_expression DIV cast_expression
	| multiplicative_expression MOD cast_expression
	;

additive_expression
	: multiplicative_expression
	| additive_expression ADD multiplicative_expression
	| additive_expression SUB multiplicative_expression
	;

shift_expression
	: additive_expression
	| shift_expression LEFT_OP additive_expression
	| shift_expression RIGHT_OP additive_expression
	;

relational_expression
	: shift_expression
	| relational_expression LESSER shift_expression
	| relational_expression GREATER shift_expression
	| relational_expression LE_OP shift_expression
	| relational_expression GE_OP shift_expression
	;

equality_expression
	: relational_expression
	| equality_expression EQ_OP relational_expression
	| equality_expression NE_OP relational_expression
	;

and_expression
	: equality_expression
	| and_expression AND equality_expression
	;

exclusive_or_expression
	: and_expression
	| exclusive_or_expression XOR and_expression
	;

inclusive_or_expression
	: exclusive_or_expression
	| inclusive_or_expression OR exclusive_or_expression
	;

logical_and_expression
	: inclusive_or_expression
	| logical_and_expression AND_OP inclusive_or_expression
	;

logical_or_expression
	: logical_and_expression
	| logical_or_expression OR_OP logical_and_expression
	;

conditional_expression
	: logical_or_expression
	| logical_or_expression COND_OP expression COLON conditional_expression
	;

assignment_expression
	: conditional_expression
	| unary_expression assignment_operator assignment_expression
	;

assignment_operator
	: ASSIGN
	| MUL_ASSIGN
	| DIV_ASSIGN
	| MOD_ASSIGN
	| ADD_ASSIGN
	| SUB_ASSIGN
	| LEFT_ASSIGN
	| RIGHT_ASSIGN
	| AND_ASSIGN
	| XOR_ASSIGN
	| OR_ASSIGN
	;

expression
	: assignment_expression
	| expression COMMA assignment_expression
	;

constant_expression
	: conditional_expression
	;

declaration
	: declaration_specifiers EOI
	| declaration_specifiers init_declarator_list EOI
	;

declaration_specifiers
	: storage_class_specifier
	| storage_class_specifier declaration_specifiers
	| type_specifier
	| type_specifier declaration_specifiers
	| type_qualifier
	| type_qualifier declaration_specifiers
	;

init_declarator_list
	: init_declarator
	| init_declarator_list COMMA init_declarator
	;

init_declarator
	: declarator
	| declarator ASSIGN initializer
	;

storage_class_specifier
	: TYPEDEF
	| EXTERN
	| STATIC
	| AUTO
	| REGISTER
	;

type_specifier
	: VOID
	| CHAR
	| SHORT
	| INT
	| LONG
	| FLOAT
	| DOUBLE
	| SIGNED
	| UNSIGNED
	| struct_or_union_specifier
	| enum_specifier
	| TYPE_NAME
	;

struct_or_union_specifier
	: struct_or_union IDENTIFIER OPEN_BRACKET struct_declaration_list CLOSE_BRACKET
	| struct_or_union OPEN_BRACKET struct_declaration_list CLOSE_BRACKET
	| struct_or_union IDENTIFIER
	;

struct_or_union
	: STRUCT
	| UNION
	;

struct_declaration_list
	: struct_declaration
	| struct_declaration_list struct_declaration
	;

struct_declaration
	: specifier_qualifier_list struct_declarator_list EOI
	;

specifier_qualifier_list
	: type_specifier specifier_qualifier_list
	| type_specifier
	| type_qualifier specifier_qualifier_list
	| type_qualifier
	;

struct_declarator_list
	: struct_declarator
	| struct_declarator_list COMMA struct_declarator
	;

struct_declarator
	: declarator
	| COLON constant_expression
	| declarator COLON constant_expression
	;

enum_specifier
	: ENUM OPEN_BRACKET enumerator_list CLOSE_BRACKET
	| ENUM IDENTIFIER OPEN_BRACKET enumerator_list CLOSE_BRACKET
	| ENUM IDENTIFIER
	;

enumerator_list
	: enumerator
	| enumerator_list COMMA enumerator
	;

enumerator
	: IDENTIFIER
	| IDENTIFIER ASSIGN constant_expression
	;

type_qualifier
	: CONST
	| VOLATILE
	;

declarator
	: pointer direct_declarator
	| direct_declarator
	;

direct_declarator
	: IDENTIFIER
	| OPEN_ROUND_BRACKET declarator CLOSE_ROUND_BRACKET
	| direct_declarator OPEN_SQUARE_BRACKET constant_expression CLOSE_SQUARE_BRACKET
	| direct_declarator OPEN_SQUARE_BRACKET CLOSE_SQUARE_BRACKET
	| direct_declarator OPEN_ROUND_BRACKET parameter_type_list CLOSE_ROUND_BRACKET
	| direct_declarator OPEN_ROUND_BRACKET identifier_list CLOSE_ROUND_BRACKET
	| direct_declarator OPEN_ROUND_BRACKET CLOSE_ROUND_BRACKET
	;

pointer
	: MUL
	| MUL type_qualifier_list
	| MUL pointer
	| MUL type_qualifier_list pointer
	;

type_qualifier_list
	: type_qualifier
	| type_qualifier_list type_qualifier
	;


parameter_type_list
	: parameter_list
	| parameter_list COMMA ELLIPSIS
	;

parameter_list
	: parameter_declaration
	| parameter_list COMMA parameter_declaration
	;

parameter_declaration
	: declaration_specifiers declarator
	| declaration_specifiers abstract_declarator
	| declaration_specifiers
	;

identifier_list
	: IDENTIFIER
	| identifier_list COMMA IDENTIFIER
	;

type_name
	: specifier_qualifier_list
	| specifier_qualifier_list abstract_declarator
	;

abstract_declarator
	: pointer
	| direct_abstract_declarator
	| pointer direct_abstract_declarator
	;

direct_abstract_declarator
	: OPEN_ROUND_BRACKET abstract_declarator CLOSE_ROUND_BRACKET
	| OPEN_SQUARE_BRACKET CLOSE_SQUARE_BRACKET
	| OPEN_SQUARE_BRACKET constant_expression CLOSE_SQUARE_BRACKET
	| direct_abstract_declarator OPEN_SQUARE_BRACKET CLOSE_SQUARE_BRACKET
	| direct_abstract_declarator OPEN_SQUARE_BRACKET constant_expression CLOSE_SQUARE_BRACKET
	| OPEN_ROUND_BRACKET CLOSE_ROUND_BRACKET
	| OPEN_ROUND_BRACKET parameter_type_list CLOSE_ROUND_BRACKET
	| direct_abstract_declarator OPEN_ROUND_BRACKET CLOSE_ROUND_BRACKET
	| direct_abstract_declarator OPEN_ROUND_BRACKET parameter_type_list CLOSE_ROUND_BRACKET
	;

initializer
	: assignment_expression
	| OPEN_BRACKET initializer_list CLOSE_BRACKET
	| OPEN_BRACKET initializer_list COMMA CLOSE_BRACKET
	;

initializer_list
	: initializer
	| initializer_list COMMA initializer
	;

statement
	: labeled_statement
	| compound_statement
	| expression_statement
	| selection_statement
	| iteration_statement
	| jump_statement
	;

labeled_statement
	: IDENTIFIER COLON statement
	| CASE constant_expression COLON statement
	| DEFAULT COLON statement
	;

compound_statement
	: OPEN_BRACKET CLOSE_BRACKET
	| OPEN_BRACKET statement_list CLOSE_BRACKET
	| OPEN_BRACKET declaration_list CLOSE_BRACKET
	| OPEN_BRACKET declaration_list statement_list CLOSE_BRACKET
	;

declaration_list
	: declaration
	| declaration_list declaration
	;

statement_list
	: statement
	| statement_list statement
	;

expression_statement
	: EOI
	| expression EOI
	;

selection_statement
	: IF OPEN_ROUND_BRACKET expression CLOSE_ROUND_BRACKET statement
	| IF OPEN_ROUND_BRACKET expression CLOSE_ROUND_BRACKET statement ELSE statement
	| SWITCH OPEN_ROUND_BRACKET expression CLOSE_ROUND_BRACKET statement
	;

iteration_statement
	: WHILE OPEN_ROUND_BRACKET expression CLOSE_ROUND_BRACKET statement
	| DO statement WHILE OPEN_ROUND_BRACKET expression CLOSE_ROUND_BRACKET EOI
	| FOR OPEN_ROUND_BRACKET expression_statement expression_statement CLOSE_ROUND_BRACKET statement
	| FOR OPEN_ROUND_BRACKET expression_statement expression_statement expression CLOSE_ROUND_BRACKET statement
	;

jump_statement
	: GOTO IDENTIFIER EOI
	| CONTINUE EOI
	| BREAK EOI
	| RETURN EOI
	| RETURN expression EOI
	;

translation_unit
	: external_declaration
	| translation_unit external_declaration
	;

external_declaration
	: function_definition
	| declaration
	;

function_definition
	: declaration_specifiers declarator declaration_list compound_statement
	| declaration_specifiers declarator compound_statement
	| declarator declaration_list compound_statement
	| declarator compound_statement
	;

%%
#include <stdio.h>

extern char yytext[];
extern int column;

yyerror(s)
char *s;
{
	fflush(stdout);
	printf("\n%*s\n%*s\n", column, "^", column, s);
}