class FailureApp
  def self.call(env)
    message = env['warden.options'].fetch(:message, "unauthorized.user")
    puts message

    ['403', {'Content-Type' => 'text'}, ['Unauthorized']]
    #['302', {'Content-Type' => 'text','Location' => '/'}, ['302 found']]
  end
end
