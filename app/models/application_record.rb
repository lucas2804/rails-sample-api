class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # pods inside k8s choose server host instead of mysql_host
  # if Rails.env === 'production'
  #   establish_connection(
  #     adapter: "mysql2",
  #     host: ENV['MYSQL_HOST'],
  #     username: ENV['MYSQL_USERNAME'],
  #     password: ENV['MYSQL_PASSWORD'],
  #     database: ENV['MYSQL_DATABASE']
  #   )
  # end
end
