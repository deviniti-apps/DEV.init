echo '-------------------------------------------------'
echo 'Deviniti Flutter Project Creator'
echo '-------------------------------------------------'
echo
echo '#1 For app name use single word or snake_case'
echo
read -rp 'Provide app name: ' appName
echo
echo '#2 For package name use reverse url e.g. com.deviniti.app'
echo
read -rp 'Provide package name ' packageName


mkdir "$appName"

cd "$appName" || exit

if flutter create -t app --org "$packageName" -a kotlin -i swift "$appName"; then
    cd ..

    echo 'COPYING FILES ...'

    cp -R core/. "$appName"/"$appName"/
    cp -R templates/debug.keystore "$appName"/"$appName"/android/
    cp -R fastlane/ios/. "$appName"/"$appName"/ios/
    cp -R fastlane/android/. "$appName"/"$appName"/android/

    echo 'USING TEMPLATES'

    sed "s/_PACKAGE_NAME_/$packageName.$appName/g" templates/template_build.gradle > templates/build1.gradle
    sed "s/_RAW_NAME_/$appName/g" templates/build1.gradle > templates/build.gradle
    rm -rf templates/build1.gradle
    mv templates/build.gradle "$appName"/"$appName"/android/app

    sed "s/_RAW_NAME_/$appName/g" templates/template_README.md > templates/README.md
    mv templates/README.md "$appName"/

    sed "s/_RAW_NAME_/$appName/g" templates/template_bitrise.yml > templates/bitrise.yml
    mv templates/bitrise.yml "$appName"/

    sed "s/_RAW_NAME_/$appName/g" templates/template_pubspec.yaml > templates/pubspec.yaml
    mv templates/pubspec.yaml "$appName"/"$appName"

    cat templates/template_gitignore > "$appName"/"$appName"/.gitignore

    sed "s/_PACKAGE_NAME_/$packageName/g" templates/fastlane_ios/template_Fastfile > templates/fastlane_ios/Fastfile1
    sed "s/_RAW_NAME_/$appName/g" templates/fastlane_ios/Fastfile1 > templates/fastlane_ios/Fastfile
    rm -rf templates/fastlane_ios/Fastfile1
    mv templates/fastlane_ios/Fastfile "$appName"/"$appName"/ios/fastlane

    sed "s/_PACKAGE_NAME_/$packageName/g" templates/fastlane_ios/template_Appfile > templates/fastlane_ios/Appfile
    mv templates/fastlane_ios/Appfile "$appName"/"$appName"/ios/fastlane

    sed "s/_PACKAGE_NAME_/$packageName/g" templates/fastlane_ios/template_Deliverfile > templates/fastlane_ios/Deliverfile
    mv templates/fastlane_ios/Deliverfile "$appName"/"$appName"/ios/fastlane

    sed "s/_PACKAGE_NAME_/$packageName/g" templates/fastlane_android/template_Appfile > templates/fastlane_android/Appfile
    mv templates/fastlane_android/Appfile "$appName"/"$appName"/android/fastlane

    cd "$appName"/"$appName" || exit

    rm -rf test/
    rm -rf README.md

    melos run rebuild --no-select

    flutter pub run change_app_package_name:main "$packageName"

    cd ../../

    echo 'Create iOS schemas'

    ruby scripts/ios_config_script.rb --config-name "development" --app-suffix "Alpha" --app-name "$appName" --project "./$appName/$appName/ios/Runner.xcodeproj" --bundle-id "$packageName"
    ruby scripts/ios_config_script.rb --config-name "staging" --app-suffix "Beta" --app-name "$appName" --project "./$appName/$appName/ios/Runner.xcodeproj" --bundle-id "$packageName"
    ruby scripts/ios_config_script.rb --config-name "production" --app-suffix "" --app-name "$appName" --project "./$appName/$appName/ios/Runner.xcodeproj" --bundle-id "$packageName"

    ruby scripts/ios_build_phase_script.rb --project "./$appName/$appName/ios/Runner.xcodeproj"

    ruby scripts/ios_schema_script.rb --config-name "development" --project "./$appName/$appName/ios/Runner.xcodeproj"
    ruby scripts/ios_schema_script.rb --config-name "staging" --project "./$appName/$appName/ios/Runner.xcodeproj"
    ruby scripts/ios_rename_schema.rb --schema-name "Runner" --project "./$appName/$appName/ios/Runner.xcodeproj" --config-name "production"

    ruby scripts/ios_remove_config.rb --config "Debug" --project "./$appName/$appName/ios/Runner.xcodeproj"
    ruby scripts/ios_remove_config.rb --config "Profile" --project "./$appName/$appName/ios/Runner.xcodeproj"
    ruby scripts/ios_remove_config.rb --config "Release" --project "./$appName/$appName/ios/Runner.xcodeproj"

    ruby scripts/ios_plist_config.rb --plist-key "CFBundleDisplayName" --plist-value "\$(APP_DISPLAY_NAME)" --plist "./$appName/$appName/ios/Runner/Info.plist"

    echo 'Create iOS flavors directories'

    cd "./$appName/$appName/ios/" || exit
    mkdir 'Configuration'
    cd 'Configuration' || exit

    mkdir 'development'
    touch './development/GoogleService-Info.plist'

    mkdir 'staging'
    touch './staging/GoogleService-Info.plist'

    mkdir 'production'
    touch './production/GoogleService-Info.plist'

    cd ../../../../

    echo 'Create Androids flavors directories'

    cd "./$appName/$appName/android/" || exit

    mkdir './app/src/development'
    touch './app/src/development/google-services.json'

    mkdir './app/src/staging'
    touch './app/src/staging/google-services.json'

    mkdir './app/src/production'
    touch './app/src/production/google-services.json'

    cd ../../../

    echo 'GIT INIT'

    cd "$appName" || exit

    git init .
    git add .
    git commit -m "Initial project commit - project created by internal custom creator"

    # shellcheck disable=SC2103
    cd ..

    echo 'CLEANING UP'
    mv "$appName" "$appName-mobile"
    mv "$appName-mobile" ..

    echo 'DONE!'
else 
    echo 'CLEANING UP'
    cd ..
    rm -rf "$appName"
    echo 'COULD NOT CREATE PROJECT'
fi

