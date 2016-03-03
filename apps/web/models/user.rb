class User < Sequel::Model
  one_to_many :metrics

  def self.authenticate(username, password)
    if user = self[name: username]
      user if user.password_matches?(password) 
    end
  end

  def password_matches?(password)
    password == encrypted_password # TODO add actual encryption!
  end
end
