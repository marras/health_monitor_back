module Web::Controllers::Data
  class Create
    include ::ControllerMixins

    accept :json

    use Warden::Manager do |manager|
      manager.default_strategies :password
      manager.failure_app = FailureApp
    end

    def call(params)
      values = params[:values]
      values.each do |metric_name, value|
        metric = Metric.find_or_create(name: metric_name)

        point = Point.new
        point.day = Date.today
        point.value = value.to_i
        point.metric = metric

        puts point.inspect
        point.save
      end

      self.body = '{ "status": "ok" }'
    end
  end
end
