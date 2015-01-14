var MelodyScout = MelodyScout || {};

MelodyScout.selectizePages = function() {
    var seConfigs = MelodyScout.selectizeConfigurations ;

    // Figure out how to determine correct page
    var seConfig = seConfigs.basic; 

    // Selectize on page load
    $('select.selectize-me').selectize(seConfig);

    // Selectize on 'add fields' click
    $('.add_fields').click(function() { 
        setTimeout(function() {
            $('select.selectize-me').not('.selectized').selectize(seConfig);
        }, 1); 
    });
}

MelodyScout.selectizeConfigurations = {
    basic: {
        create: false,
        searchField: 'text',
    },
    artist: {
        create: function(input, cb) {
            // Something was created!
            // Send request to server
            // Response will contain ID of newly created release
            // 'value' = artist_id
            // 'text' = input

            return {
                'value': 0,
                'text': input
            };
        },
        createOnBlur: true,
        searchField: 'name'  
    }
};

$(MelodyScout.selectizePages);
