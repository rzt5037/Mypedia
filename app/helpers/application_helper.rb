module ApplicationHelper
  def is_standard_user?
    current_user.standard?
  end

  def is_premium_user?
    current_user.premium?
  end
end
