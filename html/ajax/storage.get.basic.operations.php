<?php

/**
 * Геттер для реестра базовых операций
 * php version 7
 * 
 * @category Ajax_DB_JqGrid
 * @package  Storage
 * @author   Key Sansa <keysansa@yandex.ru>
 * @license  MIT 
 * @link     http://key10.ru
 */

require '../classes/ajax/ajax.getter.custom.php';

/**
 * Геттер для реестра базовых операций
 * 
 * @category Ajax_DB_JqGrid
 * @package  Storage
 * @author   Key Sansa <keysansa@yandex.ru>
 * @license  MIT 
 * @link     http://key10.ru
 */
class StorageOperationBasicGetter extends StorageCustomAjaxDBGetter
{
    var string $df;
    var string $dt;

    /**
     * Undocumented function
     *
     * @return string
     */
    function getWhereCause(): string
    {
        return "(dt BETWEEN '$this->df' AND '$this->dt') AND (volume <> 0)";
    }

    /**
     * Возвращает имя таблицы для выборки данных
     *
     * @return string
     */
    function getTableName(): string
    {
        return "storage.v_operations_all";
    }

    /**
     * Возвращает список полей для выборки
     *
     * @return string
     */
    function getFields(): string
    {
        return "id, dt, caption, product, volume";
    }

    /**
     * Возвращает имя таблицы для выборки данных
     *
     * @param mixed $post Переменные _POST
     * 
     * @return void
     */
    function doSetPOST($post)
    {
        $this->df = ConvertDT($post['df']); // Начало периода
        $this->dt = ConvertDT($post['dt']); // Окончание периода
    }

    /**
     * Обработка строки запроса
     *
     * @param int   $n Порядковый номер обрабатываемой записи (нужно для тех 
     *                 случаев, когда ID записи не возвращается, например, 
     *                 при агрегатных функциях в запросе)
     * @param mixed $r Массив, содержащий данные из БД
     * 
     * @return void
     */
    function doProcessRow(int $n, $r)
    {
        $rc['id'] = $r[0];
        $rc['cell'] = array(
            date('d.m.Y', strtotime($r[1])),
            $r[2],
            $r[3],
            $r[4]
        );
        $this->ares->rows[] = $rc;
    }
}

$getter = new StorageOperationBasicGetter();

$getter->setPost($_REQUEST);

echo $getter->getData();

?>
