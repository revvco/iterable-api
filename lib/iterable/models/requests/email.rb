# Example request
# {
#   "campaignId": 0,
#   "recipientEmail": "email@email.com"
#   "dataFields": {
#     "firstName": "Joe",
#     "lastName": "Last",
#     "purchaseAmount": 42.42
#   }
# }

module Iterable
  module Requests
    class Email < Iterable::Base
      property :campaignId
      property :recipientEmail
      property :dataFields, coerce: DataFields
    end
  end
end
