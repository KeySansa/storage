<?php

/**
 * Геттер для формирования списка выбора контрагента
 * php version 7
 * 
 * @category Ajax_DB_JqGrid
 * @package  Storage
 * @author   Key Sansa <keysansa@yandex.ru>
 * @license  MIT 
 * @link     http://key10.ru
 */

require_once '../inc/func.database.php';
  
  
$sql = "SELECT id, name FROM customers ORDER BY name";

$res = GetDbResult($sql);
  
$r = "<select class='ui-widget'>";

foreach ($res as $row) {
    $id = $row[0];
    $lab = $row[1];
    $r .= "<option value='$id'>$lab</option>";
    //    echo $row[0] . "\n";
}
$r .= "</select>";
echo $r;
?>
