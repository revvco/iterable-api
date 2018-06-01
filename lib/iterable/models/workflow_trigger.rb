module Iterable
  class WorkflowTrigger < Iterable::Base
    property :email, coerce: String
    property :listId, coerce: Integer

    property :workflowId, required: true, coerce: Integer

    property :dataFields, coerce: DataFields
  end
end
