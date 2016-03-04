module Web::Controllers::Data
  class Index
    include Web::Action

    expose :current_user

    use Warden::Manager do |manager|
      manager.default_strategies :password
      manager.failure_app = FailureApp
    end

    def call(params)
      warden.authenticate!
      @current_user = warden.user
    end
  end
end
