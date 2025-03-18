## User Create: 

Below is a script that adds multiple users and sets passwords for them in Linux. You can provide a list of usernames and corresponding passwords in a file and use this script to create the users.



#### Input File Format:
Create a file named `users.txt` with the format:

```
cat users.txt

user1:admin123
user2:admin321
```


```
cat data.txt

Jon|25|Engineer
Don|20|Developer
```



#### IFS (Parsing Data):

- `IFS=':'` : Sets the **Internal Field Separator** (IFS) to `|` or `:` and this tells read to split lines using `|` ,  `:` as the delimiter.
- `read -r username password` : Reads each line from user.txt, assigning the first part to username and the second part to password.


```
#!/bin/bash

#file='data.txt'
file='user.txt'

#while IFS='|' read -r name age profession
while IFS=':' read -r username password

do
  echo "UserName: $username"
  echo "password: $password"
  echo "---"
done < $file
```


```
chmod +x test.sh
```




### Script: `bulk_useradd.sh`

1. `if [ "$#" -ne 1 ];` :
    - `$#` : This variable represents the **number of command-line arguments** passed to the script when it is executed.
    - `-ne` : Stands for "not equal". It checks if the number of arguments is **not equal** to `1`.
    - If the condition is true (i.e., the user did not provide exactly one argument), the script enters the `if` block.

2. `echo "Usage: $0 <input_file>"` :
    - `$0` : Refers to the name of the script itself (e.g., ./bulk_useradd.sh).

3. `echo "Input file format: username:password"` :
    - Provides additional information about the required format of the input file.

4. `-f "$input_file"` :
    - Returns true if `$input_file` exists and is a regular file.
    - Returns false if `$input_file` does not exist or is not a regular file.
    - `!` (Logical NOT) : Negates the condition. Checks if a file does not exist. So, returns true if the file does not exist.

5. `[ -n "$password" ]` :
    - `-n` checks if the string inside `$password` is **not empty** (i.e., it contains at least one character).
    - If `$password` is **not empty**, the condition evaluates to true, and the script executes the commands inside the if block.
    - If `$password` is **empty**, the condition evaluates to false, and the if block is skipped.
    



```
#!/bin/bash

# Check if input file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    echo "Input file format: username:password"
    exit 1
fi

input_file=$1

# Check if input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: File '$input_file' not found!"
    exit 2
fi

echo "------------------------------------------------------"

while IFS=: read -r username password; do
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists. Skipping..."
    else
        # Create the user
        sudo useradd "$username"
        if [ -n "$password" ]; then
            echo "$username:$password" | sudo chpasswd
            echo "Successfully created user '$username' with password."
        else
            echo "Successfully created user '$username' without password."
        fi
    fi
    echo "------------------------------------------------------"

done < "$input_file"

echo "All tasks completed."
```


```
chmod +x bulk_useradd.sh
```



#### Run the script:

- `$#` is `1` (the `users.txt` file is the single argument).
- The condition `[ "$#" -ne 1 ]` is false, so the script continues execution.


```
./bulk_useradd.sh users.txt
```


```
### Output:

------------------------------------------------------
Successfully created user 'user1' with password.
------------------------------------------------------
Successfully created user 'user2' with password.
------------------------------------------------------
All tasks completed.
```




#### Incorrect Usage: No Argument

- `$#` is 0.
- The condition `[ "$#" -ne 1 ]` is true, so it displays:


```
./bulk_useradd.sh
```


```
### Output:

Usage: ./bulk_useradd.sh <input_file>
Input file format: username:password
```



---
---




### Interactive shell script to create multiple users:


#### Script: `create_multiple-users.sh`

1. Prompt for Number of Users: `read -p "Enter number of Users to create:" num`
    - Prompts the user to specify the number of users to create.
    - Stores the input in the variable `num`.

2. Prompt for Username: `read -p "Enter Username no.$i: " uname`
    - Prompts for a username (unique for each iteration).
    - Uses `useradd` to create the user.

3. Password Setup (Optional): `read -p "Enter password for user no.$i? [Y/N] " flag`
    - Asks if a password should be set for the user.
    - If the user inputs "Y" or "y": Invokes passwd to set a password interactively.
    - If the user inputs "N" or any other character: Skips password setup.


```
#!/bin/bash

read -p "Enter number of Users to create:" num

echo "------------------------------------------------------"

for (( i=1; i<=$num; i=i+1)); do

read -p "Enter Username no.$i: " uname

sudo useradd $uname

read -p "Enter password for user no.$i? [Y/N] " flag
if [[ "$flag" == "Y" || "$flag" == "y" ]]; then

sudo passwd $uname

echo "Successfully created New User: $uname with password."

echo "------------------------------------------------------"

else
echo "Successfully created New User: $uname without password."

echo "------------------------------------------------------"

fi
done

```



```
chmod +x create_multiple-users.sh
```


```
./create_multiple-users.sh
```


