#!/bin/bash

echo "Clean project"

rm app/controllers/users_controller.rb
rm app/models/user.rb
rm app/serializers/user_serializer.rb
rm db/migrate/20190517074827_create_users.rb
rm spec/controllers/users_controller_spec.rb
rm spec/factories/users.rb
rm spec/models/user_spec.rb
rm spec/requests/users_spec.rb
rm spec/routing/users_routing_spec.rb
