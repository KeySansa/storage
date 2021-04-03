<?php

/**
 * Геттер для отчета остатков с группировкой по продукции
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
 * Геттер для отчета остатков с группировкой по продукции
 *
 * @category Ajax_DB_JqGrid
 * @package  Storage
 * @author   Key Sansa <keysansa@yandex.ru>
 * @license  MIT License (http://www.opensource.org/licenses/mit-license) 
 * @link     http://key10.ru
 */
class StorageRestByProductGetter extends StorageCustomAjaxDBGetter
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
        return "storage.v_rest_by_product";
    }

    /**
     * Возвращает список полей для выборки
     *
     * @return string
     */
    function getFields(): string
    {
        return "product, volume";
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
            $r['product'],
            $r['volume']
        );
        $this->ares->rows[] = $rc;
    }
}

$getter = new StorageRestByProductGetter();

$getter->setPost($_REQUEST);

echo $getter->getData();

?>