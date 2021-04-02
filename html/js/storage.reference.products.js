$(document).ready(function() {

    var lastsel;

    $('#data_table').jqGrid({
        url: 'ajax/storage.get.products.php',
        editurl: 'ajax/storage.edit.products.php',
        datatype: 'json',
        colNames: [
            'Код',
            'Кратко',
            'Наименование'
        ],
        colModel: [{
                name: 'id',
                width: 30,
                editable: false
            },
            {
                name: 'short_name',
                width: 80,
                editable: true,
                edittype: 'text',
                editoptions: {},
                editrules: {
                    required: true
                }
            },
            {
                name: 'name',
                width: 150,
                editable: true,
                edittype: 'text',
                editoptions: {},
                editrules: {
                    required: true
                }
            }
        ],
        rowNum: 20,
        rowList: [20, 40, 100],
        gridview: true,
        rownumbers: true,
        autowidth: true,
        altRows: true,
        emptyrecords: 'Нет данных',
        height: '100%',
        multiselect: false,
        sortname: 'name',
        onSelectRow: function(id) {
            if (id == null) {
                id = 0;
                if (jQuery('#recipes_table').jqGrid('getGridParam', 'records') > 0) {
                    jQuery('#recipes_table').jqGrid('setGridParam', {
                        editurl: 'ajax/storage.edit.recipes.php?product_id=' + id,
                        page: 1
                    });
                    jQuery('#recipes_table').jqGrid('setGridParam', {
                            url: 'ajax/storage.get.recipes.php?product_id=' + id,
                            page: 1
                        })
                        .trigger('reloadGrid');
                }
            } else {
                jQuery('#recipes_table').jqGrid('setGridParam', {
                    editurl: 'ajax/storage.edit.recipes.php?product_id=' + id,
                    page: 1
                });
                jQuery('#recipes_table').jqGrid('setGridParam', {
                        url: 'ajax/storage.get.recipes.php?product_id=' + id,
                        page: 1
                    })
                    .trigger('reloadGrid');
            }

            if (id && id !== lastsel) {
                jQuery('#data_table').jqGrid('restoreRow', lastsel);
                jQuery('#data_table').jqGrid('editRow', id, true);
                lastsel = id;
            }
        },
        viewrecords: true,
        pager: '#data_pager',
        sortorder: 'desc',
        caption: 'Справочник продукции'
    }).navGrid('#data_pager', {
        edit: true,
        add: true,
        del: true,
        closeOnEscape: true
    }, {
        afterSubmit: processAddEdit,
        closeAfterAdd: true,
        closeAfterEdit: true
    }, {
        afterSubmit: processAddEdit,
        closeAfterAdd: true,
        closeAfterEdit: true
    });

    var lastsel1;

    function processAddEdit(response, postdata) {
        return [true, '', 1];
    };

    $('#recipes_table').jqGrid({
        url: 'ajax/storage.get.recipes.php',
        datatype: 'json',
        colNames: [
            'Товар',
            'Компонент',
            'Объем'
        ],
        colModel: [{
                name: 'product_id',
                hidden: true,
                editable: false,
                editrules: {
                    edithidden: false
                },
                hidedlg: true
            },
            {
                name: 'component',
                width: 80,
                editable: true,
                edittype: 'select',
                editoptions: {
                    dataUrl: 'ajax/get.products.list.php'
                },
                editrules: {
                    required: true
                }
            },
            {
                name: 'volume',
                width: 30,
                formatter: 'number',
                formatoptions: {
                    decimalPlaces: 0
                },
                align: 'right',
                editable: true,
                edittype: 'text',
                editoptions: {
                    defaultValue: '1'
                },
                editrules: {
                    number: true,
                    required: true
                }
            }
        ],
        rowNum: 20,
        rowList: [20, 40, 100],
        autowidth: true,
        gridview: true,
        rownumbers: true,
        altRows: true,
        emptyrecords: 'Нет данных',
        height: '100%',
        multiselect: false,
        sortname: 'component',
        onSelectRow: function(id) {
            if (id && id !== lastsel1) {
                jQuery('#recipes_table').jqGrid('restoreRow', lastsel1);
                jQuery('#recipes_table').jqGrid('editRow', id, true);
                lastsel1 = id;
            }
        },
        viewrecords: true,
        pager: '#recipes_pager',
        sortorder: 'desc',
        caption: 'Список рецептов для выделенного продукта'
    }).navGrid('#recipes_pager', {
        edit: true,
        add: true,
        del: true,
        closeOnEscape: true
    });
});