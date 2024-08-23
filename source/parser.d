module parser;

import lexer;
import ast;
import std.exception; 
import std.conv;

struct Parser
{
    Token[] tokens;
    size_t pos = 0;

    Token current()
    {
        return tokens[pos];
    }

    Token next()
    {
        return tokens[++pos];
    }

    Expression parse()
    {
        return parseExpression();
    }

    Expression parseExpression()
    {
        auto expr = parseTerm();

        while (current().type == TokenType.Plus || current().type == TokenType.Minus)
        {
            auto op = current().value;
            next();
            expr = new BinaryExpression(expr, op, parseTerm());
        }

        return expr;
    }

    Expression parseTerm()
    {
        auto term = parseFactor();

        while (current().type == TokenType.Multiply || current().type == TokenType.Divide)
        {
            auto op = current().value;
            next();
            term = new BinaryExpression(term, op, parseFactor());
        }

        return term;
    }

    Expression parseFactor()
    {
        auto token = current();
        if (token.type == TokenType.Number)
        {
            next();
            return new NumberExpression(token.value.to!int);
        }
        else if (token.type == TokenType.LParen)
        {
            next();
            auto expr = parseExpression();
            if (current().type != TokenType.RParen)
            {
                throw new Exception("Expected ')'");
            }
            next();
            return expr;
        }
        else
        {
            throw new Exception("Unexpected token: " ~ token.toString());
        }
    }
}

Expression parse(Token[] tokens)
{
    return Parser(tokens).parse();
}
