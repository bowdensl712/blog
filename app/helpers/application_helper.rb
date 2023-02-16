module ApplicationHelper
  def language_cookie(value)
    cookies[:language] = value
  end
end
