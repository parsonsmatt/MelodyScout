# MelodyScout

## v0.1.7

MelodyScout is a Rails application that notifies people when their favorite artists release new music.

### What's new?

* The fancy select forms now work appropriately
* Views are refactored to be a bit more manageable

## Todo:

* Deleting a ReleaseDate with associated Notifications causes a database error
* Select form has a race condition, if the POST doesn't respond quickly enough...
* Remove editing of contributions directly from Artists
* Enable a 'Delete' for admins and 'Report' for users
* Currently, Notices build up for Users. They have a dismissal feature.
    1. User `has_a` NoticeConfiguration which controls how the user gets notified?
        * Email? SMS?
        * Daily? Weekly? Monthly?
        * Every [period of time] [contact] user about [notices] 

