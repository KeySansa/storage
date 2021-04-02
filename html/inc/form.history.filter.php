<?php
/**
 * Набор функций и классов для для фильтрации данных, возвращаемых из БД
 * php version 7
 * 
 * @category Ajax_DB_JqGrid
 * @package  Storage
 * @author   Key Sansa <keysansa@yandex.ru>
 * @license  MIT 
 * @link     http://key10.ru
 */

  require_once 'HTML/QuickForm.php';
  require_once 'func.database.php';

/**
 * Проверка периода на то, что его начало раньше, чем окончание
 *
 * @param array $period Структурированный массив "период"
 * 
 * @return void
 */
function checkPeriodDFloeDT($period) {
    return (strtotime($period['dt']) >= strtotime($period['df']));
}

/**
 * Undocumented class
 */
class HistoryFilterForm extends HTML_QuickForm {
    
    /**
     * Конструктор класса
     */
    function __construct() {
        parent::__construct('historyfilter', 'get');

        $plant_list_sql = 'SELECT id, name FROM rbu_history.plants ORDER BY id';

        $this->setDefaults(
            array(
                'period[df]'   => date('d.m.Y'),
                'period[dt]'   => date('d.m.Y'),
                'plant_id'  => 0
              )
        );

        $res = GetDBResult($plant_list_sql);

        $plants[] = '- ВСЕ -';
        foreach ($res as $row) {
            $plants[] =  $row['id'];
        }

        $this->addElement(
            'select', 'plant', 'Завод: ', $plants, 
            array('class' => 'ui-widget', 'id' => 'plant', 'tabindex' => '1')
        );

        // Фильтр периода отображения
        $dates[]= &HTML_QuickForm::createElement(
            'text', 
            'df', 
            null, 
            array(
                'autocomplete' => "off", 
                'class' => 'ui-widget', 
                'id' => 'df', 
                'tabindex' => '2'
            )
        );
        $dates[]= &HTML_QuickForm::createElement(
            'text', 
            'dt', 
            null, 
            array(
                'autocomplete' => "off", 
                'class' => 'ui-widget', 
                'id' => 'dt', 
                'tabindex' => '3'
            )
        );
        $this->addGroup($dates, 'period', 'Вывод за период : ', '&nbsp;');
        $this->addGroupRule(
            'period', 
            array(
                'df' => array(
                    array(
                        'Необходимо ввести дату начала периода', 
                        'required', 
                        null, 
                        'client'
                    )
                ),
                'dt' => array(
                    array(
                        'Необходимо ввести дату окончания периода', 
                        'required', 
                        null, 
                        'client'
                    )
                )
            )
        );

        $this->registerRule('_CheckPeriodDFloeDT', 'callback', 'CheckPeriodDFloeDT');
        $this->addRule(
            'period', 
            'Дата окончания периода должна быть больше или равна дате начала', 
            'CheckPeriodDFloeDT'
        );

        $this->addElement(
            'submit', 
            null, 
            'Обновить', 
            array('class' => 'ui-priority-primary', 'id' => 'submit')
        );
    }
}

?>
