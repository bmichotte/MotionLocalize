# encoding: utf-8
unless defined?(Motion::Project::Config)
  raise "MotionLocalize must be required within a RubyMotion project."
end

Motion::Project::App.setup do |app|
  lib_dir_path = File.dirname(File.expand_path(__FILE__))

  app.files << File.join(lib_dir_path, "MotionLocalize/motion_localize.rb")
  app.files << File.join(lib_dir_path, "MotionLocalize/symbol.rb")
  if App.template.to_s =~ /\bios|osx\b/
    # remove localization from sugarcube
    app.files.flatten.reject! {|file| /sugarcube-localized/ =~ file }
    app.files << File.join(lib_dir_path, "MotionLocalize/cocoa/ns_string.rb")
  elsif App.template.to_s =~ /\bandroid\b/
    app.files << File.join(lib_dir_path, "MotionLocalize/android/string.rb")
  end
end

require 'tasks/localize'
