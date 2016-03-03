module ControllerMixins
  def self.included klass
    klass.class_eval do
      include Web::Action

      use Warden::Manager do |manager|
        manager.default_strategies :password
        manager.failure_app = FailureApp
      end
    end
  end

  def warden
    @_env['warden']
  end
end
