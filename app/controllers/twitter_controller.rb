def abuser_tweet
    require "twitter"
  
    user = Twitter::REST::Client.new do |config|
      config.consumer_key = 'FJEHpHWmzaYRrgmT0nQew'
      config.consumer_secret =  'b57WfRN8a6GgwMPFAEigwLrLIy4WbifGZ81HleIqMg'
      config.oauth_token = '418061367-wBsuQftVP9j9sv2VO7Hl7ozgw0DJ3u1JJdo5Hn1R'
      config.oauth_token_secret = 'oyz1j2Yxkbn2SQy6fGDRRxEH9K4lLWVsQfGMf5O5tdjIv'
    end
  
    #fetch tweets from abuser
    user.search("from:#{abuser_twitter_handle}", :result_type => "recent").take(50).collect do |tweet|
      "#{tweet.text} at #{tweet.timestamp}"
    end
    
    
end 