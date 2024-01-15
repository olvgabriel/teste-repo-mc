lab02.o: lab02.s
	clang --target=riscv32 -march=rv32g -mabi=ilp32d -mno-relax lab02.s -c -o lab02.o
executavel.x: lab02.o
	ld.lld lab02.o -o executavel.x

