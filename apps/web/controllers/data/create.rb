module Web::Controllers::Data
  class Create
    include Web::Action

    def call(params)
      values = JSON.parse(params[:values])
      values.each do |metric_name, value|
        metric = Metric.find_or_create_by(name: metric_name)

        point = Point.new
        point.day = Date.today
        point.value = value.to_i

        puts point.inspect
        metric.points << point
      end
    end
  end
end
