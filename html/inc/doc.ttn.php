<?php

/**
 * Базовый класс товарно-транспортной накладной
 * php version 7
 * 
 * @category Ajax_DB_JqGrid
 * @package  Storage
 * @author   Key Sansa <keysansa@yandex.ru>
 * @license  MIT 
 * @link     http://key10.ru
 */

require_once 'doc.base.php';

/**
 * Undocumented class
 */
abstract class exDocTTN extends exBaseDocument
{
    var $CarNumber;        // Гос номер автотранспорта
    var $CarModel;         // Модель автотранспорта
   
    var $TransporterName;  // Наименование автопредприятия
    var $Driver;           // ФИО Водителя
    var $TransporterType;  // Вид перевозки
  
    var $PayerName;        // Наименование плательщика
    var $LoaderName;       // Наименование грузоотправителя
    var $CustomerName;     // Наименование грузополучателя
   
    var $LoadPoint;         // Пункт погрузки
    var $UnloadPoint;       // Пункт отгрузки
    var $Readdress;         // Переадресация
    var $FirstPricep;       // Первый прицеп
    var $SecondPricep;      // Второй прицеп
    var $SumPropis;         // Отпущено на сумму
    var $OtpuskRazreshil;   // Отпуск разрешил
    var $BruttoPropis;      // Брутто прописью
    var $WaybillType;       // Тип накладной (0 - доставка, 1 - самовывоз)
   
    var $tabCodes = array();
    var $tabPrejs = array();
    var $tabProducts = array();
    var $tabUnits = array();
    var $tabVolumes = array();
    var $tabPrices = array();
    var $tabSums = array();
    var $tabDocs = array();
    var $tabUpaks = array();
    var $tabPlaces = array();
    var $tabSMasses = array();
    var $tabPrCodes = array();
    var $tabPrClasses = array();
    var $tabBruttos = array();
   
    var $TableHeader = array(
          array (18, "Номинкл. №\nкод"),
          array (17, "№ прейск.\nпозиции"),
          array (60, "Наименование продукта и товара (груза)\nили номера контейнеров"), 
          array (12, "Един.\nизмер."), 
          array (15, "Коли-\nчество"),
          array (10, "Цена\n "),
          array (17, "Сумма\n "),
          array (24, "С грузом следуют\nдокументы"), 
          array (15, "Вид\nупаков."), 
          array (10, "Кол.\nмест"),
          array (22, "Способ опред.\nмассы"), 
          array (10, "Код\nгруза"), 
          array (10, "Класс\nгруза"),
          array (20, "Масса\nбрутто")
       );

    /**
     * Write Data Row
     *
     * @param  [type] $h
     * @param  [type] $header
     * @param  [type] $
     * 
     * @return void
     */
    function wdr($h, $header, $n)
    {
        $k = 0;
        $val = "y";
        foreach ($header as $col) {
            switch ($k) {
            case 0: $val = $this->tabCodes[$n]; 
                break;
            case 1: $val = $this->tabPrejs[$n]; 
                break;
            case 2: $val = $this->tabProducts[$n]; 
                break;
            case 3: $val = $this->tabUnits[$n]; 
                break; 
            case 4: $val = $this->tabVolumes[$n]; 
                break; 
            case 5: $val = $this->tabPrices[$n]; 
                break; 
            case 6: $val = $this->tabSums[$n]; 
                break; 
            case 7: $val = $this->tabDocs[$n]; 
                break; 
            case 8: $val = $this->tabUpaks[$n]; 
                break; 
            case 9: $val = $this->tabPlaces[$n]; 
                break; 
            case 10: $val = $this->tabSMasses[$n]; 
                break; 
            case 11: $val = $this->tabPrCodes[$n]; 
                break; 
            case 12: $val = $this->tabPrClasses[$n]; 
                break; 
            case 13: $val = $this->tabBruttos[$n]; 
                break; 
            }
            $this->wdc($col[0], $h, $val);
            $k = $k + 1;
        }
        $this->Ln();
    }

    /**
     * Undocumented function
     *
     * @return void
     */
    function template() 
    {

        $this->SetTextColor(0, 0, 0);
        $this->SetDrawColor(0, 0, 0);
    
        $this->SetFontSize(6);
        $this->Text(20, 20, $this->conv("1-й эк.: - грузоотправителю"));
        $this->Text(20, 23, $this->conv("2-й эк.: - грузополучателю"));
        $this->Text(20, 26, $this->conv("3-й эк.: - автопредприятию"));
    
        $this->Text(173, 20, $this->conv("Типовая междуведомственная форма № 1-Т"));
        $this->Text(173, 23, $this->conv("Утверждена Минфином СССР и ЦСУ СССР 1983г."));
        $this->SetFontSize(8);
        $this->Text(173, 28, $this->conv("Серия           ОЛ"));
        $this->Text(165, 40, $this->conv("№" . $this->DocNumber . " от " . $this->DocDate));
    
        $this->SetFontSize(10);
        $this->Text(162, 34, $this->conv('ТОВАРНО-ТРАНСПОРТНАЯ НАКЛАДНАЯ'));
      
        $this->SetFontSize(8);
        $this->Rect(235, 15, 45, 25, 'D');
        
        $x = 20;
        $y = 45;
        $h = 4;
        $ln = $h + 2;
        $this->SetXY($x, $y);
        $this->wvwc(105, 70, $h, "Автомобиль", $this->CarModel . " " . $this->CarNumber, "марка, гос. №");
        $this->wc(50, $h, "к путевому листу № ");
        $this->Cell(25, $ln, "", 1);
        $this->Ln($ln);
    
        $this->wvwc(25, 65, $h, "Автопредприятие", $this->TransporterName, "наименование");
        $this->wvwc(15, 55, $h, "Водитель", $this->Driver, "ф.и.о.");
        $this->wvwc(20, 45, $h, "Вид перевозки", $this->TransporterType, "");
        $this->wc(10, $h, "код");
        $this->Cell(25, $ln, "", 1);
        $this->Ln($ln);
    
        $this->wvwc(35, 190, $h, "Заказчик (плательщик)", $this->PayerName, "наименование");
        $this->wc(10, $h, "код");
        $this->Cell(25, $ln, "", 1);
        $this->Ln($ln);
    
        $this->wvwc(35, 190, $h, "Грузоотправитель", $this->LoaderName, "наименование");
        $this->wc(10, $h, "код");
        $this->Cell(25, $ln, "", 1);
        $this->Ln($ln);
    
        $this->wvwc(35, 190, $h, "Грузополучатель", $this->CustomerName, "наименование");
        $this->wc(10, $h, "код");
        $this->Cell(25, $ln, "", 1);
        $this->Ln($ln);
    
        $this->wvwc(25, 80, $h, "Пункт погрузки", $this->LoadPoint, "адрес");
        $this->wvwc(35, 75, $h, "Пункт отгрузки", $this->UnloadPoint, "адрес");
        $this->wc(20, $h, "Маршрут №");
        $this->Cell(25, $ln, "", 1);
        $this->Ln($ln);
    
        $this->wvwc(25, 100, $h, "Переадресовка", $this->Readdress, "наимен. и адрес нового грузоплучат.");
        $this->wvwc(15, 80, $h, "1. Прицеп", $this->FirstPricep, "гос. №");
        $this->wc(15, $h, "Гар. №");
        $this->Cell(25, $ln, "", 1);
        $this->Ln($ln);
    
        $this->wv(125, $h, "", "подпись отв. лица");
        $this->wvwc(15, 80, $h, "2. Прицеп", $this->SecondPricep, "гос. №");
        $this->wc(15, $h, "Гар. №");
        $this->Cell(25, $ln, "", 1);
        $this->Ln($ln);

        $this->Ln(2);
        $this->Cell(260, $h - 1, $this->conv("СВЕДЕНИЯ О ГРУЗЕ"), 1, 0, 'C');
        $this->Ln();
    
        $this->SetFontSize(7);
        foreach ($this->TableHeader as $col) {
            $this->whc($col[0], $h - 2, $col[1]);
        }
        $this->Ln(($h) * 2);
    
        $k = 1;    
        foreach ($this->TableHeader as $col) {
            $this->whc($col[0], $h - 3, "$k");
            $k = $k + 1;
        }
        $this->Ln();

        for ($i=0; $i<8; $i++) {
            $this->wdr($h, $this->TableHeader, $i);
        }    
    
        $this->wdc(18 + 17 + 60, $h, "Итого : ");
        $this->wdc($this->TableHeader[3][0], $h, "");
        $this->wdc($this->TableHeader[4][0], $h, "");
        $this->wdc(10, $h, "");
        $this->wdc(17, $h, "");
        $this->wdc(24, $h, "");
        $this->wdc(15, $h, "");
        $this->wdc(10, $h, ""); //B
        $this->Cell(22, $h, $this->conv("Кол. ездок"), 0, 0, 'C');  
        $this->Cell(10, $h, "", 1, 0, 'C'); //B
        $this->Cell(10, $h, "", 1, 0, 'C');
        $this->Cell(20, $h, "", 1, 0, 'C'); //B
        $this->Ln();
        $this->Ln($ln);
    
        $fy = $this->GetY();
        $this->wvwc(35, 92, $h, "Всего отпущено на сумму", $this->SumPropis, "прописью");
        $this->Ln($ln);

        $this->wvwc(40, 50, $h, "Указаный груз за испр. пломбой, маркой и упаковкой", "", "оттиск");
        $this->wvwc(15, 22, $h, "Кол мест", "одно", "прописью");
        $this->Ln($ln);

        $this->wvwc(25, 85, $h, "Массой брутто", $this->BruttoPropis, "прописью");
        $this->wc(17, $h, "к поездке");
        $this->Ln($ln);

        $this->wvwc(10, 117, $h, "Сдал", $this->OtpuskRazreshil, "должность, ф.и.о., подпись, штамп");
        $this->Ln($ln);

        $this->wvwc(42, 85, $h, "Принял водитель-экспедитор", $this->Driver, "ф.и.о. водит., подпись");
        $this->Ln($ln);
    
        $this->SetY($fy);

        $this->SetX(23 + 120);
        $this->wvwc(25, 102, $h, "Отпуск разрешил", $this->OtpuskRazreshil, "должность, подпись");
        $this->Ln($ln);

        $this->SetX(23 + 120);
        $this->wvwc(40, 50, $h, "Указаный груз за испр. пломбой, марой и упаковкой",  "", "оттиск");
        $this->wvwc(15, 22, $h, "Кол мест", "одно", "прописью");
        $this->Ln($ln);

        $this->SetX(23 + 120);
        $this->wvwc(25, 85, $h, "Массой брутто",  $this->BruttoPropis, "прописью");
        $this->wc(17, $h, "к поездке");
        $this->Ln($ln);

        $this->SetX(23 + 120);
        $this->wvwc(42, 85, $h, "Сдал  водитель-экспедитор", $this->Driver, "подпись");
        $this->Ln($ln);

        $this->SetX(23 + 120);
        $this->wvwc(13, 114, $h, "Принял", "", "должность, ф.и.о., подпись, штамп");
        $this->Ln($ln);
    }
  
    /**
     * Undocumented function
     *
     * @param string $header Заголовок таблицы
     * @param string $data   Данные таблицы
     * 
     * @return void
     */
    function table(string $header, string $data) 
    {
    
    }
}
?>
