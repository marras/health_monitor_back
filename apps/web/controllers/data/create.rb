module Web::Controllers::Data
  class Create
    include Web::Action

    def call(params)
      puts params.inspect
    end
  end
end
