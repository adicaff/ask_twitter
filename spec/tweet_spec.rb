require_relative '../lib/ask_twitter/tweet'

describe Tweet do

  let(:number) { rand(1000).to_s }
  let(:tweet_data) { {'retweet_count' => number,
                      'text'          => 'nice goal by the keeper!',
                      'created_at'    => 'Fri Oct 21 15:35 +3000 2014'} }

  let(:user_data) { {'screen_name'       => 'worldcup',
                     'followers_count'   =>   number,
                     'profile_image_url' => 'http://www.hello.com'} }

  subject(:tweet) { described_class.new(tweet_data, user_data) }

  describe '#description' do

    it 'should return the tweet\'s text' do

      expect(tweet.description).to eq('nice goal by the keeper!')
    end
  end

  describe '#user' do

    it 'should return the tweet\'s user' do

      expect(tweet.user).to be_a(User)
    end
  end

  describe '#retweets' do

    it 'should return the tweet\'s retweets' do

      expect(tweet.retweet).to eq(number)
    end
  end

  describe '#created_at' do

    it 'should return the tweet\'s creation date' do

      expect(tweet.created_at).to eq('21 Oct 2014')
    end
  end

  describe '#user_screen_name' do

    it 'should return the tweet\'s user screen name' do

      expect(tweet.user_screen_name).to eq('worldcup')
    end
  end

  describe '#user_image_url' do

    it 'should return the tweet\'s user image url' do

      expect(tweet.user_image_url).to eq('http://www.hello.com')
    end
  end

end