module Requests
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body)
    end
  end

  module LoginHelpers
    def token_auth
      {
        "HTTP_AUTHORIZATION" => ActionController::HttpAuthentication::Token.encode_credentials(
          ENV["API_SECRET"]
        )
      }
    end
  end
end
