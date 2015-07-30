# -*- coding: utf-8 -*-
$:.unshift('/Library/RubyMotion/lib')
platform = ENV.fetch('platform', 'ios')
if platform == 'ios'
  require 'motion/project/template/ios'
elsif platform == 'osx'
  require 'motion/project/template/osx'
elsif platform == 'android'
  require 'motion/project/template/android'
else
  raise "Unsupported platform #{ENV['platform']}"
end

require 'bundler'
require 'motion-yaml'
Bundler.require

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'MotionLocalize'
  app.device_family = [:iphone, :ipad]
end
