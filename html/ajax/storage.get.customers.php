<?php

/**
 * Геттер для справочника контрагентов
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
 * Геттер для справочника контрагентов
 *
 * @category Ajax_DB_JqGrid
 * @package  Storage
 * @author   Key Sansa <keysansa@yandex.ru>
 * @license  MIT License (http://www.opensource.org/licenses/mit-license) 
 * @link     http://key10.ru
 */
class StorageCustomerGetter extends StorageCustomAjaxDBGetter
{
    var int $parent_id;

    /**
     * Возвращает ограничение выборки
     *
     * @return string
     */
    function getWhereCause(): string
    {
        if ($this->parent_id) {      // Если указан родитель...
            // Выбираем рецепты только этого родителя
            return "parent_id = $this->parent_id";
        } else { //
            return '';
        }
    }

    /**
     * Возвращает имя таблицы для выборки данных
     *
     * @return string
     */
    function getTableName(): string
    {
        return "v_customers";
    }

    /**
     * Возвращает список полей для выборки
     *
     * @return string
     */
    function getFields(): string
    {
        return "id, short_name, name, prd, parent_id, parent";
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
        $this->parent_id = $post['parent'];
    }

    /**
     * Обработка строки запроса
     *
     * @param mixed $r Массив, содержащий данные из БД
     *
     * @return void
     */
    function doProcessRow($r)
    {
        $rc['id'] = $r[0];
        $p = 'Да';
        if ($r[3] == "f") {
            $p = 'Нет';
        }
        $rc['cell'] = array(
            $r[0],
            $r[1],
            $r[2],
            $p,
            $r[4],
            $r[5]
        );
        $this->ares->rows[] = $rc;
    }
}

$getter = new StorageCustomerGetter();

$getter->setPost($_REQUEST);

echo $getter->getData();

?>
