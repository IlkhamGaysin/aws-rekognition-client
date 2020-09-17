# frozen_string_literal: true

module AwsRekognitionClient
  class Request
    attr_reader :uri, :body, :target, :headers

    def initialize(body, target)
      @target     = target
      @body       = body
      @type       = 'POST'
      @connection = Connection.new
      @uri        = Configuration.url
      @headers    = {
        'Content-Type' => 'application/x-amz-json-1.1',
        'X-Amz-Target' => "RekognitionService.#{target}"
      }
    end

    def call
      CredentialsValidator.validate

      signed_headers = Signer.sign(self)

      begin
        @connection.post(uri, body, signed_headers)
      rescue Faraday::Error => e
        raise BaseError, e.message
      end
    end

    def self.call(body)
      new(body).call
    end
  end
end
