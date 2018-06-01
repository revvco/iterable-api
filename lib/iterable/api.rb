#
# api.rb
# Iterable
#
# Copyright (c) 2017 Kyle Schutt. All rights reserved.

module Iterable
  class Api
    attr_accessor :api_key

    # Class constructor
    # @param [String] api_key - Iterable API Key
    # @return
    def initialize(api_key = nil)
      @api_key = api_key || Util::Config.get('auth.api_key')
      if @api_key.nil? || @api_key == ''
        raise ArgumentError.new(Util::Config.get('errors.api_key_missing'))
      end
    end

    #
    # List Services
    #
    def lists
      Services::ListService.new(@api_key).all
    end

    def lists_subscribe(list_id, subscribers)
      Services::ListService.new(@api_key).subscribe(list_id, subscribers)
    end

    def list_by_id(list_id)
      Services::ListService.new(@api_key).find_by_id(list_id)
    end

    #
    # User Services
    #
    def user_by_email(email)
      Services::UserService.new(@api_key).find_by_email(email)
    end

    def user_by_id(id)
      Services::UserService.new(@api_key).find_by_id(id)
    end

    def user_update(user)
      Services::UserService.new(@api_key).update(user)
    end

    def user_fields
      Services::UserService.new(@api_key).fields
    end

    def user_subscriptions_update
    end

    #
    # Event Services
    #
    def track_event(event)
      Services::EventService.new(@api_key).track(event)
    end

    #
    # Commerce Services
    #
    def track_purchase(track_purchase_request)
      Services::CommerceService.new(@api_key).track_purchase(track_purchase_request)
    end

    #
    # Workflow Services
    #
    def trigger_workflow(workflow_trigger)
      Services::WorkflowService.new(@api_key).trigger_workflow(workflow_trigger)
    end

    def update_cart(update_cart_request)
      Services::CommerceService.update_cart(update_cart_request)
    end
  end
end
