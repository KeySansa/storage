$(document).ready(function() {

    $('#recycle_table').jqGrid({
        url: 'ajax/storage.get.recycle.by.product.php',
        datatype: 'json',
        colNames: ['Код', 'Склад', 'Продукция', 'Остаток'],
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
        sortname: 'recipient',
        viewrecords: true,
        sortorder: 'desc',
        caption: 'Остатки брака'
    });
});