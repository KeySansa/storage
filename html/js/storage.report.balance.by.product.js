$(document).ready(function() {

    $('#data_table').jqGrid({
        url: 'ajax/storage.get.rest.by.product.php',
        datatype: 'json',
        colNames: ['Код', 'Продукция', 'Остаток'],
        colModel: [{
                name: 'id',
                width: 30
            },
            {
                name: 'product',
                width: 200
            },
            {
                name: 'value',
                width: 60
            }
        ],
        rowNum: 20,
        rowList: [20, 40, 100],
        autowidth: true,
        gridview: true,
        rownumbers: true,
        altRows: true,
        pager: '#data_pager',
        emptyrecords: 'Нет данных',
        height: '100%',
        multiselect: false,
        sortname: 'product',
        viewrecords: true,
        sortorder: 'desc',
        caption: 'Остатки с группировкой по продукции'
    });
});