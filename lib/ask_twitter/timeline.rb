require_relative 'user'
require_relative 'tweet'

class Timeline
  def initialize(timeline_data={})
    @tweets = Array.new
    timeline_data.each do |status|
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