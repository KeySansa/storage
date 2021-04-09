<?php

/**
 * Геттер для реестра операций
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
 * Геттер для реестра операций
 *
 * @category Ajax_DB_JqGrid
 * @package  Storage
 * @author   Key Sansa <keysansa@yandex.ru>
 * @license  MIT License (http://www.opensource.org/licenses/mit-license) 
 * @link     http://key10.ru
 */
class StorageOperationComplexListGetter extends StorageCustomAjaxDBGetter
{
    var string $df;
    var string $dt;

    /**
     * Возвращает ограничение выборки
     *
     * @return string
     */
    function getWhereCause(): string
    {
        return "((dt >= '$this->df') AND (dt <= '$this->dt'))";
    }

    /**
     * Возвращает имя таблицы для выборки данных
     *
     * @return string
     */
    function getTableName(): string
    {
        return "storage.v_op_cmpx";
    }

    /**
     * Возвращает список полей для выборки
     *
     * @return string
     */
    function getFields(): string
    {
        return "id, dt::date, sender, recipient, product, inp, rec, out";
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
            $r[0],
            $r[1],
            $r[2],
            $r[3],
            $r[4],
            $r[5],
            $r[6],
            $r[7]
        );
        $this->ares->rows[] = $rc;
    }
}

$getter = new StorageOperationComplexListGetter();

$getter->setPost($_REQUEST);

echo $getter->getData();

?>
