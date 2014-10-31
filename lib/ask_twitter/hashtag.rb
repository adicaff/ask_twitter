require_relative 'tweet'
require_relative 'user'

class Hashtag
  include Enumerable

  def initialize(hashtag, tweet_data={})
    @hashtag = hashtag
    @tweets = Array.new
    tweet_data['statuses'].each do |status|
      @tweets.push(Tweet.new(status, status['user']))
    end
  end

  def tweets
    @tweets
  end

  def hashtag_name
    @hashtag
  end

  def each
    @tweets.each { |tweet| yield tweet }
  end
end