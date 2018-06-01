#
# list_service.rb
# Iterable
#
# Copyright (c) 2017 Kyle Schutt. All rights reserved.

module Iterable
  module Services
    class ListService < BaseService
      def all
        get(Util::Config.get('endpoints.lists'), nil, Iterable::Responses::Lists)
      end

      def find_by_id(id)
        # iterate over all lists to find the id
        all.lists.select{|x| x.id == id.to_i}.first
      end

      def subscribe(list_id, subscribers)
        request = Iterable::Requests::Subscribe.new(listId: list_id, subscribers: subscribers)
        post(Util::Config.get('endpoints.lists_subscribe'), request, nil, Iterable::Responses::Subscribe)
      end
    end
  end
end
