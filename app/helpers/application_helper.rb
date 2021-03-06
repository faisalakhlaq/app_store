module ApplicationHelper
# Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "DevBatch App Store"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def admin_user
    current_user.admin?
  end

end
