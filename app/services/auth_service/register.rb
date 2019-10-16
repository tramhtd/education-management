module AuthService::Register
  def self.call(register_params)
    {
      user: UserSerializer.new(User.create!(register_params))
    }
  end
end
