# MelodyScout

## v0.1.2

MelodyScout is a Rails application that notifies people when their favorite artists release new music.

## Todo:

* Clean up the UX:
    * Releases
          * Create new Artist from Contribution forms
    * Artists
          * Create new Release from Contribution forms
* Enable SSL
* Currently, Notices build up for Users. They have a dismissal feature.
    1. User `has_a` NoticeConfiguration which controls how the user gets notified.
        * Email? SMS?
        * Daily? Weekly? Monthly?
        * Every [period of time] [contact] user about [notices] 
* Figure out monetization
* Google AdSense (text ads only)
* Amazon affiliate links (query from release+album name)
* Create necessary roles for subscription service

