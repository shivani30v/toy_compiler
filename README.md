# Toy Compiler in D Language

Welcome to my Toy Compiler project! 

## Overview

This project is a simple compiler built in the D programming language. It's designed to parse basic arithmetic expressions and convert them into an abstract syntax tree (AST). The toy compiler handles fundamental operations like addition, subtraction, multiplication, and division. 

I created this compiler as part of my journey learning D Lang. It was a great way to dive into compiler construction, understand lexing and parsing, and practice my skills in a new programming language.

## How It Works

1. **Lexer:** Breaks down the input expression into tokens such as numbers and operators.
2. **Parser:** Converts the sequence of tokens into an abstract syntax tree (AST) that represents the structure of the expression.

## Features

- **Basic Arithmetic Operations:** Supports addition, subtraction, multiplication, and division.
- **Parentheses Handling:** Can parse expressions with parentheses to ensure proper operator precedence.
- **Custom Error Handling:** Throws meaningful errors for unexpected tokens or malformed expressions.

## Getting Started

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/shivani30v/toy_compiler.git
   cd toy_compiler
   ```

2. **Build the Project:**
   ```bash
   dub
   ```

3. **Run the Compiler:**
   ```bash
   dub run
   ```
   You will be prompted to enter an arithmetic expression. Type in your expression and hit Enter.

## Example Usage

```bash
Enter expression:
3 + 4
Tokens: [Token(Number, `3`), Token(Plus, `+`), Token(Number, `4`), Token(EOF, ``)]
Result: Binary(Number(3) + Number(4))
```

## Contributions

Feel free to contribute to this project! Whether it's fixing bugs, adding new features, or improving documentation, your help is welcome.

Thanks for checking out my toy compiler project! 🚀
