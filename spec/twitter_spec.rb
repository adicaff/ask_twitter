require_relative '../lib/ask_twitter/config_reader'
require_relative '../lib/ask_twitter'
require_relative '../lib/ask_twitter/trend'
require_relative '../lib/ask_twitter/timeline'
require 'json'

describe AskTwitter do
  subject(:twitter) { described_class.new }

  describe '#timeline' do
    let(:timeline_data) {double(:response,body: '[{"retweet_count": 2,
                                                  "text": "nice goal by the keeper!",
                                                  "created_at": "Fri Oct 21 15:35 +3000 2014",
                                                  "user": {"screen_name": "worldcup",
                                                           "followers_count": "10",
                                                           "profile_image_url": "http://www.hello.com"}}]' )}

    it 'gets the timeline tweets' do
      allow(twitter.api_consumer).to receive(:get).and_return(timeline_data)
      expect(twitter.api_consumer).to receive(:get).with(ConfigReader.timeline_route+'?'+'screen_name=adrian')
      twitter.timeline('adrian')
    end

    it 'should return the timeline tweets correctly' do
      allow(twitter.api_consumer).to receive(:get).and_return(timeline_data)
      expect(twitter.timeline('adrian')).to be_a(Timeline)
    end
  end

  describe '#hashtag' do
    let(:response_hashtag) {double(:response,body:'{"statuses":[{"retweet_count": 2,
                                                                  "text": "nice goal by the keeper!",
                                                                  "created_at": "Fri Oct 21 15:35 +3000 2014",
                                                                  "user": {"screen_name": "worldcup",
                                                                           "followers_count": "10",
                                                                           "profile_image_url": "http://www.hello.com"}}]}')}

    it 'gets the hashtags' do
      allow(twitter.api_consumer).to receive(:get).and_return(response_hashtag)
      expect(twitter.api_consumer).to receive(:get).with(ConfigReader.hashtag_route+'?'+'q=goal')
      twitter.hashtag('goal')
    end

    it 'should return the hashtags correctly' do
      allow(twitter.api_consumer).to receive(:get).and_return(response_hashtag)
      expect(twitter.hashtag('goal')).to be_a(Hashtag)
    end

  end

  describe '#trends' do
    let(:response_trends) {double(:response,body:'[{"trends":[{"id":1, "Name":"Nacional"},
                                                          {"id":2, "Name":"Suarez"}]}]')}

    it 'gets the trends' do
      allow(twitter.api_consumer).to receive(:get).and_return(response_trends)
      expect(twitter.api_consumer).to receive(:get).with(ConfigReader.trend_route+'?'+'id=1')
      twitter.trends('1')
    end

    it 'should return the trends correctly' do
      allow(twitter.api_consumer).to receive(:get).and_return(response_trends)
      expect(twitter.trends('1')).to be_a(Trend)
    end

  end

  describe '#user_bio' do
    let(:response_bio) {double(:response,body:'[{"id":1, "profile_image_url":"www.hello.com",
                                                "screen_name":"Bolso", "followers_count":1500000},
                                                       {"id":2, "profile_image_url":"www.Uruguay.com",
                                                "screen_name":"AUF", "followers_count":3000000}]')}

    it 'gets the bio' do
      allow(twitter.api_consumer).to receive(:get).and_return(response_bio)
      expect(twitter.api_consumer).to receive(:get).with(ConfigReader.bio_route+'?'+'q=adi')
      twitter.user_bio('adi')
    end

    it 'should return the bio correctly' do
      allow(twitter.api_consumer).to receive(:get).and_return(response_bio)
      expect(twitter.user_bio('adi')).to be_a(User)
    end
  end


end