require 'spec_helper'

describe Iterable::Services::EventService do
  before(:each) do
    @request = double('http request', :user => nil, :password => nil, :url => 'http://example.com', :redirection_history => nil)
  end

  describe "#track" do
    it "tracks an event" do
      event = Iterable::Event.new(JSON.parse(load_file('event.json')))
      json = load_file('response_track_event.json')
      net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

      response = RestClient::Response.create(json, net_http_resp, @request)
      RestClient.stub(:post).and_return(response)
      list_response = Iterable::Services::EventService.new('api_key').track(event)

      expect(list_response).to be_kind_of(Iterable::Responses::General)
      expect(list_response.msg).to eq "OK"
      expect(list_response.code).to eq "Success"
      expect(list_response.params).to eq({"eventName" => "userSignup"})
    end
  end
end
