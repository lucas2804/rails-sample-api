class TopTweetsService
  def exec
    retweets = Retweet.group('tweet_id').limit(10).order('count_id DESC, tweet_id DESC')
                 .count(:id)
    tweets = Tweet.where(id: retweets.keys)
    retweets.map do |retweet|
      tweet = tweets.select { |tweet| tweet.id == retweet[0] }.first
      {
        tweet: tweet,
        number_of_retweet: retweet[1]
      }
    end
  end
end
