<?php

/**
 * Набор функций для работы с базой данных
 * php version 7
 * 
 * @category Ajax_DB_JqGrid
 * @package  Storage
 * @author   Key Sansa <keysansa@yandex.ru>
 * @license  MIT license (http://www.opensource.org/licenses/mit-license)
 * @link     http://key10.ru
 */

const S_ERR_CREATE_CONN = "Create connection error, because: ";
const S_ERR_EXEC_QRY = "Execute query error, because: ";

/**
 * Возвращает соединение с базой данных
 *
 * @return PDO
 */
function getDataBase(): PDO 
{
    $dsn = 'pgsql:dbname=metall;host=127.0.0.1';
    $dbuser = 'sansa';
    $dbpass = 'Tr320exs';

    $connection = new PDO($dsn, $dbuser, $dbpass);
    if (!$connection) {
        die(S_ERR_CREATE_CONN . print_r($connection->errorInfo(), true));
    } else {
        return $connection;
    }
}
   
/**
 * Возвращает число строк, возвращаемых указанным ограничением where.
 *
 * @param string $table Таблица для запроса.
 * @param string $where Ограничение выборки
 * 
 * @return integer Число возвращаемых запросом записей
 */
function getRecordCount(string $table, string $where = null):int
{
    $connection = GetDataBase();
    $sql = 'SELECT COUNT(*) FROM ' . $table;
    if ($where) {
        $sql = $sql . ' WHERE ' . $where;
    }
    //echo $sql;
    $res = $connection->query($sql);
    if (!$res) {
        die(S_ERR_EXEC_QRY . print_r($connection->errorInfo(), true));
    } else {
        return $res->FetchColumn();
    }
}

/**
 * Поиск значения по набору данных
 *
 * @param string $tab    Таблица для поиска
 * @param string $fld    Поле для поиска
 * @param string $val    Значение, которое нужно найти
 * @param string $resfld Поле, значение которого необходимо вернуть
 * 
 * @return string
 */
function lookup(string $tab, string $fld, string $val, string $resfld = 'id'):string 
{
    $sql = "SELECT $resfld FROM $tab WHERE $fld = '$val'";
    $con = getDataBase();
    $res = $con->query($sql);
    if (!$res) {
        die(S_ERR_EXEC_QRY . print_r($con->errorInfo(), true));
    } else {
        return $res->FetchColumn();
    }
}

/**
 * Выполнить SQL запрос и вернуть набор данных
 *
 * @param string $sql SQL запрос для выполнения
 * 
 * @return PDOStatement
 */
function getDBResult(string $sql): PDOStatement 
{
    $con = getDataBase();
    $res = $con->query($sql);
    if (!$res) {
        die(S_ERR_EXEC_QRY . print_r($con->errorInfo(), true));
    } else {
        return $res;
    }
}

/**
 * Выполнить SQL запрос без возвращения результата
 *
 * @param string $sql SQL запрос для выполнения
 * 
 * @return bool true при успешном выполнении, false в обратном случае
 */
function execSQL(string $sql):bool 
{
    $con = GetDataBase();
    $res = $con->exec($sql);
    if (!$res) {
        die(S_ERR_EXEC_QRY . print_r($con->errorInfo(), true));
        return false;
    } else {
        return true;
    }
}
  
/**
 * Прочитать SQL запрос из файла
 *
 * @param string $filename Имя файла, содержащего SQL запрос
 * @param array  $args     Параметры функции sprintf для подставления в только что 
 *                         прочитанный запрос
 * 
 * @return string SQL запрос, прочитанный из файла
 */
function getSQLFromFile(string $filename, array $args = array()): string
{
    $handle = fopen($filename, "r");
    $sql = fread($handle, filesize($filename));
    fclose($handle);  
    return sprintf($sql, $args);
}

/**
 * Преобразование даты из "человеческого" вида в вид, понимаемый postgresql
 *
 * @param string $dt Дата для преобразования
 * 
 * @return string Строка, содержащая дату, подготовленную для использования
 *                в запросах
 */
function convertDT(string $dt): string 
{
    $spstr = explode('.', $dt);
    return $spstr[2] . '-' . $spstr[1] . '-' . $spstr[0];
}

?>
