require 'httparty'
require 'json'

module Aircall
  module Connection
    attr_reader :aircall
    def initialize(aircall)
      @aircall = aircall
    end

    def require_settings(required)
      required.each do |setting|
        raise "Required setting #{setting} is missing." unless aircall.send(setting)
      end
    end

    def parse(result)
      parsed =  JSON.parse result.body
      if parsed.kind_of? Hash and parsed['status'] and parsed['status'] == 'failure'
        raise Error.new(parsed['error'])
      end
      
      parsed
    end

    def get(path)
      url = "https://api.aircall.io/v1#{path}"
      response = HTTParty.get(
          url,
          basic_auth: { username: aircall.id, password: aircall.token }
      )
      
      parse(response)
    end

    def get_method_arguments(ext_binding)
      raise ArgumentError, "Binding expected, #{ext_binding.class.name} given" unless ext_binding.is_a?(Binding)
      method_name = ext_binding.eval("__method__")
      ext_binding.receiver.method(method_name).parameters.map do |_, name|
        [name, ext_binding.local_variable_get(name)]
      end.to_h
    end

    # La requete se construit selon le nom et la valeur des arguments passés à la fonction
    def construct_request_with_arguments(base_request, ext_binding)
      request = base_request.concat("?")
      get_method_arguments(ext_binding).each do |arg_name, arg_value|
        request.concat(arg_name.to_s).concat("=").concat(arg_value.to_s).concat("&")
      end
      
      # Suppression du dernier "&"
      request[0..-2]
    end

    private :require, :parse ,:get, :construct_request_with_arguments
  end
end