require 'spec_helper'

describe Iterable::WorkflowTrigger do
  let(:workflowId) { 42 }
  subject { Iterable::WorkflowTrigger.new(workflowId: workflowId) }

  it 'is Iterable::Base' do
    expect(subject.is_a?(Iterable::Base)).to be_truthy
  end

  it 'has workflowId' do
    expect(subject.workflowId).to eq workflowId
  end

  it 'has listId' do
    expect(subject.listId).to be_nil
    subject.listId = 1
    expect(subject.listId).to eq 1
  end

  it 'has email' do
    expect(subject.email).to be_nil
    subject.email = 'bob@revv.co'
    expect(subject.email).to eq 'bob@revv.co'
  end

  it 'has dataFields' do
    expect(subject.dataFields).to be_nil
    subject.dataFields = {key: 'value'}
    expect(subject.dataFields).to be_truthy
    expect(subject.dataFields[:key]).to eq 'value'
  end

  it 'can parse from json' do
    json_string = load_file('workflow_trigger.json')
    output = Iterable::WorkflowTrigger.new(JSON.parse(json_string))
    expect(output.email).to eq 'bob@revv.co'
    expect(output.workflowId).to eq 12
    expect(output.dataFields).to be_truthy
    expect(output.dataFields[:firstName]).to eq 'Bob'
  end
end
