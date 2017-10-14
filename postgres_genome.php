<?php
/**
 * Created by PhpStorm.
 * User: softilnyr
 * Date: 21.09.17
 * Time: 22:03
 */

//$connection = pg_connect("postgresql://localhost:5432/test?user=postgres&password=postgres");

function uploadDoc($doc)
{
    $content = preg_replace('/\s+/', '', file_get_contents($doc));

    echo strlen($content);


    $connStr = "host=localhost port=5432 dbname=test user=postgres password=postgres";
    $conn = pg_connect($connStr);
    $result = pg_query_params($conn, "insert into  test_schema.documents (content) values ($1)", array($content));

    $result2 = pg_query($conn, "select max(id)  from test_schema.documents");
    $resId = pg_fetch_all($result2)[0]["max"];
    echo $resId . "\n";


    $kshingles = array(2, 5, 9);
    foreach ($kshingles as $k) {

        for ($i = 0; $i < strlen($content) - $k; $i += 1) {
            $string = substr($content, $i, $k);
            $result = pg_query_params($conn, "insert into  test_schema.genetics (document_id, kshingle, word) values ($1, $2, $3)",
                array($resId, $k, $string));
            $i += 1;
        }

        printf($k . " done\n");
    }

}


$docs = array("Genome_1.txt", "Genome_2.txt");

foreach ($docs as $doc) {
    uploadDoc($doc);
}