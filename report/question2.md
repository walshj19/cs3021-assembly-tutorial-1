CS3021 Computer Architecture Tutorial 1
====================

### James Walsh 10382833

Question 2
---------------------

The function f(n) calculates n factorial.

###State of the Stack after a call to f(13)

Stack							|bottom of stack
------------------|------------------
13								|f(13) parameter
return address		|
saved ebp(caller)	|<- f(13) ebp
12								|f(12) parameter
return address		|
saved ebp(f(13))	|<- f(12) ebp
11								|f(11) parameter
return address		|
saved ebp(f(12))	|<- f(11) ebp
10								|f(10) parameter
return address		|
saved ebp(f(11))	|<- f(10) ebp <- esp

Question 3
---------------------

This is the terminal output when compiling and running the program.

```
tutorial1$ make
nasm -f macho -o bin/asm.o src/segment.asm
llvm-g++	-m32 -c src/segment.hpp -o bin/segment.hpp.gch
llvm-g++ -m32 -c src/test-suite.cpp -o bin/main.o
llvm-g++ -m32 -Wl,-no_pie -o bin/test-program bin/asm.o bin/main.o
tutorial1$ ./bin/test-program
p test : pass
q test : pass
f test : pass
tutorial1$
```
