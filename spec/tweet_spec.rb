require_relative '../lib/ask_twitter/tweet'

describe Tweet do

  let(:retweet_num) { rand(1000).to_s }
  let(:tweet_data) { ['good job!',retweet_num,'adicaff'] }

  subject(:tweet) { described_class.new(tweet_data[0], tweet_data[1], tweet_data[2]) }

  it '#description' do
    expect(tweet.description).to eq('good job!')
  end

  it '#user' do
    expect(tweet.user).to eq('adicaff')
  end

  it '#retweets' do
    expect(tweet.retweet).to eq(retweet_num)
  end

end