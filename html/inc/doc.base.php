<?php

require_once 'libs/tcpdf/tcpdf.php';

class exBaseDocument extends TCPDF
{
  
    var $PrintOnlyData = false;     // При true выводятся только данные. Без формы.
    var $FontName = 'Georgia';      // Основной шрифт документа.
    var $FontSize = '12';           // Основной размер шрифта.      
  
    var $DocNumber;
    var $DocDate;  

    function header() {
        $this->SetAuthor('ООО "ПКФ Стройбетон"');
        $this->SetTitle($this->conv('Товарно-транспортная накладная'));
        $this->SetCreator('GDisp project (c)2010 Key Sansa');
        $this->SetTextColor(0, 0, 0);
        $this->SetLeftMargin(20);
        $this->SetRightMargin(10);
        $this->SetTopMargin(10);
//				$this->AddFont('LiberationSans','', '90610cf33796b31b35c9e81b9be64d5d_liberationsans-regular.php');
//				$this->AddFont('Georgia','', 'georgia.php');
//				$this->SetFont($this->FontName, '', $this->FontSize);
        $this->SetDisplayMode('default', 'single');
    }

    /**
     * Конвертирует строку из UTF-8 в CP-1251
     *
     * @param string $in Входна строка в кодировке UTF8
     * 
     * @return string  Строка, в кодировке CP1251   
     */
    function conv(string $in): string 
    {
        return iconv('UTF-8', 'CP1251', $in);
    }

    /**
     * Write Caption. Выводит подпись переменной
     *
     * @param [type] $w
     * @param [type] $h
     * @param string $cap Подпись переменной
     * 
     * @return void
     */
    function wc($w, $h, string $cap) 
    {
        $this->SetTextColor(0, 0, 0);
        $this->SetFontSize(8);
        $s = "";
        if (!$this->PrintOnlyData) {
            $s = $this->conv($cap);
        }
        $this->Cell($w, $h, $s, 0, 0, 'L');
    }

    /**
     * Write Value. Выводит значение переменной в документ
     *
     * @param [type] $w
     * @param string $h
     * @param string $val
     * @param string $desc
     * 
     * @return void
     */
    function wv($w, string $h, string $val, string $desc) {
        $this->SetTextColor(0, 0, 0);
        $this->SetDrawColor(0, 0, 0);
        $this->SetFontSize(9);
        $dx = $this->GetX();
        $dy = $this->GetY() + ($h - 0.5);
        $l = '';
        if (!$this->PrintOnlyData) {
            $l = 'B';
        }
      
        $this->Cell($w, $h, $this->conv($val), $l, 0, 'C');
      
        if (!$this->PrintOnlyData) {
            $x = $this->GetX();
            $y = $this->GetY();
            $this->SetFontSize(5);
            $this->SetXY($dx, $dy);
            $this->Cell($w, 3, $this->conv($desc), 0, 0, 'C');
            $this->SetFontSize(9);
            $this->SetXY($x, $y);
        }
    }

    /**
     * Write Var with Caption. Функция последовательно вызывает wc и wv
     *
     * @param [type] $cw
     * @param [type] $vw
     * @param string $h
     * @param string $cap
     * @param string $val
     * @param string $desc
     * @return void
     */
    function wvwc($cw, $vw, $h, string $cap, $val, $desc)
    {
        $this->wc($cw, $h, $cap);
        $this->wv($vw, $h, $val, $desc);
    }


    /**
     * Write header cell. Выводит ячейку заголовка таблицы
     *
     * @param [type] $w
     * @param [type] $h
     * @param string $text
     * 
     * @return void
     */
    function whc($w, $h, string $text) 
    {
        $cy = $this->GetY();
        $cx = $this->GetX();
        $s = "";
        if (!$this->PrintOnlyData) {
            $s = $this->conv($text);
        }
        $this->MultiCell($w, $h, $s, 1, 'C');
        $this->SetY($cy);
        $this->SetX($cx + $w);
    }

    /**
     * Write Data Cell. Выводит ячейку данных страницы
     *
     * @param [type] $w
     * @param [type] $h
     * @param string $val
     * 
     * @return void
     */
    function wdc($w, $h, string $val)  {
        $this->Cell($w, $h, $this->conv($val), 1, 0, 'C');
    }

}
?>
