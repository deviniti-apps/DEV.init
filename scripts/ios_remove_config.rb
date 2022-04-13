require 'rubygems'
require 'bundler/setup'
require 'xcodeproj'
require 'optparse'

# ruby ios_remove_config.rb --config "Debug" --project './hello-mobile/hello/ios/Runner.xcodeproj'

options = { }

OptionParser.new do |option|
    option.on('-cn', '--config-name', 'Config name') do |value|
        options[:config] = value
    end

    option.on('-proj', '--project', 'Path to project file') do |value|
        options[:path] = value
    end
end.parse!

base_config_name = options[:config]
project_path = options[:path]


if base_config_name.nil? || project_path.nil?
    puts 'Provide all values'
else
    project = Xcodeproj::Project.open(project_path)

    finded_config = nil
    finded_config_with_target = nil

    project.build_configurations.each do |configuration|
        if configuration.name == base_config_name
            finded_config = configuration
        end
    end

    project.native_targets[0].build_configurations.each do |configuration|
        if configuration.name == base_config_name
            finded_config_with_target = configuration
        end
    end

    if finded_config && finded_config_with_target
        project.build_configurations.delete(finded_config)
        project.native_targets[0].build_configurations.delete(finded_config_with_target)

        project.save()
        puts 'Config removed'
    else
        puts 'Could not find configs'
    end
end

