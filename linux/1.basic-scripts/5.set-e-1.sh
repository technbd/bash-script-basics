
#!/bin/bash

echo "Start of the script"

## This command fails:
ls non_existent_file.txt

echo "This line will still execute, even if the above command fails."
