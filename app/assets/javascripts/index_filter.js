var MelodyScout = MelodyScout || {};

MelodyScout.filterTables = function() {
    $('#filter-input').keyup(function() {
        var filterString = $('#filter-input').val().toUpperCase().replace(/\W+/g, '');
        console.log(filterString);
        $.each($('.filter'), function(i, row) {
            if ( $(row).html().toUpperCase().replace(/\W+/g, '').indexOf(filterString) > -1 ) {
                $(row).show();
            }
            else {
                $(row).hide();
            }
        });
    });
};

$(document).on('ready page:load', MelodyScout.filterTables);
        
        
