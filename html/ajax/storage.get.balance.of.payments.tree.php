<?php

require_once "../inc/func.database.php";

//******************************************************************************
//*
//*                     Получение переменных запроса
//*
//******************************************************************************
$page = $_REQUEST['page']; // номер извлекаемой страницы
$limit = $_REQUEST['rows']; // сколько строк извлекать
$sidx = $_REQUEST['sidx']; // индекс столбца для сортировки
$sord = $_REQUEST['sord']; // Порядок сортировки
//  $dt = $_REQUEST['dt']; // Окончание периода
if (!$sidx) {       // Столбец сортировки
    $sidx = 'storage';       // Если не указан, то 1
}
if (!$limit) {      // Количество записей
    $limit =30;     // Если не указано, то 30
}
if (!$page) {       // Номер страницы
    $page =0;       // Если не указано, то сначала
}

//******************************************************************************
//*
//*                      Ограничение выборки
//*
//******************************************************************************
  
  // По дате
//  $where = " ((dt >= '$dt') AND (dt <= '$dt')) ";

//******************************************************************************
//*
//*                      Подключаемся к DB 
//*
//******************************************************************************
  
$group = "GROUP BY storage, product ";

$from ="storage.v_operations_list";
  
//******************************************************************************
//*
//*                      Разбивка на страницы
//*
//******************************************************************************
  // Общее число записей в результате
$sql = "SELECT COUNT(*) AS count " .
    " FROM (SELECT COUNT(storage) FROM $from) AS s";
$res = GetDBResult($sql);
if (!$res) {
      die("Execute query error, because: ". print_r($connection->errorInfo(), true));
}

$count = $res->FetchColumn();
  
// Количество страниц
if (($count) && ($limit)) {
    $total_pages = ceil($count/$limit); 
} else { 
    $total_pages = 0; 
} 
  
// Проверка, что запрашиваемая страница меньше числа страниц
if ($page > $total_pages) {
    $page=$total_pages; 
}
  
// Номер первой записи результата
$start = $limit * $page - $limit; 
  
// Возвращаем данные о страницах и числе записей
$ares->page = $page; 
$ares->total = $total_pages; 
$ares->records = $count; 

// Устанавливаем ограничение на число записей в БД
$lim = ' LIMIT ' . $limit . ' OFFSET ' . $start;
  
//******************************************************************************
//*
//*                            Сортировка
//*
//******************************************************************************
$order = " ORDER BY storage, product";
  
//******************************************************************************
//*
//*                      Выборка данных из БД
//*
//******************************************************************************
$sql = "SELECT storage, product, sum(COALESCE(volume, 0)) FROM $from $group $order ";
  
$res = GetDBResult($sql);
//  var_dump($res);
$n = 1;
$vol = 0;
foreach ($res as $row) {
    $vol = $row[2];
    if ($vol != 0) {
        $ar['id']=$n;
        $ar['cell']=array(
            $row[0],
            $row[1],
            $row[2]
        );
        $n++;
        $ares->rows[] = $ar;
    }
}
//  echo $sql;
echo json_encode($ares);
  
?>
