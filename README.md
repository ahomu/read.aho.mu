```
% rake secret
[GENERATED TOKEN]
% heroku config:add SECRET_TOKEN=[GENERATED TOKEN]
```

```
% rm config/initializers/secret_token.rb
% rake secret:generate
% git update-index --assume-unchanged  config/initializers/secret_token.rb
```