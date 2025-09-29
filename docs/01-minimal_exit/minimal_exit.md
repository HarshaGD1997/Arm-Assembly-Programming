# Minimal arm assembly program to exit with exit code 42

## .syntax unified
    - tells assembler GNU as unified ARM syntax
    - Unified syntax allows writing code that works both on ARM and Thumb modes consitently 
    - Thumb modes : improves code density (smaller program size) while keeping good performance.

## .text
    - places following code in text section of the executable, readonly area where instructions are stored.

## .global _start
    - Exports the symbol __ _start __ so that linker knows the entry point of the program.
    - _ _start __ is where the program begins similar to main() function in c.
    - -nostdlib and -nostartfiles, these flags when linking tells there is no C runtime; kernel jumps to _ _start __.


## Setting up registers 
    
    - MOV R0, #42 
    -- Loads immediate value 42 into the register R0.
    -- R0 is used to pass the first argument to a system call in 32-bit ARM.
    -- Here it represents exit status code.

    - MOV R7, #1
    -- Loads immediate value 1 into register R7.
    -- In ARM-32 bit register R7 holds the system call number.
    -- Number 1 corresponds to system call sys_exit.

    - SVC #0
    -- SVC (Superior call, formally SWI) generates the software interrupt.
    -- Switches CPU from user mode to kernel mode.
    -- #0 is the immediate value which isn't used by linux but it's a placeholder.

### Kernel ops:
    
    - R7 = 1 -> syscall number = sys_exit
    - R0 = 42 -> exit status

    -- Kernel performs the exit and terminates the program with status 42.

### Result:
    
    arm-linux-gnueabihf-as -o exit.o exit.S
    arm-linux-gnueabihf-ld -o exit exit.o

    ./exit
    echo $?

    shell prints 42.



