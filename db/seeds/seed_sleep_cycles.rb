# Gen 30 day sleep cycle
#
chris = User.find_or_create_by(email: 'chris@gmail.com')
tom = User.find_or_create_by(email: 'tom@gmail.com')
justin = User.find_or_create_by(email: 'justin@gmail.com')
steve = User.find_or_create_by(email: 'steve@gmail.com')


if SleepCycle.count == 0
  30.times.to_a.each do |v|
    night = SleepCycle.create(user: chris, start_sleep_time: v.days.ago, end_sleep_time: (v - 0.4).days.ago)
    night.reload.update(total_sleep_time: (night.end_sleep_time - night.start_sleep_time))

    night = SleepCycle.create(user: tom, start_sleep_time: v.days.ago, end_sleep_time: (v - 0.3).days.ago)
    night.reload.update(total_sleep_time: (night.end_sleep_time - night.start_sleep_time))

    night = SleepCycle.create(user: justin, start_sleep_time: v.days.ago, end_sleep_time: (v - 0.24).days.ago)
    night.reload.update(total_sleep_time: (night.end_sleep_time - night.start_sleep_time))

    night = SleepCycle.create(user: steve, start_sleep_time: v.days.ago, end_sleep_time: (v - 0.22).days.ago)
    night.reload.update(total_sleep_time: (night.end_sleep_time - night.start_sleep_time))
  end
end
