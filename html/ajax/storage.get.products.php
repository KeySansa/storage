<?php

/**
 * Геттер для справочника продукции
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
 * Геттер для таблицы продукции
 * 
 * @category Ajax_DB_JqGrid
 * @package  Storage
 * @author   Key Sansa <keysansa@yandex.ru>
 * @license  MIT 
 * @link     http://key10.ru
 */
class StorageProductGetter extends StorageCustomAjaxDBGetter
{

    /**
     * Undocumented function
     *
     * @return string
     */
    function getWhereCause(): string
    {
        return '';
    }

    /**
     * Возвращает имя таблицы для выборки данных
     *
     * @return string
     */
    function getTableName(): string
    {
        return "products";
    }

    /**
     * Возвращает список полей для выборки
     *
     * @return string
     */
    function getFields(): string
    {
        return "id, short_name, name";
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
        $rc['id'] = $r[0];
        $rc['cell'] = array(
            $r[0],
            $r[1],
            $r[2]
        );
        $this->ares->rows[] = $rc;
    }
}

$getter = new StorageProductGetter();

$getter->setPost($_REQUEST);

echo $getter->getData();
  
?>
