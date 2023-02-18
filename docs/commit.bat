@echo off
@title Typora_script

set /a timemax=60
set /a timemin=30

set /a timeval=%timemin%
:loop
echo LOOP_BEGIN[%time%]:%timeval%====== >> E://Gitbook//logfile.log
set /a timeval=%timemin%
git add *
(git commit -m "%date%") | find /i "nothing to commit"
if ERRORLEVEL 1 (
     echo "there are changes, push it to origin" >> E://Gitbook// logfile.log
       git push -u origin master
)^
else (
     echo "nothing to commit" >> E://Gitbook//logfile.log
)
timeout /nobreak /t %timeval%
goto loop
