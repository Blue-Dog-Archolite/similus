module Similus
  def self.redis
    @redis ||= begin
      ::Redis.new(:host => config.redis_host, :port => config.redis_port,
                         :username => config.redis_username, :password => config.redis_password,
                         :thread_safe => true)
    rescue Exception => e
      config.logger.error "Error connecting redis server: #{e.message}"
      nil
    end
  end

  def self.clear_database!
    @cache = {}
    redis.flushdb
  end
end
