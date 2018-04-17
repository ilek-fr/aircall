# Aircall

A Ruby gem for [Aircall](https://developer.aircall.io/api-references/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aircall'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aircall

## Usage


### Init

Create new Aircall like this:

    aircall = Aircall.new({id: [AIRCALL_ID], token: [AIRCALL_TOKEN]})

Or like this:
    
    aircall = Aircall.new
    aircall.id = [AIRCALL_ID]
    aircall.token = [AIRCALL_TOKEN]


### Methods

#### [Calls](./doc/calls.md)
#### [Numbers](./doc/numbers.md)
#### [Contacts](./doc/contacts.md)
#### [Users](./doc/users.md)


## Tests

Create **.env** file from **.env.example**.
Complete with your variables.
 
Run test with `rake test`. 