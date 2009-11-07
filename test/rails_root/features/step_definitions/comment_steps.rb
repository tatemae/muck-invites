Given /^There are invites$/ do
  create_invites
end

def create_invites(inviteable = nil)
  inviteable ||= Factory(:user)
  invite = Factory(:invite, :inviteable => inviteable)
  child = Factory(:invite, :inviteable => inviteable)
  child.move_to_child_of(invite)
  invite
end