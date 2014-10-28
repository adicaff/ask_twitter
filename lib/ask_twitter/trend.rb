class Trend
  def initialize(trend_data={})
    @topics = Array.new
    trend_data.each do |trend|
      trend['trends'].each do |topic|
        @topics.push(topic['name'])
      end
    end
  end

  def topics
    @topics
  end

  def to_s
    "#{@topics}"
  end
end