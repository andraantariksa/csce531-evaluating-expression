#include "expr-tree.h"

enum ExprType
{
    ExprType_IntVal,
    ExprType_VarName,
    ExprType_SignOp,
    ExprType_BinaryOp
};

enum ExprSign
{
    ExprSign_Pos,
    ExprSign_Neg
};

enum ExprOperator
{
    ExprOperator_Add,
    ExprOperator_Sub,
    ExprOperator_Mul,
    ExprOperator_Div,
    ExprOperator_Mod,
};

struct ExprTree
{
    enum ExprType type;
    union
    {
        int int_val;
        char var_name;
        struct
        {
            enum ExprSign sign;
            struct ExprTree *inside;
        }
        signed_expr;
        struct
        {
            enum ExprOperator operator;
            struct ExprTree *left, *right;
        }
        operation_expr;
    }
    data;
};
