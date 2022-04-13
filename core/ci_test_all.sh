cd modules

cd domain/
fvm flutter test --reporter expanded
cd ../

cd remote/
fvm flutter test --reporter expanded
cd ../

cd presentation/
fvm flutter test --reporter expanded
cd ../../
