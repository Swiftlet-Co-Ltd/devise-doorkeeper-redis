# frozen_string_literal: true

module Doorkeeper
  module Rails
    module Helpers
      def doorkeeper_authorize!(*scopes)
        @_doorkeeper_scopes = scopes.presence || Doorkeeper.config.default_scopes
        token = request.authorization.gsub("Bearer ", "")
        return if verify_with_redis?(token)

        if valid_doorkeeper_token?
          cache_session_with_redis(token)
        else
          doorkeeper_render_error
        end

        # doorkeeper_render_error unless valid_doorkeeper_token?
      end

      def verify_with_redis?(token)
        Kredis.string(token).value == "active"
      end

      def cache_session_with_redis(token)
        Kredis.string(token).value = "active"
      end
    end
  end
end
