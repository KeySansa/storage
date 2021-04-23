<?php

/**
 * Геттер для отчета брака с группировкой по продукции
 * php version 7
 *
 * @category Ajax_DB_JqGrid
 * @package  Storage
 * @author   Key Sansa <keysansa@yandex.ru>
 * @license  MIT License (http://www.opensource.org/licenses/mit-license)
 * @link     http://key10.ru
 */

require '../classes/ajax/ajax.getter.custom.php';

/**
 * Геттер для отчета брака с группировкой по продукции
 *
 * @category Ajax_DB_JqGrid
 * @package  Storage
 * @author   Key Sansa <keysansa@yandex.ru>
 * @license  MIT License (http://www.opensource.org/licenses/mit-license) 
 * @link     http://key10.ru
 */
class StorageRecycleByProductGetter extends StorageCustomAjaxDBGetter
{

    /**
     * Возвращает ограничение выборки
     *
     * @return string
     */
    function getWhereCause(): string
    {
        return "";
    }

    /**
     * Возвращает имя таблицы для выборки данных
     *
     * @return string
     */
    function getTableName(): string
    {
        return "storage.v_rest_recycle";
    }

    /**
     * Возвращает список полей для выборки
     *
     * @return string
     */
    function getFields(): string
    {
        return "recipient, product, recycle";
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
        $rc['id'] = $n;
        $rc['cell'] = array(
            $r['id'] = $n,
            $r['recipient'],
            $r['product'],
            $r['recycle']
        );
        $this->ares->rows[] = $rc;
    }
}

$getter = new StorageRecycleByProductGetter();

$getter->setPost($_REQUEST);

echo $getter->getData();

?>