set exe=D:\Develop\Projects\ALL\server\php7\7_38\php.exe

set lvl=0
::0 to 8

set autoload=..\..\vendor\autoload.php

set vid=junit
:: table, raw, checkstyle,json,prettyJson,junit, gitlab

set path1=..\..\widgets\market

%exe% ../../phpstan.phar analyse -l %lvl% -a %autoload% --error-format %vid% %path1%
