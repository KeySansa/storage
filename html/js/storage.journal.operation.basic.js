$(document).ready(function() {
    $.datepicker.setDefaults(
        $.extend($.datepicker.regional['ru'])
    );

    vdt = $('#dt').datepicker({
        minDate: '-300',
        maxDate: '+6m +1w +3d',
        onSelect: function(date) {
            refreshGrid();
        }
    });

    vdt.datepicker('setDate', new Date());

    vdf = $('#df').datepicker({
        minDate: '-300',
        maxDate: '+6m +1w +3d',
        onSelect: function(date) {
            refreshGrid();
        }
    });
    vdf.datepicker('setDate', new Date());

    function refreshGrid() {
        var gwaiting = jQuery('#data_table');
        gwaiting.jqGrid('setGridParam', {
            url: 'ajax/storage.get.basic.operations.php?df=' + vdf.val() + '&dt=' + vdt.val(),
            page: 1
        });
        gwaiting.trigger('reloadGrid');
    };

    var lastsel;
    $('#data_table').jqGrid({
        url: 'ajax/storage.get.basic.operations.php?df=' + vdf.val() + '&dt=' + vdt.val(),
        editurl: 'ajax/storage.edit.basic.operation.php',
        datatype: 'json',
        colNames: [
            'Дата',
            'Контрагент',
            'Товар',
            'Количество'
        ],
        colModel: [{
                name: 'dt',
                width: 50,
                editable: true,
                formatter: 'date',
                editrules: {
                    required: true
                },
                editoptions: {
                    size: 10,
                    maxlengh: 10,
                    dataInit: function(element) {
                        $(element).datepicker({
                            dateFormat: 'dd.mm.yy'
                        })
                    }
                }
            },
            {
                name: 'caption',
                width: 150,
                editable: true,
                edittype: 'select',
                editoptions: {
                    dataUrl: 'ajax/get.customers.list.php'
                },
                editrules: {
                    required: true
                }
            },
            {
                name: 'product',
                width: 150,
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
                name: 'value',
                width: 30,
                formatter: 'number',
                formatoptions: {
                    decimalPlaces: 0
                },
                align: 'right',
                editable: true,
                edittype: 'text',
                editoptions: {
                    defaultValue: '0'
                },
                editrules: {
                    number: true,
                    required: true
                }
            }
        ],
        rowNum: 20,
        rowList: [20, 60, 100],
        rownumbers: true,
        altRows: false,
        emptyrecords: 'Нет данных',
        height: '100%',
        autowidth: true,
        closeAfterEdit: true,
        reloadAfterSubmit: true,
        multiselect: false,
        sortname: 'product',
        sortorder: 'desc',
        onSelectRow: function(id) {
            if (id && id !== lastsel) {
                jQuery('#data_table').jqGrid('restoreRow', lastsel);
                jQuery('#data_table').jqGrid('editRow', id, true);
                lastsel = id;
            }
        },
        viewrecords: true,
        pager: '#data_pager',
        caption: 'Операции за период'
    }).navGrid('#data_pager', {
        edit: true,
        add: true,
        del: true,
        closeOnEscape: true
    });

    refreshGrid();
});