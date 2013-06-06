class InitializerGenerator < Rails::Generators::Base
  desc "This generator creates an initializer file at config/initializers"
  def create_initializer_file
    create_file "config/initializers/qwop_client_initializer.rb", "QwopClient.nsq_host='localhost'\nQwopClient.nsq_port=4150"
  end
end