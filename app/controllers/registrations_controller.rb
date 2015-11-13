class RegistrationsController < Devise::RegistrationsController

def new
  @user = User.new
end



private


    def sign_up_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :username, :about_me)
    end

    def account_update_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :username, :about_me)
    end

end