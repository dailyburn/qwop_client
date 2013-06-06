require 'action_mailer'
require 'qwop_client/client'

module QwopClient
  module Mailers
    class Sendgrid

      def self.queue(queue, mail)
        mail.inform_interceptors
        mail.inform_observers
        
        to = mail.header[:to].to_s
        from = mail.header[:from].to_s
        subject = mail.subject
        text_content = mail.parts[0] ? mail.parts[0].decoded : ""
        html_content = mail.parts[1].decoded if mail.parts.length > 0
        sendgrid_headers = {"X-SMTPAPI" => mail['X-SMTPAPI'].to_s}
        
        QwopClient::Client.enqueue(queue, [to, from, subject, text_content, html_content, sendgrid_headers, ActionMailer::Base.perform_deliveries])        
      end

    end
  end
end