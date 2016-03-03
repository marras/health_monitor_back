module Web::Controllers::Data
  class Index
    include ::ControllerMixins

    expose :warden

    use Warden::Manager do |manager|
      manager.default_strategies :password
      manager.failure_app = FailureApp
    end

    def call(params)
      warden.authenticate!
    end
  end
end
