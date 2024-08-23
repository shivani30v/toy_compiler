module ast;

import std.conv;  // Import std.conv for conversion

class Expression
{
    override string toString()
    {
        return "Expression";
    }
}

class NumberExpression : Expression
{
    int value;

    this(int value)
    {
        this.value = value;
    }

    override string toString()
    {
        return "Number(" ~ value.to!string() ~ ")";
    }
}

class BinaryExpression : Expression
{
    Expression left;
    string op;
    Expression right;

    this(Expression left, string op, Expression right)
    {
        this.left = left;
        this.op = op;
        this.right = right;
    }

    override string toString()
    {
        return "Binary(" ~ left.toString() ~ " " ~ op ~ " " ~ right.toString() ~ ")";
    }
}
