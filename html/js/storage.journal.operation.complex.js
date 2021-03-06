$(document).ready(function() {

    $.datepicker.setDefaults(
        $.extend($.datepicker.regional['ru'])
    );

    $('a').button();

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
            ddf = date;
            refreshGrid();
        }
    });
    vdf.datepicker('setDate', new Date());

    function refreshGrid() {
        var gwaiting = jQuery('#data_table');
        gwaiting.jqGrid('setGridParam', {
            url: 'ajax/storage.get.operation.complex.list.php?df=' + vdf.val() + '&dt=' + vdt.val(),
            page: 1
        });
        gwaiting.trigger('reloadGrid');
    };


    var lastsel;
    $('#data_table').jqGrid({
        url: 'ajax/storage.get.operation.complex.list.php?df=' + vdf.val() + '&dt=' + vdt.val(),
        editurl: 'ajax/storage.edit.operation.complex.php',
        datatype: 'json',
        colNames: [
            'Код',
            'Дата',
            'Отправитель',
            'Получатель',
            'Товар',
            'Получено',
            'Брак',
            'Возврат'
        ],
        colModel: [{
                name: 'id',
                width: 20,
                editable: false
            },
            {
                name: 'dt',
                width: 30,
                editable: true,
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
                name: 'sender',
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
                name: 'recipient',
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
                name: 'inp',
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
            },
            {
                name: 'rec',
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
            },
            {
                name: 'out',
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
        rowNum: 50,
        rowList: [50, 100, 150],
        autowidth: true,
        gridview: true,
        rownumbers: true,
        altRows: false,
        emptyrecords: 'Нет данных',
        height: '100%',
        multiselect: false,
        sortname: 'dt',
        viewrecords: true,
        pager: '#data_pager',
        sortorder: 'desc',
        onSelectRow: function(id) {
            if (id && id !== lastsel) {
                jQuery('#data_table').jqGrid('restoreRow', lastsel);
                lastsel = id;
            };
            jQuery('#data_table').jqGrid('editRow', id, true);
        },
        caption: 'Операции за период'
    }).navGrid('#data_pager', {
        edit: true,
        add: true,
        del: true,
        closeOnEscape: true
    });
});