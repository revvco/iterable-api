#
# user_service.rb
# Iterable
#
# Copyright (c) 2017 Kyle Schutt. All rights reserved.

module Iterable
  module Services
    class UserService < BaseService
      def find_by_email(email)
        raise Exceptions::ServiceException, "Email is required." if email.nil?
        find_by((Util::Config.get('endpoints.user_by_email') % [email]))
      end

      def find_by_id(id)
        raise Exceptions::ServiceException, "Id is required." if id.nil?
        find_by((Util::Config.get('endpoints.user_by_id') % [id]))
      end

      def update(user)
        raise Exceptions::ServiceException, "Must be a Iterable::Requests::UserUpdate" unless user.is_a?(Iterable::Requests::UserUpdate)
        post(Util::Config.get('endpoints.user_update'), user)
      end

      def fields
        get(Util::Config.get('endpoints.user_fields'))
      end

      private

      def find_by(path)
        get(path, nil, Iterable::Responses::User)
      end
    end
  end
end
