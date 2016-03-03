class FailureApp
  def self.call(env)
    message = env['warden.options'].fetch(:message, "unauthorized.user")
    puts message

    redirect_to '/'
  end
end
