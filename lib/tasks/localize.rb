desc "Convert translations to iOS or Android format"
task :localize do
  cocoa = App.template.to_s =~ /\bios|osx\b/
  android = App.template.to_s =~ /\bandroid\b/

  require 'yaml'
  files = Dir.glob("config/locales/*.yml")

  files.each do |file|
    data = YAML.load(File.read(file))
    locale = File.basename(file).sub(".yml", "")

    if cocoa
      FileUtils.mkdir_p("resources/#{locale}.lproj")
      filename = "resources/#{locale}.lproj/Localizable.strings"
    elsif android
      if locale == 'en'
        dir = "values"
      else
        dir = "values-#{locale}"
      end
      FileUtils.mkdir_p("resources/#{dir}")
      filename = "resources/#{dir}/strings.xml"
    end

    App.info "Writing", filename
    File.open(filename, 'w') do |translation|
      if android
        translation.puts <<-EOF
<?xml version="1.0" encoding="utf-8"?>
<resources>
        EOF
      end

      data.each do |key, value|
        if cocoa
          translation.puts "\"#{key}\" = \"#{value}\";"
        elsif android
          translation.puts <<-EOF
          <string name="#{key}">#{value}</string>
          EOF
        end
      end

      if android
        translation.puts '</resources>'
      end
    end
  end
end

# ios
namespace :build do
  task :simulator => :localize
  task :device => :localize
end

# android
task :build => :localize
