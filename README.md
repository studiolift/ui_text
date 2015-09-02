# UiText

## Add to your gem file

```ruby
gem 'ui_text', git: 'git://github.com/krishandley/ui_text.git', tag: 'v0.0.1'
```

## Install the migrations

```
bundle exec ui_text:install:migrations
```

## Mount the engine

```ruby
Rails.application.routes.draw do
  mount UiText::Engine => '/ui_text'
end
```
