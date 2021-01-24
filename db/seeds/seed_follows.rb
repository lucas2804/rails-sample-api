chris = User.find_or_create_by(email: 'chris@gmail.com')
tom = User.find_or_create_by(email: 'tom@gmail.com')
justin = User.find_or_create_by(email: 'justin@gmail.com')
steve = User.find_or_create_by(email: 'steve@gmail.com')

chris.follow!(tom.id)
chris.follow!(justin.id)
chris.follow!(steve.id)

tom.follow!(justin.id)
tom.follow!(steve.id)
