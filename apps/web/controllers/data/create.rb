module Web::Controllers::Data
  class Create
    include Web::Action

    accept :json

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
    end
  end
end
