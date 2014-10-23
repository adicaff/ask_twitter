require_relative '../lib/ask_twitter'
require_relative '../lib/ask_twitter/config_reader'
require 'json'

describe AskTwitter do
  subject(:twitter) { described_class.new }
  describe '#timeline' do
    let(:response_timeline) {double(:response,body:'[{"id":1, "Text":"Hello"},{"id":2, "Text":"Bye"}]')}
    let(:tweets) {[{'id'=>1, 'Text'=>'Hello'}, {'id'=>2, 'Text'=>'Bye'}]}
    before do
      allow(twitter.api_consumer).to receive(:get).and_return(response_timeline)
    end

    it 'gets the timeline tweets' do
      expect(twitter.api_consumer).to receive(:get).with(ConfigReader.timeline_route+'?')
      twitter.request('timeline')
    end

    it 'return the timeline tweets correctly' do
      expect(twitter.request('timeline')).to eq(tweets)
    end
  end

  describe '#hashtag' do
    let(:response) {double(:response,body:'[{"statuses":[{"id":1, "Text":"#gol at the end"},
                                                          {"id":2, "Text":"#gol awesome!"}]}]')}
    let(:hashtags) {[{'statuses' =>[{'id' => 1, 'Text' => '#gol at the end'},{'id' => 2, 'Text' => '#gol awesome!'}]}]}

    before do
      allow(twitter.api_consumer).to receive(:get).and_return(response)
    end

    it 'gets the hashtags' do
      expect(twitter.api_consumer).to receive(:get).with(ConfigReader.hashtag_route+'?q=%23gol')
      twitter.request('hashtag',{'q'=>'#gol'})
    end

    it 'return the hashtags correctly' do
      expect(twitter.request('hashtag',{'q'=>'#gol'})).to eq(hashtags)
    end
  end

  describe '#trends' do
    let(:response_trends) {double(:response,body:'[{"trends":[{"id":1, "Name":"Nacional"},
                                                          {"id":2, "Name":"Suarez"}]}]')}
    let(:trends) {[{'trends' =>[{'id' => 1, 'Name' => 'Nacional'},{'id' => 2, 'Name' => 'Suarez'}]}]}

    before do
      allow(twitter.api_consumer).to receive(:get).and_return(response_trends)
    end

    it 'gets the trends' do
      expect(twitter.api_consumer).to receive(:get).with(ConfigReader.trend_route+'?id=1')
      twitter.request('trends',{'id'=>'1'})
    end

    it 'return the trends correctly' do
      expect(twitter.request('trends',{'id'=>'1'})).to eq(trends)
    end
  end

  describe '#user_bio' do
    let(:response_bio) {double(:response,body:'[{"bio":[{"id":1, "Name":"Nacional",
                                                "Screen_name":"Bolso", "Followers_count":1500000},
                                                          {"id":2, "Name":"Uruguay",
                                                "Screen_name":"AUF", "Followers_count":3000000}]}]')}
    let(:bio) {[{'bio' =>[{'id' => 1, 'Name' => 'Nacional', 'Screen_name' => 'Bolso', 'Followers_count' => 1500000},
                          {'id' => 2, 'Name' => 'Uruguay', 'Screen_name' => 'AUF', 'Followers_count' => 3000000}]}]}

    before do
      allow(twitter.api_consumer).to receive(:get).and_return(response_bio)
    end

    it 'gets the bio' do
      expect(twitter.api_consumer).to receive(:get).with(ConfigReader.bio_route+'?q=futbol')
      twitter.request('bio',{'q'=>'futbol'})
    end

    it 'return the bio correctly' do
      expect(twitter.request('bio',{'q'=>'futbol'})).to eq(bio)
    end
  end

end