<?php

// Include the SDK using the composer autoloader
require 'vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
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

    // Print the body of the result by indexing into the result object.
    var_dump($result);
}

echo "done";