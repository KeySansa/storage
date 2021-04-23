$(document).ready(function() {

    $('#data_table').jqGrid({
        url: 'ajax/storage.get.recycle.by.product.php',
        datatype: 'json',
        colNames: ['Код', 'Склад', 'Продукция', 'Брак'],
        colModel: [{
                name: 'id',
                width: 30
            },
            {
                name: 'recipient',
                width: 200
            },
            {
                name: 'product',
                width: 200
            },
            {
                name: 'recycle',
                width: 60
            }
        ],
        rowNum: 50,
        rowList: [50, 100, 150],
        autowidth: true,
        gridview: true,
        rownumbers: true,
        altRows: true,
        pager: '#data_pager',
        emptyrecords: 'Нет данных',
        height: '100%',
        multiselect: false,
        sortname: 'recipient',
        viewrecords: true,
        sortorder: 'desc',
        caption: 'Остатки брака'
    });
});