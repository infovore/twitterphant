Twitterphant
============

Twitterphant keeps track of searchterms for you. Add a searchterm, trigger it
to refresh enough, and you'll never miss what somebody's said about your
project.

Configuration
-------------

You'll need to register an app with Twitter, in order to get the OAuth creds
necessary to make API calls. Once you've done that, make sure that upon
deployment, `config/initializers/twitter_creds.rb` is filled out correctly. An
example of this file is included. Then, everything should work.
(If you're deploying with Cap, you'll want toopy over this file correctly. A more
modern solution would be to use environment variables, which is left as an exercise for the reader).
