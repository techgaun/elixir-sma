<?php
// you need trader pecl extension
// this is one of the sma examples what was used to compare vs elixir
$time = microtime();

$num_points = 100000;
$all_points = array();
$fifteen_minutes = 15 * 60;
srand();
for ( $x = 0; $x < $num_points; $x++)
{
    // $all_points[] = $x;
    $all_points[] = rand(1000, 30000) / 100;
}

$result = trader_sma($all_points, $fifteen_minutes);

echo('Count is: ' + count($result));
echo "Total time: " . (microtime() - $time) . "\n";
