cd modules

echo 'Rebuilding in presentation'
cd presentation/ && fvm flutter pub get && fvm flutter packages pub run build_runner build --delete-conflicting-outputs && cd ../../
