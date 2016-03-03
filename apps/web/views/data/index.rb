module Web::Views::Data
  class Index
    include Web::View

    def points
      @points ||= Point.all
    end
  end
end
