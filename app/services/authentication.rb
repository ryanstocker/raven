class Authentication
  def initialize(omniauth = nil)
    @omniauth = omniauth
  end

  def user
    @user = user_from_omniauth
  end

  def authenticated?
    user.present?
  end

  private

    def user_from_omniauth
      User.where(@omniauth.slice("provider","uid")).first_or_initialize.tap do |user|
        user.provider = @omniauth["provider"]
        user.uid = @omniauth["uid"]
        user.name_n = @omniauth["info"]["name_n"]
        user.save!
      end
    end
end
