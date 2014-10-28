require_relative '../lib/ask_twitter/hashtag'
require_relative '../lib/ask_twitter/user'
require_relative '../lib/ask_twitter/tweet'


describe Hashtag do

=begin
  let(:hashtag_data) { double(:tweet_data, statuses: "[{'retweet_count' => '1',
                                                       'text' => '#gol at the end',
                                                       'user' => [{'screen_name' => 'Joseph',
                                                                  'profile_image_url' => 'www',
                                                                  'followers_count' => '2'}]}]")}
=end
  let(:user)  {User.new()}
  let(:tweet) {Tweet.new('test!',4,'gerome')}
  let(:user)  {User.new()}
  let(:hashtag_data) { {'statuses' =>[{'retweet_count' => 1,
                                        'text' => '#gol at the end',
                                        'user' => [{'screen_name' => 'Joseph',
                                                   'profile_image_url' => 'www',
                                                   'followers_count' => 2}]},
                                      {'retweet_count' => 2,
                                       'text' => 'nice goal by the keeper!',
                                       'user' => [{'screen_name' => 'Maria',
                                                   'profile_image_url' => 'http',
                                                   'followers_count' => 8}]}]} }

  subject(:hashtag) { described_class.new('test', hashtag_data) }

  it '#tweets' do
      expect(hashtag.tweets).to eq(['#gol at the end', 'nice goal by the keeper!'])
  end

end