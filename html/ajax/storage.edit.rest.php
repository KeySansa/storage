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
    $dt = $_REQUEST['dt'];
    //$dt = ConvertDT($_REQUEST['dt']); 
    $subject = $_REQUEST['subject']; 
    $product = $_REQUEST['product']; 
    $volume = $_REQUEST['value']; 

    $sql="";

    // Изменение записи
    if ($oper == 'edit') {
        $product_id = Lookup('products', 'name', $product, 'id');
        $sql = "UPDATE storage.base_operations" . 
            " SET subject_id = $product, storage_id = $subject, " . 
            "dt = '$dt', volume = $volume" .
            " WHERE id = $id;";
    }

    // Удаление записи
    if ($oper == 'del') {
        $sql = 'DELETE FROM storage.base_operations WHERE id =' . $id;
    }

    // Добавлениие новой записи
    if ($oper == 'add') {
        $sql = "INSERT INTO storage.base_operations" . 
            " (id, ln, dt, subject_id, storage_id, volume)" .
            " VALUES (" .
                " nextval('storage.operations_complex_id_seq'::regclass)," . 
                " -1," . 
                sprintf("'%s', %s, %s, %f", $dt, $product, $subject, $volume) . 
                ");"; 

    }
    echo $sql;

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
