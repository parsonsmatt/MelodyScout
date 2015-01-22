var MelodyScout = MelodyScout || {};

MelodyScout.selectizePages = function() {
    var seConfigs = MelodyScout.selectizeConfigurations;

    var controller = document.body.getAttribute( "data-controller" );
    var action = document.body.getAttribute( "data-action" );

    var seConfig = seConfigs.basic;

    if ( $('.modal').size() === 0 ) {
        switch (controller) {
            case 'releases':
                // TODO: Change to createArtists when the artist controller/views are ready
                seConfig = seConfigs.createArtists;
            break;
            case 'artists':
                seConfig = seConfigs.createReleases;
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
    createArtists: {
        create: function(input, cb) {
            $.getScript(window.location.origin+'/artists/new',
                        function() {
                            $('.modal').promise().done(function() {
                                $('input#artist_name').val(input);

                                $('input[type="submit"]').click(function() {
                                    setTimeout(
                                        function() {
                                            $('.modal').promise().done(function() {
                                                cb({'text': newArtist.name, 'value':newArtist.id});
                                            });
                                        }, 100
                                    );
                                });
                            });
                        }
            );
        },
        searchField: 'text'  
    },
    createReleases: {
        create: function(input, cb) {
            $.getScript(window.location.origin+'/releases/new',
                        function() {
                            $('.modal').promise().done(function() {
                                $('input#release_name').val(input);

                                $('input[type="submit"]').click(function() {
                                    setTimeout(
                                        function() {
                                            $('.modal').promise().done(function() {
                                                cb({'text':newRelease.name, 'value':newRelease.id});
                                            });
                                        }, 100
                                    );
                                });
                            });
                        }
            );
        },
        searchField: 'text'  
    },
};

$(document).on('ready page:load', MelodyScout.selectizePages);

