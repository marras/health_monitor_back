module Web::Controllers::Data
  class Index
    include Web::Action

    def call(params)
      @data = Data.all
    end
  end
end
