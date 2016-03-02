module Web::Controllers::Data
  class Create
    include Web::Action

    def call(params)
      data = Data.new(params)
      puts data.inspect
      data.save!
    end
  end
end
