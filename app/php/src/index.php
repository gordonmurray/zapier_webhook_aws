<?php

$name = trim(getenv('name')) ?? 'john doe';

echo "Hello $name";