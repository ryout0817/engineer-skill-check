module ApplicationHelper
  BASE_TITLE = "技術試験".freeze

  def full_title(title_name)
    title_name.blank? ? BASE_TITLE : "#{title_name} | #{BASE_TITLE}"
  end
end
