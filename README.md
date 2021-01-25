## Tripla README

1. Clock In operation, and return all clocked-in times, ordered by created time.
    + **track start sleep time**
    + **track end sleep time**
    + **ordered by created time**
2. Users can follow and unfollow other users.
    + **User_id_4 follow user_id_1**
    + **User_id_4 unfollow user_id_1**
3. See the sleep records over the past week for their friends, ordered by the length of their sleep.
    + **See the sleep records**

## I - Set up

```bash
bundle exec rake db:migrate
bundle exec rake db:seed

bundle exec rails s
```

### 1. Clock In operation, and return all clocked-in times, ordered by created time.

- **track start sleep time**

```json
curl --location --request POST 'http://localhost:3000/sleep_cycles' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjNTkzNmVjNyJ9.QA3Gcvy27GAum1y2L_f_YbYJsuDmuYTzKf7i_qtaNW0' \
--header 'Cookie: next-i18next=en' \
--data-raw '{
    "user_id": 1
}'

{
    "data": {
        "id": 125,
        "user_id": 1,
        "start_sleep_time": "2021-01-25T01:03:45.000Z",
        "end_sleep_time": null,
        "length_of_sleep": "0 hours"
    }
}
```

- **track end sleep time**

```json
curl --location --request PUT 'http://localhost:3000/sleep_cycles/124/end_sleep_cycle' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjNTkzNmVjNyJ9.QA3Gcvy27GAum1y2L_f_YbYJsuDmuYTzKf7i_qtaNW0' \
--header 'Cookie: next-i18next=en' \
--data-raw ''

{
    "data": {
        "id": 124,
        "user_id": 1,
        "start_sleep_time": "2021-01-25T01:02:57.000Z",
        "end_sleep_time": null,
        "length_of_sleep": "0.03 hours"
    }
}
```

- **ordered by created time**

```json

curl --location --request GET 'http://localhost:3000/sleep_cycles' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjNTkzNmVjNyJ9.QA3Gcvy27GAum1y2L_f_YbYJsuDmuYTzKf7i_qtaNW0' \
--header 'Cookie: next-i18next=en' \
--data-raw ''

{
    "data": [
        {
            "id": 125,
            "user_id": 1,
            "start_sleep_time": "2021-01-25T01:03:45.000Z",
            "end_sleep_time": null,
            "length_of_sleep": "0 hours"
        },
        {
            "id": 124,
            "user_id": 1,
            "start_sleep_time": "2021-01-25T01:02:57.000Z",
            "end_sleep_time": null,
            "length_of_sleep": "0.03 hours"
        },
        {
            "id": 123,
            "user_id": 1,
            "start_sleep_time": "2021-01-25T01:02:00.000Z",
            "end_sleep_time": null,
            "length_of_sleep": "0 hours"
        },
        {
            "id": 122,
            "user_id": 1,
            "start_sleep_time": "2021-01-25T01:01:47.000Z",
            "end_sleep_time": null,
            "length_of_sleep": "0 hours"
        },
        {
            "id": 121,
            "user_id": 1,
            "start_sleep_time": "2021-01-25T01:01:41.000Z",
            "end_sleep_time": null,
            "length_of_sleep": "0 hours"
        },
        {
            "id": 1,
            "user_id": 4,
            "start_sleep_time": "2021-01-24T04:08:58.000Z",
            "end_sleep_time": "2021-01-24T13:44:58.000Z",
            "length_of_sleep": "9.6 hours"
        },
        {
            "id": 2,
            "user_id": 1,
            "start_sleep_time": "2021-01-24T04:08:58.000Z",
            "end_sleep_time": "2021-01-24T11:20:58.000Z",
            "length_of_sleep": "7.2 hours"
        },
        {
            "id": 3,
            "user_id": 3,
            "start_sleep_time": "2021-01-24T04:08:58.000Z",
            "end_sleep_time": "2021-01-24T09:54:34.000Z",
            "length_of_sleep": "5.76 hours"
        },
        {
            "id": 4,
            "user_id": 2,
            "start_sleep_time": "2021-01-24T04:08:58.000Z",
            "end_sleep_time": "2021-01-24T09:25:46.000Z",
            "length_of_sleep": "5.28 hours"
        },
        {
            "id": 5,
            "user_id": 4,
            "start_sleep_time": "2021-01-23T04:08:58.000Z",
            "end_sleep_time": "2021-01-23T13:44:58.000Z",
            "length_of_sleep": "9.6 hours"
        },
        {
            "id": 6,
            "user_id": 1,
            "start_sleep_time": "2021-01-23T04:08:58.000Z",
            "end_sleep_time": "2021-01-23T11:20:58.000Z",
            "length_of_sleep": "7.2 hours"
        },
        {
            "id": 7,
            "user_id": 3,
            "start_sleep_time": "2021-01-23T04:08:58.000Z",
            "end_sleep_time": "2021-01-23T09:54:34.000Z",
            "length_of_sleep": "5.76 hours"
        },
        {
            "id": 8,
            "user_id": 2,
            "start_sleep_time": "2021-01-23T04:08:58.000Z",
            "end_sleep_time": "2021-01-23T09:25:46.000Z",
            "length_of_sleep": "5.28 hours"
        },
        {
            "id": 9,
            "user_id": 4,
            "start_sleep_time": "2021-01-22T04:08:58.000Z",
            "end_sleep_time": "2021-01-22T13:44:58.000Z",
            "length_of_sleep": "9.6 hours"
        },
        {
            "id": 10,
            "user_id": 1,
            "start_sleep_time": "2021-01-22T04:08:58.000Z",
            "end_sleep_time": "2021-01-22T11:20:58.000Z",
            "length_of_sleep": "7.2 hours"
        },
        {
            "id": 11,
            "user_id": 3,
            "start_sleep_time": "2021-01-22T04:08:58.000Z",
            "end_sleep_time": "2021-01-22T09:54:34.000Z",
            "length_of_sleep": "5.76 hours"
        },
        {
            "id": 12,
            "user_id": 2,
            "start_sleep_time": "2021-01-22T04:08:58.000Z",
            "end_sleep_time": "2021-01-22T09:25:46.000Z",
            "length_of_sleep": "5.28 hours"
        },
        {
            "id": 13,
            "user_id": 4,
            "start_sleep_time": "2021-01-21T04:08:58.000Z",
            "end_sleep_time": "2021-01-21T13:44:58.000Z",
            "length_of_sleep": "9.6 hours"
        },
        {
            "id": 14,
            "user_id": 1,
            "start_sleep_time": "2021-01-21T04:08:58.000Z",
            "end_sleep_time": "2021-01-21T11:20:58.000Z",
            "length_of_sleep": "7.2 hours"
        },
        {
            "id": 15,
            "user_id": 3,
            "start_sleep_time": "2021-01-21T04:08:58.000Z",
            "end_sleep_time": "2021-01-21T09:54:34.000Z",
            "length_of_sleep": "5.76 hours"
        },
        {
            "id": 16,
            "user_id": 2,
            "start_sleep_time": "2021-01-21T04:08:58.000Z",
            "end_sleep_time": "2021-01-21T09:25:46.000Z",
            "length_of_sleep": "5.28 hours"
        }
    ]
}
```


### 2. Users can follow and unfollow other users.

- **User_id_4 follow user_id_1**

```json
curl --location --request POST 'http://localhost:3000/follows' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjNTkzNmVjNyJ9.QA3Gcvy27GAum1y2L_f_YbYJsuDmuYTzKf7i_qtaNW0' \
--header 'Cookie: next-i18next=en' \
--data-raw '{
    "user_id": 4,
    "following_id": 1
}'


{
    "data": {
        "id": 7,
        "user_id": 4,
        "following_id": 1
    }
}
```

- **User_id_4 unfollow user_id_1**

```json
curl --location --request DELETE 'http://localhost:3000/follows/6' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjNTkzNmVjNyJ9.QA3Gcvy27GAum1y2L_f_YbYJsuDmuYTzKf7i_qtaNW0' \
--header 'Cookie: next-i18next=en' 

Status: 204
```

### 3. See the sleep records over the past week for their friends, ordered by the length of their sleep.

```json
curl --location --request GET 'http://localhost:3000/users/1/friend_sleeps' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjNTkzNmVjNyJ9.QA3Gcvy27GAum1y2L_f_YbYJsuDmuYTzKf7i_qtaNW0' \
--header 'Cookie: next-i18next=en' \
--data-raw ''

[
    {
        "id": 3,
        "email": "justin@gmail.com",
        "total_sleep_last_week": 40.32
    },
    {
        "id": 2,
        "email": "steve@gmail.com",
        "total_sleep_last_week": 36.96
    }
]
```
