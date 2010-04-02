class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
  end
  acts_as_muck_user
  acts_as_muck_inviter
  has_activities
  acts_as_muck_oauth_user
end

