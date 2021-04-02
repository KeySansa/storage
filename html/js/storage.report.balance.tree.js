$(document).ready(function() {

    tab = $('#data_table').jqGrid({
        url: 'ajax/storage.get.balance.of.payments.tree.php',
        datatype: 'json',
        colNames: ['Контрагент', 'Наименование', 'Объем'],
        colModel: [{
            name: 's.name',
            width: 200,
            sorttype: 'string',
            searchoptions: {
                sopt: ['in']
            }
        }, {
            name: 'p.name',
            sorttype: 'string',
            width: 200
        }, {
            name: 'o.volume',
            sorttype: 'integer',
            width: 50,
            summaryType: 'sum'
        }],
        //rowNum: 100,
        //rowList: [100, 200, 400],
        autowidth: true,
        gridview: true,
        rownumbers: true,
        altRows: false,
        emptyrecords: 'Нет данных',
        height: '100%',
        multiselect: false,
        sortname: 's.name',
        viewrecords: true,
        sortorder: 's.name',
        footerrow: true,
        grouping: true,
        groupingView: {
            groupField: ['s.name'],
            groupColumnShow: [false],
            groupSummary: [true],
            groupCollapse: true,
            groupText: ['<b>{0} - {1} поз.</b>']
        },
        caption: 'Остатки на складах'
    });
    //tab.jqGrid('filterToolbar', {
    //    searchOperators: true,
    //    autosearch: true
    //});

});