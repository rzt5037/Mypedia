module ApplicationHelper
  def is_standard_user?
    if current_user
      current_user.standard?
    end
  end

  def is_premium_user?
    if current_user
      current_user.premium?
    end
  end
end
