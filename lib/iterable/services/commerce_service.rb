#
# commerce_service.rb
# Iterable
#
# Copyright (c) 2017 Kyle Schutt. All rights reserved.

module Iterable
  module Services
    class CommerceService < BaseService
      class << self

        def track_purchase(request)
          raise Exceptions::ServiceException, "Must be a Iterable::Requests::TrackPurchase" unless request.is_a?(Iterable::Requests::TrackPurchase)
          post(Util::Config.get('endpoints.track_purchase'), request)
        end

        def update_cart(request)
          raise Exceptions::ServiceException, "Must be a Iterable::Requests::UpdateCart" unless request.is_a?(Iterable::Requests::UpdateCart)
          post(Util::Config.get('endpoints.update_cart'), request)
        end
      end
    end
  end
end