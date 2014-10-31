require 'yaml'

class ConfigReader

  # Return the consumer token read from config file.
  #
  # @return [String] consumer_token the consumer token.
  def self.consumer_token
    read_config['consumer']['token']
  end

  # Return the consumer secret read from config file.
  #
  # @return [String] consumer_secret the consumer secret token.
  def self.consumer_secret
    read_config['consumer']['secret']
  end

  # Return the oauth token read from config file.
  #
  # @return [String] oauth_token the oauth token.
  def self.oauth_token
    read_config['oauth']['token']
  end

  # Return the oauth secret read from config file.
  #
  # @return [String] oauth_secret the oauth secret token.
  def self.oauth_secret
    read_config['oauth']['secret']
  end

  # Return the twitter api site url.
  #
  # @return [String] site api url.
  def self.site
    read_config['site']
  end

  # Return the timeline request url.
  #
  # @return [String] timeline request url.
  def self.timeline_route
    "#{read_config['site']}/1.1/statuses/user_timeline.json"
  end

  # Return the trending topics request url.
  #
  # @return [String] trends request url.
  def self.trend_route
    "#{read_config['site']}/1.1/trends/place.json"
  end

  # Return the hashtag search request url.
  #
  # @return [String] hashtag request url.
  def self.hashtag_route
    "#{read_config['site']}/1.1/search/tweets.json"
  end

  # Return the user bio request url.
  #
  # @return [String] user bio request url.
  def self.bio_route
    "#{read_config['site']}/1.1/users/search.json"
  end

  private

  # Return the consumer token read from config file.
  #
  # @return [String] consumer_token the consumer token.
  def self.read_config
    @config_file ||= YAML::load(IO.read('config/config.yml'))
  end

end