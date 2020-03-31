class TopTweetsService
  def exec
    top_retweets = Retweet.top_retweets
    top_tweets = Tweet.includes(:user).where(id: top_retweets.keys)

    top_retweeted_tweets_format(top_retweets, top_tweets) +
      not_top_tweets_format(top_tweets.map(&:id))
  end

  private

  def top_retweeted_tweets_format(top_retweets, top_tweets)
    top_retweets.map do |retweet|
      tweet = top_tweets.select { |tweet| tweet.id == retweet[0] }.first
      tweet.number_of_retweet = retweet[1]
      TweetSerializer.new(tweet)
    end
  end

  def not_top_tweets_format(top_tweet_ids)
    tweets = Tweet.not_top_tweets(top_tweet_ids)
    tweets.map do |tweet|
      tweet.number_of_retweet = 0
      TweetSerializer.new(tweet)
    end
  end
end
