require "json"
require "nsq"
require "securerandom"

module QwopClient
  class Client

    def self.enqueue(queue, args)    
      message = {
        :id => SecureRandom.uuid,
        :task_name => "#{queue} Task",
        :args => args
      }

      NSQ::Publisher.new(QwopClient::nsq_host, QwopClient::nsq_port) do |publisher|
        publisher.publish(queue, message.to_json)
      end
    end

  end
end