$(function() {
    $('#artist-filter-input').change(function() {
        $('#artist-filter-text').text( $('#artist-filter-input').text() );
    });
});
