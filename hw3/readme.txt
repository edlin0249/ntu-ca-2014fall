This code is tested on Ubuntu 14.04
-----

each stack frame of my function
|----------------| High
| return address |
|----------------|
|    last fp     |
|----------------|
| local variable | (one word) used to save c*n
|----------------| Low

storing return array to output_ascii and itoa uses the same method as hw2
