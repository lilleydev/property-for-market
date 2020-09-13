module UserHelper
  def format_name(user)
    # binding.pry
    if user.first_name && user.last_name
      "#{user.first_name} " " #{user.last_name}"
    else
      user.email.to_s
    end
  end
end
