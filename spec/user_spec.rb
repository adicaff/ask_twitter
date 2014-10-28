require_relative '../lib/ask_twitter/user'

describe User do

  let(:user_data) { {:screen_name      => 'worldcup',
                    :followers_count   => '10',
                    :profile_image_url => 'http://www.hello.com'} }

  subject(:user) { described_class.new(user_data) }

  it '#screen_name' do
    expect(user.screen_name).to eq('worldcup')
  end

end