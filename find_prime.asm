; Find 10 prime numbers around the user input in x86-64 Assembly

section .data
  prompt db "Enter a number: ", 0
  promptLen equ $-prompt
  resultFormat db "Prime number: %d", 10, 0
  inputFormat db "%d", 0

section .bss
  inputNum resq 1 ; Reserve space for the input number

section .text
  global _start

_start:
  ; Print the prompt
  mov rax, 1 ; Write syscall number
  mov rdi, 1 ; File descriptor STDOUT
  lea rsi, [prompt] ; Address of the prompt string
  mov rdx, promptLen ; Length of the prompt string
  syscall

  ; Read the input number
  lea rdi, [inputFormat]
  lea rsi, [inputNum]
  call scanf

  ; Find and print the 10 prime numbers around inputNum
  mov rcx, 10 ; Counter for 10 prime numbers
  mov rdi, [inputNum] ; Load the input number into RDI

next_prime:
  add rdi, 1 ; Increment the number

  ; Check if the number is prime
  mov rax, 2 ; Initialize RAX to 2 (first divisor)
  mov rsi, rdi ; Copy the number to RSI for division
  xor rdx, rdx ; Clear RDX for division
  div rax ; Divide RSI by RAX (number / 2)

check_divisor:
  cmp rax, 1 ; Check if the divisor is 1 (number is prime)
  je print_prime
  cmp rax, rsi ; Check if the divisor is equal to the number (looped through all divisors)
  je next_prime

  xor rdx, rdx ; Clear RDX for division
  div rax ; Divide RSI by RAX (number / divisor)

  cmp rdx, 0 ; Check if the remainder is 0 (not prime)
  je next_prime

  ; Increment the divisor and check again
  add rax, 1
  jmp check_divisor

print_prime:
  ; Print the prime number
  lea rdi, [resultFormat]
  mov rsi, [inputNum]
  call printf

  ; Decrement the counter and check if 10 prime numbers have been found
  dec rcx
  jnz next_prime

  ; Exit the program
  mov rax, 60 ; Exit syscall number
  xor rdi, rdi ; Return code 0
  syscall

section .text
  extern scanf, printf

scanf:
  jmp scanf

printf:
  jmp printf
