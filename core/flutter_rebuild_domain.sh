cd modules

echo 'Rebuilding in domain'
cd domain/ && fvm flutter pub get && fvm flutter packages pub run build_runner build --delete-conflicting-outputs && cd ../../
