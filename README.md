# MelodyScout

## v0.1.4

MelodyScout is a Rails application that notifies people when their favorite artists release new music.

### What's new?

* SSL is (or, should be) enabled. 
* Releases have a sweet new form that operates over AJAX.
* Filter has been implemented.

## Todo:

* Enable SSL
* Instead of directly creating artist/releases, get a 'New' form response which is filled out and posted via ajax
* Currently, Notices build up for Users. They have a dismissal feature.
    1. User `has_a` NoticeConfiguration which controls how the user gets notified?
        * Email? SMS?
        * Daily? Weekly? Monthly?
        * Every [period of time] [contact] user about [notices] 
* Figure out monetization
* Google AdSense (text ads only)
* Amazon affiliate links (query from release+album name)
* Create necessary roles for subscription service

