CC=llvm-g++
BIN-DIR=bin
SRC-DIR=src
L-FLAGS=-m32 -Wl,-no_pie

all:
	nasm -f macho -o ${BIN-DIR}/asm.o ${SRC-DIR}/segment.asm
	${CC}	-m32 -c ${SRC-DIR}/segment.hpp -o ${BIN-DIR}/segment.hpp.gch
	${CC} -m32 -c ${SRC-DIR}/test-suite.cpp -o ${BIN-DIR}/main.o
	${CC} ${L-FLAGS} -o ${BIN-DIR}/test-program ${BIN-DIR}/asm.o ${BIN-DIR}/main.o
