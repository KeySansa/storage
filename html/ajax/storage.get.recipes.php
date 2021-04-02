<?php

/**
 * Геттер для справочника продукции
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
 * Геттер для справочника рецептов
 *
 * @category Ajax_DB_JqGrid
 * @package  Storage
 * @author   Key Sansa <keysansa@yandex.ru>
 * @license  MIT License (http://www.opensource.org/licenses/mit-license) 
 * @link     http://key10.ru
 */
class StorageRecipeGetter extends StorageCustomAjaxDBGetter
{
    var int $product_id;

    /**
     * Возвращает ограничение выборки
     *
     * @return string
     */
    function getWhereCause(): string
    {
        if ($this->product_id) {      // Если указан продукт...
            // Выбираем рецепты только этого продукта
            return "product_id = $this->product_id";
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
        return "v_recipes";
    }

    /**
     * Возвращает список полей для выборки
     *
     * @return string
     */
    function getFields(): string
    {
        return "id, product_id, component, volume";
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
        if (isset($post['product_id'])) {
            $this->product_id = $post['product_id'];
        } else {
            $this->product_id = -1;
        }
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
        $rc['cell'] = array(
            $r[1],
            $r[2],
            $r[3]
        );
        $this->ares->rows[] = $rc;
    }
}

$getter = new StorageRecipeGetter();

$getter->setPost($_REQUEST);

echo $getter->getData();
?>
