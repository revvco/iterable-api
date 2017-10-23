require 'spec_helper'

describe Iterable::Event do
  let(:email) { 'bob@example.org' }
  let(:eventName) { 'userSignup' }
  subject { Iterable::Event.new(email: email, eventName: eventName) }

  it 'is Iterable::Base' do
    expect(subject.is_a?(Iterable::Base)).to be_truthy
  end

  it 'has email' do
    expect(subject.email).to eq email
  end

  it 'has eventName' do
    expect(subject.eventName).to eq eventName
  end

  it 'has userId' do
    expect(subject.userId).to be_nil
    subject.userId = 1
    expect(subject.userId).to eq "1" # coerced into a string
  end

  it 'has createdAt' do
    expect(subject.createdAt).to be_nil
    current_i = Time.now.to_i
    subject.createdAt = current_i
    expect(subject.createdAt).to eq current_i # coerced into a string
  end

  it 'has campaignId' do
    expect(subject.campaignId).to be_nil
    current_i = 42
    subject.campaignId = current_i
    expect(subject.campaignId).to eq current_i # coerced into a string
  end

  it 'has templateId' do
    expect(subject.templateId).to be_nil
    current_i = 42
    subject.templateId = current_i
    expect(subject.templateId).to eq current_i # coerced into a string
  end

  it 'has dataFields' do
    expect(subject.dataFields).to be_nil
    subject.dataFields = {key: 'value'}
    expect(subject.dataFields).to be_truthy
    expect(subject.dataFields[:key]).to eq 'value'
  end

  it 'can parse from json' do
    json_string = load_file('user.json')
    output = Iterable::User.new(JSON.parse(json_string))
    expect(output.email).to eq email
    expect(output.userId).to eq "1"
    expect(output.dataFields).to be_truthy
    expect(output.dataFields[:key]).to eq 'value'
  end
end
