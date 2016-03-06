module Web::Views::Data
  class Index
    include Web::View

    def labels
      raw points.map(&:day).to_json
    end

    def series
      raw points.map(&:value).to_json
    end

    private

    def points
      current_user.metrics.first.points
    end
  end
end
