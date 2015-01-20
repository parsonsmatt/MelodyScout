var MelodyScout = MelodyScout || {};

MelodyScout.selectizePages = function() {
    var seConfigs = MelodyScout.selectizeConfigurations;

    var controller = document.body.getAttribute( "data-controller" );
    var action = document.body.getAttribute( "data-action" );
    
    var seConfig;
    switch (controller) {
        case 'releases':
            seConfig = seConfigs.releases;
            break;
        default:
            seConfig = seConfigs.basic; 
            break;
    }

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
    releases: {
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
    },
    artists: {
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

$(document).on('ready page:load', MelodyScout.selectizePages);

