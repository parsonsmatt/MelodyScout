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
            $.post( 'http://'+window.location.host+'/artists', 
                    { 
                        'artist': { 
                            'name': input
                        }
                    },
                    function(data) {
                        var id=data.id;
                        cb({ 
                            'value': id,
                            'text': input
                        });
                    }, 'json'
                  );
        },
        createOnBlur: true,
        searchField: 'name'  
    },
    artists: {
        create: function(input, cb) {
            $.post( 'http://'+window.location.host+'/releases', 
                    { 
                        'release': { 
                            'name': input
                        }
                    },
                    function(data) {
                        var id=data.id;
                        cb({ 
                            'value': id,
                            'text': input
                        });
                    }, 'json'
                  );
        },
        createOnBlur: true,
        searchField: 'name'  
    }
};

$(document).on('ready page:load', MelodyScout.selectizePages);

