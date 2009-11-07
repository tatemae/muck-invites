class UserInvite < ActiveRecord::Base
  unloadable

  belongs_to :user
  belongs_to :invite
end
