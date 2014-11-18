class RegistrationsController < Devise::RegistrationsController

private

def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :profile_name, :date_of_birth, :email, :password, :password_confirmation, :avatar)
end

def account_update_params
    params.require(:user).permit( :email, :password, :date_of_birth, :password_confirmation, :current_password)
end
end
