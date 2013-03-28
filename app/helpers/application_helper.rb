module ApplicationHelper
  def is_admin
    !!current_admin_user
  end
end
