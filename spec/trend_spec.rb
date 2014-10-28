require_relative '../lib/ask_twitter/trend'

describe Trend do

  let(:trend_data) { [{'trends' =>[{'name' => 'worldcup'},
                                  {'name' => '#gol awesome!'}]}] }

  subject(:trend) { described_class.new(trend_data) }

  it '#topics' do
    expect(trend.topics).to eq(['worldcup', '#gol awesome!'])
  end

end