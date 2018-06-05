# frozen_string_literal: true

module AwsRekognitionClient
  class Signer
    def initialize(request)
      @request = request
      @signer  = AWS4::Signer.new(Configuration.credentials)
    end

    def sign
      @signer.sign(request.type, request.uri, request.headers, request.body)
    end

    def self.sign(request)
      new(request).sign
    end
  end
end
