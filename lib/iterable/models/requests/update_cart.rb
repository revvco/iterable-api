module Iterable
  module Requests
    class UpdateCart < Iterable::Base
      property :user, coerce: Iterable::Requests::UserUpdate, required: true
      property :items, coerce: Array[Iterable::CommerceItem], required: true
    end
  end
end