# MotionLocalize

This gem allows you to translate your Android and iOS apps easily.

## Warning
This gem is currently in very early-stage. Use it at your own risk :)

[![Build Status](https://travis-ci.org/bmichotte/MotionLocalize.svg?branch=master)](https://travis-ci.org/bmichotte/MotionLocalize) [![Gem Version](https://badge.fury.io/rb/MotionLocalize.svg)](http://badge.fury.io/rb/MotionLocalize)

## Installation

```ruby
gem 'MotionLocalize'
```

Then:

```sh-session
$ bundle
```

## Usage

Add a `config/locales` dir and put your `locale.yml` files in it.

You can generate the platform specific files with `rake localize`. This task is automaticaly executed when you build your application.

```yml
# en.yml
hello: Hello
how_are_you: How are you ?
show_my_age: I'm %{age} old

# fr.yml
hello: Bonjour
how_are_you: Comment allez-vous ?
show_my_age: J'ai %{age} ans
```

On Android, the files `resources/values-en/strings.xml` and `resources/values-fr/strings.xml` will be created.  
On iOS, the files `resources/en.lproj/Localizable.strings` and `resources/fr.lproj/Localizable.strings` will be created.  

On your code, you can get the translation with
```ruby
# use a symbol
puts :hello._

# use a string
puts 'hello'._

# use substitution
puts :show_my_age._ age: 36

# You can also use
puts 'show_my_age'.translate(age: 36)
```

### A note on Android
[As you can read here](https://github.com/GantMan/PackingPeanut#explain-this-android-context-thing-again), Android love `Context` stuff. In order to get your strings translated on Android, you have to initialize `MotionLocalize.context` (from you `Android::App::Application` or first activity).

## Todo
- Tests

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Make some specs pass
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request

## License

Released under the [MIT license](LICENSE).
