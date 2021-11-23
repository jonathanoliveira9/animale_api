class Rack::Attack
  throttle('req/ip', limit: 300, period: 5.minutes) do |req|
    req.ip
  end

  throttle('logins/email', limit: 5, period: 20.seconds) do |req|
    if req.path == '/login' && req.post?
      req.params['email'].presence
    end
  end

  Rack::Attack.safelist('allow from localhost') do |req|
    req.ip == '127.0.0.1'
  end
end
