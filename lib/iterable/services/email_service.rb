module Iterable
  module Services
    class EmailService < BaseService
      class << self
          def send_email(email_request)
            post(Util::Config.get('endpoints.send_email'), email_request)
          end
      end
    end
  end
end
