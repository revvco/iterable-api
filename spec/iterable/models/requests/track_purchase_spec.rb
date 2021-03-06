require 'spec_helper'

describe Iterable::Requests::TrackPurchase do
  subject { Iterable::Requests::TrackPurchase.new(JSON.parse(load_file('request_track_purchase.json'))) }

  it 'is Iterable::Base' do 
    expect(subject.is_a?(Iterable::Base)).to be_truthy
  end

  it 'has user with email' do 
    expect(subject.user[:email]).to eq 'bob@example.org'
  end

  it 'has items with price' do 
    expect(subject.items).to be_truthy
    expect(subject.items.first[:price]).to eq 1334
  end

end