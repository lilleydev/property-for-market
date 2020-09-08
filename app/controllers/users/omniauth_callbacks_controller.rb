class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    user = User.from_omniauth(request.env['omniauth.auth'])
    binding.pry
    if user.persisted?
      sign_in_and_redirect user, notice: 'Signed In!'
    else
      session['devise.user_attributes'] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  # def failure
  #   flash[:error] = 'Problem signing in. Please register or try again'
  #   redirect_to new_user_registration_url
  # end
end
