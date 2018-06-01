#
# event_service.rb
# Iterable
#
# Copyright (c) 2017 Kyle Schutt. All rights reserved.

module Iterable
  module Services
    class EventService < BaseService
        def track(event)
          raise Exceptions::ServiceException, "Must be a Iterable::Event" unless event.is_a?(Iterable::Event)
          post(Util::Config.get('endpoints.track_event'), event)
        end
    end
  end
end
