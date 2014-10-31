require_relative '../lib/ask_twitter/user'

describe User do

  let(:followers) { rand(1000).to_s }
  let(:user_data) { {'screen_name'      => 'worldcup',
                    'followers_count'   => followers,
                    'profile_image_url' => 'http://www.hello.com'} }

  subject(:user) { described_class.new(user_data) }

  describe '#screen_name' do

    it 'should return the user\'s screen_name' do

      expect(user.screen_name).to eq('worldcup')
    end
  end

  describe '#followers_count' do

    it 'should return the user\'s followers count' do

      expect(user.followers_count).to eq(followers)
    end
  end

  describe '#image_url' do

    it 'should return the user\'s profile image url' do

      expect(user.image_url).to eq('http://www.hello.com')
    end
  end
end