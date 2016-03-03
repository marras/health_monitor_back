module Web::Controllers::Data
  class Index
    include Web::Action

    use Warden::Manager do |manager|
      manager.default_strategies :password
      manager.failure_app = FailureApp
    end

    def call(params)
      @_env['warden'].authenticate!
    end
  end
end
