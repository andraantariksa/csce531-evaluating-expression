%{
#include "y.tab.h"

#define DEBUG 0

#define debug(s)      if (DEBUG) fprintf(stderr,s)
#define debug1(s,t)   if (DEBUG) fprintf(stderr,s,t)
#define debug2(s,t,u) if (DEBUG) fprintf(stderr,s,t,u)
%}