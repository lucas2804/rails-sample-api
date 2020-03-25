tom = User.find_or_create_by(email: 'tom@gmail.com', name: 'Tom')
steve = User.find_or_create_by(email: 'steve@gmail.com', name: 'Steve')
justin = User.find_or_create_by(email: 'justin@gmail.com', name: 'Justin')

active = Tweet.statuses[:active]
Tweet.find_or_create_by(content: 'Tom tweet sth nice 01!', user: tom, status: active)
Tweet.find_or_create_by(content: 'Tom tweet sth nice 02!', user: tom, status: active)

Tweet.find_or_create_by(content: 'Tom tweet sth nice 03!', user: steve, status: active)
Tweet.find_or_create_by(content: 'Tom tweet sth nice 04!', user: steve, status: active)

Tweet.find_or_create_by(content: 'Tom tweet sth nice 05!', user: justin, status: active)
Tweet.find_or_create_by(content: 'Tom tweet sth nice 06!', user: justin, status: active)
