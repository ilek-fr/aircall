require 'aircall'

module DefaultAircall
  AIRCALL = Aircall.new({id: ENV['AIRCALL_ID'], token: ENV['AIRCALL_TOKEN']})
end
