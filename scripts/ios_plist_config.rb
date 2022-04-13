require 'rubygems'
require 'bundler/setup'
require 'xcodeproj'
require 'optparse'

options = { }

# ruby ios_plist_config.rb --plist-key "CFBundleDisplayName" --plist-value "$(APP_DISPLAY_NAME)" --plist "./hello-mobile/hello/ios/Runner/Info.plist"

OptionParser.new do |option|
    option.on('-ke', '--plist-key', 'Key in plist') do |value|
        options[:key_value] = value
    end

    option.on('-va', '--plist-value', 'Value in plist') do |value|
        options[:plist_value] = value
    end

    option.on('-pl', '--plist', 'Path to plist file') do |value|
        options[:path] = value
    end
end.parse!

if options[:key_value].nil? || options[:plist_value].nil? || options[:path].nil?
    puts 'All options are required'
else
    path = options[:path]
    key_value = options[:key_value]
    plist_value = options[:plist_value]
    plist_file = Xcodeproj::Plist.read_from_path(path)

    plist_file[key_value] = plist_value

    Xcodeproj::Plist.write_to_path(plist_file, path)

    puts 'Plist updated'
end
