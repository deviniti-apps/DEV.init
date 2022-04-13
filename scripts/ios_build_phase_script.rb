require 'rubygems'
require 'bundler/setup'
require 'xcodeproj'
require 'optparse'

# ruby ios_build_phase_script.rb --project './hello-mobile/hello/ios/Runner.xcodeproj'

options = { }

OptionParser.new do |option|
    option.on('-proj', '--project', 'Path to project file') do |value|
        options[:path] = value
    end
end.parse!


if options[:path].nil? 
    puts 'All options are required'
else
    project_path = options[:path]
    project = Xcodeproj::Project.open(project_path)

    shellScript = "environment=\"default\"\n\nif [[ $CONFIGURATION =~ -([^-]*)$ ]]; then\nenvironment=${BASH_REMATCH[1]}\nfi\n\necho $environment\n\n# Name and path of the resource we're copying\nGOOGLESERVICE_INFO_PLIST=GoogleService-Info.plist\nGOOGLESERVICE_INFO_FILE=${PROJECT_DIR}/Configuration/${environment}/${GOOGLESERVICE_INFO_PLIST}\n\n# Make sure GoogleService-Info.plist exists\necho \"Looking for ${GOOGLESERVICE_INFO_PLIST} in ${GOOGLESERVICE_INFO_FILE}\"\nif [ ! -f $GOOGLESERVICE_INFO_FILE ]\nthen\necho \"No GoogleService-Info.plist found. Please ensure it's in the proper directory.\"\nexit 1\nfi\n\n# Get a reference to the destination location for the GoogleService-Info.plist\n# This is the default location where Firebase init code expects to find GoogleServices-Info.plist file\nPLIST_DESTINATION=${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app\necho \"Will copy ${GOOGLESERVICE_INFO_PLIST} to final destination: ${PLIST_DESTINATION}\"\n\n# Copy over the prod GoogleService-Info.plist for Release builds\ncp \"${GOOGLESERVICE_INFO_FILE}\" \"${PLIST_DESTINATION}\"\n";

    script = project.native_targets[0].new_shell_script_build_phase(name = 'Copy GoogleService-Info.plist on build time')
    script.shell_script = shellScript
    puts project.native_targets[0].shell_script_build_phases

    project.save()
end
