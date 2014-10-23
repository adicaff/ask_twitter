class Tweet

  def initialize(text, retweets, user)
    @text, @user, @retweet = text, user, retweets
  end

  def description
    @text
  end

  def user
    @user
  end

  def retweet
    @retweet
  end
end