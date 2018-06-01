require 'spec_helper'

describe Iterable::Services::WorkflowService do
  before(:each) do
    @request = double('http request', :user => nil, :password => nil, :url => 'http://example.com', :redirection_history => nil)
  end

  describe "#trigger" do
    it "triggers a workflow" do
      workflow_trigger = Iterable::WorkflowTrigger.new(JSON.parse(load_file('workflow_trigger.json')))
      json = load_file('response_trigger_workflow.json')
      net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

      response = RestClient::Response.create(json, net_http_resp, @request)
      RestClient.stub(:post).and_return(response)
      list_response = Iterable::Services::WorkflowService.new('api_key').trigger(workflow_trigger)

      expect(list_response).to be_kind_of(Iterable::Responses::General)
      expect(list_response.msg).to eq "OK"
      expect(list_response.code).to eq "Success"
      expect(list_response.params).to eq({"eventName" => "workflowTriggered"})
    end
  end
end
