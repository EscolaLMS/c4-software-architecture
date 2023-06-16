<?php

$f = json_decode(file_get_contents('packages.json'), true);
$c = '"';
foreach ($f as $package) {
    // database = container "Database" "persistent database information (for example, users, payments, orders, courses, topics,  other metadata)"
    $name = ucfirst($package[0]);
    echo "$package[0] = component {$c}{$name}{$c} {$c}Laravel Package{$c} {$c}$package[1]{$c}\n";
}

//var_dump($f);
