module Web::Views::Home
  class Index
    include Web::View

    def form
      form_for :session, routes.session_path do
        label 'Name'
        text_field :name
        label 'Password'
        password_field :password

        submit 'Log in'
      end
    end
  end
end
