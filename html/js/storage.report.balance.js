$(document).ready(function() {

    $('#data_table').jqGrid({
        url: 'ajax/storage.get.balance.of.payments.php',
        datatype: 'json',
        colNames: ['Контрагент'
            $capts
        ],
        colModel: [{
                name: 'storage',
                width: 200
            }
            $cols
        ],
        rowNum: 20,
        rowList: [20, 40, 100],
        autowidth: true,
        gridview: true,
        rownumbers: true,
        altRows: false,
        pager: '#data_pager',
        emptyrecords: 'Нет данных',
        height: '100%',
        multiselect: false,
        sortname: 'storage',
        viewrecords: true,
        sortorder: 'desc',
        caption: 'Остатки на складах'
    });
});