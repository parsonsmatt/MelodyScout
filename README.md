# MelodyScout

## v0.1.5


MelodyScout is a Rails application that notifies people when their favorite artists release new music.

### What's new?

* Creating Artists from Releases and vice versa is much smoother process now.
* Some style updates

## Todo:

* Remove editing of contributions directly from Artists
* Enable a 'Delete' for admins and 'Report' for users
* Currently, Notices build up for Users. They have a dismissal feature.
    1. User `has_a` NoticeConfiguration which controls how the user gets notified?
        * Email? SMS?
        * Daily? Weekly? Monthly?
        * Every [period of time] [contact] user about [notices] 
