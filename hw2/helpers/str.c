#include <string.h>

char* strdup(const char* str)
{
    char* str_duplicated = (char*) malloc(strlen(str) * sizeof(char));
    if (str_duplicated != NULL)
    {
        strcpy(str_duplicated, str);
    }
    return str_duplicated;
}
