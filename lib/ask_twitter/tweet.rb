require_relative 'user'
class Tweet

  def initialize(status={}, user={})
    if(status['retweeted_status'])
      @text, @retweet = "RT #{status['retweeted_status']['text']}", status['retweeted_status']['retweet_count']
      @original_user = User.new(status['retweeted_status']['user'])
    else
      @text, @retweet = status['text'], status['retweet_count']
      @original_user = User.new(user)
    end
    time = Array.new(status['created_at'].split(' '))
    @created_at = "#{time[2]} #{time[1]} #{time[5]}"
    @user = User.new(user)
  end

  def description
    @text
  end

  def user
    @user
  end

  def created_at
    @created_at
  end

  def original_user
    @original_user
  end

  def retweet
    @retweet
  end

  def user_screen_name
    @user.screen_name
  end

  def original_user_name
    @original_user.screen_name
  end

  def user_image_url
    @user.image_url
  end
end