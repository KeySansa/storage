<?php

/**
 * Абстрактный редактор для jqGrid
 * php version 7
 * 
 * @category Ajax_DB_JqGrid
 * @package  Storage
 * @author   Key Sansa <keysansa@yandex.ru>
 * @license  MIT 
 * @link     http://key10.ru
 */

 /**
  * Абстрактный редактор для jqGrid
  * 
  * @category Ajax_DB_JqGrid
  * @package  Storage
  * @author   Key Sansa <keysansa@yandex.ru>
  * @license  MIT 
  * @link     http://key10.ru
  */
abstract class StorageCustomAjaxDBEditor
{
    protected int $oper;

    protected const OP_UNK = 0;
    protected const OP_ADD = 1;
    protected const OP_UPD = 2;
    protected const OP_DEL = 3;


    /**
     * Возвращает SQL для добавления записи
     *
     * @return string
     */
    abstract protected function getAddSql(): string;

    /**
     * Возвращает значения для добавления записи
     *
     * @return array
     */
    abstract protected function getAddValues(): array;

    /**
     * Возвращает SQL для изменения записи
     *
     * @return string
     */
    abstract protected function getUpdSql(): string;

    /**
     * Возвращает значения для изменения записи
     *
     * @return string
     */
    abstract protected function getUpdValues(): string;

    /**
     * Возвращает SQL для удаления записи
     *
     * @return string
     */
    abstract protected function getDelSql(): string;

    /**
     * Возвращает значения для удаления записи
     *
     * @return string
     */
    abstract protected function getDelValues(): string;

    /**
     * Внутренняя обработка переданных переменных (не определенных в базовом классе)
     *
     * @param mixed $post Переменные _POST
     * 
     * @return void
     */
    abstract protected function doSetPOST($post);

    /**
     * Установка POST переменных
     *
     * @param array $post Переменные _POST
     * 
     * @return void
     */
    public function setPost($post)
    {
        //var_dump($post);

        // Определяем операцию, которую необходимо выполнить
        $this->oper = $this->OP_UNK;
        if (isset($post['oper'])) {
            $oper = $post['oper'];
            if ($oper == 'add') {
                $this->$oper = $this->OP_ADD;
            };
            if ($oper == 'edit') {
                $this->$oper = $this->OP_UPD;
            };
            if ($oper == 'del') {
                $this->$oper = $this->OP_DEL;
            };
        }

        // Порядок сортировки
        $this->_sord = '';
        if (isset($post['sord'])) {
            $this->_sord = $post['sord'];
        }

        $this->doSetPOST($post);
    }

}

?>