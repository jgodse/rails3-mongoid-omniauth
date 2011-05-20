require 'json'
class User
  include Mongoid::Document
  field :provider, :type => String
  field :uid, :type => String
  field :name, :type => String
  field :email, :type => String
  field :user_info, :type=> String
  attr_accessible :provider, :uid, :name, :email, :user_info

  def self.create_with_omniauth(auth)
	raise Exception, auth.inspect
    begin
      create! do |user|
        user.provider = auth['provider']
        user.uid = auth['uid']
        if auth['user_info']
          user.name = auth['user_info']['name'] if auth['user_info']['name'] # Twitter, Google, Yahoo, GitHub
          user.email = auth['user_info']['email'] if auth['user_info']['email'] # Google, Yahoo, GitHub
		  user.user_info = auth['user_info'].to_json
        end
        if auth['extra']['user_hash']
          user.name = auth['extra']['user_hash']['name'] if auth['extra']['user_hash']['name'] # Facebook
          user.email = auth['extra']['user_hash']['email'] if auth['extra']['user_hash']['email'] # Facebook
		  user.user_info = auth['extra'].to_json
        end
      end
    rescue Exception
      raise Exception, "cannot create user record" + auth.inspect
    end
  end

end

