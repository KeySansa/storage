$(document).ready(function() {

    //var lastsel1;

    $('#data_table').jqGrid({
        url: 'ajax/storage.get.customers.php?parent=2',
        editurl: 'ajax/storage.edit.customers.php?parent=2',
        datatype: 'json',
        colNames: [
            'Код',
            'Кратко',
            'Наименование',
            'Произв'
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
            },
            {
                name: 'prd',
                width: 10,
                editable: true,
                edittype: 'checkbox',
                editoptions: {
                    value: 'Да:Нет'
                },
                editrules: {
                    required: true
                }
            }
        ],
        rowNum: 20,
        rowList: [20, 40, 100],
        autowidth: true,
        gridview: true,
        rownumbers: true,
        altRows: false,
        emptyrecords: 'Нет данных',
        height: '100%',
        multiselect: false,
        sortname: 'name',
        //onSelectRow: function(id) {
        //    if (id && id !== lastsel1) {
        //        jQuery('#data_table').jqGrid('restoreRow', lastsel1);
        //        jQuery('#data_table').jqGrid('editRow', id, true);
        //        lastsel1 = id;
        //    }
        //},
        viewrecords: true,
        pager: '#data_pager',
        sortorder: 'desc',
        caption: 'Список своих контрагентов'
    }).navGrid('#data_pager', {
        edit: true,
        add: true,
        del: true,
        closeOnEscape: true
    });

    //var lastsel2;

    $('#enemy_data_table').jqGrid({
        url: 'ajax/storage.get.customers.php?parent=3',
        editurl: 'ajax/storage.edit.customers.php?parent=3',
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
        autowidth: true,
        gridview: true,
        rownumbers: true,
        altRows: true,
        emptyrecords: 'Нет данных',
        height: '100%',
        multiselect: false,
        sortname: 'name',
        //onSelectRow: function(id) {
        //    if (id && id !== lastsel2) {
        //        jQuery('#enemy_data_table').jqGrid('restoreRow', lastsel2);
        //        jQuery('#enemy_data_table').jqGrid('editRow', id, true);
        //        lastsel2 = id;
        //    }
        //},
        viewrecords: true,
        pager: '#enemy_data_pager',
        sortorder: 'desc',
        caption: 'Список сторонних контрагентов'
    }).navGrid('#enemy_data_pager', {
        edit: true,
        add: true,
        del: true,
        closeOnEscape: true
    });
});