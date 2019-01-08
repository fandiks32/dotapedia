# Dotapedia

## Introduction
`dotapedia` is is a Ruby gem client for the Dota 2 WebAPI. This client web api was sourced from [OpenDota API](https://docs.opendota.com/). Using this gems will make you easier to gather all available Dota 2 information into your need.

## Requirement
- Ruby
- activesupport gem
- Rspec gem (optional: for testing)
## Installation
 1. Rails env
    Add this line on your Gemfile.
    ```ruby
       gem 'dotapedia'
    ``` 
    and execute
    ```ruby
       $ bundle
    ```
2. Local Environment
   ```ruby
      $ gem install dotapedia
    ```
   
## Available Objects
1. **Teams**
2. **Heroes**
3. **ProPlayers**
4. **ProMatches**

## Usage
Instantiate Dotapedia
```ruby
    dotapedia = Dotapedia.new
```
Filtering
```ruby
    dotapedia.teams # return all teams
    dotapedia.teams(name: 'Team Liquid') # filter by name.
    dotapedia.heroes # return all heroes
    dotapedia.heroes(name: 'axe') # filter by name.
    dotapedia.heroes(id: xxx) # filtered by hero id
```

**Please read the OpenDota Api [Documentation](https://docs.opendota.com/) to get full list  of objects attributes.

## License

Copyright © Irfandi Achmad

Distributed under the [MIT License](http://www.opensource.org/licenses/MIT).
