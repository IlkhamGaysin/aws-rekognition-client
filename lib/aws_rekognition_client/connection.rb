# frozen_string_literal: true

module AwsRekognitionClient
  class Connection
    def initialize
      @connection = Faraday.new do |faraday|
        faraday.response :logger do |logger|
          logger.filter(/(Authorization=)(\w+)/, '\1[REMOVED]')
        end
        faraday.adapter Faraday.default_adapter
      end
    end

    def post(url, body, headers)
      @connection.post(url, body, headers)
    end
  end
end
