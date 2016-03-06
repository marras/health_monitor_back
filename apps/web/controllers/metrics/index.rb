module Web::Controllers::Metrics
  class Index
    include Web::Action

    expose :metrics

    use Warden::Manager do |manager|
      manager.default_strategies :password
      manager.failure_app = FailureApp
    end

    def call(params)
      warden.authenticate!
      @current_user = warden.user
      @metrics = Metric.where(user_id: @current_user.id)
      self.format = :json
    end
  end
end
