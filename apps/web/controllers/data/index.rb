module Web::Controllers::Data
  class Index
    include Web::Action

    before :require_login!

    def call(params)
      warden.authenticate!
      @current_user = warden.user
    end
  end
end
