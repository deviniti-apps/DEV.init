echo '-------------------------------------------------'
echo 'Flutter templator 1.0'
echo 'Created by M.Sokol and S.Onyszko'
echo '-------------------------------------------------'
echo
echo 'TIP: For app name use camel_case'
echo
read -p 'App name: ' appName
echo
echo 'TIP1: For package name use referse url with camel_case e.g. com.my_domain'
echo 'TIP2: Your target package name will include app name'
echo
read -p 'Package name ' packageName

mkdir $appName

cd $appName

if flutter create -t app --org $packageName -a kotlin -i swift $appName; then
    cd ..

    echo 'COPYING FILES ...'

    cp -R core/. $appName/$appName/
    cp -R templates/debug.keystore $appName/$appName/android/

    echo 'USING TEMPLATES'

    sed "s/_PACKAGE_NAME_/$packageName.$appName/g" templates/template_build.gradle > templates/build1.gradle
    sed "s/_RAW_NAME_/$appName/g" templates/build1.gradle > templates/build.gradle
    rm -rf templates/build1.gradle
    mv templates/build.gradle $appName/$appName/android/app

    sed "s/_RAW_NAME_/$appName/g" templates/template_README.md > templates/README.md
    mv templates/README.md $appName/

    # echo 'FLUTTER GET AND REBUILD'

    cd $appName/$appName

    chmod +x flutter_build_runner_rebuild.sh

    ./flutter_build_runner_rebuild.sh

    cd ../../

    echo 'GIT INIT'

    git init $appName

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

