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
$dt = ConvertDT($_REQUEST['dt']); // Окончание периода
if (!$sidx) {       // Столбец сортировки
    $sidx = 'storage';       // Если не указан, то 1
}

if (!$limit) {       // Количество записей
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
$wdate = " ((dt >= '$dt') AND (dt <= '$dt')) ";
$where = ' WHERE ' . $wdate;

//******************************************************************************
//*
//*                      Подключаемся к DB 
//*
//******************************************************************************


$prdsql = "SELECT count(*) FROM (SELECT DISTINCT (product) FROM storage.v_operations_list) as ct";
  
$res = GetDBResult($prdsql);
    
$nk = $res->fetchColumn();
  
$cols = "";
for ($i = 0; $i < $nk; $i++) {
    $cols .= ", d$i double precision";
}

$from ="crosstab('SELECT storage, product, sum(COALESCE(volume, 0)) 
    FROM storage.v_operations_list GROUP BY storage, product 
    ORDER BY storage, product', 
    'SELECT DISTINCT product FROM storage.v_operations_list ORDER BY product') 
    AS ct (storage varchar $cols)";
  
//******************************************************************************
//*
//*                      Разбивка на страницы
//*
//******************************************************************************
 
// Общее число записей в результате
$sql = "SELECT COUNT(ct.*) AS count FROM $from";
$res = GetDBResult($sql);
    
$count = $res->fetchColumn();
  
// Количество страниц
if (($count) && ($limit) ) { 
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
$order = " ORDER BY $sidx $sord";
  
//******************************************************************************
//*
//*                      Выборка данных из БД
//*
//******************************************************************************

$sql = "SELECT ct.* FROM $from $order $lim";
  
$res = GetDBResult($sql);
//  var_dump($res);
$n = 1;
foreach ($res as $row) {
    $ar['id']=$n; 
    $arc = array();
    for ($i = 0; $i <= $nk; $i++) {
        $arc[] = $row[$i];
    }
    $ar['cell']= $arc;
    $n++;
    $ares->rows[] = $ar;
}
echo json_encode($ares);  
?>
