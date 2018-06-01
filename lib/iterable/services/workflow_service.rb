#
# workflow_service.rb
# Iterable
#
# Copyright (c) 2018 Kyle Schutt. All rights reserved.

module Iterable
  module Services
    class WorkflowService < BaseService
        def trigger(workflow_trigger)
          raise Exceptions::ServiceException, "Must be a Iterable::WorkflowTrigger" unless workflow_trigger.is_a?(Iterable::WorkflowTrigger)
          post(Util::Config.get('endpoints.trigger_workflow'), workflow_trigger)
        end
    end
  end
end
