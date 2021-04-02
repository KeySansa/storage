<?php

/**
 * Базовые действия редактирования реестра операций
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
  
    $id = $_REQUEST['id']; 
    $product = $_REQUEST['product']; 
    $inp = $_REQUEST['inp']; 
    $rec = $_REQUEST['rec']; 
    $out = $_REQUEST['out']; 
    $sql="";
    if ($oper == 'edit') {
        $product_id = Lookup('products', 'name', $product, 'id');
        $sql = "UPDATE storage.operations_complex " . 
        " SET product_id=$product, inp=$inp, rec=$rec, out=$out WHERE id = $id";
    }

    if ($oper == 'del') {
        $sql = "DELETE FROM storage.operations_complex WHERE id = $id";
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
