Warden::Manager.serialize_into_session do |user|
  user.id
end

Warden::Manager.serialize_from_session do |id|
  User[id]
end

Warden::Strategies.add(:password) do
  def valid?
    puts "Checking valid: #{name} / #{password}"
    name && password
  end

  def authenticate!
    u = User.authenticate(name, password)
    u.nil? ? fail!("Could not log in") : success!(u)
  end

  private

  def name
    session_params['name']
  end

  def password
    session_params['password']
  end

  def session_params
    params.fetch('session', {})
  end
end
