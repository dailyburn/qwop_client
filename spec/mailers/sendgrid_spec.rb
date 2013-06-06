require 'qwop_client'
require 'mail'

describe QwopClient::Mailers::Sendgrid do
  before(:all) do
    @mail = Mail.new(:to => "test", :from => "test", :subject => "test")
  end

  describe "self.queue" do
  	it "should inform interceptors" do
      @mail.should_receive(:inform_interceptors)
      QwopClient::Mailers::Sendgrid.queue("mail_queue", @mail)
    end

    it "should inform observers" do
      @mail.should_receive(:inform_observers)
      QwopClient::Mailers::Sendgrid.queue("mail_queue", @mail)
    end

    it "should add sendgrid headers" do
      QwopClient::Client.should_receive(:enqueue) do |arg1, arg2|
        arg1.should eq "mail_queue"
        arg2.should include({"X-SMTPAPI" => ""})
      end
      QwopClient::Mailers::Sendgrid.queue("mail_queue", @mail)
    end

    it "should queue the mail message" do
      QwopClient::Mailers::Sendgrid.queue("mail_queue", @mail).should be_a(NSQ::Publisher)
    end
  end
end