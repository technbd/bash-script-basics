
## Linux bash scripts:



### Hello World: 

```
#!/bin/bash

#Creates a new variable with a value of "Hello World"
myVar="Hello World"
echo $myVar
```





### Echo: with define variables

If the `echo` bash command is used with double quotation marks `" "`, then the script will print out the actual value of a variable. Otherwise, if the single quotation marks `' '` are used, it will print out only the name of a variable.

- The `-e` option enables the interpretation of escape sequences, allowing you to include special characters like newlines (`\n`), tabs (`\t`), or colors in your output. To format your script's output with newlines, tabs, or colors.



```
echo 1 2 3 4 5
echo {0..10}
```


```
#!/bin/bash

myVar="Hello World"

echo 'The best hosting provider is $myVar'
echo "The best hosting provider is $myVar"
```


```
#!/bin/bash

greeting=Hello
name=Jon

echo $greeting $name
```


```
#!/bin/bash

echo "Hello\nWorld"

echo -e "Hello\nWorld"
echo -e "Name:\tAlice"
```


### Sleep: 


```
#!/bin/bash
sleep 10 && echo "I have been sleeping for 10 seconds, I want more sleeping..." && sleep 5 

echo "I’m done sleeping, thanks!"
```


### User Input:

`read.sh`:

```
#!/bin/bash

echo "What is your age?"

# read variable_name
read age

echo "Your age is: $age"
```


_To prompt the user with a custom message, use the `-p` flag:_

```
#!/bin/bash

read -p "Enter your name:" name

echo "Your name is: $name"
```





### `set -e` option:

- Enables the "**exit on error**" mode.
- `set -e` is a command that tells the script to **exit immediately** if any command within the script fails (returns a non-zero exit status). If any command in the script fails (returns a non-zero status), the script will terminate immediately.


#### Example Without `set -e`:

- The script continues to run even after the `ls` command fails.

```
#!/bin/bash

echo "Start of the script"


## This command fails:
ls non_existent_file.txt

echo "This line will still execute, even if the above command fails."
```



#### Example With `set -e`:

- The script stops immediately after the `ls` command fails, and the final echo statement is not executed.

```
#!/bin/bash

set -e

echo "Start of the script"

## This command fails:
ls non_existent_file.txt

echo "This line will NOT execute, because the script stops after the above failure."
```




### `set -x` option:

`set -x` is used to enable debugging mode. When `set -x` is active, each command in the script is printed to the terminal as it is executed, along with its arguments. This is helpful for debugging scripts to understand how commands are being executed.

- Enable Debugging: `set -x`
- Disable Debugging: `set +x`
- Every command after `set -x` is prefixed with a `+` sign and printed to the terminal as it's executed.


```
#!/bin/bash

set -x

echo "Starting the script"

name="Alice"
echo "Hello, $name"

ls non_existent_file.txt


set +x

ls nonexistent_directory

echo "End of script"

```




### Loops:


_Syntax:_

```
#!/bin/bash


for <variable_name> in <value1 value2 value3>

do 

<command> $<variable_name>;

done
```


#### Example-1:


```
#!/bin/bash

## Basic loop:

for char in a b c
do
echo $char
done

echo "------------"


## Loop Through a List of Values: 

for items in apple banana cherry; do
    echo "Fruit name: $items"
done


echo "------------"


## Loop Through a List of Values:

for n in 1 2 3 4 5
do
echo "Number $n"
done

echo "------------"


## Loop Through a Range of Numbers:

for i in {1..10}
do
echo "Number $i"
done

```


#### Example-2:

- `{1..10..2}` : is a Bash range expression that generates a sequence of numbers:
  - 1: Starting number.
  - 10: Ending number.
  - 2: Step value (increment by 2).

- The result is the sequence: 1 3 5 7 9.


```
#!/bin/bash

## Loop Through a Range with Step Value:
for i in {1..10..2}
do
    echo "Number: $i"
done
```



#### Example-3:

- `$(seq 1 2 10)` : Generates a sequence starting at 1, incrementing by 2, up to 10. The result is: 1 3 5 7 9.

```
#!/bin/bash

echo Sequence numbers are: 

for i in $(seq 1 2 10)
do
   echo "Number: $i"
done

```



#### Example-4:



```
#!/bin/bash

## C-style For Loop: 

for (( n=1; n<=10; n++ ))
do
echo "$n seconds"
done
```



#### Example-5:



```
#!/bin/bash 

INSTANCE_NAMES="m w1 w2 lb"

#for instances_name in ${INSTANCE_NAMES}

for instances_name in $INSTANCE_NAMES
do 
  echo $instances_name
done
```


#### Example-6:



```
#!/bin/bash 

INSTANCE_NAMES=('m' 'w1' 'w2') #Array elements

for instances_name in ${INSTANCE_NAMES[@]};
do 
  echo $instances_name
done
```



#### Example-7:



```
#!/bin/bash 

INSTANCE_NAMES=('master' 'worker1' 'worker2') ## Array:

for instance_name in "${INSTANCE_NAMES[@]}"
do
  echo "Creating EC2 $instance_name, please wait ..."
  
  aws ec2 run-instances \
  --image-id ami-0c7217cdde317cfec \
  --instance-type t2.micro \
  --count 1 \
  --associate-public-ip-address \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value='$instance_name'}]';

done
```



#### Example-8:


```
#!/bin/bash

ssh="22"
http="80"
https="443"

for port in $ssh $http $https
do
   echo $port
done
```



#### Example-9:

This script connects to each of the three servers (server1, server2, server3) via SSH and retrieves the system `uptime` for each server.


```
#!/bin/bash

for s in server1 server2 server3
do
    echo "Server ${s}: $(ssh root@${s} uptime)"
done
```



#### Example-10:

To avoid being prompted for passwords during each `scp` command, use SSH key-based authentication.

- Make sure the files (`file1`, `file2`, `file3`) exist in the current directory (or provide their full path).


```
#!/bin/bash

for i in file{1..3}
    do
        for x in node{1..3}
            do
                echo "Copying $i to server $x"
                scp $i $x:/tmp
        done

done
```





### Array: 

#### Example-1:


```
#!/bin/bash

## Array:
fruits=("apple" "banana" "cherry" "mango")


## Access all elements in the array
echo "All fruits: ${fruits[@]}"


## Loop Through an Array:
for fruit in "${fruits[@]}"; do
    echo "$fruit"
done
```



#### Example-2:

```
#!/bin/bash

## Array:
fruits=(apple banana cherry mango)

#fruits=("apple" "banana" "cherry" "mango")

## Access individual array elements
echo "First elements: ${fruits[0]}"
echo "Second elements: ${fruits[1]}"
echo "Third elements: ${fruits[2]}"
echo "Forth elements: ${fruits[3]}"

echo "----------------"


## Loop Through an Array:
for n in ${fruits[@]}
do
  echo $n
done

```



#### Example-3: Array Length

- Returns the number of elements in the array.


```
#!/bin/bash

## Array:
fruits=("apple" "banana" "cherry" "mango")


## Access all elements in the array
echo "All fruits: ${fruits[@]}"


## Get the length of the array (number of elements)
echo "Number of fruits: ${#fruits[@]}"

```



### Conditional Statements:

The structure of conditional statements is as follows:

- if...then...fi statements
- if...then...else...fi statements
- if..elif..else..fi statements


_Common Conditions:_

- `==` is for string comparison. For numeric comparison, use `-eq` (equals).
- Equality check: `[ "$a" == "$b" ]` or `[ "$a" = "$b" ]` (String comparison)
- Inequality check: `[ "$a" != "$b" ]`
- Greater than: `[ $a -gt $b ]` (for integers)
- Less than: `[ $a -lt $b ]`
- File existence check: `[ -e "$filename" ]` (Checks if the file exists)
- Directory check: `[ -d "$dirname" ]` (Checks if the directory exists)


#### if Statement: (Example-1)

```
#!/bin/bash

## if Statement:

read -p "Enter your age: " age

if [ $age -gt 18 ]
then
  echo "You are Teenager age plus."
  echo "You age is: $age"
fi

```


#### if Statement: (Example-2)

```
#!/bin/bash

## if Statement:

#a=20
#b=30

read -p "1st value for 'a': " a
read -p "1st value for 'b': " b


if [ $a -lt $b ]
then
  echo "a is less than b"
  echo "$a is less than $b"
fi

```


#### if Statement: (Example-3)

```
#!/bin/bash

#num=8

read -p "Enter your number: " num

if [ $((num % 2)) -eq 0 ]
then
    echo "$num is an even number"
fi
```




#### if-else Statement (if-then-else): (Example-1)

```
#!/bin/bash

## if then else statement:

#num=100

read -p "Enter your number: " num

if [ $num -eq 100 ]
then
 echo "Number is equal to 100"
 
else
 echo "Number is not equal to 100"
fi
```



#### if-else Statement (if-then-else): (Example-2)

```
#!/bin/bash

## if then else statement:

#var1=1
#var2=2

read -p "Enter your variable1: " var1
read -p "Enter your variable2: " var2

#if [ $var1 -eq $var2 ]

if [ $var1 == $var2 ]
then
    echo "Both variables are the same"
else
    echo "Both variables are different"
fi

```



#### if-else Statement (if-then-else): (Example-3)

```
#!/bin/bash

## if-then-else statement to check even or odd

#num=10

read -p "Enter your number: " num


if [ $((num % 2)) -eq 0 ]

then
  echo "The number is even."
else
  echo "The number is odd."
fi

```



#### if-else Statement (if-then-else): (Example-4)

```
#!/bin/bash

file="instance_id"

#if [ -f "$file" ]

if [ -e "$file" ]
then
  echo "$file is exists"
  cat "$file"
else
  echo "$file does not exists"
fi
```



#### if-else Statement (if-then-else): (Example-5)

- `-z` :
  - This is a test operator that checks if a string is empty.
  - It returns true if the string is empty (zero length).

- `!` :
  - This is the logical NOT operator. It inverts the result of the condition.
  - `! -z` means "not empty."


```
#!/bin/bash

names=(m2 w3 w4)  # Array: 

#for name in m w1 w2 
for name in ${names[@]}
do
    if [ ! -z "$name" ]
    then
        echo "Delete: $name"
        echo "$name is terminated"
    else
        echo "Not found: $name"
    fi
done

```




#### if-elif-else Statement (Example-1)


```
#!/bin/bash

# Declare a variable
#number=5

read -p "Enter your number: " num

## Check different conditions using if-elif-else:
if [ $num -gt 5 ]
then
    echo "Number is greater than 5"

elif [ $num -eq 5 ]; then
    echo "Number is equal to 5"

else
    echo "Number is less than 5"
fi

```





### Functions:


#### Example-1:

```
#!/bin/bash

# Define a function
hello () {
   echo 'Hello World!'
}

# Call the function
hello
```


#### Example-2:

- `$1` is the first argument passed to the function.

```
#!/bin/bash

# Define a function
greet() {
    echo "Hello, $1!"
}

# Call the function
greet "Alice"

```



#### Example-3:

- `$1` and `$2` are the first and second arguments.

```
#!/bin/bash

# Define a function
add_numbers() {
    result=$(( $1 + $2 ))
    echo "The sum of $1 and $2 is: $result"
}

# Call the function
add_numbers 5 10

```



#### Example-4: Function to Read User Input

```
#!/bin/bash

# Define a function
get_input () {

    read -p "Enter your name: " name
    echo "Hello, $name!"
}

# Call the function
get_input

```





### Links:
- [Bash Script Examples](https://www.hostinger.com/tutorials/bash-script-example)
- [Bash Scripting Tutorial](https://www.freecodecamp.org/news/bash-scripting-tutorial-linux-shell-script-and-command-line-for-beginners/)
- [Shell Scripting for Beginners](https://www.freecodecamp.org/news/shell-scripting-crash-course-how-to-write-bash-scripts-in-linux/)









