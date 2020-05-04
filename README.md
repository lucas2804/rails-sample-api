# I - AgileLab

## 1. Anagram Tester
- An anagram is created by re-arranging the letters of a word. For example, the word LISTEN is an anagram of SILENT. You can find the definition in Wikipedia. Below is a skeleton defenition of a method for testing if two words make an anagram. Your task is to implement this method, using Ruby. It should take in two strings and return true if the two words make an anagram, or false if it's not.
```ruby
# app/services/anagram_service.rb
class AnagramService
  def anagram?(first_word, second_word)
    sort_anagram(first_word) == sort_anagram(second_word)
  end

  private

  def sort_anagram(word)
    word.downcase.split('').sort.join('')
  end
end
```

## 2. Anonymous Chat
- Public can initiate the chat
- Admin can acknowledge that they have seen the chat (not messages).
- Admin can response to the chat with the person who initiate the chat.
- Admin can closed the conversation.
- Admin cannot initiate the chat.

```ruby
Rails.application.routes.draw do
  resources :conversations, only: [:create]do
    resources :messages, only: [:create] # enum status: { unseen: 0, seen: 1 }
    member do
      delete :close
    end
  end
end
```

## 3. Bug Fixing

- When client or users reported an issue to you, describe what you do next. How do you go about trouble shooting the issue? Depending on what you find, what will your next step be? When do you consider the issue fixed or resolved?

1) When client or users reported an issue to you, describe what you do next?
    + request reproduce steps, env, inputs, outputs, expectations
    + Verify this issue is bug or feature
    + Prioritize this issue
    + Planning to fix this issue, if this issue is marked with P1. It should be fixed immediately.
    + Write unit-test to cover this issue,
    + Write behavior-test to cover this issue if this issue about UI (if company have enough resources).
    + Implement code and test on local.
    + Deploy to staging then test.
    + Test integration on production env.
    
2) When do you consider the issue fixed or resolved?
    + When the fix on production
    + When the engineer go to the production env then take some tests about this issues
    + When the engineer test some main feature to make sure the new fix does not have any bad impact to production.
    + The engineer should take a snapshot about the fix on production then attach it into the ticket.
    + Feel free to close the ticket, without too much depend on QA.
    
## 4. Taking over an old project

- You have recently been assigned to an old project, the previous developer had already left and you are tasked to take over the project and implement new features. However you are facing some problems, the new feature that you are implementating doesn't seem to go well with the existing features. The more you code, the more edge case you encounter.

1) Clear requirements as much as possible
2) Read code to find test cases and outputs, then confirm them with Product Owner
3) Don't try to refactor code at this time, let legacy code alone
4) Write tests and implement new features to make sure they not impact to old features.
5) Make your code as isolate as possible, maybe under services, modules to plugin in them to the old one.
6) When new features ready and work well with the old one.
7) consider to refactor the old one step by step.
8) Make it work, Make it right, then make it fast.

========================================================================================================================
========================================================================================================================
========================================================================================================================
========================================================================================================================
========================================================================================================================
========================================================================================================================
========================================================================================================================
========================================================================================================================
========================================================================================================================
========================================================================================================================
========================================================================================================================
========================================================================================================================
========================================================================================================================
========================================================================================================================
========================================================================================================================
========================================================================================================================
========================================================================================================================
========================================================================================================================
========================================================================================================================
========================================================================================================================
========================================================================================================================
========================================================================================================================
# II - Rails Sample Restful

- Current production url: **http://35.201.233.96/**

### I - Tech stack
```
- Deploy by docker images to Kubernetes
- Deploy to Kubernetes with templates from **auto_deploy_kubernetes/api_ingress.json**
- Use Next.js/React.js/Redux for front end
- Use RoR for backend
- Use Mysql as DB
```


### II - Architecture design for high traffic Twitter

- Kubernetes combines over 15 years of Google’s experience running production workloads at scale with best-of-breed ideas and practices from the community. (https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/)
 
- Next.js is statically generated and server-rendered React applications

- React.js/Redux is the best way to maintain state of applications

- Mysql with indexing in retweets and tweets table can solve api response time under 1s

- If response time over 1s, consider to migrate separate table for separate retweets, or use other NoSQL

#### 1 - Turn on API server
- Environment variables are loaded from **.env.development**

```bash
git clone git@github.com:lucas2804/rails-sample-api.git
cd rails-sample-api
rake db:create
rake db:migrate
rake db:seed

rails s -b 0.0.0.0 -p 3001 # expose on http://localhost:30001
```

#### 2 - Turn on Next.js server for React.js-Frontend
- Environment variables are loaded from **.env.development**
- API_URL in development is equal **http:://localhost:30001** , which the same with api server.

```bash
git clone git@github.com:lucas2804/nextjs-sample.git
cd nextjs-sample

yarn install
yarn start

curl http://localhost:3000
```
