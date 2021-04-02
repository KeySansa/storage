<?php

/**
 * Базовые действия редактирования реестра комплексных операций
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
    $dt = ConvertDT($_REQUEST['dt']); 
    $sender_id = $_REQUEST['sender']; 
    $recipient_id = $_REQUEST['recipient']; 
    $product_id = $_REQUEST['product']; 
    $inp = $_REQUEST['inp']; 
    $rec = $_REQUEST['rec']; 
    $out = $_REQUEST['out']; 

    $sql="";
    if ($oper == 'add') {
        $sql = "INSERT INTO storage.operations_complex" . 
	" (dt, sender_id, recipient_id, product_id, inp, rec, out)" .
	" VALUES ('$dt', $sender_id, $recipient_id, $product_id, $inp, $rec, $out);";
    }

    if ($oper == 'edit') {
        $sql = getSQLFromFile(
            'storage.edit.operation.complex.upd.sql', 
            [$dt, $sender_id, $recipient_id, $product_id, $inp, $rec, $out]
        );
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
