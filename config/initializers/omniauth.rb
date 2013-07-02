Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development?
    provider :developer, :fields => [:name_n], :uid_field => [:name_n]
  end
end
