echo '-------------------------------------------------'
echo 'Flutter Creator 1.0'
echo 'Created by Michał Sokol and Sławomir Onyszko'
echo '-------------------------------------------------'
echo
echo '#1 For app name use camel_case'
echo
read -p 'Provide app name: ' appName
echo
echo '#2 For package name use reverse url with camel_case e.g. com.deviniti.app'
echo
read -p 'Provide package name ' packageName

mkdir $appName

cd $appName

if flutter create -t app --org $packageName -a kotlin -i swift $appName; then
    cd ..

    echo 'COPYING FILES ...'

    cp -R core/. $appName/$appName/
    cp -R templates/debug.keystore $appName/$appName/android/

    echo 'USING TEMPLATES'

    sed "s/_PACKAGE_NAME_/$packageName/g" templates/template_build.gradle > templates/build1.gradle
    sed "s/_RAW_NAME_/$appName/g" templates/build1.gradle > templates/build.gradle
    rm -rf templates/build1.gradle
    mv templates/build.gradle $appName/$appName/android/app

    sed "s/_RAW_NAME_/$appName/g" templates/template_README.md > templates/README.md
    mv templates/README.md $appName/

    sed "s/_RAW_NAME_/$appName/g" templates/template_pubspec.yaml > templates/pubspec.yaml
    mv templates/pubspec.yaml $appName/$appName

    echo "$(cat templates/template_gitignore)" > $appName/$appName/.gitignore

    cd $appName/$appName

    rm -rf test/
    rm -rf README.md

    chmod +x flutter_create_screen.sh

    chmod +x flutter_rebuild_presentation.sh
    chmod +x flutter_rebuild_domain.sh
    chmod +x flutter_rebuild_remote.sh
    chmod +x flutter_l10n.sh
    chmod +x flutter_get_all.sh
    chmod +x flutter_clean_all.sh
    chmod +x flutter_test_all.sh
    chmod +x replace.sh

    chmod +x flutter_rebuild_all.sh
    ./flutter_rebuild_all.sh

    cd ../../

    echo 'GIT INIT'

    cd $appName

    git init .
    git add .
    git commit -m "Initial project commit - project created by internal custom creator"

    cd ..

    echo 'CLEANING UP'
    mv $appName "$appName-mobile"
    mv "$appName-mobile" ..

    echo 'DONE!'
else 
    echo 'CLEANING UP'
    cd ..
    rm -rf $appName
    echo 'COULD NOT CREATE PROJECT'
fi

