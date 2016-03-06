module Web::Controllers::Metrics
  class Index
    include Web::Action

    expose :metrics

    before :require_login!

    def call(params)
      @metrics = Metric.where(user_id: @current_user.id)
      self.format = :json
    end
  end
end
