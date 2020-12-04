<?php

/**
 *
 *
 * Author:  Asror Zakirov
 * https://www.linkedin.com/in/asror-zakirov
 * https://www.facebook.com/asror.zakirov
 * https://github.com/asror-z
 */

use zetsoft\dbitem\ALL\ZAppItem;
const Mode = 'init';

require '../../configs/ALL.php';

$app = $argv[1];
$script = 'D:\Develop\Projects\ALL\asrorz\zettest\excmd\ALL\asrorz.php';
$args = 'cruds/adder/run ' . $app;

$t = shell_exec('php ' . $script . ' ' . $args);

$boot->eol(2);
$boot->echo('Creating Storing');
