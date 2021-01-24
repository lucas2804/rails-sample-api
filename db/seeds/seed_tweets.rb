tom = User.find_or_create_by(email: 'tom@gmail.com', name: 'Tom')
steve = User.find_or_create_by(email: 'steve@gmail.com', name: 'Steve')
justin = User.find_or_create_by(email: 'justin@gmail.com', name: 'Justin')

active = Tweet.statuses[:active]
tom_tweet1 = Tweet.find_or_create_by(content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempor interdum ultricies. Praesent efficitur posuere auctor.', user: tom, status: active)
tom_tweet2 = Tweet.find_or_create_by(content: 'Morbi ultrices erat nec sagittis tristique. Phasellus non risus tortor. Mauris vel lobortis mi. Sed a elementum felis. Sed at tellus leo.', user: tom, status: active)
tom_tweet3 = Tweet.find_or_create_by(content: '3 Morbi ultrices erat nec sagittis tristique. Phasellus non risus tortor. Mauris vel lobortis mi. Sed a elementum felis. Sed at tellus leo.', user: tom, status: active)

Tweet.find_or_create_by(content: 'Duis id venenatis eros. Duis suscipit nisi et tincidunt imperdiet. Phasellus eget leo cursus sem egestas dignissim', user: steve, status: active)
Tweet.find_or_create_by(content: 'Cras finibus, diam vel rutrum dignissim, neque justo cursus lorem, ut ultrices metus libero vel ligula. Fusce venenatis lectus ex,', user: steve, status: active)

Tweet.find_or_create_by(content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempor interdum ultricies. Praesent efficitur posuere auctor.', user: justin, status: active)
Tweet.find_or_create_by(content: 'Morbi ultrices erat nec sagittis tristique. Phasellus non risus tortor. Mauris vel lobortis mi. Sed a elementum felis. Sed at tellus leo.', user: justin, status: active)

Tweet.find_or_create_by(content: '4 Morbi ultrices erat nec sagittis tristique. Phasellus non risus tortor. Mauris vel lobortis mi. Sed a elementum felis. Sed at tellus leo.', user: justin, status: active)

Tweet.find_or_create_by(content: '5 Morbi ultrices erat nec sagittis tristique. Phasellus non risus tortor. Mauris vel lobortis mi. Sed a elementum felis. Sed at tellus leo.', user: justin, status: active)

Retweet.find_or_create_by(user: steve, tweet: tom_tweet1)
Retweet.find_or_create_by(user: justin, tweet: tom_tweet1)

Retweet.find_or_create_by(user: steve, tweet: tom_tweet2)
Retweet.find_or_create_by(user: justin, tweet: tom_tweet2)

Retweet.find_or_create_by(user: steve, tweet: tom_tweet3)

