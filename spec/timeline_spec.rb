require_relative '../lib/ask_twitter/timeline'

describe Timeline do

  let(:timeline_data) { [{'retweet_count' => 2,
                          'text'          => 'nice goal by the keeper!',
                          'created_at'    => 'Fri Oct 21 15:35 +3000 2014',
                          'user'          => {'screen_name'       => 'worldcup',
                                              'followers_count'   => '10',
                                              'profile_image_url' => 'http://www.hello.com'}}] }

  subject(:timeline) { described_class.new(timeline_data) }

  describe '#tweets' do

    it 'should return the hashtag tweets correctly' do

      expect(timeline.tweets[0].description).to eq('nice goal by the keeper!')
    end
  end

end