# How it works
The program first prints a prompt to the user to input a number. It then reads in the user's input using the scanf function.

The program then enters a loop to find and print the 10 prime numbers around the user's input. It initializes a counter and loads the user's input into a register. It then checks if the number is prime by dividing it by 2 and checking for any remainder. If there is no remainder, the number is not prime, and the program increments the number and repeats the process until a prime number is found. Once a prime number is found, the program prints it using the printf function and decrements the counter. The program then checks if 10 prime numbers have been found, and if not, it repeats the process.

Once 10 prime numbers have been found and printed, the program exits using the exit system call.
