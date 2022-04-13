require 'rubygems'
require 'bundler/setup'
require 'xcodeproj'
require 'optparse'


options = { }

# ruby ios_rename_schema.rb --schema-name "Runner" --project "./hello-mobile/hello/ios/Runner.xcodeproj" --config-name "production"

OptionParser.new do |option|
    option.on('-sn', '--schema-name', 'Symbol could be debug or relase') do |value|
        options[:schema_name] = value
    end

    option.on('-proj', '--project', 'Path to project file') do |value|
        options[:path] = value
    end
    option.on('-cn', '--config-name', 'Symbol could be debug or relase') do |value|
        options[:config_name] = value
    end
end.parse!

if options[:schema_name].nil? || options[:path].nil? ||  options[:config_name].nil?
    puts 'All options are required'
else
    path = options[:path]
    scheme_name = options[:schema_name]
    config_name = options[:config_name]
    path_complate = path + '/xcshareddata/xcschemes/' + scheme_name + '.xcscheme'

   
    scheme = Xcodeproj::XCScheme.new(path_complate)
    scheme.launch_action.build_configuration='Debug-' + config_name
    scheme.test_action.build_configuration='Debug-' + config_name
    scheme.profile_action.build_configuration='Profile-' + config_name
    scheme.analyze_action.build_configuration='Debug-' + config_name
    scheme.archive_action.build_configuration='Release-' + config_name

    puts path_complate

    updated_name = path + '/xcshareddata/xcschemes/' + config_name + '.xcscheme'
    
    scheme.save!

    File.rename(path_complate, updated_name)
    

    puts 'Schema renamed successfuly'
end
