<?php 

/**
 * Абстрактный геттер
 * php version 7
 * 
 * @category Ajax_DB_JqGrid
 * @package  Storage
 * @author   Key Sansa <keysansa@yandex.ru>
 * @license  MIT 
 * @link     http://key10.ru
 */

 require '../inc/func.database.php';

/**
 * Абстрактный геттер для jqGrid
 * 
 * @category Ajax_DB_JqGrid
 * @package  Storage
 * @author   Key Sansa <keysansa@yandex.ru>
 * @license  MIT 
 * @link     http://key10.ru
 */
abstract class StorageCustomAjaxDBGetter
{
    
    // Соединение с базой данных
    private PDO $_connection;
    
    // Номер страницы, которую необходимо выбрать
    private int $_page = 0;
    // Число строк для выборки
    private int $_rows = 0;

    private int $_limit = 0;
    // Поля для сортировки
    private string $_sidx = '';
    // Порядок сортировки
    private string $_sord = '';

    // Общее число возвращаемых записей
    private int $_count = 0;
    // Номер записи, с которой будет осуществляться выборка
    private int $_start = 0;
    // Общее количество страниц
    private int $_total_pages = 0;

    protected object $ares;

    /**
     * Осуществляет сборку условий отбора данных в соответствии со
     * стандартом SQL
     *
     * @return string
     */
    abstract protected function getWhereCause(): string;

    /**
     * Возвращает имя таблицы для выборки данных
     *
     * @return string
     */
    abstract protected function getTableName(): string;


    /**
     * Возвращает список полей для выборки
     *
     * @return string
     */
    abstract protected function getFields(): string;

    /**
     * Возвращает имя таблицы для выборки данных
     *
     * @param mixed $post Переменные _POST
     * 
     * @return void
     */
    abstract protected function doSetPOST($post);

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
    abstract protected function doProcessRow(int $n, $r);

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
        $this->_page = 0;
        if (isset($post['page'])) {
            if (is_int((int)$post['page'])) {
                $this->_page = (int)$post['page'];
            }
        }

        $this->_rows = 0;
        if (isset($post['rows'])) {
            if (is_int((int)$post['rows'])) {
                $this->_rows = (int)$post['rows'];
            }
        }

        // Поле для сортировки
        $this->_sidx = '';
        if (isset($post['sidx'])) {
            $this->_sidx = $post['sidx'];
        }

        // Порядок сортировки
        $this->_sord = '';
        if (isset($post['sord'])) {
            $this->_sord = $post['sord'];
        }

        $this->doSetPOST($post);
    }

    /**
     * Возвращает имя пользователя, для подключения к БД
     *
     * @return string
     */
    private function _getDbUserName(): string 
    {
        return "sansa";
    }

    /**
     * Возвращает пароль для подключения к БД
     *
     * @return string
     */
    private function _getDbPasswd(): string 
    {
        return "Tr320exs";
    }

    /**
     * Возвращает адрес сервера БД
     *
     * @return string
     */
    private function _getDbHost(): string 
    {
        return "127.0.0.1";
    }

    /**
     * Возвращает имя базы данных
     *
     * @return string
     */
    private function _getDbName(): string 
    {
        return "metall";
    }

    /**
     * Undocumented function
     *
     * @return PDO
     */
    private function _getConnection(): PDO 
    {
        if (!isset($_connection)) {
            //$connection = new PDO(GetDSN(), GetDBUserName(), GetDBPasswd());
            $_connection = GetDataBase();
        }
        return $_connection;
    }
    
    /**
     * Возвращает число записей, которое должен вернуть запрос
     *
     * @return integer
     */
    protected function getRecordCount(): int 
    {
        $con = $this->_getConnection();
        $tn = $this->getTableName();
        $wh = $this->getWhere();
        $sql = "SELECT COUNT(*) FROM $tn $wh";
        $res = $con->Query($sql);
        if (!$res) {
            die(
                "Counting records error, because: ". print_r($con->errorInfo(), true)
            );
        }
    
        return $res->FetchColumn();
    }


    /**
     * Возвращает строку, содержащую порядок сортировки, согласно формата SQL
     * без ключевого слова WHERE
     * 
     * @return string
     */
    protected function getSortOrder(): string
    {
        if (($this->_sidx)&&($this->_sord)) { 
            return "$this->_sidx $this->_sord";
        } else {
            return '';
        }
    }

    /**
     * Возвращает строку, содержащую условия отбора записей, согласно формата SQL
     * включая ключевое слово WHERE
     * 
     * @return string
     */
    protected function getWhere(): string 
    {
        $w = $this->getWhereCause();
        $wh = '';
        if ($w) {
            $wh = 'WHERE ' . $w;
        }
        return $wh;
    }

    /**
     * Undocumented function
     *
     * @return void
     */
    private function _calcMetrics() 
    {
        // Общее число записей в результате
        $this->_count = $this->getRecordCount(
            $this->getTableName(), $this->getWhereCause()
        );
  
        // Количество страниц
        if ($this->_rows > 0) { 
            $this->_total_pages = ceil($this->_count/$this->_rows); 
        } else { 
            if ($this->_count > 0) {
                $this->_total_pages = 1; 
            } else {
                $this->_total_pages = 0;
            }
        } 
  
        // Проверка, что запрашиваемая страница меньше числа страниц
        if ($this->_page > $this->_total_pages) {
            $_page = $this->_total_pages; 
        }
  
        // Номер первой записи результата
        if ($this->_count > 0) {
            $this->_start = $this->_rows * $this->_page - $this->_rows; 
        }
        $this->_limit = $this->_rows;
    }

    /**
     * Возвращает строку, содержащую ограничение выборки, в формате SQL
     *
     * @return void
     */
    protected function getLimits(): string
    {
        $this->_calcMetrics();
        if ($this->_limit > 0) {
            return "LIMIT $this->_limit OFFSET $this->_start";
        } else {
            return "";
        }
    }

    /**
     * Собирает SQL запрос
     *
     * @return string SQL для запроса
     */
    protected function getSQL(): string 
    {
        $tn = $this->getTableName();

        $fld = $this->getFields();
        
        $w = $this->getWhere();

        $so = '';
        $s = $this->getSortOrder();
        if ($s) { 
            $so = "ORDER BY $s";
        }

        $li = $this->getLimits();

        return "SELECT $fld FROM $tn $w $so $li;";
    }

    /**
     * Обработка запроса к БД и возврат отформатированных данных 
     *
     * @return string
     */
    public function getData(): string 
    {
        $c = $this->_getConnection();        
        
        $sql = $this->getSQL(); 
        //echo $sql;
        $res = $c->Query($sql);
        $n = $this->_start;
        if (!$res) {
            if (!$res) {
                die(
                    "Execute query error, because: ". print_r($c->errorInfo(), true)
                );
            }
        } else {
            $this->ares = new stdClass();
            $this->ares->page = $this->_page;
            $this->ares->total = $this->_total_pages;
            $this->ares->records = $this->_count;
            //var_dump($this);
            foreach ($res as $row) {
                $this->doProcessRow($n, $row);
                $n += 1;
            }
            return json_encode($this->ares);
        }
    }
}
?>