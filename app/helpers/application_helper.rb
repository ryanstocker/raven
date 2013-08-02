module ApplicationHelper
  def signin_path
    if Rails.env.development?
      "/auth/developer"
    end
  end
end
