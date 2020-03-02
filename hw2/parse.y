/* Simple Expression Evaluator */

/* parse.y
 *
 * Grammer rules for bison.
 * Includes the lexical analyzer routine yylex().
 */


%{
#include <ctype.h>
#define YYDEBUG 1
int  yylex();
void yyerror(char *s);
void print_welcome();
int  get_val(int);
void set_val(int, int);
%}

%token CONST
%token VAR

%%

session
    : { print_welcome(); }
      eval
    ;

eval
    : eval line
    | /* empty */
    ;

line
    : assign '\n'		{ printf("%d\n", $1); }
    ;

assign
    : VAR '=' expr		{ set_val($1, $3);  $$ = $3; }
    | expr
    ;

expr
    : term
    | expr '+' term		{ $$ = $1 + $3; }
    | expr '-' term		{ $$ = $1 - $3; }
    ;

term
    : factor
    | term '*' factor		{ $$ = $1 * $3; }
    | term '/' factor		{ $$ = $1 / $3; }
    | term '%' factor		{ $$ = $1 % $3; }
    ;

factor
    : CONST
    | VAR			{ $$ = get_val($1); }
    | '(' expr ')'		{ $$ = $2; }
    ;

%%

int yylex()
{
    int c;

    /* read past whitespace first */
    while ((c = getchar()) == ' ' || c == '\t');

    if (isalpha(c))            /* if letter (variable name) */
    {
        yylval = toupper(c);   /* case insensitive */
        return VAR;
    }
    if (isdigit(c))
    {
        ungetc(c, stdin);
        scanf("%d", &yylval);
        return CONST;
    }
    return c;
}

void yyerror(char *s)
{
    fprintf(stderr, "%s\n", s);
}

void print_welcome()
{
    printf("Welcome to the Simple Expression Evaluator.\n");
    printf("Enter one expression per line, end with ^D\n\n");
}

static int val_tab[26];

int get_val(int v)
{
    return val_tab[v - 'A'];
}

void set_val(int v, int val)
{
    val_tab[v - 'A'] = val;
}
