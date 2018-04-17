module Aircall
  class Contacts
    include Connection

    def get_by_id(contact_id)
      get("/contacts/#{contact_id}")
    end

    def get_by_email(email, page: 1, per_page: 5, order: "asc", order_by: "created_at")
      get(construct_request_with_arguments("/contacts/search", binding))
    end

    def get_by_phone_number(phone_number, page: 1, per_page: 5, order: "asc", order_by: "created_at")
      get(construct_request_with_arguments("/contacts/search", binding))
    end

  end
end