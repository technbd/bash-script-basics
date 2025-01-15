@echo off

echo Disk usage for all drives:
wmic logicaldisk get size,freespace,caption

pause
