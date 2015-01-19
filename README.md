# MelodyScout

## v0.1.1

MelodyScout is a Rails application that notifies people when their favorite artists release new music.

## Todo:

* Clean up the UX:
    * Index page should have search/filter feature
    * Releases
          * Create new Artist from Contribution forms
    * Artists
          * Create new Release from Contribution forms
* Currently, Notices build up for Users. They have a dismissal feature.
    1. User `has_a` NoticeConfiguration which controls how the user gets notified.
        * Email? SMS?
        * Daily? Weekly? Monthly?
        * Every [period of time] [contact] user about [notices] 
* Figure out monetization
* Google AdSense (text ads only)
* Amazon affiliate links (query from release+album name)
* Create necessary roles for subscription service

