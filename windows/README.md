
## Windows batch scripts: 

Windows-native batch scripts (`.cmd` or `.bat`), here are some examples that can be run directly in **Command Prompt** or **Windows Terminal**:



### Hello World: 

Save the script with a `.cmd` or `.bat` extension and run it by **double-clicking** or typing the file name in a terminal.

- `@echo off` : is used to control how commands and output are displayed in the terminal. Without this, every line of the script, including the commands themselves, is echoed in the terminal.


#### Example-1:

`hello.cmd`:

```
@echo off
echo Hello, World!
```


#### Example-2:

`hello.bat`:


```
@echo off
echo Hello, World!
pause
```



### System Information:


```
@echo off
echo Current Date and Time: %date% %time%

echo Operating System Info: 
ver

pause
```


### Disk Space Check:

```
@echo off

echo Disk usage for all drives:
wmic logicaldisk get size,freespace,caption

pause
```


### Basic Variable:


#### Example-1:

- `set NAME=John`: Assigns the value John to the variable is NAME.
- `%NAME%`: Accesses the value of the variable NAME.


```
@echo off

set NAME=John
echo Hello, %NAME%!

pause
```


#### Example-2: Prompting for Interactive User Input: 

- `set /p` : To prompt the user for input.
- `set /p USERNAME=` : Prompts the user to enter a value for the variable USERNAME.

```
@echo off

set /p USERNAME=Enter your name: 
echo Hello, %USERNAME%!

pause
```




