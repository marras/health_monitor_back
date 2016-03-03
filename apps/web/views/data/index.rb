module Web::Views::Data
  class Index
    include Web::View

    def metrics
      @metrics ||= Metric.all
    end
  end
end
