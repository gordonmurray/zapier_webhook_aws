<?php

// composer autoload
require 'vendor/autoload.php';

// Sentry
Sentry\init(['dsn' => 'https://7956ba00c4494add8c2730c1404748dc@sentry.io/1878950' ]);

// dotenv
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/../');
$dotenv->load();

$post = file_get_contents('php://input');

if ($post != "") {

    $key = 'logs/tweet_' . date('m-d-Y_hia') . '.json';

    $s3 = new Aws\S3\S3Client([
        'region'  => getenv('AWS_REGION'),
        'version' => 'latest',
        'credentials' => [
            'key'    => getenv('AWS_KEY'),
            'secret' => getenv('AWS_SECRET')
        ]
    ]);

    $result = $s3->putObject([
        'Bucket' => getenv('S3_BUCKET'),
        'Key'    => $key,
        'Body'   => serialize($post)
    ]);

}

echo "Done";