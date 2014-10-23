require_relative 'tweet'
require_relative 'user'

class Hashtag

  def initialize(hashtag, tweet_data={})
    @hashtag = hashtag
    @tweets = Array.new
    tweet_data['statuses'].each do |status|
      @tweets.push(Tweet.new(status['text'],
                             status['retweet_count'],
                             User.new({screen_name: status['user']['screen_name'],
                                       profile_image_url: status['user']['profile_image_url'],
                                       followers_count: status['user']['followers_count']})))
    end
  end

  def tweets
    @tweets
  end
end