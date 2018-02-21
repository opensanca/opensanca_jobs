# frozen_string_literal: true

class UsersController < Clearance::UsersController
  private

  def user_params
    params.require(:user).permit(:email, :password, company_attributes: %i[name url])
  end
end
