module lexer;

import std.ascii;
import std.string;

enum TokenType
{
    Number, Plus, Minus, Multiply, Divide, LParen, RParen, EOF
}

struct Token
{
    TokenType type;
    string value;

    string toString() const
    {
        return "Token(" ~ type.toString() ~ ", `" ~ value ~ "`)";
    }
}

string toString(TokenType type)
{
    final switch (type)
    {
        case TokenType.Number: return "Number";
        case TokenType.Plus: return "Plus";
        case TokenType.Minus: return "Minus";
        case TokenType.Multiply: return "Multiply";
        case TokenType.Divide: return "Divide";
        case TokenType.LParen: return "LParen";
        case TokenType.RParen: return "RParen";
        case TokenType.EOF: return "EOF";
    }
}

Token[] lex(string input)
{
    Token[] tokens;
    size_t i = 0;

    while (i < input.length)
    {
        switch (input[i])
        {
            case '+': tokens ~= Token(TokenType.Plus, "+"); break;
            case '-': tokens ~= Token(TokenType.Minus, "-"); break;
            case '*': tokens ~= Token(TokenType.Multiply, "*"); break;
            case '/': tokens ~= Token(TokenType.Divide, "/"); break;
            case '(': tokens ~= Token(TokenType.LParen, "("); break;
            case ')': tokens ~= Token(TokenType.RParen, ")"); break;
            default:
                if (input[i].isDigit)
                {
                    string num = "";
                    while (i < input.length && input[i].isDigit)
                        num ~= input[i++];
                    tokens ~= Token(TokenType.Number, num);
                    continue;
                }
                break;
        }
        i++;
    }

    tokens ~= Token(TokenType.EOF, "");
    return tokens;
}
