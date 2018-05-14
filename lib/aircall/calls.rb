module Aircall
  class Calls
    include Connection

    def get_all(page: 1, per_page: 5, order: "asc", order_by: "created_at")
      get(construct_request_with_arguments("/calls", binding))
    end

    def get_by_id(call_id)
      get("/calls/#{call_id}")
    end

    def get_by_user_id(user_id, page: 1, per_page: 5, order: "asc", order_by: "created_at")
      get(construct_request_with_arguments("/calls/search", binding))
    end

    def get_by_phone_number(phone_number, page: 1, per_page: 5, order: "asc", order_by: "created_at")
      get(construct_request_with_arguments("/calls/search", binding))
    end

  end
end