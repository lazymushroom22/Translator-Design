/* A Bison parser, made by GNU Bison 3.7.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_C_TAB_H_INCLUDED
# define YY_YY_C_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    IDENTIFIER = 258,              /* IDENTIFIER  */
    CONSTANT = 259,                /* CONSTANT  */
    STRING_LITERAL = 260,          /* STRING_LITERAL  */
    SIZEOF = 261,                  /* SIZEOF  */
    PTR_OP = 262,                  /* PTR_OP  */
    INC_OP = 263,                  /* INC_OP  */
    DEC_OP = 264,                  /* DEC_OP  */
    LEFT_OP = 265,                 /* LEFT_OP  */
    RIGHT_OP = 266,                /* RIGHT_OP  */
    LE_OP = 267,                   /* LE_OP  */
    GE_OP = 268,                   /* GE_OP  */
    EQ_OP = 269,                   /* EQ_OP  */
    NE_OP = 270,                   /* NE_OP  */
    AND_OP = 271,                  /* AND_OP  */
    OR_OP = 272,                   /* OR_OP  */
    MUL_ASSIGN = 273,              /* MUL_ASSIGN  */
    DIV_ASSIGN = 274,              /* DIV_ASSIGN  */
    MOD_ASSIGN = 275,              /* MOD_ASSIGN  */
    ADD_ASSIGN = 276,              /* ADD_ASSIGN  */
    SUB_ASSIGN = 277,              /* SUB_ASSIGN  */
    LEFT_ASSIGN = 278,             /* LEFT_ASSIGN  */
    RIGHT_ASSIGN = 279,            /* RIGHT_ASSIGN  */
    AND_ASSIGN = 280,              /* AND_ASSIGN  */
    XOR_ASSIGN = 281,              /* XOR_ASSIGN  */
    OR_ASSIGN = 282,               /* OR_ASSIGN  */
    TYPE_NAME = 283,               /* TYPE_NAME  */
    OPEN_ROUND_BRACKET = 284,      /* OPEN_ROUND_BRACKET  */
    CLOSE_ROUND_BRACKET = 285,     /* CLOSE_ROUND_BRACKET  */
    OPEN_SQUARE_BRACKET = 286,     /* OPEN_SQUARE_BRACKET  */
    CLOSE_SQUARE_BRACKET = 287,    /* CLOSE_SQUARE_BRACKET  */
    OPEN_BRACKET = 288,            /* OPEN_BRACKET  */
    CLOSE_BRACKET = 289,           /* CLOSE_BRACKET  */
    PERIOD = 290,                  /* PERIOD  */
    COMMA = 291,                   /* COMMA  */
    AND = 292,                     /* AND  */
    MUL = 293,                     /* MUL  */
    ADD = 294,                     /* ADD  */
    SUB = 295,                     /* SUB  */
    NON = 296,                     /* NON  */
    NEGATE = 297,                  /* NEGATE  */
    DIV = 298,                     /* DIV  */
    MOD = 299,                     /* MOD  */
    LESSER = 300,                  /* LESSER  */
    GREATER = 301,                 /* GREATER  */
    XOR = 302,                     /* XOR  */
    OR = 303,                      /* OR  */
    COND_OP = 304,                 /* COND_OP  */
    COLON = 305,                   /* COLON  */
    ASSIGN = 306,                  /* ASSIGN  */
    EOI = 307,                     /* EOI  */
    TYPEDEF = 308,                 /* TYPEDEF  */
    EXTERN = 309,                  /* EXTERN  */
    STATIC = 310,                  /* STATIC  */
    AUTO = 311,                    /* AUTO  */
    REGISTER = 312,                /* REGISTER  */
    CHAR = 313,                    /* CHAR  */
    SHORT = 314,                   /* SHORT  */
    INT = 315,                     /* INT  */
    LONG = 316,                    /* LONG  */
    SIGNED = 317,                  /* SIGNED  */
    UNSIGNED = 318,                /* UNSIGNED  */
    FLOAT = 319,                   /* FLOAT  */
    DOUBLE = 320,                  /* DOUBLE  */
    CONST = 321,                   /* CONST  */
    VOLATILE = 322,                /* VOLATILE  */
    VOID = 323,                    /* VOID  */
    STRUCT = 324,                  /* STRUCT  */
    UNION = 325,                   /* UNION  */
    ENUM = 326,                    /* ENUM  */
    ELLIPSIS = 327,                /* ELLIPSIS  */
    CASE = 328,                    /* CASE  */
    DEFAULT = 329,                 /* DEFAULT  */
    IF = 330,                      /* IF  */
    ELSE = 331,                    /* ELSE  */
    SWITCH = 332,                  /* SWITCH  */
    WHILE = 333,                   /* WHILE  */
    DO = 334,                      /* DO  */
    FOR = 335,                     /* FOR  */
    GOTO = 336,                    /* GOTO  */
    CONTINUE = 337,                /* CONTINUE  */
    BREAK = 338,                   /* BREAK  */
    RETURN = 339                   /* RETURN  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_C_TAB_H_INCLUDED  */
