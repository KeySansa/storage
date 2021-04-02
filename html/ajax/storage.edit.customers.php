<?php

/**
 * Базовые действия редактирования справочника контрагентов
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
    if (isset($_REQUEST['short_name'])) {
        $short_name = $_REQUEST['short_name'];
    } 
    if (isset($_REQUEST['name'])) {
        $name = $_REQUEST['name']; 
    }
    if (isset($_REQUEST['parent'])) {
        $parent = $_REQUEST['parent']; 
    }

    $prd = 'f'; 
    if (isset($_REQUEST['prd'])) {
        if ($_REQUEST['prd'] == 'Да') {
            $prd = 't';
        }
    }

    $sql="";
    if ($oper == 'add') {
        if ($prd == 'Да') {
            $p = 't';
        }
        $sql = "INSERT INTO customers (short_name, name, parent_id, prd)" .  
        "VALUES ('$short_name', '$name', $parent, '$prd');";
    }
    
    if ($oper == 'edit') {
        $sql = "UPDATE customers" . 
        " SET short_name='$short_name', name='$name'," . 
        " parent_id = $parent, prd = '$prd' " . 
        " WHERE (id = $id);";
    }

    if ($oper == 'del') {
        $sql = "DELETE FROM customers WHERE (id = $id)";
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
