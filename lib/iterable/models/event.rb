module Iterable
  class Event < Iterable::Base
    property :email, required: true, coerce: String
    property :eventName, required: true, coerce: String

    property :userId, coerce: String

    property :createdAt, coerce: Integer
    property :campaignId, coerce: Integer
    property :templateId, coerce: Integer

    property :dataFields, coerce: DataFields
  end
end
