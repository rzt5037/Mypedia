module WikisHelper
  def is_viewable?(wiki)
    if current_user
      (wiki.private == true && current_user.id == wiki.user_id) || (wiki.private == false) || (current_user.admin?)
    end
  end
end
