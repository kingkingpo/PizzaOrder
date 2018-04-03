<?php

require_once('functions.php');

// Assign the root URL to a PHP constant
$doc_root = substr($_SERVER['SCRIPT_NAME'], 0, 24);
define("WWW_ROOT", $doc_root);


// DB credentials
define("DB_HOST", "localhost");
define("DB_USER", "lamp2project");
define("DB_PASSWORD", "lamp2project");
define("DB_NAME", "lamp2project");

?>