class MessageSender < ApplicationRecord
  def self.send_message(phone_number, message)
    client = Twilio::REST::Client.new
    client.messages.create(
      from: "+15628372060",
      to: phone_number,
      body: message
    )
  end
end
