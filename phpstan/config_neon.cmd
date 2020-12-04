set exe=D:\Develop\Projects\ALL\server\php7\7_38\php.exe
set lvl=0
::0 to 8
set autoload=..\..\vendor\autoload.php
set vid=table
:: table, raw, checkstyle,json,prettyJson,junit, gitlab
set path1=..\..\widgets\market
set conf=../../conf.neon
::set debug=--debug
%exe% ../../phpstan.phar analyse -l %lvl% %debug% -c %conf% --error-format %vid% %path1%
