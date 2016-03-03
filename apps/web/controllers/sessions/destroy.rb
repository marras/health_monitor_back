module Web::Controllers::Sessions
  class Destroy
    include ::ControllerMixins

    def call(params)
      warden.logout
      redirect_to '/'
    end
  end
end

