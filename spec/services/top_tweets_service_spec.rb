require 'rails_helper'

RSpec.describe TopTweetsService do
  describe '#exec' do
    let(:exec_top_tweets) { TopTweetsService.new.exec }

    context 'no tweets data' do
      it 'should return an empty array' do
        result = exec_top_tweets
        expect(result).to eq([])
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
        result = exec_top_tweets

        expect(result.count).to eq(2)
      end

      it 'should order by number_of_retweet' do
        result = exec_top_tweets

        expect(result[0][:number_of_retweet] > result[1][:number_of_retweet]).to eq(true)
      end

      it 'should not return tweets which not retweeted' do
        result = exec_top_tweets
        tweets = result.map { |r| r[:tweet] }

        expect(tweets).not_to include(steve_tweet_1)
        expect(tweets).not_to include(justin_tweet_1)
      end

      context 'tom new tweet is retweeted the same 2 times' do
        let(:tom_new_tweet) { create(:tweet, user: tom) }
        let!(:steve_retweet_new_tweet) { create(:retweet, user: steve, tweet: tom_new_tweet) }
        let!(:justin_retweet_new_tweet) { create(:retweet, user: justin, tweet: tom_new_tweet) }

        it 'should return latest tweet trendings first' do
          result = exec_top_tweets
          expect(result[0][:tweet]).to eq(tom_new_tweet)
          expect(result[0][:number_of_retweet]).to eq(2)
        end
      end
    end
  end
end

