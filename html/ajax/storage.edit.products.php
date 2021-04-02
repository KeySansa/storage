<?php

/**
 * Базовые действия редактирования справочника продукции
 * php version 7
 * 
 * @category Storage
 * @package  Storage
 * @author   Key Sansa <keysansa@yandex.ru>
 * @license  MIT 
 * @link     http://key10.ru
 */

require_once '../inc/func.database.php';

$id = $_REQUEST['id'];
$short_name = $_REQUEST['short_name'];
$name = $_REQUEST['name']; 
  
$oper = $_REQUEST['oper']; 
if (isset($oper)) {

    $sql="";
    if ($oper == 'add') {
        $sql = "INSERT INTO products (short_name, name, parent_id) " . 
        "VALUES ('$short_name', '$name', 15)";
    }

    if ($oper == 'edit') {
        $sql = "UPDATE products " . 
        "SET short_name='$short_name', name='$name' WHERE id = $id";
    }

    if ($oper == 'del') {
        $sql = "DELETE FROM products WHERE id = $id";
    }

    $responce = new stdClass();
    if (ExecSQL($sql)) {
        $responce->success = true; 
    } else {
        $responce->success = false;
    }
    echo json_encode($responce);
}
?>
