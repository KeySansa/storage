<?php

/**
 * Геттер для реестра корректировок остатков, реализация
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
 * Геттер для справочника рецептов
 *
 * @category Ajax_DB_JqGrid
 * @package  Storage
 * @author   Key Sansa <keysansa@yandex.ru>
 * @license  MIT License (http://www.opensource.org/licenses/mit-license) 
 * @link     http://key10.ru
 */
class StorageRestControlGetter extends StorageCustomAjaxDBGetter
{

    /**
     * Возвращает ограничение выборки
     *
     * @return string
     */
    function getWhereCause(): string
    {
        return "(dt BETWEEN '$this->df' AND '$this->dt') AND (sender_id IS NULL)";
    }

    /**
     * Возвращает имя таблицы для выборки данных
     *
     * @return string
     */
    function getTableName(): string
    {
        return "storage.v_operations";
    }

    /**
     * Возвращает список полей для выборки
     *
     * @return string
     */
    function getFields(): string
    {
        return "id, dt, recipient, subject, volume";
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
    function doProcessRow($n, $r)
    {
        $rc['id'] = $r[0];
        $rc['cell'] = array(
            $r[1],
            $r[2],
            $r[3],
            $r[4]
        );
        $this->ares->rows[] = $rc;
    }
}

$getter = new StorageRestControlGetter();

$getter->setPost($_REQUEST);

echo $getter->getData();
  
?>
