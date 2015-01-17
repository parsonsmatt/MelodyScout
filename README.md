# MelodyScout

This README would normally document whatever steps are necessary to get the
application up and running.

## Todo:

* Deploying Beta:
  * Configure for Heroku
* After Deploying Beta:
  * Clean up the UX:
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

## Things you may want to cover:

* Ruby version: Ruby-2.2.0

* System dependencies: PostgreSQL

* Configuration

* Database creation

* Database initialization

* How to run the test suite:

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions (hm yes very good idea)


