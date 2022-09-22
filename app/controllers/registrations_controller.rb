class RegistrationsController < Devise::RegistrationsController
    # DELETE /resource
    def destroy
        super
      redirect_to new_user_registration_path
    end
  
    def cancel
      expire_data_after_sign_in!
      redirect_to here_your_url
    end
  end