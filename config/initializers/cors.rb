Rails.application.config.middleware.insert_before 0, Rack::Cors do
  # Insert CORS request headers for API responses
  allow do
    # Access-Control-Allow-Origin: (Origin に書かれたものをそのまま返す)
    origins '*'

    # Access-Control-Allow-Methods: GET, POST, PUT, OPTIONS
    # Access-Control-Allow-Headers: (OPTIONS に対してのみ Access-Control-Request-Headers に書かれたものをそのまま返す)
    # Access-Control-Max-Age: 3600
    resource '/*',
             :methods => [:get, :post, :put, :options],
             :headers => :any,
             :max_age => 3600
  end
end
