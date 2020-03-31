require 'rails_helper'

RSpec.describe Retweet, type: :model do
  describe '.top_retweets' do
    let(:subject) { Retweet.top_retweets }

    context 'no tweets data' do
      it 'should return an empty hash' do
        result = subject
        expect(result).to eq({})
      end
    end

    context 'exist tweets data' do
      let!(:tom) { create(:user) }
      let!(:steve) { create(:user) }
      let!(:justin) { create(:user) }

      let!(:tom_tweet_10) { create_list(:tweet, 10, user: tom) }
      let!(:steve_tweet_1) { create(:tweet, user: steve) }
      let!(:justin_tweet_1) { create(:tweet, user: justin) }

      let!(:steve_retweet_tom_tweet_3) { create(:retweet, user: steve, tweet: tom_tweet_10[2]) }
      let!(:justin_retweet_tom_tweet_3) { create(:retweet, user: justin, tweet: tom_tweet_10[2]) }
      let!(:steve_retweet_tom_tweet_2) { create(:retweet, user: steve, tweet: tom_tweet_10[1]) }

      it 'should return top tweet trendings' do
        result = subject

        expect(result.count).to eq(2)
      end

      it 'should order by number_of_retweet' do
        counted_tweets = subject.values

        expect(counted_tweets[0] > counted_tweets[1]).to eq(true)
        expect(counted_tweets[0]).to eq(2)
        expect(counted_tweets[1]).to eq(1)
      end

      it 'should not return tweets which not retweeted' do
        tweet_ids = subject.keys

        expect(tweet_ids).not_to include(steve_tweet_1.id)
        expect(tweet_ids).not_to include(justin_tweet_1.id)
      end

      context 'tom new tweet is retweeted the same 2 times' do
        let(:tom_new_tweet) { create(:tweet, user: tom) }
        let!(:steve_retweet_new_tweet) { create(:retweet, user: steve, tweet: tom_new_tweet) }
        let!(:justin_retweet_new_tweet) { create(:retweet, user: justin, tweet: tom_new_tweet) }

        it 'should return latest tweet trendings first' do
          tweet_ids = subject.keys
          expect(tweet_ids[0]).to eq(tom_new_tweet.id)
        end
      end
    end
  end
end

