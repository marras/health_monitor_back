module Web::Controllers::Data
  class Create
    include Web::Action

    accept :json

    def call(params)
      values = params[:values]
      user_id = params[:user]
      values.each do |metric_name, value|
        metric = Metric.find_or_create(name: metric_name, user_id: user_id)

        point = Point.find_or_create(metric_id: metric.id, day: Date.today)
        point.value = value.to_i
        point.metric = metric

        puts point.inspect
        point.save
      end

      self.body = '{ "status": "ok" }'
    end

    private

    def verify_csrf_token?
      false # we should probably implement some signing mechanism
    end
  end
end
