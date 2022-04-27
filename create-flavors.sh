echo '-------------------------------------------------'
echo 'Flutter Flavors & Fastlane Creator 2.0'
echo 'Created by Michał Sokol and Sławomir Onyszko'
echo '-------------------------------------------------'
echo
echo '#1 For app name use single word or snake_case'
echo
read -rp 'Provide app name: ' appName
echo
echo '#2 For package name use reverse url e.g. com.deviniti.app'
echo
read -rp 'Provide package name: ' packageName
echo
echo '#3 Flutter root project path'
echo
read -rp 'Provide project path: ' projectPath

echo 'Copy templates'

cp -R fastlane/ios/. "$projectPath"/ios/
cp -R fastlane/android/. "$projectPath"/android/

sed -e "s/_PACKAGE_NAME_/$packageName/g" -e "s/_RAW_NAME_/$appName/g" templates/template_build.gradle > "$projectPath"/android/app/build.gradle
sed "s/_RAW_NAME_/$appName/g" templates/template_bitrise.yml > "$projectPath"/bitrise.yml
sed -e "s/_PACKAGE_NAME_/$packageName/g" -e "s/_RAW_NAME_/$appName/g" templates/fastlane_ios/template_Fastfile > "$projectPath"/ios/fastlane/Fastfile
sed "s/_PACKAGE_NAME_/$packageName/g" templates/fastlane_ios/template_Appfile > "$projectPath"/ios/fastlane/Appfile
sed "s/_PACKAGE_NAME_/$packageName/g" templates/fastlane_ios/template_Deliverfile > "$projectPath"/ios/fastlane/Deliverfile
sed "s/_PACKAGE_NAME_/$packageName/g" templates/fastlane_android/template_Appfile > "$projectPath"/android/fastlane/Appfile

echo 'Create iOS flavors directories'

mkdir -p "$projectPath"/ios/Configuration
mkdir -p "$projectPath"/ios/Configuration/development
touch "$projectPath"/ios/Configuration/development/GoogleService-Info.plist

mkdir -p "$projectPath"/ios/Configuration/staging
touch "$projectPath"/ios/Configuration/staging/GoogleService-Info.plist

mkdir -p "$projectPath"/ios/Configuration/production
touch "$projectPath"/ios/Configuration/production/GoogleService-Info.plist

echo 'Create Androids flavors directories'

mkdir -p "$projectPath"/android/app/src/development
touch "$projectPath"/android/app/src/development/google-services.json

mkdir -p "$projectPath"/android/app/src/staging
touch "$projectPath"/android/app/src/staging/google-services.json

mkdir -p "$projectPath"/android/app/src/production
touch "$projectPath"/android/app/src/production/google-services.json

#echo 'Create iOS schemas'
#
#ruby scripts/ios_config_script.rb --config-name "development" --app-suffix "Alpha" --app-name "$appName" --project "$projectPath/ios/Runner.xcodeproj" --bundle-id "$packageName"
#ruby scripts/ios_config_script.rb --config-name "staging" --app-suffix "Beta" --app-name "$appName" --project "$projectPath/ios/Runner.xcodeproj" --bundle-id "$packageName"
#ruby scripts/ios_config_script.rb --config-name "production" --app-suffix "" --app-name "$appName" --project "$projectPath/ios/Runner.xcodeproj" --bundle-id "$packageName"
#
#ruby scripts/ios_build_phase_script.rb --project "$projectPath/ios/Runner.xcodeproj"
#
#ruby scripts/ios_schema_script.rb --config-name "development" --project "$projectPath/ios/Runner.xcodeproj"
#ruby scripts/ios_schema_script.rb --config-name "staging" --project "$projectPath/ios/Runner.xcodeproj"
#ruby scripts/ios_rename_schema.rb --schema-name "Runner" --project "$projectPath/ios/Runner.xcodeproj" --config-name "production"
#
#ruby scripts/ios_remove_config.rb --config "Debug" --project "$projectPath/ios/Runner.xcodeproj"
#ruby scripts/ios_remove_config.rb --config "Profile" --project "$projectPath/ios/Runner.xcodeproj"
#ruby scripts/ios_remove_config.rb --config "Release" --project "$projectPath/ios/Runner.xcodeproj"
#
#ruby scripts/ios_plist_config.rb --plist-key "CFBundleDisplayName" --plist-value "\$(APP_DISPLAY_NAME)" --plist "$projectPath/ios/Runner/Info.plist"
