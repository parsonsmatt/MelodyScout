$('document').ready(function() {
    var seConfig = {
        create: function(input, cb) {
            // Something was created!
            // Send request to server
            // Response will contain ID of newly created release
            // 'value' = artist_id
            // 'text' = input

            
            return {
                'value': 0,
                'text': input
            }
        },
        createOnBlur: true,
        searchField: 'name',  
    };

    $('.select-release').selectize(seConfig);

    $('.add_fields').click(function() { 
        setTimeout(function() {
            $('select.select-release').not('.selectized').selectize(seConfig);
        }, 1); 
    });
});
