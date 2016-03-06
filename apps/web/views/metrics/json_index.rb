require_relative './index'

module Web::Views::Metrics
  class JsonShow < Index
    format :json

    def render
      json = {
        user: current_user.id,
        metrics: metrics.map { |m| { id: m.id, name: m.name, max: m.max } }
      }

      raw JSON.generate(json)
    end
  end
end
