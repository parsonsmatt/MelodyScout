var MelodyScout = MelodyScout || {};

MelodyScout.selectizePages = function() {
    var seConfigs = MelodyScout.selectizeConfigurations;

    var controller = document.body.getAttribute( "data-controller" );
    var action = document.body.getAttribute( "data-action" );

    var seConfig = seConfigs.basic;

    if ( $('.modal').size() === 0 ) {
        switch (controller) {
            case 'releases':
                seConfig = seConfigs.releases_create;
            break;
            case 'artists':
                seConfig = seConfigs.artists_create;
            break;
            default:
                seConfig = seConfigs.basic;
            break;
        }
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
    releases_create: {
        create: function(input, cb) {
            $.post( window.location.origin + '/artists', 
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
        searchField: 'text'  
    },
    artists_create: {
        create: function(input, cb) {
            $.post( window.location.origin+'/releases', 
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
        searchField: 'text'  
    },
};

$(document).on('ready page:load', MelodyScout.selectizePages);

