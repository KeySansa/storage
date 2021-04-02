<?php

/**
 * Базовые действия редактирования справочника рецептов
 * php version 7
 * 
 * @category Storage
 * @package  Storage
 * @author   Key Sansa <keysansa@yandex.ru>
 * @license  MIT 
 * @link     http://key10.ru
 */

require_once '../inc/func.database.php';
  
$oper = $_REQUEST['oper']; 
if (isset($oper)) {
    if (isset($_REQUEST['id'])) {
        $id = $_REQUEST['id']; 
    }
    if (isset($_REQUEST['product_id'])) {
        $product_id = $_REQUEST['product_id']; 
    }
    if (isset($_REQUEST['component'])) {
        $component_id = $_REQUEST['component']; 
    }
    if (isset($_REQUEST['volume'])) {
        $volume = $_REQUEST['volume'];
    }

    $sql="";
    if ($oper == 'add') {
        $sql = "INSERT INTO recipes (product_id, component_id, volume) " . 
        " VALUES ($product_id, $component_id, $volume)";
    }

    if ($oper == 'edit') {
        $sql = "UPDATE recipes " . 
        "SET product_id = $product_id, " . 
        "component_id = $component_id, volume = $volume" . 
        "WHERE id = $id";
    }

    if ($oper == 'del') {
        $sql = "DELETE FROM recipes WHERE id = $id";
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
