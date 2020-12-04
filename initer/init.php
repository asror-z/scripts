<?php

/**
 *
 *
 * Author:  Asror Zakirov
 * https://www.linkedin.com/in/asror-zakirov
 * https://www.facebook.com/asror.zakirov
 * https://github.com/asror-z
 */


const Mode = 'init';

require __DIR__ . '\..\..\configs\ALL.php';

$apps = file(__DIR__ . '/App.txt', FILE_IGNORE_NEW_LINES);

$stores = [
    Root . '/storing/appgen',
    Root . '/storing/zcodes',
];

$boot = new Boot();

$boot->eol(2);
$boot->echo('Process Projects');

foreach ($apps as $app) {

//    $boot->mkdir(Root . '/execut/web/' . $app . '/assets', true);
    $boot->mkdir(Root . '/execut/web/' . $app . '/.well-known/acme-challenge', true);
    
    $boot->mklink(Root . '/vendor', Root . "/execut/web/{$app}/vendor");
    $boot->mklink(Root . '/ventest', Root . "/execut/web/{$app}/ventest");
    $boot->mklink(Root . '/deploy', Root . "/execut/web/{$app}/deploy");
    $boot->mklink(Root . '/caches', Root . "/execut/web/{$app}/caches");
    $boot->mklink(Root . '/render', Root . "/execut/web/{$app}/render");
    $boot->mklink(Root . '/render', Root . '/webhtm/ALL/render');

}

$boot->eol(2);
$boot->echo('Creating Storing');

foreach ($stores as $target) {
    $boot->mkdir($target);
}

