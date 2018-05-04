# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AwsRekognitionClient::Connection do
  let(:status)  { 200 }
  let(:headers) { Hash.new }
  let(:body)    { { 'Labels': [] } }
  let(:url)     { 'https://rekognition.eu-west-1.amazonaws.com' }

  let!(:http_stubs) do
    Faraday.new do |builder|
      builder.adapter :test do |stub|
        stub.post(url) { [status, headers, body] }
      end
    end
  end

  let(:connection) { described_class.new }

  before do
    allow(Faraday).to receive(:new).and_return(http_stubs)
  end

  it "returns status, headers, body" do
    result = connection.post(url, body, headers)

    expect(result.status).to eq(status)
    expect(result.headers).to eq(headers)
    expect(result.body).to eq(body)
  end
end
