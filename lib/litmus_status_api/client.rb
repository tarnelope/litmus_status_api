require 'httparty'

module LitmusStatusApi
  class Client
    # initialize with user so that it can pass authentication
    def initialize(username, password, root_url)
      @username = username
      @password = password
      @root_url = root_url
    end

    def create_status(params)
      auth = { username: @username, password: @password }

      HTTParty.post("#{@root_url}/api/v1/status", basic_auth: auth)
    end

    def get_status
      # TODO: Need to create this in our repo
      HTTParty.get("#{@root_url}/api/v1/status")
    end

    def create_message(params)
      auth = { username: @username, password: @password }

      HTTParty.post("#{@root_url}/api/v1/status_message", basic_auth: auth)
    end
  end
end
