class FailureApp
  def self.call(env)
    message = env['warden.options'].fetch(:message, "unauthorized.user")

    ['403', {'Content-Type' => 'text'}, ["Unauthorized: #{message}"]]
    #['302', {'Content-Type' => 'text','Location' => '/'}, ['302 found']]
  end
end
