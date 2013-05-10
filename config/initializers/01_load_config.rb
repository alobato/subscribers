# http://stackoverflow.com/questions/4779773/how-do-i-change-the-load-order-of-initializers-in-rails-3
APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]
