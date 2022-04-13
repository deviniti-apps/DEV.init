require 'rubygems'
require 'bundler/setup'
require 'xcodeproj'
require 'optparse'

options = { }

# ruby test-full.rb --config-name "development" --app-suffix "Alpha" --app-name "Hello" --project "./hello-mobile/hello/ios/Runner.xcodeproj" --bundle-id "com.hello"
# ruby test-full.rb --config-name "staging" --app-suffix "Beta" --app-name "Hello" --project "./hello-mobile/hello/ios/Runner.xcodeproj" --bundle-id "com.hello"


OptionParser.new do |option|
    option.on('-cn', '--config-name', 'Symbol could be debug or relase') do |value|
        options[:config_name] = value
    end

    option.on('-as', '--app-suffix', 'Symbol could be debug or relase') do |value|
        options[:app_suffix] = value
    end

    option.on('-an', '--app-name', 'App name') do |value|
        options[:app_name] = value
    end

    option.on('-proj', '--project', 'Path to project file') do |value|
        options[:path] = value
    end

    option.on('-bun', '--bundle-id', 'Path to project file') do |value|
        options[:bundle_id] = value
    end
end.parse!


def create_configurations(config_name, symbol_name, project, base_config_name, bundle_suffix, app_name, bunde_id)
    added_configuration = project.add_build_configuration(config_name, symbol_name)
    project_conf = project.native_targets[0].add_build_configuration(config_name, symbol_name.to_s)

    found = project.native_targets[0].build_configurations.detect {|element| element.name.downcase == symbol_name.to_s}

    puts found
    
    project_conf.base_configuration_reference = found.base_configuration_reference

    # copying configuration from base
    project.build_configurations.each do |configuration|
        if configuration.name == base_config_name
            added_configuration.build_settings = configuration.build_settings
        end
    end

    project.native_targets[0].build_configurations.each do |configuration|
        if configuration.name == base_config_name
            project_conf.build_settings = configuration.build_settings
        end
    end

    project_conf.build_settings['PRODUCT_BUNDLE_IDENTIFIER'] = bunde_id + bundle_suffix
    project_conf.build_settings['APP_DISPLAY_NAME'] = app_name
    project.save()
end

if options[:config_name].nil? || options[:app_suffix].nil? || options[:app_name].nil? || options[:path].nil? || options[:bundle_id].nil?
    puts 'All options are required'
else
    project = Xcodeproj::Project.open(options[:path])

    config_name = options[:config_name] # eg. development
    app_suffix = options[:app_suffix] # eg. Alpha
    appName = options[:app_name] #eg. Hello

    config_suffix = ''
    unless app_suffix == ""
        config_suffix = '.' + app_suffix.sub(' ', '_').downcase
    end
    
    full_app_name = appName + ' ' + app_suffix
    
    debug_name = 'Debug'
    profile_name = 'Profile'
    release_name = 'Release'

    debug_full_config_name = debug_name + '-' + config_name
    profile_full_config_name = profile_name + '-' + config_name
    release_full_config_name = release_name + '-' + config_name
    
    create_configurations(debug_full_config_name , :debug, project, debug_name, config_suffix, full_app_name, options[:bundle_id])
    create_configurations(profile_full_config_name , :release, project, profile_name, config_suffix, full_app_name, options[:bundle_id])
    create_configurations(release_full_config_name , :release, project, release_name, config_suffix, full_app_name, options[:bundle_id])

    puts 'Config added!'
end
