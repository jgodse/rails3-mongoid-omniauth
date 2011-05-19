#require 'openid/store/filesystem'
#  use OmniAuth::Strategies::OpenID, OpenID::Store::Filesystem.new('/tmp'), :name=> "google", :identifier => 'https://www.google.com/accounts/o8/id'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
  provider :github, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_SECRET']
  provider :linked_in, ENV['LINKED_IN_API_KEY'], ENV['LINKED_IN_SECRET_KEY']
  
#  provider :open_id, OpenID::Store::Filesystem.new('./tmp')
#  provider :google, OpenID::Store::Filesystem.new('./tmp'), :domain=>'gmail.com'
  
end
