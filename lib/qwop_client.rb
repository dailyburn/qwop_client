require "qwop_client/client"
require "qwop_client/mailers/sendgrid"
require "qwop_client/version"

module QwopClient
  mattr_accessor :nsq_host, :nsq_port
end