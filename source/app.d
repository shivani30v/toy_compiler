module app;

import lexer;
import parser;
import std.stdio;
import std.string;  // Importing std.string for various string operations

void main()
{
    writeln("Enter expression:");
    auto input = stdin.readln().chomp();  // Use chomp to remove trailing newline

    auto tokens = lex(input);
    writeln("Tokens: ", tokens);

    auto result = parse(tokens);
    writeln("Result: ", result.toString());
}
