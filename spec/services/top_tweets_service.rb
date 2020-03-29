RSpec.describe TopTweetsService, type: :model do
  let(:tom)
  let(:steve)
  let(:justin)

  let(:tom_tweet_10)
  let(:steve_tweet_1)
  let(:justin_tweet_1)

  let(:steve_retweet_tom_tweet_1)
  let(:justin_retweet_tom_tweet_1)

  let(:steve_retweet_tom_tweet_2)

  describe '#exec' do
    it 'should return top tweet trendings' do
      expect(result[0]).to eq(tom_tweet_10[0])
      expect(result[1]).to eq(tom_tweet_10[1])
      expect(result.count).to eq(2)
    end

    it 'should not return tweets which not retweeted' do
      expect(result).not_to include?(steve_tweet_1)
      expect(result).not_to include?(justin_tweet_1)
    end

    context 'tom new tweet is retweeted the same 2 times' do
      let(:tom_new_tweet)
      let(:steve_retweet_new_tweet)
      let(:justin_retweet_new_tweet)

      it 'should return latest tweet trendings' do
        expect(result[0]).to eq(tom_new_tweet)
        expect(result[1]).to eq(tom_tweet_10[0])
        expect(result.count).to eq(10)
      end
    end
  end
end

