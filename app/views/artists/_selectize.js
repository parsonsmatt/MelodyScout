$('document').ready(function() {
    var seConfig = {
        valueField: 'id',
        labelField: 'name',
        create: function(input) {
            return {
                'id': 0,
                'name': input
            }
        },
        createOnBlur: true,
        searchField: 'name',  
        delimiter: ''  
    };

    $('.select-release').selectize(seConfig);

    $('.add_fields').click(function() { 
        setTimeout(function() {
            console.log('hey');
            $('select.select-release').not('.selectized').selectize(seConfig);
        }, 1); 
    });
});
