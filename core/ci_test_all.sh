cd modules

cd domain/
flutter test --reporter expanded
cd ../

cd remote/
flutter test --reporter expanded
cd ../

cd presentation/
flutter test --reporter expanded
cd ../../
