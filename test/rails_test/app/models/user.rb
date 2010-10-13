class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
  end
  include MuckUsers::Models::MuckUser
  include MuckInvites::Models::Inviter
  include MuckActivities::Models::MuckActivityConsumer
  include MuckOauth::Models::MuckUser
end

