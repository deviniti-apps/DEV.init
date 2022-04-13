chmod +x flutter_get_all.sh && ./flutter_get_all.sh

cd modules

echo 'Rebuilding in remote'
cd remote/ && fvm flutter packages pub run build_runner build --delete-conflicting-outputs
cd ../

echo 'Rebuilding in domain'
cd domain/ && fvm flutter packages pub run build_runner build --delete-conflicting-outputs
cd ../

echo 'Rebuilding in presentation'
cd presentation/ && fvm flutter packages pub run build_runner build --delete-conflicting-outputs
cd ../../

cd modules/presentation/