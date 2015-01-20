var filterTables = function() {
    $('#filter-input').keyup(function() {
        var filterString = $('#filter-input').val().toUpperCase();

        $.each($('.filter'), function(i, row) {
            if ( $(row).html().toUpperCase().indexOf(filterString) > -1 ) {
                $(row).show();
            }
            else {
                $(row).hide();
            }
        });
    });
};

$(document).ready(filterTables);
$(document).on('page:load', filterTables);
        
        
