# GNU Assembler Hello World 64 bit edition
# Compile: gcc -nostdlib hello.s -o hello.bin or use make
# Run: ./hello.bin

# Data segment
.data

# String for print. Label on data of string
hello_str:
        # String data
        # .string store zero char at the end of string
        .string "Hello, 64-bit world!\n"

        # Сalculation length of string and store in "hello_str_length" symbol
        # -1 for no print last character(zero)
        .set hello_str_length, . - hello_str - 1

# Code segment
.text

.globl  _start                          # Define a global symbol _start. Entry point in program
.type   _start, @function               # Define symbol as function instead data

_start:
        # Print hello

        movq    $1, %rax                # Pass syscall number(1 for "write" syscal) in rax register

        movq    $1, %rdi                # Pass 1-st argumens for write - file descriptor number. Put it in %rdi register
        movq    $hello_str, %rsi        # Pass 2-nd argument for write - pointer on string data. Put it in %rsi register 
        movq    $hello_str_length, %rdx # Pass 3-rd argument for write - string length. Put it in %rdx register

        syscall                         # Call syscall "write". The same as write(1, hello_str, hello_str_length)
        # Correct exit

        movq    $60, %rax   # Pass syscall number (60 for exit)
        movq    $0,  %rdi   # Pass 1-st argument - succsess exit code 0
        syscall             # Call syscall "exit". The same as exit(0)

