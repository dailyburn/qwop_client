require 'qwop_client'

describe QwopClient::Client do
  describe "self.enqueue" do
    it "should generate a unique message id" do
      SecureRandom.should_receive(:uuid)
      QwopClient::Client.enqueue("queue", "message")
    end

    it "should return an nsq publisher" do
      QwopClient::Client.enqueue("queue", "message").should be_a(NSQ::Publisher)
    end
  end
end