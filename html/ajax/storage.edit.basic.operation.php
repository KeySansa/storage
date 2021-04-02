<?php

/**
 * Базовые действия редактирования реестра базовых операций
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
    $ln = $_REQUEST['ln']; 

    if (isset($_REQUEST['dt'])) {
        $dt = ConvertDT($_REQUEST['dt']);
    }
    if (isset($_REQUEST['subject'])) {
        $subject = $_REQUEST['subject']; 
    }

    if (isset($_REQUEST['product'])) {
        $product = $_REQUEST['product']; 
    }
    if (isset($_REQUEST['dt'])) {
        $volume = $_REQUEST['value']; 
    }
    $sql="";

    // Изменение записи
    if ($oper == 'edit') {
        $product_id = Lookup('products', 'name', $product, 'id');
        $sql = "UPDATE storage.base_operations" .  
        " SET subject_id = $product_id, storage_id = $subject, " . 
        " dt = $dt, volume = $volume " . 
        " WHERE id = $id";
    }

    // Удаление записи
    if ($oper == 'del') {
        $sql = "DELETE FROM storage.base_operations " . 
        " WHERE id = $id";
    }

    // Добавлениие новой записи
    if ($oper == 'add') {
        $sql = "INSERT INTO storage.base_operations" .
        " (id, ln, dt, subject_id, storage_id, volume)" .
        " VALUES (nextval('storage.operations_complex_id_seq'::regclass), " . 
        " -1, 'dt', $product, $subject, $volume);";  
    }

    $responce = new stdClass();
    // Кодируем результат выполнения операции
    if (ExecSQL($sql)) {
        $responce->success = true; 
    } else {
        $responce->success = false;
    }

    // Возвращаем результат выполнения операции
    echo json_encode($responce);
}
?>
