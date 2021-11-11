class PasswordsController < Devise::PasswordsController
  # here we need to skip the automatic authentication based on current session for the following two actions
  # edit: shows the reset password form. need to skip, otherwise it will go directly to root
  # update: updates the password, need to skip otherwise it won't even reset if already logged in
  skip_before_action :require_no_authentication, :only => [:edit]

  # we need to override the update, too.
  # After a password is reset, all outstanding sessions are gone.
  # When already logged in, sign_in is a no op, so the session will expire, too.
  # The solution is to logout and then re-login which will make the session right.
end