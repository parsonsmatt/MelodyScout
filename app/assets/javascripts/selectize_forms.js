var MelodyScout = MelodyScout || {};

MelodyScout.selectizePages = function() {
    var seConfigs = MelodyScout.selectizeConfigurations;

    var controller = document.body.getAttribute( "data-controller" );
    var action = document.body.getAttribute( "data-action" );

    var seConfig = seConfigs.basic;

    if ( $('.modal').size() === 0 ) {
        switch (controller) {
            case 'releases':
                seConfig = seConfigs.createModel("artist");
            break;
            case 'artists':
                seConfig = seConfigs.createModel("release");
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
        delimiter: null, // Delimiter is by default ',' which causes it to break on , input
        create: false,
        searchField: 'text',
    },
    createModel: function(model) {
        return {
            delimiter: null,
            create: function(input, cb) {
                $.getScript(window.location.origin+'/'+model+'s/new',
                            function() {
                                $('.modal').promise().done(function() {
                                    $('input#'+model+'_name').val(input);

                                    $('input[type="submit"]').click(function() {
                                        // setTimeout because we are waiting for AJAX to finish
                                        setTimeout(
                                            function() {
                                                $('.modal').promise().done(function() {
                                                    function capitalize(str) {
                                                        return str.charAt(0).toUpperCase() + str.substring(1);
                                                    }

                                                    cb({
                                                        'text':     eval('new' + capitalize(model)).name, 
                                                        'value':    eval('new' + capitalize(model)).id
                                                    });
                                                });
                                            }, 100
                                        );
                                    });
                            
                                    $('button[data-dismiss="modal"]').click(function() {
                                        setTimeout(
                                            function() {
                                                $('.modal').promise().done(function() {
                                                    cb();
                                                });
                                            }, 150
                                        );

                                    });
                                });
                            }
                );
            },
            searchField: 'text'
        }
    }
};

$(document).on('ready page:load', MelodyScout.selectizePages);

