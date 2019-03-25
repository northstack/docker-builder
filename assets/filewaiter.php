<?php
if (!isset($argv[1], $argv[2])) {
    throw new RuntimeException('Must provide two arguments: timeout, file-path');
}
$timeout = (int) $argv[1];
$file = (string) $argv[2];

if (!$timeout) {
    throw new RuntimeException('Invalid timeout');
}

$wait = 0;
while ($wait < $timeout) {
    if (file_exists($file)) {
        return;
    }
    sleep(1);
    $wait++;
}

throw new RuntimeException('File '.$file.' was never created');
