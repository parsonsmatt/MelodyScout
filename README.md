# MelodyScout

## v0.1.6

MelodyScout is a Rails application that notifies people when their favorite artists release new music.

### What's new?

* Creating Artists from Releases and vice versa is much smoother process now.
* Some style updates

## Todo:

* Tidy up the Selectize box:
    * Typing a comma "," into the Selectize box causes it to create.
    * Defaults to first option, which usually isn't helpful.
    * Backing out of the New Model process doesn't unlock Selectize
* Remove editing of contributions directly from Artists
* Enable a 'Delete' for admins and 'Report' for users
* Currently, Notices build up for Users. They have a dismissal feature.
    1. User `has_a` NoticeConfiguration which controls how the user gets notified?
        * Email? SMS?
        * Daily? Weekly? Monthly?
        * Every [period of time] [contact] user about [notices] 

