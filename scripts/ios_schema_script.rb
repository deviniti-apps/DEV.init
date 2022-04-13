require 'rubygems'
require 'bundler/setup'
require 'xcodeproj'
require 'optparse'


options = { }

# ruby ios_schema_script.rb --config-name "staging" --project "./hello-mobile/hello/ios/Runner.xcodeproj"

OptionParser.new do |option|
    option.on('-cn', '--config-name', 'Symbol could be debug or relase') do |value|
        options[:config_name] = value
    end

    option.on('-proj', '--project', 'Path to project file') do |value|
        options[:path] = value
    end
end.parse!

if options[:path].nil? || options[:config_name].nil?
    puts 'All options are required'
else
    config_name = options[:config_name]
    project_path = options[:path]
    scheme = Xcodeproj::XCScheme.new
    project = Xcodeproj::Project.open(project_path)

    scheme.add_build_target(project.native_targets[0])
    scheme.launch_action.build_configuration='Debug-' + config_name
    scheme.test_action.build_configuration='Debug-' + config_name
    scheme.profile_action.build_configuration='Profile-' + config_name
    scheme.analyze_action.build_configuration='Debug-' + config_name
    scheme.archive_action.build_configuration='Release-' + config_name
    scheme.save_as(project_path, config_name)
end
