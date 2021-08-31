cd modules

echo 'Rebuilding in remote'
cd remote/ && fvm flutter pub get && fvm flutter packages pub run build_runner build --delete-conflicting-outputs && cd ../../
