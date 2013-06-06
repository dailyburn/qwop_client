# QwopClient

QwopClient is a client for publishing messages to an NSQ instance

## Installation

Add this line to your application's Gemfile:

    gem 'qwop_client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install qwop_client

After installing you will need to add an initializer that defines QwopClient.nsq_host (default: localhost) and QwopClient.nsq_port (default: 4150). If using rails this file can be generated for you by running:

	$ rails generate initializer

## Usage

	QwopClient::Mailers::Sendgrid.queue("name_of_your_nsq_queue", Mail.new)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
