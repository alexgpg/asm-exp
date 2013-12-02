create_executable: hello.o
	ld hello.o -print-output-format -o hello.bin

compile: hello.s
	as hello.s -o hello.o

clean:
	rm -f hello.o hello.bin
