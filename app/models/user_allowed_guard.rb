# frozen_string_literal: true

class UserAllowedGuard < Clearance::SignInGuard
  def call
    return next_guard if !signed_in? || allowed?

    failure('Your user is banned.')
  end

  def allowed?
    !current_user.banned?
  end
end
