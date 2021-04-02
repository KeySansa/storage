<?php

/**
 * Класс базовой HTML страницы проекта
 * php version 7
 * 
 * @category HTML
 * @package  Base_Classes
 * @author   Key Sansa <keysansa@yandex.ru>
 * @license  MIT 
 * @link     http://key10.ru
 */

require_once 'HTML/Page2.php';

/**
 * Прочитать SQL запрос из файла
 *
 * @param string $filename Имя файла, содержащего HTML вставку
 * @param mixed  $args     Аргументы для форматирования переменных файла 
 * 
 * @return string HTML разметка, прочитанная из файла
 */
function getHTMLFromFile(string $filename, $args): string
{
    $handle = fopen($filename, "r");
    $html = fread($handle, filesize($filename));
    fclose($handle);
    return sprintf($html, $args);;
}


/**
 * Класс базовой страницы проекта
 *
 * @category Project_Pages
 * @package  Storage
 * @author   Key Sansa <keysansa@yandex.ru>
 * @license  MIT License (http://www.opensource.org/licenses/mit-license) 
 * @link     http://key10.ru
 */
abstract class BasePage extends HTML_Page2
{

    /**
     * Конструктор класса
     */
    function __construct() 
    {
        parent::__construct();
        $this->setCharset('UTF-8');
        $this->setupMetadata(); 
        $this->setupHeader();
        $this->constructBody();

    }
    
    /**
     * Установка метаданных страницы
     *
     * @return void
     */
    function setupMetadata() 
    {
        $this->setMetaData('author', 'Key Sansa');
    }

    /**
     * Настройки заголовка страницы
     *
     * @return void
     */
    function setupHeader() 
    {
        $this->setupHeaderStyles();
        $this->setupHeaderScripts();
    }
    
    /**
     * Настройка таблицы стилей
     *
     * @return void
     */
    function setupHeaderStyles() 
    {
        $this->addStyleSheet('css/south-street/jquery-ui.css');
    }
    
    /**
     * Настройка JS скриптов страницы
     *
     * @return void
     */
    function setupHeaderScripts() 
    {
        $this->addScript('js/jquery.js');
        $this->addScript('js/i18n/jquery.ui.datepicker-ru.js');
        $this->addScript('js/jquery-ui.js');
    }

    /**
     * Формирование тела страницы
     *
     * @return void
     */
    abstract function constructBody();
}  
?>
