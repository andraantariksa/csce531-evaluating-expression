/* Simple Expression Evaluator */

/* main.c */

int yyparse();

int main()
{
    extern int yydebug;
    yydebug = 1;         /* change to 1 to see debugging info */
    yyparse();
    return 0;
}
