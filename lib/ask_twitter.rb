require 'oauth'
require 'json'
require_relative 'ask_twitter/config_reader'

class AskTwitter
  attr_reader :api_consumer

  # Initialize the connection with the AskTwitter api.
  #
  # @param [Hash] connection_data the options to create a connection with the twitter api.
  # @option connection_data [String] :consumer_token The token from consumer
  # @option connection_data [String] :consumer_secret The secret token to authenticate consumer
  # @option connection_data [String] :site The url of the api site
  # @option connection_data [String] :oauth_token The token from oauth
  # @option connection_data [String] :oauth_secret  The secret token to validate user
  def initialize(connection_data={})
    connection_data = {consumer_token: ConfigReader.consumer_token,
                         consumer_secret: ConfigReader.consumer_secret,
                         site: ConfigReader.site,
                         oauth_token: ConfigReader.oauth_token,
                         oauth_secret: ConfigReader.oauth_secret}.merge(connection_data)

    consumer = OAuth::Consumer.new(connection_data[:consumer_token],
                                   connection_data[:consumer_secret],
                                   {  site: connection_data[:site], scheme: :header  })
    # now create the access token object from passed values
    token_hash = { oauth_token: connection_data[:oauth_token],
                   oauth_token_secret: connection_data[:oauth_secret]}
    @api_consumer = OAuth::AccessToken.from_hash(consumer, token_hash )
  end

  # Returns the user timeline request perform by the api
  # View https://dev.twitter.com/rest/reference/get/statuses/user_timeline
  #
  # @param [String] screen_name require param, the user name to search for the timeline.
  # @param [Hash<String>] options the optional params for the timeline request
  # @option options [String] :count Specifies the number of tweets to try and retrieve.
  # @option options[String] :since_id Returns results with an ID greater than the specified ID.
  # @option options [String] :include_rts For include retweets.
  #
  # @return [Array<String>] puts the request info in an array.
  def timeline(screen_name,options={})
    get(ConfigReader.timeline_route, options.merge({screen_name: screen_name}))
  end

  # Returns the user hashtag request perform by the api
  # View https://dev.twitter.com/rest/reference/get/search/tweets
  #
  # @param [String] q Require param, the hashtag to search for the tweets.
  # @param [Hash<String>] options the optional params for the hashtag request
  # @option options [String] :geocode Returns tweets by users located within a given radius.
  # @option options[String] :lang Restricts tweets to the given language.
  # @option options [String] :count The number of tweets to return per page.
  #
  # @return [Array<String>] puts the request info in an array.
  def hashtag(q, options={})
    get(ConfigReader.hashtag_route, options.merge({q: q}))
  end


  # Returns the user hashtag request perform by the api
  # View https://dev.twitter.com/rest/reference/get/trends/place
  #
  # @param [String] id Require param, the trend id to search for the topics.
  # @param [Hash<String>] options the optional params for the trend request
  # @option options [String] :exclude Setting this equal to hashtags will remove all hashtags from the trends list.
  #
  # @return [Array<String>] puts the request info in an array.
  def trends(id, options={})
    get(ConfigReader.trend_route, options.merge({id: id}))
  end


  # Returns the user user bio request perform by the api
  # View https://dev.twitter.com/rest/reference/get/users/search
  #
  # @param [String] q Require param, the user name to search for the bio data.
  # @param [Hash<String>] options the optional params for the bio request
  # @option options [String] :page Specifies the page of results to retrieve.
  # @option options[String] :include_entities The entities node will be disincluded from embedded tweet objects.
  # @option options [String] :count The number of potential user results to retrieve per page.
  #
  # @return [Array<String>] puts the request info in an array.
  def user_bio(q, options={})
    get(ConfigReader.bio_route, options.merge({q: q}))
  end

  # Returns the specific request perform by the api
  #
  # @param [String] route the user name to search for the bio.
  # @param [String] options the params options for the url request.
  #
  # @return [Array<String>] puts the request info in an array.
  def get(route, options)
    parse_json(@api_consumer.get(route+'?'+to_url_params(options)))
  end

  private

  # Return the string parameter as JSON.
  #
  # @param [String] response the string to parse.
  #
  # @return [Array<Hash>] return the string parameter as JSON.
  def parse_json(response)
    JSON.parse(response.body)
  end

  def to_url_params(params)
    params.collect do |param, value|
      [param, URI.encode(value)].join('=')
    end.sort.join('&')
  end

end