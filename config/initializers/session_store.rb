# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_restfulie-client_session',
  :secret      => 'f8b67892bf1791da690cf43aa94272156b9fb5b800db8df167d3438dcbf31f031a9d7390c1aba10055166d1bdb3e21f69a4e8ab7edb7bb83f5573397e234b9ea'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
