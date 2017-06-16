config = Rails.application.config_for('redis').deep_symbolize_keys

if config[:namespace].blank?
  $redis = Redis.new config
else
  $redis = Redis::Namespace.new config[:namespace], redis: Redis.new(config)
end

# raise exception if connection failed
$redis.ping

# don't use flushdb, it does not respect namespace
if Rails.env.test?
  keys = $redis.keys('*')
  unless keys.empty?
    $redis.del keys
  end
end
