module Surveygizmo
  # Defines HTTP request methods
  module Request

    # Perform an HTTP GET request
    def get(path, options={})
      request(:get, path, options)
    end

    def post(path, options={}, temp_api_endpoint=nil)
      request(:post, path, options, temp_api_endpoint)
    end

    private

    # Perform an HTTP request
    def request(method, path, options, temp_api_endpoint=nil)
      connection_options = {
        :headers => { 'Accept' => 'application/json', 'User-Agent' => @user_agent },
        :ssl => { :verify => false }
      }

      if credentials?
        authentication = auth_query_hash
        connection_options[:params] = authentication
      end

      connection_options[:url] = temp_api_endpoint ? temp_api_endpoint : @endpoint

      response = connection(connection_options).send(method) do |request|
        convert_hash_filter_params!(options)
        case method.to_sym
        when :get, :delete
          request.url(path, options)
        when :post, :put
          request.path = path
          request.body = options unless options.empty?
        end
      end

      response = Response.new(response)

      if response.failed?
        raise Error.new(response.error_code, response.error_message)
      else
        response
      end
    end

    def convert_hash_filter_params! options
      options.merge! formatted_filters options.delete :filter
    end

    def auth_query_hash
      { :'user:md5' => "#{credentials[:username]}:#{Digest::MD5.hexdigest(credentials[:password])}" }
    end

  end
end
