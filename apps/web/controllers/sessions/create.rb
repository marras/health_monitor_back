module Web::Controllers::Sessions
  class Create
    include ::ControllerMixins

    def call(params)
      warden.authenticate!
      redirect_to routes.data_path
    end
  end
end

