lab03.s: lab03.c
	clang --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax lab03.c -S -o lab03.s
lab03.o: lab03.s
	clang --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax lab03.s -c -o lab03.o
executavel.x: lab03.o
	ld.lld lab03.o -o executavel.x


