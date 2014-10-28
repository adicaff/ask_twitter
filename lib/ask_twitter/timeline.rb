require_relative 'user'
require_relative 'tweet'

class Timeline
  include Enumerable

  def initialize(timeline_data={})
    @tweets = Array.new
    timeline_data.each do |status|
      @tweets.push(Tweet.new(status, status['user']))
    end
  end

  def tweets
    @tweets
  end

  def each
    @tweets.each { |tweet| yield tweet }
  end
end