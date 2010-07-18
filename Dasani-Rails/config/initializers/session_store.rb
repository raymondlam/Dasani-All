# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Dasani-Rails_session',
  :secret      => '46279516812445d291160dfdc1894398ed66297959e949687de3f8d8ceb682df2ea9f02b37d5e8d58a88d5debbfcdf128ab73d5b1efabc1f32f290c1841ff36e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
