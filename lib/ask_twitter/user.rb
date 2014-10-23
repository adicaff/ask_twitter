class User

  def initialize(user_data={})
    @screen_name = user_data[:screen_name]
    @profile_image_url = user_data[:profile_image_url]
    @followers = user_data[:followers_count]
  end

  def screen_name
    @screen_name
  end

  def image_url
    @profile_image_url
  end

  def followers_count
    @followers
  end
end
